<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	function paging(pageNum) {
		var title = $("input[name='title']").val();
		location.href = "/user/data_board?title=" + title + "&pageNum=" + pageNum;
	}
	
	function boardDetail(board_no) {
		var title = $("input[name='title']").val();
		location.href = "/user/data_board/detail?title=" + title + "&pageNum=" + "${pageVO.cri.pageNum}" + "&board_no=" + board_no;
	}
</script>
<div class="border-radius-white p-4 mb-4">
	<div class="row">
		<div class="board-title">
			<div>
				<span class="fs-5 fw-bold">자료게시판</span>
				<span class="fs-7 ps-1">${pageVO.total }건</span>
			</div>
			<sec:authorize access="!isAnonymous() && isAuthenticated()">
				<div class="">
					<a class="custom-btn fs-7 px-3 fw-bold" href="/user/data_board/register?gubun=new">
						<i class="fa-solid fa-pencil"></i> 글쓰기
					</a>
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
						<c:if test="${item.level > 1 }">
							<c:forEach var="num" begin="2" end="${item.level }">
								<span class="ps-1"></span>
							</c:forEach>
							<span class="pe-1"><i class="fa-solid fa-reply fa-rotate-180"></i></span>
						</c:if>
						<c:choose>
							<c:when test="${item.fileCount == 0 }">
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
	<div class="pagination d-flex mt-4">
		<div class="col-12">
			<ul class="d-flex justify-content-center">
				<c:if test="${pageVO.prev }">
					<li><a class="page-link" href="javascript:paging(${pageVO.startPage - 1 })"><i class="fa-solid fa-chevron-left"></i></a></li>
				</c:if>
				<c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
					<li><a class="${pageVO.cri.pageNum eq num ? 'active' : '' } page-link" href="javascript:paging(${num})">${num }</a></li>
				</c:forEach>
				<c:if test="${pageVO.next }">
					<li><a class="page-link" href="javascript:paging(${pageVO.endPage + 1 })"><i class="fa-solid fa-chevron-right"></i></a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>