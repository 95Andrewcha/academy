package com.academy.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.academy.common.Common;
import com.academy.mapper.AdminMapper;
import com.academy.service.AdminService;
import com.academy.vo.AttachVO;
import com.academy.vo.CalendarVO;
import com.academy.vo.ChildrenVO;
import com.academy.vo.CouponVO;
import com.academy.vo.Criteria;
import com.academy.vo.PageVO;
import com.academy.vo.PopupVO;
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
	public String Admin(HttpServletRequest request, UserVO uservo, Object UserDetails, Authentication authentication, ChildrenVO childrenvo, Model model) {
		System.out.println("adminpage");

		UserDetails user = (UserDetails) authentication.getPrincipal();
		System.out.println("users:" + user);
		
		List<Map<String, Object>> charlist = adminservice.totalchild();
		List<Map<String, Object>> gender1Maps = new ArrayList<>();
		List<Map<String, Object>> gender0Maps = new ArrayList<>();
		List<Map<String, Object>> genderSum = new ArrayList<>();

		for (Map<String, Object> map : charlist) {
		    int gender = Integer.parseInt(String.valueOf(map.get("GENDER")));
		    if (gender == 1) {
		        gender1Maps.add(map);
		    } else if (gender == 0) {
		        gender0Maps.add(map);
		    } else if (gender ==2) {
		    	genderSum.add(map);
		    }
		}
		model.addAttribute("charlist", charlist);
		model.addAttribute("woman", gender1Maps);
		model.addAttribute("man", gender0Maps);
		model.addAttribute("sum", genderSum);

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
		HttpSession session = request.getSession();
		session.setAttribute("admin", true);
		
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
		
		Boolean isError = Boolean.parseBoolean(request.getParameter("error"));
		String message = request.getParameter("message");
		
		if(isError && message != null) {
			request.setAttribute("isError", isError);
			request.setAttribute("message", message);
		}

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
		model.addAttribute("timetableList", adminservice.getLst());
		List<Time_tblVO> timetableList = adminservice.getLst();
		System.out.println("timetableList:" + timetableList);

		return request.getRequestURI();
	}
	
	@RequestMapping(value = "ac_info/time_tbl_enrollpop", method = RequestMethod.GET)
	public String time_enroll(HttpServletRequest request, @ModelAttribute Time_tblVO time_tblVO) {
	
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "ac_info/time_tbl_enrollpop_time", method = RequestMethod.GET)
	public String time_enroll(HttpServletRequest request) {
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "ac_info/time_tbl_update", method = RequestMethod.GET)
	public String time_tbl_update(HttpServletRequest request, @ModelAttribute Time_tblVO time_tblVO) {
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "ac_info/time_tbl_update_time", method = RequestMethod.GET)
	public String time_update(HttpServletRequest request, @ModelAttribute Time_tblVO time_tblVO) {
		return request.getRequestURI();
	}
	@RequestMapping(value = "ac_info/time_tbl_doupdate", method=RequestMethod.POST)
	public String time_tbl_doupdate(HttpServletRequest request, @ModelAttribute Time_tblVO time_tblVO) {
		
		String subject = time_tblVO.getSubject();
		String day= time_tblVO.getDay();
		String time = time_tblVO.getTime();
		String subject2 = time_tblVO.getSubject2();
		
		if("".equals(day) && "".equals(subject)) {
			adminservice.update_time(time_tblVO);
		}else {
			adminservice.update_timetable(time_tblVO);
		}
		
		return "redirect:/admin/ac_info/ac_info";
	}
	
	
	@RequestMapping(value = "ac_info/time_tbl_enroll", method = {RequestMethod.GET, RequestMethod.POST})
	public String time_tbl_enroll(HttpServletRequest request,  @ModelAttribute Time_tblVO time_tblVO)  {
		System.out.println(request.getRequestURI());
		
		System.out.println("time:" + time_tblVO.getTime());
		System.out.println("day:" + time_tblVO.getDay());
		System.out.println("subject:" + time_tblVO.getSubject());
		
		String time= time_tblVO.getTime();
		String subject = time_tblVO.getSubject();
		String day= time_tblVO.getDay();
		
		
		
		if("".equals(day) &&  "".equals(subject)) {
			adminservice.add_time(time);
		}else {
			adminservice.add_timetable(time_tblVO);
		}
		
		return "redirect:/admin/ac_info/ac_info";
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
	
	@RequestMapping(value="ac_info/schedule",  method=RequestMethod.GET)
	public String schedule(HttpServletRequest request, Model model) {
		List<CalendarVO> listAll = adminservice.calendarList();
		System.out.println("ac_info/schedule 진입");
		model.addAttribute("listAll", listAll);
		return request.getRequestURI();
	}
	


	
	
	

	
	 @SuppressWarnings("unchecked")
	@RequestMapping(value="ac_info/schedule_info")
	  @ResponseBody 
	  public List<Map<String, Object>> monthPlan() {
		  List<CalendarVO> listAll = adminservice.calendarList();
		  JSONObject jsonObj = new JSONObject();
		  JSONArray jsonArr = new JSONArray();
		  HashMap<String, Object> hash = new HashMap<>();
	        for (int i = 0; i < listAll.size(); i++) {
	            hash.put("title", listAll.get(i).getTitle());
	            hash.put("start", listAll.get(i).getStart_date());
	            hash.put("end", listAll.get(i).getEnd_date());
	            jsonObj = new JSONObject(hash);
	            jsonArr.add(jsonObj);
	        }
	        
	        System.out.println("jsonArr:::::" + jsonArr);


	     return jsonArr;

	  }
	 
		@RequestMapping(value="ac_info/schedulepopup", method=RequestMethod.GET)
		public String schedulepopup(HttpServletRequest request, Model model) {
			System.out.println("ac_info/schedule/schedulepopup 진입");
			return request.getRequestURI();
		}
		
	 
		@ResponseBody
		@RequestMapping(value = "ac_info/scheduleadd", method= RequestMethod.POST)
		public Map<Object, Object>scheduleadd(HttpServletRequest request, @RequestBody CalendarVO calendarvo){
			
			Map<Object, Object>map = new HashMap<Object, Object>();
			
		
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String start_date = request.getParameter("start_date");
			System.out.println("title::::" + title);
			System.out.println("content::::" + content);
			System.out.println("start_date:::" +start_date);
			
			adminservice.schedule_insert(calendarvo);
			
			return map;
		}
	

	 
	

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
	public String popup(HttpServletRequest request, Model model, Map<String, String> map) {
		System.out.println("popupMainPage");
		
		model.addAttribute("list", adminservice.getPopup());
		System.out.println("list");

		/*Map<String, String> controller = new HashMap<String, String>();
		String value = "";
		value = request.getParameter("value");
		controller.put("controller", value);
		System.out.println("controller :" + controller.get("controller"));

		if(value.equals(null)) {
			return "/admin/ad_manage/popup";
		}else if (value.equals("popupenroll")) {
			System.out.println("popupenroll");
			return "/admin/ad_manage/popupenroll";

		}

		else if (value.equals("popup")) {
			

		}

		else if (value.equals("delete")) {

			String[] id = tdArr;
			for (int i = 0; i < id.length; i++) {
				System.out.println(id[i] + "<br/>");
			}

			return "redirect:/admin/ad_manage/popup?value='popup'";
		}
*/
		return request.getRequestURI();
	}
	
	@RequestMapping(value = "ad_manage/popupenroll", method =  RequestMethod.GET )
	public String popupenroll(HttpServletRequest request) {
		return request.getRequestURI();
	}
	
	@ResponseBody
	@RequestMapping(value ="ad_manage/dopopupenroll", method=RequestMethod.POST)
	public Map<String, Object> dopopupenroll(MultipartHttpServletRequest multipartRequest) throws Exception  {
		
		Map<String, Object> paramMap = new HashMap<>();
		Enumeration<String> paramNames = multipartRequest.getParameterNames();
		while(paramNames.hasMoreElements()) {
			String name = paramNames.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("name: " + name);
			System.out.println("value: " + value);
			paramMap.put(name, value);
		}
		List<AttachVO> fileList = Common.uploadFile(multipartRequest);
		paramMap.put("uuid", fileList.get(0).getUuid());
		paramMap.put("fileList", fileList);
		
		System.out.println("paramMap:::" + paramMap.get("fileList"));
		for (Map.Entry<String, Object> entry : paramMap.entrySet()) {
		    String name = entry.getKey();
		    Object value = entry.getValue();
		    System.out.println("name: " + name);
		    System.out.println("value: " + value);
		}
		
		
		
		Map<String, Object> result = adminservice.insertPopupFiles(paramMap);
		
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "ad_manage/popupDetail/{id}", method =  RequestMethod.GET )
	public JSONObject popupenroll(@PathVariable int id, HttpServletRequest request ) {
		
		PopupVO popupvo = adminservice.getPopupDetail(id); 
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", popupvo);
		
		return jsonObject;
	}
	
	@ResponseBody
	@RequestMapping(value= "ad_manage/delete", method=RequestMethod.POST)
	public String delete(HttpServletRequest request, @RequestParam String[] tdArr, PopupVO popupvo) {
		
		String [] ids = tdArr;
		
		for (int i = 0; i < ids.length; i++) {
			System.out.println("tddArr:" + ids[i]);
			
			String did = ids[i];
			int id=Integer.parseInt(did);
			int r = adminservice.deletepopup(id);
			if (r>0) {
				System.out.println("삭제");
			}else {
				System.out.println("삭제실패");
			}
			
			
		}
		
		System.out.println("tdArr:::::::" + ids);
		
		return "test";
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

	@RequestMapping(value = "coupon_manage/coupon_enroll", method = RequestMethod.POST)
	public String coupoon_enroll(@ModelAttribute CouponVO couponvo, HttpServletRequest request) {
		System.out.println("들어오니?");
		adminservice.couponInsert(couponvo);
		System.out.println(request.getRequestURI());

		return "redirect:coupon_manage";
	}

	@RequestMapping(value ="coupon_manage/search", method = RequestMethod.POST)
	@ResponseBody
	public String search(HttpServletRequest request,
			/*
			 * @RequestParam("name") String name,
			 * 
			 * @RequestParam("start_date") String startDate,
			 * 
			 * @RequestParam("end_date") String endDate,
			 * 
			 * @RequestParam("active") String active,
			 */
            
			@ModelAttribute CouponVO couponVO) {
		
		
//		System.out.println("name:::::" + name);
//		System.out.println("start_date:::::" + startDate);
//		System.out.println("end_date:::::" + endDate);
//		System.out.println("active:::::" + active);
		

		List<CouponVO> couponlist = adminservice.couponsearch(couponVO);
		System.out.println("couponlist:::::" + couponlist);
		System.out.println(request.getRequestURI());
		
		JSONObject jsonObject = new JSONObject();
		
		
		jsonObject.put("result", couponlist);
		
		return jsonObject.toString();
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
	
	@ResponseBody
	@PostMapping("/uploadAjaxAction")
	public JSONObject uploadAjaxAction(MultipartHttpServletRequest multipartRequest) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		Enumeration<String> paramNames = multipartRequest.getParameterNames();
		while(paramNames.hasMoreElements()) {
			String name = paramNames.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("name: " + name);
			System.out.println("value: " + value);
			paramMap.put(name, value);
		}
		List<AttachVO> fileList = Common.uploadFile(multipartRequest);
		paramMap.put("uuid", fileList.get(0).getUuid());
		paramMap.put("fileList", fileList);
		
		System.out.println("paramMap:::" + paramMap.get("fileList"));
		for (Map.Entry<String, Object> entry : paramMap.entrySet()) {
		    String name = entry.getKey();
		    Object value = entry.getValue();
		    System.out.println("name: " + name);
		    System.out.println("value: " + value);
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("fileList", fileList);
		
		return jsonObject;
	}
}
