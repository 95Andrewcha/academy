<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-body">
			<div class="container-fluid px-4">
				<h1 class="mt-2">시간 등록</h1>
				<div class="card mb-4">
					<div class="card-body">
						<form action="time_tbl_enroll" method="post">
							<input type="hidden" name="subject" value="${subject}">
    						<input type="hidden" name="day" value="${day }">
							<div class="mb-3">
								<label for="title" class="form-label">등록할시간</label>
								 <input type="text" class="form-control update" id="time" name="time" value="" >
							</div>
							<input type="submit" value="등록하기" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>