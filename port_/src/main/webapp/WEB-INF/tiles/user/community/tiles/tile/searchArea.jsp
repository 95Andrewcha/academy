<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="search-container">
	<div class="d-flex justify-content-center search-wrap">
		<div>
			<div class="select-box h-100">
				<select>
					<option value="01">제목</option>
					<option value="02">제목+내용</option>
					<option value="03">작성자</option>
				</select>
				<span class="select-arrow d-flex align-items-center">
					<i class="fa-solid fa-caret-down"></i>
				</span>
			</div>
		</div>
		<div class="search-input w-100">
			<input type="text" class="w-100 h-100" placeholder="검색어를 입력하세요" name="keyword"/>
		</div>
		<div class="d-flex align-items-center main-bg-color h-100 search-btn">
			<i class="fa fa-search"></i>
		</div>
	</div>
</div>