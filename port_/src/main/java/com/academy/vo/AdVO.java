package com.academy.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdVO {
	private int academy_id;		// 학원 일련번호
	private String name; 		// 학원명
	private String addr;		// 학원 주소
	private double rate;		// 별점 평균
	private Date ad_date;		// 광고 등록 날짜
	private String accept_ox; 	// 승인여부 - 0:승인 1:보류 2:거절
	private String reason;  	// 거절,보류 사유
	private String link; 		// 광고 링크 주소
	private int price;			// 입찰 가격
}
