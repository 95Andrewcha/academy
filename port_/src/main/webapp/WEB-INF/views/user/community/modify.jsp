<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	var deleteFileList = [];
	
	// 삭제할 파일 이름 저장
	function deleteFile(uuid, file_name, obj) {
		deleteFileList.push(uuid + "_" + file_name);
		$(obj).closest("tr").css("display", "none");
	}
	
	// 글 수정
	function modify(board_no) {
		var formData = new FormData();
		var board_title = $("input[name='board_title']").val();
		var board_content = $("textarea[name='board_content']").val();
		var file = $("input[name='file']");
		var files = file[0].files;
		
		formData.append("board_title", board_title);
		formData.append("board_content", board_content);
		formData.append("board_no", board_no);
		
		for(var i=0; i<files.length; i++) {
			formData.append("file", files[i]);
		}
		
		// 삭제할 파일 이름들도 formData에 저장
		for(var j=0; j<deleteFileList.length; j++) {
			formData.append("delete_files", deleteFileList[j]);
		}
		
		$.ajax({
			type: "post",
			url: "/user/data_board/" + board_no,
			processData: false,
			contentType: false,
			enctype: "multipart/form-data",
			data: formData,
			success: function(data) {
				alert("글이 수정되었습니다.");
				location.href = "/user/data_board/detail?title=${criteria.title }&pageNum=${criteria.pageNum }&board_no=" + board_no;
			}
		});
	}
</script>

<div class="border-radius-white p-4 mb-4">
	<div class="board-title border-bottom-line pb-3 mb-3">
		<span class="fs-5 fw-bold">글 수정</span>
	</div>
	<div class="row">
		<div class="pb-3">
			<div class="fw-bold pb-2">제목</div>
			<input type="text" name="board_title" value="${list.board_title }" class="form-control">
		</div>
		<div class="pb-3">
			<div class="fw-bold pb-2">내용</div>
			<textarea rows="15" cols="" class="form-control" name="board_content">${list.board_content }</textarea>
		</div>
		<div class="pb-5">
			<div class="fw-bold pb-2">첨부파일</div>
			<c:if test="${not empty fileList }">
				<table>
					<c:forEach var="item" items="${fileList }">
						<tr>
							<td><img width="30" height="30" src="/download?uuid=${item.uuid }&file_name=${item.file_name }"></td>
							<td class="p-2">${item.file_name }</td>
							<td>
								<div onclick="javascript:deleteFile('${item.uuid }', '${item.file_name }', this);">
									<i class="fa-solid fa-circle-xmark"></i>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<div class="mt-2">
				<input type="file" name="file" multiple="multiple">
			</div>
		</div>
		<div class="d-flex justify-content-end">
			<a href="javascript:modify(${list.board_no });" class="btn btn-primary me-2">수정</a>
			<a href="javascript:history.go(-1);" class="btn btn-danger">취소</a>
		</div>
	</div>
</div>

	