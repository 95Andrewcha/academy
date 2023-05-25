<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	$(document).ready(function() {
		getComment(); // 댓글 가져오기
	});

	// 글 삭제
	function deleteBoard(board_no) {
		var delete_files = $("input[name='delete_files']");
		var deleteFilesArr = [];
		
		// 삭제할 파일 이름들도 formData에 저장
		for(var i=0; i<delete_files.length; i++) {
			var obj = {
				deleteFiles: delete_files.eq(i).val()
			}
			
			deleteFilesArr.push(obj);
		}
		
		$.ajax({
			type: "delete",
			url: "/user/data_board/" + board_no,
			data: {
				jsonData: JSON.stringify(deleteFilesArr)
			},
			success: function(data) {
				if(data == "success") {
					alert("글이 삭제되었습니다.");
					location.href = "/user/data_board?title=${criteria.title }&pageNum=${criteria.pageNum }";
				} else {
					alert("에러가 발생했습니다. 다시 시도해주세요.");
				}
			},
			error: function(data) {
				alert("에러가 발생했습니다.");
			}
		});
	}
	
	// 날짜 포맷
	function dateFormat(val) {
		var date = new Date(val);
		
		var result = date.getFullYear()
				   + "-"
				   + (date.getMonth() < 9 ? "0" + (date.getMonth() + 1) : (date.getMonth() + 1))
				   + "-"
				   + (date.getDay() < 10 ? "0" + date.getDay() : date.getDay())
				   + " "
				   + (date.getHours() < 10 ? "0" + date.getHours() : date.getHours())
				   + ":"
				   + (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes())
				   + ":"
				   + (date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());
		
		return result;
	}
	
	
	// 댓글 html 출력
	function showComments(data) {
		var commentList = data['commentList'];
		var pageVO = data['pageVO'];
		var comment = "";

		for(var cmt in commentList) {
			var info = commentList[cmt];
			
			if(info.level > 1) {
				comment += "<div class='d-flex bg-secondary-color'>";
				comment +=     "<div class='py-4'>";
				for(var i=1; i<info.level; i++) {
					comment +=     "<span class='ps-3'></span>";
				}
				comment += 		   "<span class='pe-2'><i class='fa-solid fa-reply fa-rotate-180'></i></span>";
				comment +=     "</div>";
			}
			comment += "<ul class='py-4 border-bottom-line w-100'>";
			comment +=     "<li>";
			comment +=         "<div class='d-flex align-items-center pb-1'>";
			comment +=             "<div class='fw-bold pe-3'>"+ info.comment_writer +"</div>";
			comment +=             "<div class='fs-7'>"+ dateFormat(info.reg_date) +"</div>";
			comment +=         "</div>";
			comment +=     "</li>";
			comment +=     "<li class='py-1 content'>"+ info.content +"</li>";
			comment +=     "<li class='d-none replyCommentForm pe-3'></li>";
			comment +=     "<li>";
			comment +=         "<div class='d-flex mt-2 fs-7'>";
			comment +=             "<div class='me-1 cursor-pointer' onclick='javascript:showReplyCommentForm("+ info.comment_no +", "+ info.board_no +", this, \"reply\");'>답글</div>";
			comment +=             "<div class='me-1 cursor-pointer' onclick='javascript:showReplyCommentForm("+ info.comment_no +", "+ info.board_no +", this, \"update\");'>수정</div>";
			comment +=             "<div class='cursor-pointer' onclick='javascript:deleteComment("+ info.comment_no +", "+ info.board_no +")'>삭제</div>";
			comment +=         "</div>";
			comment +=     "</li>";
			comment += "</ul>";
			if(info.level > 1) {
				comment += "</div>";
			}
		}

		var page = "";
		
		page += "<div class='pagination d-flex mt-4'>";
		page +=		"<div class='col-12'>";
		page +=			"<ul class='d-flex justify-content-center'>";
		if(pageVO.prev) {
			page +=			"<li><a class='page-link' href='javascript:getComment("+ (pageVO.startPage - 1) +");'><i class='fa-solid fa-chevron-left'></i></a></li>";
		}
		for(var i=pageVO.startPage; i<=pageVO.endPage; i++) {
			page +=			"<li><a class='"+ (pageVO.cri.pageNum == i ? 'active' : '') +" page-link' href='javascript:getComment("+ i +");'>"+ i +"</a></li>";
		}
		if(pageVO.next) {
			page +=			"<li><a class='page-link' href='javascript:getComment("+ (pageVO.endPage + 1) +");'><i class='fa-solid fa-chevron-right'></i></a></li>";
		}
		page +=			"</ul>";
		page +=		"</div>";
		page +=	"</div>";
	
		$("#paging").html(page);
		$("#comments-title").html("댓글&nbsp;&nbsp;" + pageVO.total + "개");
		$("#comments").html(comment);
	}
	
	// 댓글 가져오기
	function getComment(page) {
		$.ajax({
			type: "get",
			url: "/user/data_board/comment",
			data: {
				pageNum: page,
				board_no: $("input[name='board_no']").val()
			},
			success: function(data) {
				showComments(data);
			},
			error: function(data) {
				alert("댓글을 불러오는 중 에러가 발생했습니다.");
			}
		});
	}
	
	// 댓글 달기
	function addComment(board_no) {
		$.ajax({
			type: "post",
			url: "/user/data_board/comment",
			data: {
				board_no: board_no,
				comment_writer: $("input[name='comment_writer']").val(),
				content: $("textarea[name='content']").val()
			},
			success: function(data) {
				showComments(data);
				$("textarea[name='content']").val("");
			},
			error: function(data) {
				alert("에러가 발생했습니다.");
			}
		});
	}
	
	// 대댓글 달기
	function addReplyComment(comment_no, board_no, obj) {
		$.ajax({
			type: "post",
			url: "/user/data_board/comment/reply",
			data: {
				board_no: board_no,
				parent_no: comment_no,
				comment_writer: $("input[name='comment_writer']").val(),
				content: $("textarea[name='replyContent']").val()
			},
			success: function(data) {
				$(obj).parents(".replyCommentForm").addClass("d-none");
				showComments(data);
			},
			error: function(data) {
				alert("에러가 발생했습니다.");
			}
		});
	}
	
	// 댓글 수정
	function modifyComment(comment_no, board_no, obj) {
		$.ajax({
			type: "put",
			url: "/user/data_board/comment/" + comment_no,
			data: {
				board_no: board_no,
				comment_no: comment_no,
				content: $("textarea[name='content']").val()
			},
			success: function(data) {
				$(obj).parents(".replyCommentForm").addClass("d-none");
				showComments(data);
			},
			error: function(data) {
				alert("에러가 발생했습니다.");
			}
		});
	}
	
	// 댓글 삭제
	function deleteComment(comment_no, board_no) {
		$.ajax({
			type: "delete",
			url: "/user/data_board/comment/" + comment_no,
			data: {
				board_no: board_no
			},
			success: function(data) {
				showComments(data);
			},
			error: function(data) {
				alert("에러가 발생했습니다.");
			}
		});
	}
	
	// 대댓글 입력 폼 html 출력
	function showReplyCommentForm(comment_no, board_no, obj, type) {
		var replyForm = $(obj).closest("li").siblings(".replyCommentForm");
		var content = replyForm.siblings(".content");
		var html = "";
		
		replyForm.removeClass("d-none");
		
		html += "<div class='d-flex pt-2'>";
		if(type == 'reply') {
			html += "<div class='pe-2'><i class='fa-solid fa-reply fa-rotate-180'></i></div>";
			html += "<textarea class='w-100 p-2 border-line' rows='3' name='replyContent' placeholder='답글 내용을 입력하세요.'></textarea>";
		} else {
			html += "<textarea class='w-100 p-2 border-line' rows='3' name='content' placeholder='내용을 입력하세요.'>"+ content.text() +"</textarea>";
		}
		html += "</div>";
		html += "<div class='text-end pt-2'>";
		if(type == 'reply') {
			html += "<div class='btn btn-secondary' onclick='javascript:addReplyComment("+ comment_no +", "+ board_no +", this);'>답글달기</div>";
		} else {
			html += "<div class='btn btn-secondary' onclick='javascript:modifyComment("+ comment_no +", "+ board_no +", this);'>수정하기</div>";
		}
		html += "</div>";
		
		replyForm.html(html);
	}
