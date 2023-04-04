package com.academy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	/**
	 * 액세스 거부 페이지
	 * @param auth
	 * @param model
	 * @return String
	 */
	@GetMapping("/accessError")
	public String accessDenied(Authentication auth, Model model) {
		log.info("access Denied:"  + auth);
		model.addAttribute("msg", "access Denied");
		
		return "error/accessError";
	}

}
