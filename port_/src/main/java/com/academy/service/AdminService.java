package com.academy.service;

import java.util.ArrayList;
import java.util.List;

import com.academy.vo.CouponVO;
import com.academy.vo.Criteria;
import com.academy.vo.DateData;
import com.academy.vo.PopupVO;
import com.academy.vo.ScheduleVO;
import com.academy.vo.Time_tblVO;

public interface AdminService {

	public List<PopupVO> getPopup();
	
	public List<CouponVO> getCoupList(Criteria cri);
	
	public int getTotalCount(Criteria cri);

	public void couponInsert(CouponVO Couponvo);
	
	/*schedule*/
	public int schedule_add(ScheduleVO schedulevo);
	
	public int before_shcedule_add_search(ScheduleVO schedulevo);
	
	public ArrayList<ScheduleVO> schedule_list(DateData dateData);
	
	/*수정 삭제 리스트 불러오기*/
	public ScheduleVO get(int idx);
	
	/*update*/
	public int update(ScheduleVO schedulevo);
	
	/*delete*/
	public int delete(ScheduleVO shcdulevo);
	
	public List<Time_tblVO> getLst();
}
