<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="border-radius-white p-4 mb-3">
	<div class="search-wrap">
		<div>
			<div class="select-box">
				<select>
					<option value="01">제목</option>
					<option value="02">제목+내용</option>
					<option value="03">작성자</option>
				</select>
				<span class="select-arrow">
					<i class="fa-solid fa-caret-down"></i>
				</span>
			</div>
		</div>
		<div class="search-input">
			<input type="text" class="w-100 h-100" placeholder="검색어를 입력하세요" name="keyword"/>
		</div>
		<div class="search-btn">
			<i class="fa fa-search"></i><span class="ms-1">검색</span>
		</div>
	</div>
</div>