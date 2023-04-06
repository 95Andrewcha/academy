package com.academy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		System.out.println("admin_admin page�Դϴ�.");
		System.out.println(request.getRequestURI());
		return request.getRequestURI();
	}
	
	
	@GetMapping(value="login")
	public String doLogin(String error, String logout, Model model, HttpServletRequest request) {
		
	
		log.info("error:" + error);
		log.info("logout:" + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout != null) {
			model.addAttribute("logout", "logout!!");
		}
		return request.getRequestURI();
	}
	
	/*--------------------------------------------------------------------------------------------------------------*/
	/*������ ������ �п� ����*/
	/*--------------------------------------------------------------------------------------------------------------*/
	
	/*�п� ����*/
	@RequestMapping(value = "ac_info/ac_info", method = RequestMethod.GET)
	public String ac_info(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	/*������������*/
	@RequestMapping(value = "ac_info/subject_info", method = RequestMethod.GET)
	public String subject_info(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	/*�ð�ǥ*/
	@RequestMapping(value = "ac_info/schedule", method = RequestMethod.GET)
	public String schedule(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	/*�������*/
	@RequestMapping(value = "ac_info/ac_test_manage", method = RequestMethod.GET)
	public String ac_test_manage(HttpServletRequest request) {
		System.out.println("ac_test_manage");
		
		return request.getRequestURI();
	}
	
	/*--------------------------------------------------------------------------------------------------------------*/
	/*�л� ����*/
	/*--------------------------------------------------------------------------------------------------------------*/
	
	/*������*/
	@RequestMapping(value = "stu_manage/att_manage", method = RequestMethod.GET)
	public String att_manage(HttpServletRequest request) {
		System.out.println("att_manage");
		
		return request.getRequestURI();
	}
	
	/*���� ����*/
	@RequestMapping(value = "stu_manage/grade_manage", method = RequestMethod.GET)
	public String grade_manage(HttpServletRequest request) {
		System.out.println("grade_manage");
		
		return request.getRequestURI();
	}
	/*�л� ����*/
	@RequestMapping(value = "stu_manage/stu_info", method = RequestMethod.GET)
	public String stu_info(HttpServletRequest request) {
		System.out.println("stu_info");
		
		return request.getRequestURI();
	}
	/*--------------------------------------------------------------------------------------------------------------*/
	/*�Խ��� ����*/
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
	/*���� ����*/
	/*--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "text_manage/text_manage", method = RequestMethod.GET)
	public String text_manage(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	
	/*--------------------------------------------------------------------------------------------------------------*/
	/*���� ����*/
	/*--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "ad_manage/ad_manage", method = RequestMethod.GET)
	public String ad_manage(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	/*--------------------------------------------------------------------------------------------------------------*/
	/*���� ����*/ /*coupon_manage*/
	/*--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "coupon_manage/coupon_manage", method = RequestMethod.GET)
	public String coupon_manage(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	/*--------------------------------------------------------------------------------------------------------------*/
	/*������*/ /*stats_manage*/
	/*--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "stats_manage/stats_manage", method = RequestMethod.GET)
	public String stats_manage(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	/*--------------------------------------------------------------------------------------------------------------*/
	/*����� ����*/ /*coupon_manage*/
	/*--------------------------------------------------------------------------------------------------------------*/
}
