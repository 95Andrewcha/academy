package com.academy.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.academy.vo.AttachVO;
import com.academy.vo.CalendarVO;
import com.academy.vo.ChildrenVO;
import com.academy.vo.CouponVO;
import com.academy.vo.Criteria;
import com.academy.vo.PopupVO;
import com.academy.vo.ScheduleVO;
import com.academy.vo.Time_tblVO;

public interface AdminMapper {

	public ArrayList<ScheduleVO> schedule_list();

	/*팝업*/
	public List<PopupVO> getPopup();
	
	public PopupVO getPopupDetail(int id);

	public List<CouponVO> getCoupList(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void couponInsert(CouponVO couponvo);
	
	public List<Time_tblVO> getLst();
	
	public void add_timetable(Time_tblVO time_tblvo) ;
	
	public void add_time(String time);
	
	public List<CalendarVO> calendarList();
	
	public List<Map<String, Object>> totalchild();
	
	public void schedule_insert(CalendarVO calendarvo);
	
	public List<CouponVO> couponsearch(CouponVO couponVO);
	
	public int deletepopup(int id);
	
	public int update_time(Time_tblVO time_tblvo);
	
	public int update_timetable(Time_tblVO time_tblvo); 
	
	public void insertBoardFiles(AttachVO attachVO);
	
	public void insertpopup(Map<String, Object> paramMap);
	
	
}
