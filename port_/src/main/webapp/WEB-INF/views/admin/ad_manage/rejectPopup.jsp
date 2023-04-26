<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Table Start -->
<div class="container-fluid pt-4 px-4">
	<div class="row g-4">

		<div class="col-sm-12 col-xl-6">
			<div class="bg-light rounded h-100 p-4">
				<h6 class="mb-4">거절 사유 입력</h6>
				
				<table class="table table-bordered">
				<form>
					<div class="mb-3">
							<label for="content" class="form-label">내용</label>
							<textarea class="form-control update" id="textAreaContent"name="content"></textarea>
					</div>
				</form>		
				</table>
				
			</div>
		</div>


	</div>
	<div class="my-2 text-end">
		<button class="btn btn-primary" id="t_update">수정하기</button>
		<button class="btn btn-primary">삭제</button>
		<button class="btn btn-primary">닫기</button>
	</div>
</div>