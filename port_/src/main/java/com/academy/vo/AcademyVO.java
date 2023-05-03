package com.academy.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AcademyVO {
	private int id;
	private String name; /*학원명*/
	private String addr; /*학원 주소*/
	private String owner; /* 대표자 */
	private int people; /*학원 인원*/
	private String stats; /*입정 상태 0 - 입접 1- 보류  2= 거절 4 입점신청완료*/
	private String stats_reason; /*입접 보류 거절 ㅣ유*/
	private String busi_num; /* 사업자 등록번호*/
	private String course; /*수강 과목*/
	private String contents; /* 학원소개 */
	private String amenities; /* 편의 시설 */
	private String payment;/* 결제 여부 0: 결제 완료 1: 미결제 */
	private Date update_date;  /* 업데이트 날짜 */
	private Date reg_date; /* 학원 등록 날짜 */
	
}
