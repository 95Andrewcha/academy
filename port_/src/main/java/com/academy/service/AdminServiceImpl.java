package com.academy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.mapper.AdminMapper;
import com.academy.vo.CouponVO;
import com.academy.vo.Criteria;
import com.academy.vo.PopupVO;
import com.academy.vo.Time_tblVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper adminMapper;
	
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
		// TODO Auto-generated method stub
		return adminMapper.getTotalCount(cri);
	}


	@Override
	public void couponInsert(CouponVO Couponvo) {
		// TODO Auto-generated method stub
		
		adminMapper.couponInsert(Couponvo);
		
	}
	@Override
	public List<Time_tblVO> getLst() {
		/*시간표 조회*/
		return adminMapper.getLst();
	}
	

}
