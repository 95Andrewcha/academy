package com.academy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/*")
@Controller
public class AdminController {

	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public String Admin(HttpServletRequest request) {
		System.out.println("adminpage");
		
		return request.getRequestURI();
	}
	
	@GetMapping("/admin_member")
	public void doMember() {
		log.info("logined member");
	}
	
	@GetMapping(value = "admin_admin")
	public String doAdmin(HttpServletRequest request) {
		log.info("admin only");
		System.out.println("admin_admin page¿‘¥œ¥Ÿ.");
		System.out.println(request.getRequestURI());
		return request.getRequestURI();
	}
	
	@GetMapping(value="admin_login")
	public String doLogin(HttpServletRequest request) {
		
		System.out.println("login");
		return request.getRequestURI();
	}
}
