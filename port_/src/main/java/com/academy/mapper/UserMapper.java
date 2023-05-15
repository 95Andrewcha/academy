package com.academy.mapper;

import java.util.List;

import com.academy.vo.AdVO;
import com.academy.vo.BoardVO;
import com.academy.vo.Criteria;
import com.academy.vo.ReviewVO;

public interface UserMapper {
	
	/**
	 * 메인 > 회원 수 조회
	 * @return int
	 */
	public int getUserCount();
	
	/**
	 * 메인 > 리뷰 수 조회
	 * @return int
	 */
	public int getReviewCount();
	
	/**
	 * 메인 > 학원 수 조회
	 * @return int
	 */
	public int getAcademyCount();
	
	/**
	 * 메인 > 가장 인기 많은 학원 TOP4 조회
	 * @return List<AdVO>
	 */
	public List<AdVO> getMostPopularAcademyTop4();
	
	/**
	 * 메인 > 리뷰 조회(최신 리뷰 4개 조회)
	 * @return List<ReviewVO>
	 */
	public List<ReviewVO> getReviewList();
	
	/**
	 * 자료게시판 목록 조회
	 * @param cri
	 * @return List<BoardVO>
	 */
	public List<BoardVO> getBoardsList(Criteria cri);
	

	/**
	 * 자료게시판 갯수 조회
	 * @param cri
	 * @return int
	 */
	public int getBoardsCount(Criteria cri);
}
