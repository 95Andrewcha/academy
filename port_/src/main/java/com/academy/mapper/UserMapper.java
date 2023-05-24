package com.academy.mapper;

import java.util.List;
import java.util.Map;

import com.academy.vo.AdVO;
import com.academy.vo.AttachVO;
import com.academy.vo.BoardVO;
import com.academy.vo.Criteria;
import com.academy.vo.ReviewVO;

public interface UserMapper {
	
	/**
	 * 메인 > 회원 수 조회
	 * @return 총 회원 수
	 */
	public int getUserCount();
	
	/**
	 * 메인 > 리뷰 수 조회
	 * @return 총 리뷰 수
	 */
	public int getReviewCount();
	
	/**
	 * 메인 > 학원 수 조회
	 * @return 총 학원 수
	 */
	public int getAcademyCount();
	
	/**
	 * 메인 > 가장 인기 많은 학원 TOP4 조회
	 * @return 가장 인기 많은 학원 TOP4
	 */
	public List<AdVO> getMostPopularAcademyTop4();
	
	/**
	 * 메인 > 리뷰 조회(최신 리뷰 4개 조회)
	 * @return 최신 리뷰 4개
	 */
	public List<ReviewVO> getReviewList();
	
	/**
	 * 자료게시판 목록 조회
	 * @param cri
	 * @return 자료게시판 목록
	 */
	public List<BoardVO> selectBoardsList(Criteria cri);
	

	/**
	 * 자료게시판 갯수 조회
	 * @param cri
	 * @return 자료게시판 총 갯수
	 */
	public int selectBoardsCount(Criteria cri);
	
	/**
	 * 자료게시판 글 상세 조회
	 * @param boardVO
	 * @return 글 상세 데이터
	 */
	public BoardVO selectBoard(BoardVO boardVO);
	
	/**
	 * 자료게시판 글 파일 목록 조회
	 * @param boardVO
	 * @return 자료게시판 글 파일 목록
	 */
	public List<AttachVO> selectBoardFiles(BoardVO boardVO);
	
	/**
	 * 자료게시판 일련번호 생성
	 * @return 자료게시판 새 일련번호
	 */
	public int selectNewBoardNo();
	
	/**
	 * 자료게시판 글 등록
	 * @param boardVO
	 */
	public void insertBoard(Map<String, Object> paramMap);
	
	/**
	 * 자료게시판 파일 등록
	 * @param boardVO
	 */
	public void insertBoardFiles(AttachVO attachVO);
	
	/**
	 * 자료게시판 파일 삭제
	 * @param attachVO
	 */
	public void deleteBoardFiles(AttachVO attachVO);
	
	/**
	 * 자료게시판 글 수정
	 * @param paramMap
	 */
	public void updateDataBoard(Map<String, Object> paramMap);
	
	/**
	 * 자료게시판 파일 삭제
	 * @param board_no
	 */
	public int deleteBoardFile(int board_no);
	
	/**
	 * 자료게시판 글 삭제
	 * @param board_no
	 */
	public int deleteBoard(int board_no);
}
