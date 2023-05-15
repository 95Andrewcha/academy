package com.academy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.mapper.UserMapper;
import com.academy.vo.AdVO;
import com.academy.vo.BoardVO;
import com.academy.vo.Criteria;
import com.academy.vo.ReviewVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;
	
	/**
	 * 메인 > 회원 수 조회
	 * @return int
	 */
	@Override
	public int getUserCount() {
		return userMapper.getUserCount();
	}
	
	/**
	 * 메인 > 리뷰 수 조회
	 * @return int
	 */
	public int getReviewCount() {
		return userMapper.getReviewCount();
	};
	
	/**
	 * 메인 > 학원 수 조회
	 * @return int
	 */
	public int getAcademyCount() {
		return userMapper.getAcademyCount();
	}

	/**
	 * 메인 > 가장 인기 많은 학원 TOP4 조회
	 * @return List<AdVO>
	 */
	public List<AdVO> getMostPopularAcademyTop4() {
		return userMapper.getMostPopularAcademyTop4();
	}
	
	/**
	 * 메인 > 리뷰 조회(최신 리뷰 4개 조회)
	 * @return List<ReviewVO>
	 */
	public List<ReviewVO> getReviewList() {
		return userMapper.getReviewList();
	}
	
	/**
	 * 자료게시판 목록 조회
	 * @param cri
	 * @return List<BoardVO>
	 */
	@Override
	public List<BoardVO> getBoardsList(Criteria cri) {
		return userMapper.getBoardsList(cri);
	}
	
	/**
	 * 자료게시판 갯수 조회
	 * @param cri
	 * @return int
	 */
	@Override
	public int getBoardsCount(Criteria cri) {
		return userMapper.getBoardsCount(cri);
	}
}
