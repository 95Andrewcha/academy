package com.academy.service;

import java.util.List;
import java.util.Map;

import com.academy.vo.AttachVO;
import com.academy.vo.CalendarVO;
import com.academy.vo.CouponVO;
import com.academy.vo.Criteria;
import com.academy.vo.PopupVO;
import com.academy.vo.Time_tblVO;

public interface AdminService {
	
	/**
	 * 학원 인원 불러오기
	 * @return 학원 인원 데이터
	 */
	public List<Map<String, Object>> totalchild();
	
	public List<PopupVO> getPopup();
	
	public PopupVO getPopupDetail(int id);
	
	public List<CouponVO> getCoupList(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void couponInsert(CouponVO Couponvo);
	
	public List<CouponVO> couponsearch(CouponVO couponVO);
	
	public List<Time_tblVO> getLst();
	
	public void add_timetable(Time_tblVO time_tblvo);
	
	public void add_time(String time);
	
	public List<CalendarVO> calendarList();
	
	public void schedule_insert(CalendarVO calendarvo);
	
	public int deletepopup(int id);
	
	public int update_time(Time_tblVO time_tblvo);
	
	public int update_timetable(Time_tblVO time_tblvo);
	
	public Map<String, Object> insertPopupFiles(Map<String, Object> paramMap);

}
