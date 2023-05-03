package com.academy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.mapper.AdminMapper;
import com.academy.vo.PopupVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public List<PopupVO> getPopup(){
		
		return adminMapper.getPopup();
	}
	

}
