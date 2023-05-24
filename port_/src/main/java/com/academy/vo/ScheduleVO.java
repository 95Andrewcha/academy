package com.academy.vo;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ScheduleVO {

	int scheule_id;
	Date create_date;
	String creator_id;
	Date schedule_date_time_end;
	Date schedule_date_time_start;
	Date update_date;
	String update_id;
	
	

}
