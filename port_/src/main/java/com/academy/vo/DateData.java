package com.academy.vo;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class DateData {

	String year ="";
	String month ="";
	String date ="";
	String value ="";
	
	String db_startDate=""; 
	String db_endDate="";
	
	ScheduleVO[] schedule_data_arr = new ScheduleVO[4];
	
	public Map<String, Integer> today_info(DateData dateData){
		Map<String, Integer> today_Data = new HashMap<String, Integer>();  //금일 날자 맵으로 가져오기		
		Calendar cal = Calendar.getInstance(); //cal 가져오기
		cal.set(Integer.parseInt(dateData.getYear()), Integer.parseInt(dateData.getMonth()), 1);
		
		int startDay = cal.getMinimum(Calendar.DATE);  /*시작일 가져오기*/
		int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH); /*마지막일 가져오기 */
		int start = cal.get(Calendar.DAY_OF_WEEK); /*시작 주*/
		
		Calendar todayCal = Calendar.getInstance();
		SimpleDateFormat ysdf = new SimpleDateFormat("yyyy"); /*년도 yyy로변경*/
		SimpleDateFormat msdf = new SimpleDateFormat("M"); /* 1월, 2월, 11월로 변경*/
		
		/*숫자로변경*/
		int today_year = Integer.parseInt(ysdf.format(todayCal.getTime()));
		int today_month = Integer.parseInt(msdf.format(todayCal.getTime()));
		int search_year = Integer.parseInt(dateData.getYear());
		int search_month = Integer.parseInt(dateData.getMonth()) + 1;
		int today= -1;
		
		if(today_year ==search_year && today_month == search_month) {
			SimpleDateFormat dsdf = new SimpleDateFormat("dd");
			today = Integer.parseInt(dsdf.format(todayCal.getTime())); //오늘에 날짜 넣기
		}
			
			search_month = search_month-1; //검색한 월에 -1넣기
			
			Map<String, Integer>before_after_calendar =
					before_after_calendar(search_year, search_month);
			
			System.out.println("search_month:" + search_month);
			
		      // 캘린더 함수 end
		      today_Data.put("start", start);
		      today_Data.put("startDay", startDay);
		      today_Data.put("endDay", endDay);
		      today_Data.put("today", today);
		      today_Data.put("search_year", search_year);
		      today_Data.put("search_month", search_month+1);
		      today_Data.put("before_year", before_after_calendar.get("before_year"));
		      today_Data.put("before_month", before_after_calendar.get("before_month"));
		      today_Data.put("after_year", before_after_calendar.get("after_year"));
		      today_Data.put("after_month", before_after_calendar.get("after_month"));
		      
		      String data_startDate = String.valueOf(search_year)+"-"+String.valueOf(search_month+1)+"-"+String.valueOf(startDay);
		      String data_end =String.valueOf(search_year)+"-"+String.valueOf(search_month+1)+"-"+String.valueOf(endDay);
		    
		     
		        
		        
		      this.db_startDate =data_startDate;
		      this.db_endDate = data_end;
		     

		     System.out.println("db_startDate:" + db_startDate);
		     System.out.println("db_endDate:" + db_endDate);
		     
		     System.out.println("type:" + db_startDate.getClass());
		        System.out.println(" e_date type:" + db_endDate.getClass());
		     
		    
		      
		      return today_Data;
	}
		
		public Map<String, Integer> before_after_calendar(int search_year, int search_month){
			Map<String, Integer> before_after_date = new HashMap<String, Integer>();
			int before_year = search_year;
			int before_month = search_month-1;
			int after_year = search_year;
			int after_month = search_month+1;
			
			if(before_month<0) { //1월 미만시
				before_month = 11;
				before_year=search_year -1;
			}
			
			if(after_month>11) { //12월 초과시
				after_month=0;
				after_year = search_year + 1;
			}
			
			before_after_date.put("before_year", before_year);
			before_after_date.put("before", before_month);
			before_after_date.put("after_year", after_year);
			before_after_date.put("after_month", after_month);
			
			return before_after_date;
		}
		
		
		public DateData(String year, String month, String date, String value, ScheduleVO[] schedule_data_arr) {
			if((month != null && month !="") && (date !=null && date !="")) {
				this.year = year;
				this.month = month;
				this.date = date;
				this.value = value;
				this.schedule_data_arr = schedule_data_arr;
			}
		}
		
		/*기본생성자 */
		public DateData() {
			
		}
		
		
	}