</script>

<sec:authorize access="!isAnonymous() && isAuthenticated()">
	<sec:authentication property="principal.id" var="user_id"/>
	<input type="hidden" name="comment_writer" value="${user_id }">
</sec:authorize>
<input type="hidden" name="board_no" value="${list.board_no }">
<div class="border-radius-white p-4 mb-4">
	<div>
		<div class="board-title border-bottom-line pb-2 mb-3" style="border-width: 2px; border-color: var(--custom-main-color); color: var(--custom-main-color);">
			<span class="fs-5 fw-bold">자료게시판</span>
		</div>
		<div class="board-title">
			<span class="fs-5 fw-bold">${list.board_title }</span>
		</div>
		<div class="d-flex justify-content-between pb-3 border-bottom-line fs-7">
			<span>${list.board_writer }</span>
			<div>
				<span class="pe-2">조회수 <fmt:formatNumber type="number" value="${list.board_hit }" /></span>
				<span><fmt:formatDate value="${list.board_date }" pattern="yyyy-MM-dd HH:mm:SS" /></span>
			</div>
		</div>
		<div class="py-3 border-bottom-line mh-38vh">
			<div>${list.board_content }</div>
		</div>
		<c:if test="${not empty fileList }">
			<div class="border-bottom-line my-3 pb-3">
				<div class="fw-bold py-2">첨부파일</div>
				<table>
					<c:forEach var="item" items="${fileList }">
						<tr>
							<td><img width="30" height="30" src="/thumbnails?uuid=${item.uuid }&file_name=${item.file_name }"></td>
							<td class="p-2"><a href="/download?uuid=${item.uuid }&file_name=${item.file_name }">${item.file_name }</a></td>
						</tr>
						<input type="hidden" name="delete_files" value="${item.uuid }_${item.file_name }">
					</c:forEach>
				</table>
			</div>
		</c:if>
		<div>
			<div id="comments-title" class="pt-2 pb-2 fw-bold"></div>
			<div id="comments"></div>
			<div id="paging"></div>
			<textarea class="w-100 p-2 mt-5 border-line" rows="3" name="content" placeholder="내용을 입력하세요."></textarea>
			<div class="text-end">
				<a class="btn btn-secondary" href="javascript:addComment(${list.board_no });">댓글달기</a>
			</div>
		</div>
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