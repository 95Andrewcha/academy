<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-fluid px-4">
		<h1 class="mt-4"></h1>
		<div class="card mb-4">
			<div class="card-body">
				<table style="border-bottom:1px solid #e3e3e3;"> <!-- 나중에 지워야함 초안으로 경계선 보여주기위함 -->
				<tr>
					<th>제목</th>
					<td>제목</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>작성자이름</td>
					
				</tr>
				
				<tr>
					<th>날짜</th>
					<td>등록일</td>
				</tr>
				<tr>
					<th>답변여부</th>
					<td> o or x</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>내용산ㅇㄻㅇㄹㄴㄹㄴㅇㄹ</td>
				</tr>
				
				</table>
				<form>
					<div class="mb-3">
						<label for="content" class="form-label">답변 쓸 내용</label>
							<textarea class="form-control" id="content" name="content"></textarea>
					</div>
					<div style="text-align:right;">
						<input type="submit" value="등록" class="btn btn-sm btn-primary">
						<button onclick="close()" class="btn btn-sm btn-primary px-2" >닫기</button>
					</div>
				</form>
				
				
			</div>
		</div>
	</div>