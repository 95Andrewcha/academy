package com.academy.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CancelVO {
	private int id;
	private int payment_id;
	private int price;/*주문 취소 금액*/
	private String status;  /* 취소완료 - 0 , 취소중 - 1, 취소불가 -2 */
	private String user_id; /*주문 취소자 아이디 */
	private Date request_date;
	private Date cancel_date;
}
