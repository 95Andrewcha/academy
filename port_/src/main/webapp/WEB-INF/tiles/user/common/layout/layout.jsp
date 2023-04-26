<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title><tiles:insertAttribute name="title"/></title>
	<tiles:insertAttribute name="link"/>
</head>
<body>
	<!-- ***** Preloader Start ***** -->
	<div id="js-preloader" class="js-preloader">
		<div class="preloader-inner">
			<span class="dot"></span>
			<div class="dots">
				<span></span>
				<span></span>
				<span></span>
			</div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->
<div class="min-h-100 position-relative main-container">
	<tiles:insertAttribute name="header"/>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<tiles:insertAttribute name="body"/>
				</div>
			</div>
		</div>
	</div>
	<tiles:insertAttribute name="footer"/>
</div>
</body>
</html>
