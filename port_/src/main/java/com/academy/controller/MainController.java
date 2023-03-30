package com.academy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/*")
public class MainController {
	
	/**
	 * 메인
	 * @param request
	 * @return String
	 */
	@GetMapping("main")
	public String main(HttpServletRequest request) {
		return request.getRequestURI();
	}
	
	@GetMapping("login")
	public String loginPage(HttpServletRequest request) {
		return request.getRequestURI();
	}
	
	//---------------------------------------------------------
	// 학원 start
	//---------------------------------------------------------
	
	/**
	 * 메인 > 학원
	 * @param request
	 * @return String
	 */
	@GetMapping("academy")
	public String academy(HttpServletRequest request) {
		return request.getRequestURI();
	}
	
	/**
	 * 메인 > 학원 > 학원 상세 팝업
	 * @param request
	 * @return String
	 */
	@GetMapping("academy/academy_detail_pop")
	public String academy_detail_pop(HttpServletRequest request) {
		return request.getRequestURI();
	}
	
	//---------------------------------------------------------
	// 학원 end
	//---------------------------------------------------------
	
	//---------------------------------------------------------
	// 마이페이지 start
	//---------------------------------------------------------
	
	/**
	 * 메인 > 마이페이지 메인
	 * @param request
	 * @return String
	 */
	@GetMapping("my_page/my_main")
	public String myMain(HttpServletRequest request) {
		return request.getRequestURI();
	}
	
	//---------------------------------------------------------
	// 마이페이지 end
	//---------------------------------------------------------
	
}
