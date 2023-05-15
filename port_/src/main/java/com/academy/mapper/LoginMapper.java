package com.academy.mapper;

import java.util.List;

import com.academy.vo.AuthVO;
import com.academy.vo.UserVO;

public interface LoginMapper {
	
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
