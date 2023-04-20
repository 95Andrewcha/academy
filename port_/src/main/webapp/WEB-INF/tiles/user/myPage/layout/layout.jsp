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
	<div class="footer-bottom min-h-100 position-relative bg-color">
		<tiles:insertAttribute name="header"/>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-content">
						<div class="row">
							<div class="col-2"></div>
							<div class="col-10">
								<div class="font-color fs-4 fw-bold pb-3">
									마이페이지 > <span class="fs-5 fw-normal"><tiles:insertAttribute name="subMenuTitle"/></span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-2">
								<tiles:insertAttribute name="aside"/>
							</div>
							<div class="col-10">
								<tiles:insertAttribute name="body"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>