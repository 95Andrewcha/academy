<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
				<form>
					<div class="mb-3 mt-3">
						<label for="bno" class="form-label">제목</label> <input type="text"
							class="form-control update" id="subject" name="subject" disabled>
					</div>
					<div class="mb-3">
						<label for="regDate" class="form-label">기간선택</label><br>
						 <input type="text" class="form-control update" style="width:45% !important; display:inline-block;" id="start_date" name="start_date" disabled>
						 &nbsp;&nbsp;&nbsp;
						 <input type="text" class="form-control update" style="width:45% !important; display:inline-block;" id="end_date" name="end_date" disabled>
					</div>
					
					<div class="mb-3">
						<label for="xpx" class="form-label">좌표값 입력</label><br>
						 x:  &nbsp;<input type="text" class="form-control update w-25" style="display:inline-block;" id="xpx" name="xpx" disabled> px
						 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;  &nbsp;
						 y: &nbsp; <input type="text" class="form-control update w-25" style="display:inline-block;" id="ypx" name="ypx" disabled> px
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">참고</label>
						<textarea class="form-control update" id="content" name="content" disabled
							></textarea>
					</div>
					
					<div class="mb-3">
							<label for="formFileMultiple" class="form-label">첨부파일</label>
								 <input class="form-control" type="file"
								id="formFileMultiple" multiple>
					</div>
					<div class="mb-3">
						<label for="popuplink" class="form-label">팝업링크</label>
						 <input type="text" class="form-control update" id="popuplink" name="popuplink" disabled>
					</div>
					<div class="mb-3">
						<label for="xpx" class="form-label">오늘 하루 안보기여부</label><br>
						<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="유">
						<label class="form-check-label" for="gridRadios1">유</label>
						
						<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="무" checked>
						 <label class="form-check-label" for="gridRadios2">무</label>
					</div>
					
					

				</form>
			</div>
		</div>
	</div>
				
				</div>
				<div class="modal-footer">
					<a class="btn" href="#">미리보기</a>
					<a class="btn" id="modalY" href="#">수정하기</a>
					<button class="btn" type="button" data-dismiss="modal" id="close">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
		
		$(function(){
	         $('#start_date').datepicker();
	         $('#end_date').datepicker();
	      })
	</script>