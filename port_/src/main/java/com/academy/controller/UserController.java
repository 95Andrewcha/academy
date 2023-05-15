package com.academy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.academy.common.Common;
import com.academy.service.UserService;
import com.academy.vo.Criteria;
import com.academy.vo.PageVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/*")
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
		model.addAttribute("userCount", Common.setComma(userService.getUserCount()));		// 회원 수 조회
		model.addAttribute("reviewCount", Common.setComma(userService.getReviewCount()));	// 리뷰 수 조회
		model.addAttribute("academyCount", Common.setComma(userService.getAcademyCount()));	// 학원 수 조회
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
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		log.info(auth);
		
		// 이미 로그인한 사용자일 경우 메인 페이지로 이동
		if(!auth.getPrincipal().equals("anonymousUser")) {
			return "redirect:/user/main";
		}
		
		request.getSession().setAttribute("admin", false);
		
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
	 * 메인 > 커뮤니티 > 수다게시판
	 * @param 
	 * @return String
	 */
	@GetMapping("community/free_board")
	public String free_board(HttpServletRequest request, Model model) {
		model.addAttribute("title", Common.setTitle("수다게시판", Common.COMMUNITY));
		return request.getRequestURI();
	}
	
	/**
	 * 메인 > 커뮤니티 > 자료게시판
	 * @param 
	 * @return String
	 */
	@GetMapping("community/data_board")
	public String data_board(@ModelAttribute Criteria cri, HttpServletRequest request, Model model) {
		model.addAttribute("title", Common.setTitle("자료게시판", Common.COMMUNITY));
		model.addAttribute("list", userService.getBoardsList(cri));
		model.addAttribute("pageVO", new PageVO(cri, userService.getBoardsCount(cri)));
		return request.getRequestURI();
	}
	
}
