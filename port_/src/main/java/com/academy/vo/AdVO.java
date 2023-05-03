package com.academy.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdVO {

	private int academy_id;
	private Date ad_date;
	private String accept_ox; /* 0:승인 1:보류 2:거절 */
	private String reason;  /* 거절,보류 사유 */
	private String link; 
}
