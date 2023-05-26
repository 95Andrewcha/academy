package com.academy.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.academy.common.Common;
import com.academy.service.UserService;
import com.academy.vo.AttachVO;
import com.academy.vo.BoardVO;
import com.academy.vo.CommentVO;
import com.academy.vo.Criteria;
import com.academy.vo.PageVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	/**
	 * 메인
	 * @param 
	 * @return String
	 */
	@GetMapping("main")
	public String main(HttpServletRequest request, Model model) {
		model.addAttribute("userCount", userService.getUserCount());		// 회원 수 조회
		model.addAttribute("reviewCount", userService.getReviewCount());	// 리뷰 수 조회
		model.addAttribute("academyCount", userService.getAcademyCount());	// 학원 수 조회
		model.addAttribute("top4List", userService.getMostPopularAcademyTop4());			// 가장 인기 많은 학원 TOP4 조회
		model.addAttribute("reviewList", userService.getReviewList());						// 리뷰 조회(최신 리뷰 4개 조회)
		return request.getRequestURI();
	}

	/**
	 * 로그인
	 * @param 
	 * @return String
	 */
	@RequestMapping("login")
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("admin", false);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		log.info(auth);
		
		// 이미 로그인한 사용자일 경우 메인 페이지로 이동
		if(!auth.getPrincipal().equals("anonymousUser")) {
			return "redirect:/user/main";
		}
		
		Boolean isError = Boolean.parseBoolean(request.getParameter("error"));
		String message = request.getParameter("message");
		
		if(isError && message != null) {
			request.setAttribute("isError", isError);
			request.setAttribute("message", message);
		}
		
		// 이전페이지 URI
		String prevUri = request.getHeader("Referer");
		log.info("prevUri: " + prevUri);
		if(prevUri != null && !prevUri.contains("/login")) {
			request.getSession().setAttribute("prevUri", prevUri);
		}

		return request.getRequestURI();
	}
	
	/**
	 * 로그아웃
	 * @param 
	 * @return String
	 */
	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}

		return "redirect:/user/main";
	}

	/**
	 * 메인 > 자료게시판
	 * @param cri
	 * @param request
	 * @param model
	 * @return 자료게시판 페이지
	 */
	@RequestMapping(value = "/data_board", method = RequestMethod.GET)
	public String data_board(@ModelAttribute Criteria cri, HttpServletRequest request, Model model) {
		model.addAttribute("list", userService.selectBoardsList(cri));
		model.addAttribute("pageVO", new PageVO(cri, userService.selectBoardsCount(cri)));
		return request.getRequestURI();
	}
	
	/**
	 * 메인 > 자료게시판 > 자료게시판 글 상세 페이지
	 * @param boardVO
	 * @param cri
	 * @param request
	 * @param model
	 * @return 자료게시판 글 상세 페이지
	 */
	@RequestMapping(value = "/data_board/detail", method = RequestMethod.GET)
	public String data_board_detail(@ModelAttribute BoardVO boardVO, @ModelAttribute Criteria cri, HttpServletRequest request, Model model) {
		model.addAttribute("list", userService.selectBoard(boardVO));
		model.addAttribute("fileList", userService.selectBoardFiles(boardVO));
		return request.getRequestURI();
	}
	
	@ResponseBody
	@GetMapping("/data_board/comment")
	public JSONObject getComment(@ModelAttribute Criteria cri) {
		JSONObject jsonObject = new JSONObject();
		
		List<CommentVO> commentList = userService.selectBoardComments(cri);
		PageVO pageVO = new PageVO(cri, userService.selectBoardCommentsCount(Integer.parseInt(cri.getBoard_no())));
		
		jsonObject.put("commentList", commentList);
		jsonObject.put("pageVO", pageVO);
		
		return jsonObject;
	}
	
	@ResponseBody
	@PostMapping("/data_board/comment")
	public JSONObject addComment(@ModelAttribute CommentVO commentVO) {
		JSONObject jsonObject = new JSONObject();
		
		int result = userService.insertBoardComment(commentVO);
		
		Criteria cri = new Criteria();
		cri.setBoard_no(commentVO.getBoard_no() + "");
		
		List<CommentVO> commentList = userService.selectBoardComments(cri);
		PageVO pageVO = new PageVO(cri, userService.selectBoardCommentsCount(commentVO.getBoard_no()));
		
		jsonObject.put("commentList", commentList);
		jsonObject.put("pageVO", pageVO);
		
		return jsonObject;
	}
	
	/**
	 * 메인 > 자료게시판 > 자료게시판 글 등록 페이지
	 * @param request
	 * @param model
	 * @return 자료게시판 글 등록 페이지
	 */
	@RequestMapping(value = "/data_board/register", method = RequestMethod.GET)
	public String register(HttpServletRequest request, Model model, Authentication authentication) {
		model.addAttribute("user", authentication.getPrincipal());
		return request.getRequestURI();
	}
	
	/**
	 * 메인 > 자료게시판 > 자료게시판 글 등록
	 * @param multipartRequest
	 * @return 자료게시판 글 등록 후 자료게시판 페이지 리다이렉트
	 */
	@ResponseBody
	@PostMapping("/data_board")
	public Map<String, Object> addDataBoard(MultipartHttpServletRequest multipartRequest) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		Enumeration<String> paramNames = multipartRequest.getParameterNames();
		
		while(paramNames.hasMoreElements()) {
			String name = paramNames.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("name: " + name);
			System.out.println("value: " + value);
			paramMap.put(name, value);
		}
		
		List<AttachVO> fileList = Common.uploadFile(multipartRequest);
		paramMap.put("fileList", fileList);
		Map<String, Object> result = userService.insertNewDataBoard(paramMap);
		
		return result;
	}
	
	/**
	 * 자료게시판 글 수정
	 * @param board_no
	 * @param multipartRequest
	 * @return 자료게시판 글 수정 후 자료게시판 리다이렉트
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping("/data_board/{board_no}")
	public Map<String, Object> modifyDataBoard(@PathVariable int board_no, MultipartHttpServletRequest multipartRequest) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		Enumeration<String> paramNames = multipartRequest.getParameterNames();
		
		while(paramNames.hasMoreElements()) {
			String name = paramNames.nextElement();
			String value = multipartRequest.getParameter(name);
			paramMap.put(name, value);
		}
		
		List<AttachVO> fileList = Common.uploadFile(multipartRequest);
		paramMap.put("fileList", fileList);
		List<AttachVO> delFileList = Common.deleteFile(multipartRequest);
		paramMap.put("delFileList", delFileList);
		
		Map<String, Object> result = userService.modifyDataBoard(paramMap);
		
		return result;
	}
	
	/**
	 * 메인 > 자료게시판 > 자료게시판 글 수정 페이지
	 * @param request
	 * @param model
	 * @return 자료게시판 글 수정 페이지
	 */
	@RequestMapping(value = "/data_board/modify", method = RequestMethod.GET)
	public String modify(@ModelAttribute BoardVO boardVO, @ModelAttribute Criteria cri, HttpServletRequest request, Model model) {
		model.addAttribute("list", userService.selectBoard(boardVO));
		model.addAttribute("fileList", userService.selectBoardFiles(boardVO));
		return request.getRequestURI();
	}
	
	
	@ResponseBody
	@DeleteMapping("/data_board/{board_no}")
	public String removeDataBoard(@PathVariable int board_no, @RequestParam String jsonData) throws Exception {
		JSONArray jsonArray = new JSONArray();
		JSONParser jsonParser = new JSONParser();
		
		jsonArray = (JSONArray) jsonParser.parse(jsonData);
		
		for(int i=0; i<jsonArray.size(); i++) {
			JSONObject jsonObject = (JSONObject) jsonArray.get(i);
			String[] deleteFilesArr = jsonObject.get("deleteFiles").toString().split("_");
			File file = new File(Common.BOARD_REPO + deleteFilesArr[0] + deleteFilesArr[1]);
			file.delete();
		}
		
		int result = userService.removeBoard(board_no);
		
		return result > 0 ? "success" : "fail";
	}
	
	@RequestMapping(value = "/data_board/reply", method = RequestMethod.GET)
	public String reply(HttpServletRequest request, @ModelAttribute BoardVO boardVO, Model model, Authentication authentication) {
		model.addAttribute("user", authentication.getPrincipal());
		return request.getRequestURI();
	}
	
	/**
	 * 메인 > 자료게시판 > 자료게시판 답글 등록
	 * @param multipartRequest
	 * @return 자료게시판 답글 등록 후 자료게시판 페이지 리다이렉트
	 */
	@ResponseBody
	@PostMapping("/data_board/reply")
	public Map<String, Object> addDataBoardReply(MultipartHttpServletRequest multipartRequest) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		Enumeration<String> paramNames = multipartRequest.getParameterNames();
		
		while(paramNames.hasMoreElements()) {
			String name = paramNames.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("name: " + name);
			System.out.println("value: " + value);
			paramMap.put(name, value);
		}
		
		List<AttachVO> fileList = Common.uploadFile(multipartRequest);
		paramMap.put("fileList", fileList);
		Map<String, Object> result = userService.insertNewDataBoard(paramMap);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/data_board/comment/reply")
	public Map<String, Object> addCommentReply(@ModelAttribute CommentVO commentVO) {
		JSONObject jsonObject = new JSONObject();
		
		int result = userService.insertBoardComment(commentVO);
		
		Criteria cri = new Criteria();
		cri.setBoard_no(commentVO.getBoard_no() + "");
		
		List<CommentVO> commentList = userService.selectBoardComments(cri);
		PageVO pageVO = new PageVO(cri, userService.selectBoardCommentsCount(commentVO.getBoard_no()));
		
		jsonObject.put("commentList", commentList);
		jsonObject.put("pageVO", pageVO);
		
		return jsonObject;
	}
	
	@ResponseBody
	@DeleteMapping("/data_board/comment/{comment_no}")
	public Map<String, Object> removeComment(@PathVariable int comment_no, @ModelAttribute CommentVO commentVO) {
		JSONObject jsonObject = new JSONObject();
		
		int result = userService.deleteComment(comment_no);
		
		Criteria cri = new Criteria();
		cri.setBoard_no(commentVO.getBoard_no() + "");
		
		List<CommentVO> commentList = userService.selectBoardComments(cri);
		PageVO pageVO = new PageVO(cri, userService.selectBoardCommentsCount(commentVO.getBoard_no()));
		
		jsonObject.put("commentList", commentList);
		jsonObject.put("pageVO", pageVO);
		
		return jsonObject;
	}
	
	@ResponseBody
	@PutMapping("/data_board/comment/{comment_no}")
	public Map<String, Object> modifyComment(@PathVariable int comment_no, @ModelAttribute CommentVO commentVO) {
		JSONObject jsonObject = new JSONObject();
		
		int result = userService.updateComment(commentVO);
		
		Criteria cri = new Criteria();
		cri.setBoard_no(commentVO.getBoard_no() + "");
		
		List<CommentVO> commentList = userService.selectBoardComments(cri);
		PageVO pageVO = new PageVO(cri, userService.selectBoardCommentsCount(commentVO.getBoard_no()));
		
		jsonObject.put("commentList", commentList);
		jsonObject.put("pageVO", pageVO);
		
		return jsonObject;
	}
}
