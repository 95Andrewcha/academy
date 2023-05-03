package com.academy.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Attach_tbl {

	private String uuid; /*파일명*/
	private String upload_path;
	private String file_type;
	private String file_name;
	private int board_no;
	private Date date; /*업로드 날짜*/
}
