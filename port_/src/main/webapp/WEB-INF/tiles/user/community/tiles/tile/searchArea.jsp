<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	function search() {
		var title = $("input[name='title']").val();
		location.href = "/user/community/data_board?title=" + title;
	}
</script>
<div class="border-radius-white p-4 mb-3">
	<div class="search-wrap">
		<div>
			<div class="select-box">
				<select name="searchword">
					<option value="01">전체</option>
				</select>
				<span class="select-arrow">
					<i class="fa-solid fa-caret-down"></i>
				</span>
			</div>
		</div>
		<div class="search-input">
			<input type="text" class="w-100 h-100" placeholder="검색어를 입력하세요" name="title"/>
		</div>
		<div class="search-btn" onclick="javascript:search();">
			<i class="fa fa-search"></i><span class="ms-1">검색</span>
		</div>
	</div>
</div>