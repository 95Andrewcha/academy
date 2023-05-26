package com.academy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.mapper.AdminMapper;
import com.academy.vo.AttachVO;
import com.academy.vo.CalendarVO;
import com.academy.vo.CouponVO;
import com.academy.vo.Criteria;
import com.academy.vo.PopupVO;
import com.academy.vo.Time_tblVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper adminMapper;
	
	/**
	 * 학원 인원 불러오기
	 * @return 학원 인원 데이터
	 */
	@Override
	public List<Map<String, Object>> totalchild() {
		return adminMapper.totalchild();
	}
	@Override
	public List<PopupVO> getPopup(){
		return adminMapper.getPopup();
	}
	
	@Override
	public List<CouponVO> getCoupList(Criteria cri) {
		return adminMapper.getCoupList(cri);
	}
	@Override
	public int getTotalCount(Criteria cri) {
		return adminMapper.getTotalCount(cri);
	}
	@Override
	public void couponInsert(CouponVO Couponvo) {
		adminMapper.couponInsert(Couponvo);
	}
	/*
	 * 시간표 조회
	 */
	@Override
	public List<Time_tblVO> getLst() {
		return adminMapper.getLst();
	}
	/*
	 * 시간표 과목 등록
	 */
	@Override
	public void add_timetable(Time_tblVO time_tblvo) {
		adminMapper.add_timetable(time_tblvo);
	}
	/*
	 * 시간표 시간 등록
	 */
	@Override
	public void add_time(String time) {
		adminMapper.add_time(time);
	}
	/*
	 * 일정표 조회
	 */
	@Override
	public List<CalendarVO> calendarList() {
		return adminMapper.calendarList();
	}
	/*
	 * 일정표 일정 등록
	 */
	@Override
	public void schedule_insert(CalendarVO calendarvo){
		adminMapper.schedule_insert(calendarvo);
		
	}
	@Override
	public List<CouponVO> couponsearch(CouponVO couponVO) {
		return adminMapper.couponsearch(couponVO);
	}

	@Override
	public int deletepopup(int id) {
		return adminMapper.deletepopup(id);
	}
	@Override
	public PopupVO getPopupDetail(int id) {
		return adminMapper.getPopupDetail(id);
	}
	@Override
	public int update_time(Time_tblVO time_tblvo) {
		return adminMapper.update_time(time_tblvo);
	}
	@Override
	public int update_timetable(Time_tblVO time_tblvo) {
		return adminMapper.update_timetable(time_tblvo);
	}
	@Override
	public Map<String, Object> insertPopupFiles(Map<String, Object> paramMap) {
		List<AttachVO> fileList = (List<AttachVO>) paramMap.get("fileList");
		
		adminMapper.insertpopup(paramMap);
		
		for(AttachVO vo : fileList) {
			adminMapper.insertBoardFiles(vo);
		}
		
		paramMap.put("fileList", fileList);
		
		return paramMap;
		
	}
	@Override
	public Map<String, Object> updatepopup(Map<String, Object> paramMap) {
		
		adminMapper.updatepopup(paramMap);
		
		return paramMap;
	}
	





	
	
	

}
