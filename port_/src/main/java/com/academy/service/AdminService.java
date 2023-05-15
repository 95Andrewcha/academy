package com.academy.service;

import java.util.List;

import com.academy.vo.CouponVO;
import com.academy.vo.Criteria;
import com.academy.vo.PopupVO;
import com.academy.vo.Time_tblVO;

public interface AdminService {

	public List<PopupVO> getPopup();
	
	public List<CouponVO> getCoupList(Criteria cri);
	
	public int getTotalCount(Criteria cri);

	public void couponInsert(CouponVO Couponvo);
	
	public List<Time_tblVO> getLst();
}
