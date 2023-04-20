<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<title>AdminLayout</title>
<tiles:insertAttribute name="AdminLink"/>


</head>
<body>

	<div id="AdminSideBar">
		<tiles:insertAttribute name="AdminSideBar"/>
	</div>
	<div class="content">
	<header id="Adminheader">
		<tiles:insertAttribute name="Adminheader"/>
	</header>
	 
	<div id="Adminbody">
		<tiles:insertAttribute name="Adminbody"/>
	</div>
	<footer id="Adminfooter">
		<tiles:insertAttribute name="Adminfooter"/>
	</footer>
 	</div> 
	
	
	
	<tiles:insertAttribute name="scriptLink"/>
     
    
</body>
</html>