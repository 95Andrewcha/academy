package com.academy.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {
	private int rn;
	private String gubun;
	private int board_group;
	private int board_no; /*게시판 번호*/
	private int parent_no;
	private int board_order;
	private int board_level;
	private String board_title; /*제목*/
	private String board_writer; /*작성자*/
	private String board_content;
	private int board_hit; /*조회수 */
	private Date board_date; /*등록일*/
	private int board_hidden;   /*비밀글 여부 */
	private String board_answer_ox; /* 답변 여부 0:미답변 1:답변 */
	private String uuid; /*파일명*/
	private String upload_path;
	private String file_type;
	private String file_name;
	private Date date; /*업로드 날짜*/
	private List<MultipartFile> file;
}
