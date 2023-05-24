<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="main-banner">
	<div class="row">
		<div class="col-lg-7 h-100 align-self-center">
			<div class="header-text">
				<h6 class="font-color">Welcome To ACADEMY</h6>
				<h4 class="font-color">
					대한민국<br />
					<em class="main-color">No.1 학원 정보 사이트</em>
				</h4>
			</div>
		</div>
		<div class="col-lg-5">
			<div class="text-center"><i class="fa-solid fa-comments"></i></div>
		</div>
	</div>
</div>
<div class="row mt-6">
	<div class="col-12">
		<div class="border-radius-white py-4 d-flex text-center">
			<div class="col-4">
				<p class="fs-1 main-color"><i class="fa-solid fa-comment-dots"></i></p>
				<p class="fs-3 py-3 main-color">${reviewCount }</p>
				<p>누적 학원 평가</p>
			</div>
			<div class="col-4">
				<p class="fs-1 main-color"><i class="fa-solid fa-user-group"></i></p>
				<p class="fs-3 py-3 main-color">${userCount }</p>
				<p>누적 회원 수</p>
			</div>
			<div class="col-4">
				<p class="fs-1 main-color"><i class="fa-solid fa-school"></i></p>
				<p class="fs-3 py-3 main-color">${academyCount }</p>
				<p>누적 학원 수</p>
			</div>
		</div>
	</div>
</div>
<div class="most-popular">
	<div class="row">
		<div class="col-lg-12">
			<div class="heading-section">
				<h4>
					가장 인기 많은 학원
					<span class="main-color">TOP4</span>
				</h4>
			</div>
			<div class="row">
				<c:forEach var="item" items="${top4List }" varStatus="status">
					<div class="col-lg-3 col-sm-6">
						<div class="item">
							<a href="#">
								<img src="${contextPath }/resources/common/assets/images/popular-0${status.count }.jpg" alt="">
							</a>
							<h4>
								${item.name }<br>
								<span>${item.addr }</span>
								<span>
									<ul>
										<li><i class="fa fa-star"></i> ${item.rate }</li>
									</ul>
								</span>
							</h4>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<div class="start-stream">
	<div class="col-lg-12">
		<div class="heading-section">
			<h4>리뷰</h4>
		</div>
		<div class="row">
			<c:forEach var="item" items="${reviewList }">
				<div class="col-xl-3">
					<div class="item">
						<p>${item.name }</p>
						<p>${item.review_title }</p>
						<p>교육 코스 <i class="fa fa-star"></i> ${item.review1 }</p>
						<p>강사진 <i class="fa fa-star"></i> ${item.review2 }</p>
						<p>성적 <i class="fa fa-star"></i> ${item.review3 }</p>
						<p>${item.review_content }</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>