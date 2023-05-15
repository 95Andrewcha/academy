<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="border-radius-white p-4 mb-4">
	<div class="row">
		<div class="board-title">
			<div>
				<span class="fs-5 fw-bold">자료게시판</span>
				<span class="fs-7 ps-1">${pageVO.total }건</span>
			</div>
			<sec:authorize access="!isAnonymous() && isAuthenticated()">
				<div class="custom-btn fs-7 px-3 fw-bold">
					<i class="fa-solid fa-pencil"></i> 글쓰기
				</div>
			</sec:authorize>
		</div>
	</div>
	<table class="board-table">
		<colgroup>
			<col width="7%">
			<col width="60%">
			<col width="10%">
			<col width="10%">
			<col width="7%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list }">
				<tr>
					<td>${item.rn }</td>
					<td class="text-start">
						<c:choose>
							<c:when test="${empty item.uuid }">
								<span><i class="fa-solid fa-comment-dots"></i></span>
							</c:when>
							<c:otherwise>
								<span><i class="fa-solid fa-image" style="color: #2ca54a;"></i></span>
							</c:otherwise>
						</c:choose>
						<a href="javascript:boardDetail(${item.board_no });">${item.board_title }</a>
					</td>
					<td class="text-start">${item.board_writer }</td>
					<td><fmt:formatDate value="${item.board_date }" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatNumber type="number" value="${item.board_hit }"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>