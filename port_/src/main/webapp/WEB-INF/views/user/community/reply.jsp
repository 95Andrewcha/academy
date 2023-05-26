<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	function reply() {
		var formData = new FormData();
		var board_title = $("input[name='board_title']").val();
		var board_content = $("textarea[name='board_content']").val();
		var board_writer = $("input[name='board_writer']").val();
		var file = $("input[name='file']");
		var files = file[0].files;
		
		formData.append("parent_no", "${boardVO.board_no}");
		formData.append("board_title", board_title);
		formData.append("board_content", board_content);
		formData.append("board_writer", board_writer);
		
		for(var i=0; i<files.length; i++) {
			formData.append("file", files[i]);
		}
		
		$.ajax({
			type: "post",
			url: "/user/data_board/reply",
			processData: false,
			contentType: false,
			enctype: "multipart/form-data",
			data: formData,
			success: function(data) {
				alert("글이 등록되었습니다.");
				location.href = "/user/data_board";
			}
		});
	}
</script>

<sec:authorize access="!isAnonymous() && isAuthenticated()">
	<sec:authentication property="principal.id" var="user_id"/>
	<input type="hidden" name="board_writer" value="${user_id }">
</sec:authorize>
<div class="border-radius-white p-4 mb-4">
	<div class="board-title border-bottom-line pb-3 mb-3">
		<span class="fs-5 fw-bold">답글 쓰기</span>
	</div>
	<div class="row">
		<div class="pb-3">
			<div class="fw-bold pb-2">제목</div>
			<input type="text" name="board_title" class="form-control">
		</div>
		<div class="pb-3">
			<div class="fw-bold pb-2">내용</div>
			<textarea rows="15" cols="" class="form-control" name="board_content"></textarea>
		</div>
		<div class="pb-5">
			<div class="fw-bold pb-2">첨부파일</div>
			<input type="file" name="file" multiple="multiple">
		</div>
		<div class="d-flex justify-content-end">
			<a href=javascript:reply(); class="btn btn-primary me-2">등록</a>
			<a href="javascript:history.go(-1);" class="btn btn-danger">취소</a>
		</div>
	</div>
</div>

	