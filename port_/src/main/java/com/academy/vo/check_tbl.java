package com.academy.vo;

import java.util.Date;

import lombok.Data;

@Data
public class check_tbl {
	private int academy_id;
	private Date check_date;
	private String teacher_name;
	private String check_ox;
	private String reason;
	private int children_id;
}
