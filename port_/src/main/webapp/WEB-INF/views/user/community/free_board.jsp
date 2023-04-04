<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="free-board">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<div class="row">
						<div class="col-2">
							<div class="fb-left-menu">
								<div class="fb-left-menu-header">커뮤니티</div>
								<ul class="fb-left-menu-list">
									<li><a href="${contextPath }/user/community/free_board" class="main-color">수다게시판</a></li>
									<li><a href="#">자료게시판</a></li>
									<li><a href="#">QnA</a></li>
									<li><a href="#">리뷰</a></li>
								</ul>
							</div>
						</div>
						<div class="col-10">
							<div class="fb-board">
								<table class="w-100">
									<colgroup>
										<col width="7%">
										<col width="60%">
										<col width="10%">
										<col width="10%">
										<col width="7%">
									</colgroup>
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td class="text-start"><i class="fa-solid fa-image"></i> 테스트 제목1</td>
											<td class="text-start">작성자1</td>
											<td>2023.04.04</td>
											<td>1</td>
										</tr>
										<tr>
											<td>116511</td>
											<td class="text-start"><i class="fa-solid fa-comment-dots"></i> 테스트 제목1</td>
											<td class="text-start">작성자1</td>
											<td>2023.04.04</td>
											<td>1</td>
										</tr>
										<tr>
											<td>1</td>
											<td class="text-start"><i class="fa-solid fa-image"></i> 테스트 제목1</td>
											<td class="text-start">작성자1</td>
											<td>2023.04.04</td>
											<td>232233</td>
										</tr>
										<tr>
											<td>1</td>
											<td class="text-start"><i class="fa-solid fa-image"></i> 테스트 제목1</td>
											<td class="text-start">작성자1</td>
											<td>2023.04.04</td>
											<td>1</td>
										</tr>
										<tr>
											<td>1</td>
											<td class="text-start"><i class="fa-solid fa-comment-dots"></i> 테스트 제목1</td>
											<td class="text-start">작성자1</td>
											<td>2023.04.04</td>
											<td>1</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-2">
									<select>
										<option value="제목">제목</option>
										<option value="제목">제목+내용</option>
										<option value="제목">작성자</option>
									</select>
								</div>
								<div class="search-input col-9">
									<form id="search" action="#">
										<input type="text" placeholder="Type Something" id='searchText' name="searchKeyword" onkeypress="handle" />
									</form>
								</div>
								<div class="col-1">
									<div><i class="fa fa-search"></i> 검색</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>