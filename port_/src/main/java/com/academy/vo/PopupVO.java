package com.academy.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PopupVO {

	private int id;
	private int POSITION_TOP;
	private int POSITION_LEFT;
	private String NAME;
	private String CONTENT;
	private Date START_DATE;
	private Date END_DATE;
	private int DAY_CHECK;
	private String UUID;
	private int ACTIVE;
	private String LINK;
	private String REG_ID;
	private String upload_path;
	private String file_type;
	private String file_name;
	private Date regdate; /*업로드 날짜*/
	
	
}
