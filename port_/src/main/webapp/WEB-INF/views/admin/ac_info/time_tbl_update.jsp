<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-body">
			<div class="container-fluid px-4">
				<h1 class="mt-2">과목 수정</h1>
				<div class="card mb-4">
					<div class="card-body">
						<form action="time_tbl_doupdate" method="post">
							<div class="mb-3 mt-3">
								<label for="bno" class="form-label">과목명</label>
								 <input type="text" class="form-control update" id="subject" name="subject" value="${time_tblVO.subject }">
							</div>

							<div class="mb-3">
								<label for="title" class="form-label">시간</label> 
									<input type="text" class="form-control update" id="time" name="time" value="${time_tblVO.time}" readonly>
							</div>
							<div class="mb-3">
								<label for="content" class="form-label">변경할 과목</label>
								 <input type="text" class="form-control update" name="subject2" value="" />
							</div>
							<div class="mb-3">
								<label for="content" class="form-label">요일</label>
								<c:if test="${time_tblVO.day eq 'm'}">
									<input type="text" class="form-control update" name="day" value="월" readonly />
								</c:if>
								<c:if test="${time_tblVO.day eq 'w'}">
									<input type="text" class="form-control update" name="day" value="화" readonly />
								</c:if>
								<c:if test="${time_tblVO.day eq 'w'}">
									<input type="text" class="form-control update" name="day" value="수" readonly />
								</c:if>

								<c:if test="${time_tblVO.day eq 'th'}">
									<input type="text" class="form-control update" name="day" value="목" readonly />
								</c:if>

								<c:if test="${time_tblVO.day eq 'f'}">
									<input type="text" class="form-control update" name="day" value="금" readonly />
								</c:if>

								<c:if test="${time_tblVO.day eq 'sa'}">
									<input type="text" class="form-control update" name="day" value="토" readonly />
								</c:if>

								<c:if test="${time_tblVO.day eq 's'}">
									<input type="text" class="form-control update" name="day" value="일" readonly />
								</c:if>


							</div>
							<input type="submit" value="수정하기" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>






