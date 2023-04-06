<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<title>AdminPopupLayout</title>
<tiles:insertAttribute name="AdminLink"/>


</head>
<body>
<div class="content">
<header id="popupheader">
		<tiles:insertAttribute name="popupheader"/>
</header>
<div id="popupbody">
		<tiles:insertAttribute name="popupbody"/>
	</div>
	</div>
	
	
	<tiles:insertAttribute name="scriptLink"/>
</body>
</html>