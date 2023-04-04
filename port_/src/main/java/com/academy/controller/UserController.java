package com.academy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/*")
public class UserController {

	/**
	 * 메인 페이지
	 * @param request
	 * @return String
	 */
	@GetMapping("main")
	public String main(HttpServletRequest request) {
		return request.getRequestURI();
	}

	/**
	 * 로그인 페이지
	 * @param request
	 * @return String
	 */
	@RequestMapping("login")
	public String login(HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		log.info(auth);
		
		// 이미 로그인 된 사용자일 경우 메인페이지로 이동
		if(!auth.getPrincipal().equals("anonymousUser")) {
			return "redirect:/user/main";
		}
		
		request.getSession().setAttribute("admin", false);
		
		// 이전 페이지 URI
		String prevUri = request.getHeader("Referer");

		if(prevUri != null && !prevUri.contains("/login")) {
			request.getSession().setAttribute("prevUri", prevUri);
		}

		return request.getRequestURI();
	}
	
	/**
	 * 로그아웃
	 * @param request
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

	// ---------------------------------------------------------
	// 학원 start
	// ---------------------------------------------------------

	/**
	 * 메인 > 학원 페이지
	 * 
	 * @param request
	 * @return String
	 */
	@GetMapping("academy")
	public String academy(HttpServletRequest request) {
		return request.getRequestURI();
	}

	/**
	 * 메인 > 학원 > 학원 상세 팝업 페이지
	 * 
	 * @param request
	 * @return String
	 */
	@GetMapping("academy/academy_detail_pop")
	public String academy_detail_pop(HttpServletRequest request) {
		return request.getRequestURI();
	}

	// ---------------------------------------------------------
	// 학원 end
	// ---------------------------------------------------------

	// ---------------------------------------------------------
	// 마이페이지 start
	// ---------------------------------------------------------

	/**
	 * 메인 > 마이페이지 메인
	 * 
	 * @param request
	 * @return String
	 */
	@GetMapping("my_page/my_main")
	public String myMain(HttpServletRequest request) {
		return request.getRequestURI();
	}

	// ---------------------------------------------------------
	// 마이페이지 end
	// ---------------------------------------------------------

}
