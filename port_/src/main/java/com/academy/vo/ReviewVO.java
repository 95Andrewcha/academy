package com.academy.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReviewVO {
	private int academy_id;
	private String user_id;
	private int review1; /*교육 코스 만족도  1~5 점*/
	private int review2; /*선생 만족도 1~5 점*/
	private int review3;  /*성적 만족도 1~5 점 */
	private String review_title;
	private String review_content;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date reg_date;
	private String name;
}
