package com.academy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.academy.common.Common;
import com.academy.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/*")
public class UserController {

	/**
	 * 메인
	 * @param 
	 * @return String
	 */
	@GetMapping("main")
	public String main(HttpServletRequest request) {
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
	 * 메인 > 마이페이지 > 결제내역
	 * @param 
	 * @return String
	 */
	@GetMapping("my_page/my_payment")
	public String my_payment(HttpServletRequest request, Model model) {
		String subMenuTitle = "결제내역";

		model.addAttribute("subMenuTitle", subMenuTitle);
		model.addAttribute("title", Common.setTitle(subMenuTitle, Common.MY_PAGE));
		
		return request.getRequestURI();
	}
	
	/**
	 * 메인 > 마이페이지 > 나의 정보
	 * @param 
	 * @return String
	 */
	@GetMapping("my_page/my_info")
	public String my_info(HttpServletRequest request, Model model) {
		String subMenuTitle = "나의 정보";
		
		model.addAttribute("subMenuTitle", subMenuTitle);
		model.addAttribute("title", Common.setTitle(subMenuTitle, Common.MY_PAGE));
		
		return request.getRequestURI();
	}
	
	/**
	 * 메인 > 학원
	 * @param 
	 * @return String
	 */
	@GetMapping("academy")
	public String academy(HttpServletRequest request) {
		return request.getRequestURI();
	}

	/**
	 * 메인 > 학원 > 학원 상세
	 * @param 
	 * @return String
	 */
	@GetMapping("academy/academy_detail_pop")
	public String academy_detail_pop(HttpServletRequest request) {
		return request.getRequestURI();
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
	public String data_board(HttpServletRequest request, Model model) {
		model.addAttribute("title", Common.setTitle("자료게시판", Common.COMMUNITY));
		return request.getRequestURI();
	}
	
}