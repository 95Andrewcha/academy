<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-body">
			<div class="container-fluid px-4">
				<h1 class="mt-2">시간 변경</h1>
				<div class="card mb-4">
					<div class="card-body">
						<form action="time_tbl_doupdate" method="post">
							<input type="hidden" name="subject" value="">
							<input type="hidden" name="day" value="">
							<div class="mb-3">
								<label for="title" class="form-label">기존시간</label>
								 <input type="text" class="form-control update" id="time" name="time" value="${time_tblVO.time}" readonly>
							</div>
							
							<div class="mb-3">
								<label for="title" class="form-label">변경할시간</label>
								 <input type="text" class="form-control update" id="time2" name="time2" value="">
							</div>
							
							<input type="submit" value="등록하기" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>    