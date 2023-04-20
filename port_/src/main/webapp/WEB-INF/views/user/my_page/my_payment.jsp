<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function() {
		$('input[name="start_date"]').datepicker();
		$('input[name="end_date"]').datepicker();
	});
</script>
<form action="#">
	<div class="row">
		<div class="col-12">
			<div class="border-radius-white font-color mb-3">
				<div class="fs-6 p-3 fw-bolder border-bottom-line main-bg-color border-top-radius white-color">검색 옵션</div>
				<div class="p-3 fw-bold">
					<div class="row align-items-center mb-3">
						<div class="col-1">기간</div>
						<div class="col-11">
							<input type="text" class="w-auto form-control datepicker d-inline-block" placeholder="시작 날짜" name="start_date">
                            <span class="px-2">~</span>
                            <input type="text" class="w-auto form-control datepicker d-inline-block" placeholder="종료 날짜" name="end_date">
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-1">검색어</div>
						<div class="col-11"><input type="text" class="form-control" placeholder="검색어를 입력하세요." name="keyword"></div>
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
			<div class="border-radius-white font-color">
				<div class="fs-6 p-3 fw-bolder border-bottom-line main-bg-color border-top-radius white-color">최근 결제내역</div>
				<div class="p-3">
					<table class="board-table">
						<colgroup>
							<col width="15%">
							<col width="55%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>날짜</th>
								<th>결제정보</th>
								<th>상태</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr class="border-bottom-line">
								<td>2023.04.06</td>
								<td class="text-start">학원명 몇개월 결제</td>
								<td>결제완료</td>
								<td>
									<ul>
										<li><a href="#" class="custom-btn mb-1 d-inline-block">문의하기</a></li>
										<li><a href="#" class="custom-btn mb-1 d-inline-block">환불신청</a></li>
										<li><a href="#" class="custom-btn mb-1 d-inline-block">상세보기</a></li>
										<li><a href="#" class="custom-btn d-inline-block">리뷰쓰기</a></li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>				
				</div>
			</div>
		</div>
	</div>
</form>