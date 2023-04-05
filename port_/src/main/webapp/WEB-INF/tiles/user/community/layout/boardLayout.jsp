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
	<div class="community-board-container min-h-100 position-relative">
		<tiles:insertAttribute name="header"/>
		<form action="#">
			<div class="community-board">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="page-content">
								<div class="row justify-content-end">
									<div class="col-10">
										<tiles:insertAttribute name="searchArea"/>
									</div>
								</div>
								<div class="row">
									<div class="col-2">
										<tiles:insertAttribute name="aside"/>
									</div>
									<div class="col-10">
										<tiles:insertAttribute name="body"/>
										<div class="pagination d-flex">
											<div class="col-12">
												<ul class="d-flex justify-content-center">
													<li><a href="#"><i class="fa-solid fa-angles-left"></i></a></li>
													<li><a href="#"><i class="fa-solid fa-chevron-left"></i></a></li>
													<li><a href="#">1</a></li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#">4</a></li>
													<li><a href="#">5</a></li>
													<li><a href="#">6</a></li>
													<li><a href="#">7</a></li>
													<li><a href="#">8</a></li>
													<li><a href="#">9</a></li>
													<li><a href="#">10</a></li>
													<li><a href="#"><i class="fa-solid fa-chevron-right"></i></a></li>
													<li><a href="#"><i class="fa-solid fa-angles-right"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>