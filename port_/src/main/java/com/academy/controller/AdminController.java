package com.academy.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.academy.service.AdminService;
import com.academy.vo.CouponVO;
import com.academy.vo.Criteria;
import com.academy.vo.DateData;
import com.academy.vo.PageVO;
import com.academy.vo.ScheduleVO;
import com.academy.vo.Time_tblVO;
import com.academy.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/*")
@Controller
public class AdminController {
	@Autowired
	private AdminService adminservice;

	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public String Admin(HttpServletRequest request, UserVO uservo, Object UserDetails, Authentication authentication) {
		System.out.println("adminpage");

		UserDetails user = (UserDetails) authentication.getPrincipal();
		System.out.println("users:" + user);

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

	@GetMapping(value = "login")
	public String doLogin(HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		log.info(auth);

		Collection<? extends GrantedAuthority> authorities = auth.getAuthorities();

		for (GrantedAuthority authority : authorities) {
			// 이미 로그인 된 관리자일 경우 관리자 메인 페이지로 이동
			if (authority.getAuthority().equals("ROLE_AD")) {
				log.info("이미 로그인 된 관리자입니다. 관리자 메인으로 이동합니다." + authority.getAuthority());
				return "redirect:/admin/admin";
			}
		}

		request.getSession().setAttribute("admin", true);

		// 이전 페이지 URI
		String prevUri = request.getHeader("Referer");

		if (prevUri != null && !prevUri.contains("/login")) {
			request.getSession().setAttribute("prevUri", prevUri);
		}

		return request.getRequestURI();
	}

	/**
	 * 로그아웃
	 * 
	 * @param request
	 * @return String
	 */ 
	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		} 

		return "redirect:/admin/login";
	}

	/*--------------------------------------------------------------------------------------------------------------*/
	/* ������������������ ������������������ ���살�몄�� ������������ */
	/*--------------------------------------------------------------------------------------------------------------*/

	/* ���살�몄�� ������������ */
	@RequestMapping(value = "ac_info/ac_info", method = RequestMethod.GET)
	public String ac_info(HttpServletRequest request, Model model) {
		System.out.println(request.getRequestURI());
		model.addAttribute("timetableList", adminservice.getLst());
		List<Time_tblVO> timetableList = adminservice.getLst();
		System.out.println("timetableList:" + timetableList);

		return request.getRequestURI();
	}

	/* ������������������������������������ */
	@RequestMapping(value = "ac_info/subject_info", method = RequestMethod.GET)
	public String subject_info(HttpServletRequest request) {
		System.out.println(request.getRequestURI());

		return request.getRequestURI();
	}

	/* ��������������������占� */
	@RequestMapping(value = "ac_info/ac_test_manage", method = RequestMethod.GET)
	public String ac_test_manage(HttpServletRequest request, Model model, Criteria cri) {
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

	/*
	 * @RequestMapping(value = "ac_info/schedule", method = RequestMethod.GET)
	 * public String schedule(HttpServletRequest request,DateData dateData , Model
	 * model){
	 * 
	 * Calendar cal = Calendar.getInstance(); DateData calendarData;
	 * 
	 * if(dateData.getDate().equals("") && dateData.getMonth().equals("")) {
	 * dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),
	 * String.valueOf(cal.get(Calendar.MONTH)),
	 * String.valueOf(cal.get(Calendar.DATE)), null, value null); arr
	 * DateData(String year, String month, String date, String value, ScheduleVO[]
	 * schedule_data_arr)
	 * 
	 * } Map<String, Integer> today_info = dateData.today_info(dateData);
	 * List<DateData> dateList = new ArrayList<DateData>(); ArrayList<ScheduleVO>
	 * Schedule_list = adminservice.schedule_list(dateData); 네이터 배열 추가
	 * ScheduleVO[][] schedule_data_arr = new ScheduleVO[32][4]; if
	 * (Schedule_list.isEmpty() != true) { int j = 0; for (int i = 0; i <
	 * Schedule_list.size(); i++) { int date =
	 * Integer.parseInt(String.valueOf(Schedule_list.get(i).getSchedule_date()).
	 * substring( String.valueOf(Schedule_list.get(i).getSchedule_date()).length() -
	 * 2, String.valueOf(Schedule_list.get(i).getSchedule_date()).length())); if (i
	 * > 0) { int date_before = Integer.parseInt(String.valueOf(Schedule_list.get(i
	 * - 1).getSchedule_date()) .substring(String.valueOf(Schedule_list.get(i -
	 * 1).getSchedule_date()).length() - 2, String.valueOf(Schedule_list.get(i -
	 * 1).getSchedule_date()).length())); if (date_before == date) { j = j + 1;
	 * schedule_data_arr[date][j] = Schedule_list.get(i); } else { j = 0;
	 * schedule_data_arr[date][j] = Schedule_list.get(i); } } else {
	 * schedule_data_arr[date][j] = Schedule_list.get(i); } } }
	 * 
	 * // 실질적인 달력 데이터 리스트에 데이터 삽입 시작. // 일단 시작 인덱스까지 아무것도 없는 데이터 삽입 for (int i = 1;
	 * i < today_info.get("start"); i++) { calendarData = new DateData(null, null,
	 * null, null, null); dateList.add(calendarData); }
	 * 
	 * // 날짜 삽입 for (int i = today_info.get("startDay"); i <=
	 * today_info.get("endDay"); i++) { ScheduleVO[] schedule_data_arr3 = new
	 * ScheduleVO[4]; schedule_data_arr3 = schedule_data_arr[i];
	 * 
	 * if (i == today_info.get("today")) { calendarData = new
	 * DateData(String.valueOf(dateData.getYear()),
	 * String.valueOf(dateData.getMonth()), String.valueOf(i), "today",
	 * schedule_data_arr3); } else { calendarData = new
	 * DateData(String.valueOf(dateData.getYear()),
	 * String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date",
	 * schedule_data_arr3); } dateList.add(calendarData);
	 * 
	 * }
	 * 
	 * // 달력 빈 곳 빈 데이터로 삽입 int index = 7 - dateList.size() % 7;
	 * 
	 * if (dateList.size() % 7 != 0) {
	 * 
	 * for (int i = 0; i < index; i++) { calendarData = new DateData(null, null,
	 * null, null, null); dateList.add(calendarData); } }
	 * 
	 * // 배열에 담음 model.addAttribute("dateList", dateList); // 날짜 데이터 배열
	 * model.addAttribute("today_info", today_info); return request.getRequestURI();
	 * }
	 */

	/*--------------------------------------------------------------------------------------------------------------*/
	/* ���살�쇱�� ������������ */
	/*--------------------------------------------------------------------------------------------------------------*/

	/* ������������������ */
	@RequestMapping(value = "stu_manage/att_manage", method = RequestMethod.GET)
	public String att_manage(HttpServletRequest request) {
		System.out.println("att_manage");

		return request.getRequestURI();
	}

	/* ������������ ������������ */
	@RequestMapping(value = "stu_manage/grade_manage", method = RequestMethod.GET)
	public String grade_manage(HttpServletRequest request) {
		System.out.println("grade_manage");

		return request.getRequestURI();
	}

	/* ���살�쇱�� ������������ */
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
	/* �������������� ������������ */
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

	/* board_popup */
	@RequestMapping(value = "board/enroll", method = RequestMethod.GET)
	public String enroll(HttpServletRequest request) {

		return request.getRequestURI();
	}

	@RequestMapping(value = "board/showPopUp", method = RequestMethod.GET)
	public String showPopUp(HttpServletRequest request) {

		return request.getRequestURI();
	}

	/*--------------------------------------------------------------------------------------------------------------*/
	/* ������������ ������������ */
	/*--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "text_manage/text_manage", method = RequestMethod.GET)
	public String text_manage(HttpServletRequest request) {
		System.out.println(request.getRequestURI());

		return request.getRequestURI();
	}

	/*--------------------------------------------------------------------------------------------------------------*/
	/* ������������ ������������ */
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

	@RequestMapping(value = "ad_manage/popup", method = { RequestMethod.GET, RequestMethod.POST })
	public String popup(HttpServletRequest request, Model model, Map<String, String> map,
			@RequestParam String[] tdArr) {
		System.out.println("popupMainPage");

		Map<String, String> controller = new HashMap<String, String>();
		String value = "";
		value = request.getParameter("value");
		controller.put("controller", value);
		System.out.println("controller :" + controller.get("controller"));

		if (value.equals("popupenroll")) {
			System.out.println("popupenroll");
			return "/admin/ad_manage/popupenroll";

		} /*
			 * else if(value.equals("delete")) { String id[] =
			 * request.getParameterValues("id"); for(int i = 0 ; i < id.length ; i++){
			 * System.out.println(id[i]+"<br/>"); } System.out.println("delete"); }
			 */

		else if (value.equals("popup")) {
			model.addAttribute("list", adminservice.getPopup());
			System.out.println("list");

		}

		else if (value.equals("delete")) {

			String[] id = tdArr;
			for (int i = 0; i < id.length; i++) {
				System.out.println(id[i] + "<br/>");
			}

			return "redirect:/admin/ad_manage/popup?value='popup'";
		}

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
	/* ������������ ������������ */ /* coupon_manage */
	/*--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "coupon_manage/coupon_manage", method = { RequestMethod.GET, RequestMethod.POST })
	public String coupon_manage(HttpServletRequest request, Criteria cri, Model model) {
		System.out.println(request.getRequestURI());

		model.addAttribute("couponList", adminservice.getCoupList(cri));
		int total = adminservice.getTotalCount(cri);
		PageVO pageVO = new PageVO(cri, total);
		model.addAttribute("pageMaker", pageVO);
		System.out.println("total:" + total);
		return request.getRequestURI();
	}

	@RequestMapping(value = "coupon_manage/coupon_enrollpop", method = RequestMethod.GET)
	public String coupoon_enrollpop(HttpServletRequest request) {
		System.out.println(request.getRequestURI());

		return request.getRequestURI();
	}

	@RequestMapping(value = "coupon_manage/coupon_enroll", method = RequestMethod.GET)
	public String coupoon_enroll(@ModelAttribute CouponVO couponvo, HttpServletRequest request) {
		System.out.println("들어오니?");
		adminservice.couponInsert(couponvo);
		System.out.println(request.getRequestURI());

		return "redirect:coupon_manage";
	}

	@RequestMapping(value = "coupon_manage/search", method = RequestMethod.GET)
	public String search(@ModelAttribute CouponVO couponvo, HttpServletRequest request) {

		System.out.println(request.getRequestURI());

		return "";
	}

	/*--------------------------------------------------------------------------------------------------------------*/
	/* ������������������ */ /* stats_manage */
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
