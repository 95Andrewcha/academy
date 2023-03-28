package com.academy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MainController {

	@GetMapping("/main")
	public String main(HttpServletRequest request) {
		log.info("잘 들어오는지 테스트");
		return "main";
	}
	
}
