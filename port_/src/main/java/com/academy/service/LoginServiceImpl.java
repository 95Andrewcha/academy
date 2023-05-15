package com.academy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.mapper.LoginMapper;
import com.academy.vo.AuthVO;
import com.academy.vo.UserVO;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	LoginMapper loginMapper;
	
	/**
	 * 로그인
	 * @param username
	 * @return UserVO
	 */
	public UserVO login(String username) {
		return loginMapper.login(username);
	};
	
	/**
	 * 권한 정보 조회
	 * @param username
	 * @return List<AuthVO>
	 */
	public List<AuthVO> getAuthList(String username) {
		return loginMapper.getAuthList(username);
	};
	
}
