package com.academy.vo;

import java.util.Date;

import lombok.Data;

@Data
public class TestVO {

	private Date test_date;
	private String subject;
	private String teacher_name;
	private int score;
	private int children_id;
	private int academy_id;
}
