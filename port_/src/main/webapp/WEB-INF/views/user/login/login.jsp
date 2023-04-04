<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
	<form action="${contextPath }/user/loginProc" method="post" role="form" class="vh-100">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<div class="row align-items-center justify-content-center h-100">
			<div style="width: 400px;">
				<h1 class="mb-5 fw-bold text-center">
					<a href="${contextPath }/user/main" class="main-color">ACADEMY</a>
				</h1>
				<div class="form-floating mb-3">
					<input type="text" class="form-control" name="username" placeholder="아이디">
					<label for="floatingInput"><i class="fa-solid fa-user"></i> 아이디</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" placeholder="비밀번호">
					<label for="floatingPassword"><i class="fa-solid fa-key"></i> 비밀번호</label>
				</div>
				<div class="checkbox mb-4 mt-2">
					<label>
						<input type="checkbox" name="remember-me"> 로그인 유지
					</label>
				</div>
				<button class="w-100 btn btn-lg btn-secondary main-bg-color main-btn" type="submit">로그인</button>
		        <p class="mt-5 text-center">
		        	Copyright © 2023 ACADEMY.<br/>All rights reserved.
		        </p> 
			</div>
		</div>
	</form>
</div>