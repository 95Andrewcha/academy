<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<header class="header-area header-sticky">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav class="main-nav">
					<h1>
						<a href="${contextPath }/user/main" class="main-color">ACADEMY</a>
					</h1>
					<ul class="nav main-menu">
						<li><a href="#">정보</a></li>
						<li><a href="#">학원</a></li>
						<li class="position-relative">
							<a href="#">커뮤니티</a>
							<ul class="position-absolute w-100 text-center inner-menu">
								<li><a href="#">수다게시판</a></li>
								<li><a href="#">자료게시판</a></li>
								<li><a href="#">QnA</a></li>
								<li><a href="#">리뷰</a></li>
							</ul>
						</li>
						<li class="position-fixed main-menu-bg"></li>
					</ul>
					<ul class="nav login">
						<sec:authorize access="isAnonymous()">
							<li><a href="${contextPath }/user/login">로그인</a></li>
							<li><a href="#">회원가입</a></li>
						</sec:authorize>
						<sec:authorize access="!isAnonymous() && isAuthenticated()">
							<li><a href="${contextPath }/user/my_page/my_main">마이페이지</a></li>
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