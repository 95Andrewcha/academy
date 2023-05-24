package com.academy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.academy.mapper.UserMapper;
import com.academy.vo.AdVO;
import com.academy.vo.AttachVO;
import com.academy.vo.BoardVO;
import com.academy.vo.Criteria;
import com.academy.vo.ReviewVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
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
	public List<BoardVO> selectBoardsList(Criteria cri) {
		return userMapper.selectBoardsList(cri);
	}
	
	/**
	 * 자료게시판 갯수 조회
	 * @param cri
	 * @return int
	 */
	@Override
	public int selectBoardsCount(Criteria cri) {
		return userMapper.selectBoardsCount(cri);
	}
	
	/**
	 * 자료게시판 글 상세 조회
	 * @param boardVO
	 * @return 글 상세 데이터
	 */
	@Override
	public BoardVO selectBoard(BoardVO boardVO) {
		return userMapper.selectBoard(boardVO);
	}
	
	/**
	 * 자료게시판 글 등록
	 * @param boardVO
	 */
	@Override
	public Map<String, Object> insertNewDataBoard(Map<String, Object> paramMap) {
		int board_no = userMapper.selectNewBoardNo();
		paramMap.put("board_no", board_no);
		
		userMapper.insertBoard(paramMap);
		
		List<AttachVO> fileList = (List<AttachVO>) paramMap.get("fileList");
		
		for(AttachVO vo : fileList) {
			vo.setBoard_no(board_no);
			userMapper.insertBoardFiles(vo);
		}
		
		paramMap.put("fileList", fileList);
		
		return paramMap;
	}
	
	/**
	 * 자료게시판 글 파일 목록 조회
	 * @param boardVO
	 * @return 자료게시판 글 파일 목록
	 */
	@Override
	public List<AttachVO> selectBoardFiles(BoardVO boardVO) {
		return userMapper.selectBoardFiles(boardVO);
	}
	
	/**
	 * 자료게시판 글 수정
	 * @param paramMap
	 * @return
	 */
	@Override
	public Map<String, Object> modifyDataBoard(Map<String, Object> paramMap) {
		int board_no = Integer.parseInt(paramMap.get("board_no").toString());
		userMapper.updateDataBoard(paramMap);

		List<AttachVO> fileList = (List<AttachVO>) paramMap.get("fileList");
		
		for(AttachVO vo : fileList) {
			vo.setBoard_no(board_no);
			userMapper.insertBoardFiles(vo);
		}
		
		List<AttachVO> delFfileList = (List<AttachVO>) paramMap.get("delFileList");
		
		for(AttachVO vo : delFfileList) {
			vo.setBoard_no(board_no);
			userMapper.deleteBoardFiles(vo);
		}
		
		paramMap.put("fileList", fileList);
		paramMap.put("delFfileList", delFfileList);
		
		return paramMap;
	}

	/**
	 * 자료게시판 글 삭제
	 * @param board_id
	 */
	@Override
	public int removeBoard(int board_id) {
		int delFileCnt = userMapper.deleteBoardFile(board_id);
		int delBoardCnt = userMapper.deleteBoard(board_id);
		return delFileCnt > 0 && delBoardCnt > 0 ? delFileCnt + delBoardCnt : 0;
	}
}
