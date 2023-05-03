<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/common/js/Calendar.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var calendar = new Calendar();
		calendar.init();
		
		$('.prev').on('click', function() {
			calendar.click1();
		})
	})
	
</script>
<form action="#">
	<div class="row">
		<div class="col-12">
			<div class="fs-6 py-3 fw-bolder font-color">
				<i class="fa-solid fa-caret-right main-color me-2"></i>검색 옵션
			</div>
			<div class="border-radius-white font-color mb-3">
				<div class="p-3 fw-bold">
					<div class="row align-items-center mb-3">
						<div class="col-1">자녀명</div>
						<div class="col-11">
							<div class="search-wrap justify-content-start">
								<div class="select-box">
									<select>
										<option value="01">전체</option>
										<option value="02">홍길동</option>
										<option value="03">홍길서</option>
										<option value="03">홍길남</option>
									</select>
									<span class="select-arrow">
										<i class="fa-solid fa-caret-down"></i>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="d-flex justify-content-end">
							<div class="custom-btn mt-3">
								<i class="fa fa-search"></i><span class="ms-1">검색</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="fs-6 py-3 fw-bolder font-color">
				<i class="fa-solid fa-caret-right main-color me-2""></i>출결 현황
			</div>
			<div class="border-radius-white font-color">
				<div class="p-3">
					<div class="prev">prev</div>
					<div class="next">next</div>
					<div class="calendar"></div>
					캘린더 하나 만들어야 함
				</div>
			</div>
		</div>
	</div>
</form>