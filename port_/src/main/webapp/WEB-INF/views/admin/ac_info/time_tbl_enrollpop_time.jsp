<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      <form action="time_tbl_enroll" method="GET">
    	<input type="text" name="time" value="${time }">
    	<input type="hidden" name="subject" value="${subject}">
    	<input type="hidden" name="day" value="${day }">
    	
    	<input type="submit">
    </form>