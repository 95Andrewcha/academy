package com.academy.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CouponVO {

	private int id; /*쿠폰번호*/
	private String name; /*쿠폰이름*/
	private String discount;
	private String discount2;
	private Date start_date;
	private Date end_date;
	private Date reg_date;
	private String content;
	private int count;
	private String condition;
	private String gubun;
	private String active;
}
