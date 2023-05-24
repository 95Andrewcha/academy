<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	// 글 삭제
	function deleteBoard(board_no) {
		var delete_files = $("input[name='delete_files']");
		var deleteFilesArr = [];
		
		// 삭제할 파일 이름들도 formData에 저장
		for(var i=0; i<delete_files.length; i++) {
			var obj = {
				deleteFiles: delete_files.eq(i).val()
			}
			
			console.log(obj);
			deleteFilesArr.push(obj);
		}
		
		$.ajax({
			type: "post",
			url: "/user/data_board/test/" + board_no,
			traditional: true,
			dataType: "json",
			data: {
				"jsonData": JSON.stringify(deleteFilesArr)
			},
			success: function(data) {
				alert("글이 삭제되었습니다.");
				location.href = "/user/data_board?title=${criteria.title }&pageNum=${criteria.pageNum }";
			}
		});
	}
</script>

<div class="border-radius-white p-4 mb-4">
	<div>
		<div class="board-title border-bottom-line pb-2">
			<span class="fs-5 fw-bold">${list.board_title }</span>
		</div>
		<div class="d-flex justify-content-between pb-2 border-bottom-line">
			<span>${list.board_writer }</span>
			<div>
				<span class="pe-2">조회수 <fmt:formatNumber type="number" value="${list.board_hit }" /></span>
				<span><fmt:formatDate value="${list.board_date }" pattern="yyyy-MM-dd HH:mm:SS" /></span>
			</div>
		</div>
		<div class="py-3 border-bottom-line mh-38vh">${list.board_content }</div>
		<c:if test="${not empty fileList }">
			<div class="fw-bold py-2">첨부파일</div>
			<table>
				<c:forEach var="item" items="${fileList }">
					<tr>
						<td><img width="30" height="30" src="/download?uuid=${item.uuid }&file_name=${item.file_name }"></td>
						<td class="p-2"><a href="/download?uuid=${item.uuid }&file_name=${item.file_name }">${item.file_name }</a></td>
					</tr>
					<input type="hidden" name="delete_files" value="${item.uuid }_${item.file_name }">
				</c:forEach>
			</table>
		</c:if>
		<sec:authorize access="isAnonymous()">
			<div class="pt-4 text-end">
				<a class="btn btn-danger" href="javascript:history.go(-1);">목록으로</a>
			</div>
		</sec:authorize>
		<sec:authorize access="isAuthenticated() && principal.id != '${list.board_writer }'">
			<div class="pt-4 text-end">
				<a class="btn btn-primary main-bg-color" href="/user/data_board/reply?board_no=${list.board_no }">답글 달기</a>
				<a class="btn btn-danger" href="javascript:history.go(-1);">목록으로</a>
			</div>
		</sec:authorize>
		<sec:authorize access="!isAnonymous() && isAuthenticated() && principal.id == '${list.board_writer }'">
			<div class="pt-4 text-end">
				<a class="btn btn-primary main-bg-color" href="/user/data_board/modify?board_no=${list.board_no }&pageNum=${criteria.pageNum }&title=${criteria.title }">수정하기</a>
				<a class="btn btn-danger" href="javascript:deleteBoard(${list.board_no });">삭제하기</a>
			</div>
		</sec:authorize>
	</div>
</div>