package com.academy.service;

import java.util.List;
import java.util.Map;

import com.academy.vo.AdVO;
import com.academy.vo.AttachVO;
import com.academy.vo.BoardVO;
import com.academy.vo.Criteria;
import com.academy.vo.ReviewVO;

public interface UserService {
	
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
	public List<BoardVO> selectBoardsList(Criteria cri);
	
	/**
	 * 자료게시판 갯수 조회
	 * @param cri
	 * @return int
	 */
	public int selectBoardsCount(Criteria cri);
	
	/**
	 * 자료게시판 글 상세 조회
	 * @param boardVO
	 * @return 글 상세 데이터
	 */
	public BoardVO selectBoard(BoardVO boardVO);
	
	/**
	 * 자료게시판 글 등록
	 * @param boardVO
	 */
	public Map<String, Object> insertNewDataBoard(Map<String, Object> paramMap);
	
	/**
	 * 자료게시판 글 파일 목록 조회
	 * @param boardVO
	 * @return 자료게시판 글 파일 목록
	 */
	public List<AttachVO> selectBoardFiles(BoardVO boardVO);
	
	/**
	 * 자료게시판 글 수정
	 * @param paramMap
	 * @return
	 */
	public Map<String, Object> modifyDataBoard(Map<String, Object> paramMap);
	
	/**
	 * 자료게시판 글 삭제
	 * @param board_id
	 */
	public int removeBoard(int board_id);
}
