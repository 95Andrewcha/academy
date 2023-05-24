package com.academy.vo;

import lombok.Data;

@Data
public class CalendarVO {
	private int id;
	private String groupId;
	private String title;
	private String writer;
	private String content;
	private String start_date;
	private String end_date;
    private boolean allday;
	private String textColor;
	private String backgroundColor;
	private String borderColor;
		
}
