package com.academy.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.academy.service.AdminService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/*")
@Controller
public class AdminController {
	@Autowired
	private AdminService adminservice;

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
		System.out.println("admin_admin page����������.");
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
	/*������������������ ������������������ ���살�몄�� ������������*/
	/*--------------------------------------------------------------------------------------------------------------*/
	
	/*���살�몄�� ������������*/
	@RequestMapping(value = "ac_info/ac_info", method = RequestMethod.GET)
	public String ac_info(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	/*������������������������������������*/
	@RequestMapping(value = "ac_info/subject_info", method = RequestMethod.GET)
	public String subject_info(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	/*����怨ㅼ����*/
	@RequestMapping(value = "ac_info/ac_schedule", method = RequestMethod.GET)
	public String schedule(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		
		
		return request.getRequestURI();
	}
	
	/*��������������������占�*/
	@RequestMapping(value = "ac_info/ac_test_manage", method = RequestMethod.GET)
	public String ac_test_manage(HttpServletRequest request) {
		System.out.println("ac_test_manage");
		
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "ac_info/insert", method = RequestMethod.GET)
	public String insert(HttpServletRequest request) {
		System.out.println("insert");
		String reuqest = request.getRequestURI();
		System.out.println(reuqest);
		
		return request.getRequestURI();
	}
	
	/*--------------------------------------------------------------------------------------------------------------*/
	/*���살�쇱�� ������������*/
	/*--------------------------------------------------------------------------------------------------------------*/
	
	/*������������������*/
	@RequestMapping(value = "stu_manage/att_manage", method = RequestMethod.GET)
	public String att_manage(HttpServletRequest request) {
		System.out.println("att_manage");
		
		return request.getRequestURI();
	}
	
	
	
	
	/*������������ ������������*/
	@RequestMapping(value = "stu_manage/grade_manage", method = RequestMethod.GET)
	public String grade_manage(HttpServletRequest request) {
		System.out.println("grade_manage");
		
		return request.getRequestURI();
	}
	/*���살�쇱�� ������������*/
	@RequestMapping(value = "stu_manage/stu_info", method = RequestMethod.GET)
	public String stu_info(HttpServletRequest request) {
		System.out.println("stu_info");
		
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "stu_manage/open_detail", method = RequestMethod.GET)
	public String open_datail(HttpServletRequest request) {
		System.out.println("open_datail");
		System.out.println(request.getRequestURI());
		return request.getRequestURI();
	}
	/*--------------------------------------------------------------------------------------------------------------*/
	/*�������������� ������������*/
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
	
	/*board_popup*/
	@RequestMapping(value = "board/enroll", method = RequestMethod.GET)
	public String enroll(HttpServletRequest request) {
		
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "board/showPopUp", method = RequestMethod.GET)
	public String showPopUp(HttpServletRequest request) {
		
		return request.getRequestURI();
	}
	
	
	
	
	
	
	/*--------------------------------------------------------------------------------------------------------------*/
	/*������������ ������������*/
	/*--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "text_manage/text_manage", method = RequestMethod.GET)
	public String text_manage(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	
	/*--------------------------------------------------------------------------------------------------------------*/
	/*������������ ������������*/
	/*--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "ad_manage/ad_manage", method = RequestMethod.GET)
	public String ad_manage(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	
	@RequestMapping(value = "ad_manage/reasonpopup", method = RequestMethod.GET)
	public String reasonpopup(HttpServletRequest request) {
		System.out.println("reasonpopup");
		
	
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "ad_manage/popup", method = RequestMethod.GET)
	public String popup(HttpServletRequest request, Model model) {
		System.out.println("popupMainPage");
		model.addAttribute("list", adminservice.getPopup());
		System.out.println("list");
		
		
	
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "ad_manage/popupenroll", method = RequestMethod.GET)
	public String popupenroll(HttpServletRequest request) {
		System.out.println("popupenroll");
		
	
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "ad_manage/ac_accept", method = RequestMethod.GET)
	public String ac_accept(HttpServletRequest request) {
		System.out.println("ac_accept");
		
	
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "ad_manage/acceptPopup", method = RequestMethod.GET)
	public String acceptPopup(HttpServletRequest request) {
		System.out.println("ac_accept");
		
	
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "ad_manage/rejectPopup", method = RequestMethod.GET)
	public String rejectPopup(HttpServletRequest request) {
		System.out.println("ac_accept");
		
	
		return request.getRequestURI();
	}
	
	
	
	/*--------------------------------------------------------------------------------------------------------------*/
	/*������������ ������������*/ /*coupon_manage*/
	/*--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "coupon_manage/coupon_manage", method = RequestMethod.GET)
	public String coupon_manage(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "coupon_manage/coupoon_enroll", method = RequestMethod.GET)
	public String coupoon_enroll(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	
	/*--------------------------------------------------------------------------------------------------------------*/
	/*������������������*/ /*stats_manage*/
	/*--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "stats_manage/stats_manage", method = RequestMethod.GET)
	public String stats_manage(HttpServletRequest request) {
		System.out.println(request.getRequestURI());
		
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "stats_manage/select", method = RequestMethod.GET)
	public String select(HttpServletRequest request) {
		System.out.println("select");
		
	
		return request.getRequestURI();
	}
}
