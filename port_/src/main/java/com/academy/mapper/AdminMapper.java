package com.academy.mapper;

import java.util.ArrayList;
import java.util.List;

import com.academy.vo.CouponVO;
import com.academy.vo.Criteria;
import com.academy.vo.PopupVO;
import com.academy.vo.ScheduleVO;
import com.academy.vo.Time_tblVO;

public interface AdminMapper {

	public ArrayList<ScheduleVO> schedule_list();

	/*팝업*/
	public List<PopupVO> getPopup();

	public List<CouponVO> getCoupList(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void couponInsert(CouponVO couponvo);
	
	public List<Time_tblVO> getLst();
	
	public void add_timetable(Time_tblVO time_tblvo) ;
	
	public void add_time(String time);
}
