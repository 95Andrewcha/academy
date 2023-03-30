<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<title>메인</title>
    <tiles:insertAttribute name="link"/>
</head>
<body>
	<!-- Navbar Start -->
    <tiles:insertAttribute name="commonHeader"/>
    <!-- Navbar End -->
	
	<tiles:insertAttribute name="commonBody"/>
	
	<!-- Footer Start -->
	<tiles:insertAttribute name="commonFooter"/>
	<!-- Footer End -->
	
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
</body>
</html>