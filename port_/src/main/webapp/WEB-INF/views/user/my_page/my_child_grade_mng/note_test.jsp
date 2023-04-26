<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="#">
	<div class="row">
		<div class="col-12">
			<div class="fs-6 py-3 fw-bolder font-color">
				<i class="fa-solid fa-caret-right main-color me-2"></i>검색 옵션
			</div>
			<div class="border-radius-white font-color mb-3">
				<div class="p-3 fw-bold">
					<div class="row align-items-center mb-3">
						<div class="col-1">기간</div>
						<div class="col-11">
							<input type="text" class="w-auto form-control datepicker d-inline-block fs-7" placeholder="시작 날짜" name="start_date">
                            <span class="px-2">~</span>
                            <input type="text" class="w-auto form-control datepicker d-inline-block fs-7" placeholder="종료 날짜" name="end_date">
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-1">검색어</div>
						<div class="col-11"><input type="text" class="form-control fs-7" placeholder="검색어를 입력하세요." name="keyword"></div>
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
				<i class="fa-solid fa-caret-right main-color me-2""></i>쪽지 시험 문제
			</div>
			<div class="border-radius-white font-color">
				<div class="p-3">
					<table class="board-table">
						<colgroup>
							<col width="10%">
							<col width="70%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>다운로드</th>
							</tr>
						</thead>
						<tbody>
							<tr class="border-bottom-line">
								<td>1</td>
								<td>2023_04_01_쪽지_시험_문제목록</td>
								<td><a href="#" class="custom-btn">다운로드</a></td>
							</tr>
						</tbody>
					</table>				
				</div>
			</div>
		</div>
	</div>
</form>