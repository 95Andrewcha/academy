<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String subject = request.getParameter("subject");
String teacher = request.getParameter("teacher");
String student = request.getParameter("student");
String start_date = request.getParameter("start_date");
String end_date = request.getParameter("end_date");

System.out.println("subject:" + subject + teacher +  student +  start_date +  end_date);
%>
</body>
</html>