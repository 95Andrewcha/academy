package com.academy.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {

	private int id;
	private int academy_id;
	private String user_id;
	private int price;
	private String status; /*주문 상태 0 : 미결제 1: 결제 2:오류 3:취소*/
	private Date accept_date;
	private String card_name;
	private String card_number;
	private Date order_date;
	private String order_method;  /* 0 : 신용카드 1: 무통장입금 2:핸드폰결제*/
	
}
