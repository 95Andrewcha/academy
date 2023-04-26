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
						<div class="col-1">학원</div>
						<div class="col-11">
							<div class="search-wrap justify-content-start">
								<div class="select-box">
									<select>
										<option value="01">전체</option>
										<option value="03">학원1</option>
										<option value="01">학원2</option>
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
				<i class="fa-solid fa-caret-right main-color me-2""></i>시험 결과
			</div>
			<div class="border-radius-white font-color">
				<div class="p-3">
					<div>
						<ul class="d-flex pb-2">
							<li class="custom-btn-secondary fs-7 me-1">3일 이내</li>
							<li class="custom-btn-secondary fs-7 me-1">7일 이내</li>
							<li class="custom-btn-secondary fs-7 me-1">30일 이내</li>
						</ul>
					</div>
					<table class="board-table">
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="30%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>학생명</th>
								<th>과목</th>
								<th>과목 평균</th>
								<th>석차</th>
								<th>점수</th>
								<th>보기</th>
							</tr>
						</thead>
						<tbody>
							<tr class="border-bottom-line">
								<td>1</td>
								<td>홍길동</td>
								<td>수학1</td>
								<td>85.8</td>
								<td>1</td>
								<td>100</td>
								<td><a href="#" class="custom-btn">상세보기</a></td>
							</tr>
						</tbody>
					</table>				
				</div>
			</div>
		</div>
	</div>
</form>