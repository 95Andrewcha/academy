package com.academy.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
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
		System.out.println("admin_admin page입니다.");
		System.out.println(request.getRequestURI());
		return request.getRequestURI();
	}
	
	@GetMapping(value="login")
	public String doLogin(HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		log.info(auth);

		Collection<? extends GrantedAuthority> authorities = auth.getAuthorities();

		for(GrantedAuthority authority : authorities) {
			// 이미 로그인 된 관리자일 경우 관리자 메인 페이지로 이동
			if(authority.getAuthority().equals("ROLE_AD")) {
				log.info("이미 로그인 된 관리자입니다. 관리자 메인으로 이동합니다." + authority.getAuthority());
				return "redirect:/admin/admin";
			}
		}

		request.getSession().setAttribute("admin", true);

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

		return "redirect:/admin/login";
	}

	/*--------------------------------------------------------------------------------------------------------------*/
	/*관리자 페이지 학원 정보*/
	/*--------------------------------------------------------------------------------------------------------------*/
	
	/*학원 정보*/
	@RequestMapping(value = "ac_info/ac_info", method = RequestMethod.GET)
	public String ac_info(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	/*수강과목정보*/
	@RequestMapping(value = "ac_info/subject_info", method = RequestMethod.GET)
	public String subject_info(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	/*시간표*/
	@RequestMapping(value = "ac_info/schedule", method = RequestMethod.GET)
	public String schedule(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	/*시험관리*/
	@RequestMapping(value = "ac_info/ac_test_manage", method = RequestMethod.GET)
	public String ac_test_manage(HttpServletRequest request) {
		System.out.println("ac_test_manage");
		
		return request.getRequestURI();
	}
	
	/*--------------------------------------------------------------------------------------------------------------*/
	/*학생 관리*/
	/*--------------------------------------------------------------------------------------------------------------*/
	
	/*출결관리*/
	@RequestMapping(value = "stu_manage/att_manage", method = RequestMethod.GET)
	public String att_manage(HttpServletRequest request) {
		System.out.println("att_manage");
		
		return request.getRequestURI();
	}
	
	/*성적 관리*/
	@RequestMapping(value = "stu_manage/grade_manage", method = RequestMethod.GET)
	public String grade_manage(HttpServletRequest request) {
		System.out.println("grade_manage");
		
		return request.getRequestURI();
	}
	/*학생 정보*/
	@RequestMapping(value = "stu_manage/stu_info", method = RequestMethod.GET)
	public String stu_info(HttpServletRequest request) {
		System.out.println("stu_info");
		
		return request.getRequestURI();
	}
	/*--------------------------------------------------------------------------------------------------------------*/
	/*게시판 관리*/
	/*--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "board/data_board", method = RequestMethod.GET)
	public String data_board(HttpServletRequest request) {
		System.out.println("data_board");
		
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "board/qna_board", method = RequestMethod.GET)
	public String qna_board(HttpServletRequest request) {
		System.out.println("qna_board");
		
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "board/review", method = RequestMethod.GET)
	public String review(HttpServletRequest request) {
		System.out.println("review");
		
		return request.getRequestURI();
	}
	
	/*--------------------------------------------------------------------------------------------------------------*/
	/*문자 관리*/
	/*--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "text_manage/text_manage", method = RequestMethod.GET)
	public String text_manage(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	
	/*--------------------------------------------------------------------------------------------------------------*/
	/*광고 관리*/
	/*--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "ad_manage/ad_manage", method = RequestMethod.GET)
	public String ad_manage(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	/*--------------------------------------------------------------------------------------------------------------*/
	/*쿠폰 관리*/ /*coupon_manage*/
	/*--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "coupon_manage/coupon_manage", method = RequestMethod.GET)
	public String coupon_manage(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	/*--------------------------------------------------------------------------------------------------------------*/
	/*통계관리*/ /*stats_manage*/
	/*--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "stats_manage/stats_manage", method = RequestMethod.GET)
	public String stats_manage(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	/*--------------------------------------------------------------------------------------------------------------*/
	/*사용자 관리*/ /*coupon_manage*/
	/*--------------------------------------------------------------------------------------------------------------*/
}
