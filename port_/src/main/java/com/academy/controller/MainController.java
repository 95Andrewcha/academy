package com.academy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MainController {
	
	// 메인
	@GetMapping("/main")
	public String main(HttpServletRequest request) {
		return request.getRequestURI();
	}
	
	// 학원
	// (메인 > 학원)
	@GetMapping("/academy")
	public String academy(HttpServletRequest request) {
		return request.getRequestURI();
	}
	
	// 마이페이지 메인
	// (메인 > 마이페이지 메인)
	@GetMapping("/myPage/myMain")
	public String myMain(HttpServletRequest request) {
		return request.getRequestURI();
	}
	
}
