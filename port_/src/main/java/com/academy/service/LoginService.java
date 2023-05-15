package com.academy.service;

import java.util.List;

import com.academy.vo.AuthVO;
import com.academy.vo.UserVO;

public interface LoginService {
	
	/**
	 * 로그인 정보 조회
	 * @param username
	 * @return UserVO
	 */
	public UserVO login(String username);
	
	/**
	 * 권한 정보 조회
	 * @param username
	 * @return List<AuthVO>
	 */
	public List<AuthVO> getAuthList(String username);
	
}
