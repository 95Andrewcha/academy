<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<header class="header-area header-sticky">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav class="main-nav">
					<h1 class="fw-bold">
						<a href="${contextPath }/user/main" class="main-color">ACADEMY</a>
					</h1>
					<ul class="nav main-menu">
						<li><a href="#">정보</a></li>
						<li><a href="#">학원</a></li>
						<li><a href="/user/data_board">자료게시판</a></li>
						<li><a href="#">QNA</a></li>
						<li><a href="#">리뷰</a></li>
					</ul>
					<ul class="nav login">
						<sec:authorize access="isAnonymous()">
							<li><a href="${contextPath }/user/login">로그인</a></li>
							<li><a href="#">회원가입</a></li>
						</sec:authorize>
						<sec:authorize access="!isAnonymous() && isAuthenticated()">
							<li><a href="#">마이페이지</a></li>
							<li><a href="${contextPath }/user/logout">로그아웃</a></li>
						</sec:authorize>
					</ul>
					<a class='menu-trigger'>
						<span>Menu</span>
					</a>
				</nav>
			</div>
		</div>
	</div>
</header>