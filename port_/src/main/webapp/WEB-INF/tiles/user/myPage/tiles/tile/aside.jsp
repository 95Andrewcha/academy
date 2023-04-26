<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="my-aside-list border-radius-white" style="padding: 0;">
	<div class="font-color fs-5 fw-bold p-3 border-bottom-line">마이페이지</div>
	<ul>
		<li><a href="/user/my_page/my_payment/payment" class="d-block p-3 font-color fw-bold">결제내역</a></li>
		<li><a href="/user/my_page/my_info/info" class="d-block p-3 font-color fw-bold">나의 정보</a></li>
		<li>
			<div class="d-block p-3 font-color fw-bold">내가 쓴 글</div>
			<ul class="bg-secondary-color border-top-radius border-bottom-radius mx-2">
				<li><a href="/user/my_page/my_write/community" class="d-block px-4 py-2 font-color fs-7">커뮤니티</a></li>
				<li><a href="/user/my_page/my_write/qna" class="d-block px-4 py-2 font-color fs-7">QNA</a></li>
				<li><a href="/user/my_page/my_write/review" class="d-block px-4 py-2 font-color fs-7">리뷰</a></li>
			</ul>
		</li>
		<li>
			<div class="d-block p-3 font-color fw-bold">자녀 성적관리</div>
			<ul class="bg-secondary-color border-top-radius border-bottom-radius mx-2">
				<li><a href="/user/my_page/my_child_grade_mng/test_result" class="d-block px-4 py-2 font-color fs-7">시험 결과</a></li>
				<li><a href="/user/my_page/my_child_grade_mng/note_test" class="d-block px-4 py-2 font-color fs-7">쪽지 시험 문제</a></li>
			</ul>
		</li>
		<li><a href="/user/my_page/my_child_att_mng/child_att" class="d-block p-3 font-color fw-bold">자녀 출결관리</a></li>
	</ul>
</div>