<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
	<sec:authentication property="principal.id" var="user_id"/>
	
	<div id="testModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">팝업 등록하기</h5>
				</div>
				<div class="modal-body">
		<div class="container-fluid px-4">
		<h1 class="mt-4">자세히보기</h1>
		
		<div class="card mb-4">
			<div class="card-body">
				<form method="post">
					<input type="hidden" name="reg_id" id="reg_id" value="${user_id }">
					<div class="mb-3 mt-3">
						<label for="bno" class="form-label">제목</label> <input type="text"
							class="form-control update" id="subject" name="subject" >
					</div>
					<div class="mb-3">
						<label for="regDate" class="form-label">기간선택</label><br>
						 <input type="text" class="form-control update" style="width:45% !important; display:inline-block;" id="start_date" name="start_date" >
						 &nbsp;&nbsp;&nbsp; 
						 <input type="text" class="form-control update" style="width:45% !important; display:inline-block;" id="end_date" name="end_date" >
					</div>
					
					<div class="mb-3">
						<label for="xpx" class="form-label">좌표값 입력</label><br>
						 x:  &nbsp;<input type="text" class="form-control update w-25" style="display:inline-block;" id="xpx" name="xpx"> px
						 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;  &nbsp;
						 y: &nbsp; <input type="text" class="form-control update w-25" style="display:inline-block;" id="ypx" name="ypx" > px
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">참고</label>
						<textarea class="form-control update" id="content" name="content" 
							></textarea>
					</div>
					
					<div class="mb-3">
							<label for="formFileMultiple" class="form-label">첨부파일</label>
								 <input class="form-control" type="file" name="file" id="formFileMultiple" multiple>
					</div>
					
					<div class="mb-3 uploadresult"> 
						<label for="formFileMultiple" class="form-label">업로드 파일</label>
							<ul>
							
							</ul>
					</div><!-- uploadresult -->
					
					
					<div class="mb-3">
						<label for="popuplink" class="form-label">팝업링크</label>
						 <input type="text" class="form-control update" id="popuplink" name="popuplink" >
					</div>
					<div class="mb-3">
						<label for="xpx" class="form-label">오늘 하루 안보기여부</label><br>
						<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="1">
						<label class="form-check-label" for="gridRadios1">유</label>
						
						<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="0" checked>
						 <label class="form-check-label" for="gridRadios2">무</label>
					</div>
					
					

				</form>
			</div>
		</div>
	</div>
				
				</div>
				<div class="modal-footer">
					<a class="btn" href="#">미리보기</a>
					<a class="btn" id="modalY" href="javascript:enroll();">등록하기</a>
					<button class="btn" type="button" data-dismiss="modal" id="close">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
		
		$(function(){
	         $('#start_date').datepicker();
	         $('#end_date').datepicker();
	         
	         $("input[name='file']").on("change", function(e) {
		        	
		 			var formData = new FormData();
		 			var inputFile = $("input[name='file']");
		 			var files = inputFile[0].files;
		 			
		 			for(var i=0; i<files.length; i++){
		 				
		 				formData.append("uploadFile", files[i]);
		 			}
		 			
		 			$.ajax({
		 				url : '/admin/uploadAjaxAction',
		 				processData : false,
		 				contentType : false, 
		 				data : formData,
		 				type : 'POST',
		 				dataType : 'json',
		 					success:function(result){
		 						var data = result['fileList'];
		 						for(var info in data) {
		 							var res = data[info];
		 							var thumhtml = "<img src='/thumbnails?uuid="+ res.uuid +"&file_name="+ res.file_name +"'>";
		 							$(".uploadresult > ul").html(thumhtml);
		 						} ;
		 						
		 					}
		 			});
		 			
		 			
		 		});
	         
	      })
	      
	      function enroll(){
			var formData = new FormData();
			var subject = $('#subject').val();
			var start_date = $('#start_date').val();
			var end_date = $('#end_date').val();
			var xpx = $('#xpx').val();
			var ypx = $('#ypx').val();
			var content = $('#content').val();
			var file = $('input[name="file"]');
			var file2 = file[0].files;
			var popuplink = $('#popuplink').val();
			var gridRadios =$("input[name='gridRadios']:checked").val();
			var reg_id = $("#reg_id").val();

			for(var i=0; i<file2.length; i++) {
				formData.append("file", file2[i]);
			}
			
			formData.append('subject', subject);
			formData.append('start_date', start_date);
			formData.append('end_date', end_date);
			formData.append('xpx', xpx);
			formData.append('ypx', ypx);
			formData.append('content', content);
			formData.append('popuplink', popuplink);
			formData.append('gridRadios', gridRadios);
			formData.append('reg_id', reg_id);
			
			for (let key of formData.keys()) {
				console.log(key, ":", formData.get(key));
			}
			
			
			$.ajax({
				type: "post",
				url: "dopopupenroll",
				processData: false,
				contentType: false,
				enctype: "multipart/form-data",
				data: formData,
				success: function(data) {
					alert("글이 등록되었습니다.");
					location.href = "/admin/ad_manage/popup";
					opener.parent.location.reload();
					window.close();
				}
			});
		}
	</script>