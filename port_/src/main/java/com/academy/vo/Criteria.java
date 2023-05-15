package com.academy.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum; // page번호
	private int amount; //데이터 수
	private int startNum; //시작번호

	private Date start_date;  //시작일
	private Date end_date;  // 종료일
	private int active; // 활성화 여부 (0 , 1)- 0 이면 false 1 = true
	private String title; //제목
	
	public Criteria() {    //amount 20 으로 늘리면 20개씩보임
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	

	
	
}
