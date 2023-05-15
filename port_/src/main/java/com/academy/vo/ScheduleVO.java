package com.academy.vo;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ScheduleVO {

	int schedule_idx;
	int schedule_num;
	String schedule_subject; //제목
	String schedule_desc;
	Date schedule_date;
	String schedule_share; //공유여부
	String schedule_mycolor;

}
