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
			<div class="fs-6 py-3 fw-bolder font-color">
				<i class="fa-solid fa-caret-right main-color me-2"></i>검색 옵션
			</div>
			<div class="border-radius-white font-color mb-3">
				<div class="p-3 fw-bold">
					<div class="row align-items-center mb-3">
						<div class="col-1">기간</div>
						<div class="col-11">
							<div>
								<input type="text" class="w-auto form-control datepicker d-inline-block fs-7" placeholder="시작 날짜" name="start_date">
	                            <span class="px-2">~</span>
	                            <input type="text" class="w-auto form-control datepicker d-inline-block fs-7" placeholder="종료 날짜" name="end_date">
							</div>
							<div>
								<ul class="d-flex pt-1">
									<li class="custom-btn-secondary fs-7 me-1">1주</li>
									<li class="custom-btn-secondary fs-7 me-1">1개월</li>
									<li class="custom-btn-secondary fs-7 me-1">3개월</li>
									<li class="custom-btn-secondary fs-7 me-1">6개월</li>
									<li class="custom-btn-secondary fs-7 me-1">12개월</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="row align-items-center mb-3">
						<div class="col-1">게시판</div>
						<div class="col-11">
							<div class="search-wrap justify-content-start">
								<div class="select-box">
									<select>
										<option value="01">전체</option>
										<option value="02">수다게시판</option>
										<option value="03">자료게시판</option>
									</select>
									<span class="select-arrow">
										<i class="fa-solid fa-caret-down"></i>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row align-items-center mb-3">
						<div class="col-1">구분</div>
						<div class="col-11">
							<div class="search-wrap justify-content-start">
								<div class="select-box">
									<select>
										<option value="01">전체</option>
										<option value="01">제목+내용</option>
										<option value="02">제목</option>
										<option value="03">내용</option>
									</select>
									<span class="select-arrow">
										<i class="fa-solid fa-caret-down"></i>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-1">검색어</div>
						<div class="col-11">
							<input type="text" class="form-control fs-7" placeholder="검색어를 입력하세요." name="keyword">
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
				<i class="fa-solid fa-caret-right main-color me-2"></i>작성글 목록
			</div>
			<div class="border-radius-white font-color">
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
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>카테고리</th>
							</tr>
						</thead>
						<tbody>
							<tr class="border-bottom-line">
								<td>1</td>
								<td class="text-start">제목</td>
								<td>2023.04.01</td>
								<td>수다게시판</td>
							</tr>
						</tbody>
					</table>				
				</div>
			</div>
		</div>
	</div>
</form>