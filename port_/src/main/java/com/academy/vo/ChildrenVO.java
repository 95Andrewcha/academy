package com.academy.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ChildrenVO {

	private int id;
	private String name;
	private String user_id;
	private String phone1;
	private String phone2;
	private String phone3;
	private int age;
	private int gender; /*0이 남자 1이 여자*/
	private String school;
	private int academy_id;
	private String nabbu;
	private Date aca_reg_date;
	private String subject;
	private int minab1;
	private int minab2;
	private int minab3;
	
	
}
