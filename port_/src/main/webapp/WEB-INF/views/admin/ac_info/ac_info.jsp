<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<style>
	.timecolor{color:black;}
	.subjectcolor{color:black;}
</style>
    
<div class="col-sm-12 col-xl-10 m-sm-auto" style="border:3px solid #e3e3e3">
                        <div class="rounded h-100 p-4">
                            <h6 class="mb-4">시간표</h6>
                            <table class="table table-bordered">
                            <thead>
	                            <tr>
	                            	<th>시간</th>
	                            	<td>월</td>
	                            	<td>화</td>
	                            	<td>수</td>
	                            	<td>목</td>
	                            	<td>금</td>
	                            	<td>토</td>
	                            	<td>일</td>
	                            </tr>
                            </thead>
                            <tbody>
	                            
	                            <c:forEach items="${timetableList}" var="tlist">
	                                <tr>
	                                	<c:if test="${null ne time }">
	                                		<th>비어 있습니다.
	                                	</c:if>
		                            	<th><a class="timecolor" href="time_tbl_update_time?time=<c:out value="${tlist.time}"/>"><c:out value="${tlist.time}" /></a></th>
		                            	<c:if test="${null eq tlist.m }">
		                            		<td>공강 <br> <a href="time_tbl_enrollpop?time=<c:out value="${tlist.time}"/>&day=m">등록하기</a></td>
		                            	</c:if>
		                            	<c:if test="${null ne tlist.m }">
		                            		<td><a class="subjectcolor" href="time_tbl_update?time=<c:out value="${tlist.time}"/>&day=m&subject=<c:out value="${tlist.m}"></c:out>"><c:out value="${tlist.m}"/></a></td>
		                            	</c:if> 
		                            	<c:if test="${null eq tlist.t }">
		                            		<td>공강 <br> <a href="time_tbl_enrollpop?time=<c:out value="${tlist.time}"/>&day=t">등록하기</a></td>
		                            	</c:if>
		                            	<c:if test="${null ne tlist.t }">
		                            		<td><a class="subjectcolor" href="time_tbl_update?time=<c:out value="${tlist.time}"/>&day=m&subject=<c:out value="${tlist.t}"></c:out>"><c:out value="${tlist.t }"/></a></td>
		                            	</c:if> 
		                            	<c:if test="${null eq tlist.w }">
		                            		<td>공강  <br> <a href="time_tbl_enrollpop?time=<c:out value='${tlist.time}'/>&day=w">등록하기</a></td>
		                            	</c:if>
		                            	<c:if test="${null ne tlist.w }">
		                            		<td><a class="subjectcolor" href="time_tbl_update?time=<c:out value="${tlist.time}"/>&day=m&subject=<c:out value="${tlist.w}"></c:out>"><c:out value="${tlist.w }"/></a></td>
		                            	</c:if> 
		                            	<c:if test="${null eq tlist.th }">
		                            		<td>공강  <br> <a href="time_tbl_enrollpop?time=<c:out value='${tlist.time}'/>&day=th">등록하기</a></td>
		                            	</c:if>
		                            	<c:if test="${null ne tlist.th }">
		                            		<td><a class="subjectcolor" href="time_tbl_update?time=<c:out value="${tlist.time}"/>&day=m&subject=<c:out value="${tlist.th}"></c:out>"><c:out value="${tlist.th }"/></a></td>
		                            	</c:if> 
		                            	<c:if test="${null eq tlist.f }">
		                            		<td>공강  <br> <a href="time_tbl_enrollpop?time=<c:out value='${tlist.time}'/>&day=f">등록하기</a></td>
		                            	</c:if>
		                            	<c:if test="${null ne tlist.f }">
		                            		<td><a class="subjectcolor" href="time_tbl_update?time=<c:out value="${tlist.time}"/>&day=m&subject=<c:out value="${tlist.f}"></c:out>"><c:out value="${tlist.f }"/></a></td>
		                            	</c:if> 	
		                            	<c:if test="${null eq tlist.sa }">
		                            		<td>공강  <br> <a href="time_tbl_enrollpop?time=<c:out value='${tlist.time}'/>&day=sa">등록하기</a></td>
		                            	</c:if>
		                            	<c:if test="${null ne tlist.sa }">
		                            		<td><a class="subjectcolor" href="time_tbl_update?time=<c:out value="${tlist.time}"/>&day=m&subject=<c:out value="${tlist.sa}"></c:out>"><c:out value="${tlist.sa }"/></a></td>
		                            	</c:if> 	
		                            	<c:if test="${null eq tlist.s }">
		                            		<td>공강  <br> <a href="time_tbl_enrollpop?time=<c:out value='${tlist.time}'/>&day=s">등록하기</a></td>
		                            	</c:if>
		                            	<c:if test="${null ne tlist.s }">
		                            		<td><a class="subjectcolor" href="time_tbl_update?time=<c:out value="${tlist.time}"/>&day=m&subject=<c:out value="${tlist.s}"></c:out>"><c:out value="${tlist.s }"/></a></td>
		                            	</c:if> 	
		                            </tr>
	                            </c:forEach> 
	                            <tr>
	                            	<th><a href="time_tbl_enrollpop_time">시간 등록하기</a></th>
	                            	<td><a href="#" onclick="alert('시간먼저 설정해주세요')">등록하기</a></td>
	                            	<td><a href="#" onclick="alert('시간먼저 설정해주세요')">등록하기</a></td>
	                            	<td><a href="#" onclick="alert('시간먼저 설정해주세요')">등록하기</a></td>
	                            	<td><a href="#" onclick="alert('시간먼저 설정해주세요')">등록하기</a></td>
	                            	<td><a href="#" onclick="alert('시간먼저 설정해주세요')">등록하기</a></td>
	                            	<td><a href="#" onclick="alert('시간먼저 설정해주세요')">등록하기</a></td>
	                            	<td><a href="#" onclick="alert('시간먼저 설정해주세요')">등록하기</a></td>
	                            	
	                            </tr>
                            </tbody>
                            	
                            </table>
                            
                        </div>
</div>    
<div class="col-sm-8 col-xl-8 m-sm-auto" style="border:3px solid #e3e3e3">
<div class="container-fluid px-4">
		<h1 class="mt-4">학원정보 입력</h1>
		<div class="card mb-4">
			<div class="card-body">
				<form>
					<div class="mb-3 mt-3">
						<label for="bno" class="form-label">학원명</label>
						 <input type="text" class="form-control update w-50" id="subject" name="subject" disabled>
					</div>
					
					<div class="mb-3 mt-3">
						<label for="bno" class="form-label">주소</label>
						 <input type="text" class="form-control update w-50" id="subject" name="subject" disabled>
					</div>
					
					<div class="mb-3 mt-3">
						<label for="bno" class="form-label">수강인원: </label>
						 <input type="text" class="form-control update" style="display:inline-block; width:10%;"id="subject" name="subject" disabled>명
					</div>
					<div class="mb-3 mt-3">
						<label for="bno" class="form-label">수강 과목: </label>
						<input type="text" class="form-control update inputP" style="display:inline-block; width:10%;"id="subject" name="subject" disabled>
						<button class="button" onclick="add_btn()">+</button>
					</div>
					<div class="mb-3 mt-3">
						<label for="bno" class="form-label">시설 및 편의시설: </label>
						<input type="text"; class="form-control update" style="display:inline-block; width:10%;"id="subject" name="subject" disabled>
						<button class="button">+</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	
	<div class="modal-footer">
		<a class="btn" id="modalY" href="#">수정하기</a>		
	</div>
	</div>
	
	
	<script>
		function add_btn(){
			event.preventDefault();
			var input = document.getElementsByClassName('inputP');
			
			input[0].insertAdjacentHTML('afterend', '<input type="text"; class="form-control update" style="display:inline-block; width:10%;"id="subject" name="subject" disabled>');
			console.log(input);
			
		}
		
/* 		function popup(time){
			
			var url = <c:url value='time_tbl_enrollpop?time="+time+"'/>"
			var name="time_tbl_enrollpop"
			var status ="width=1000, height=600,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50";

			 window.open(url, name, status);
				
		} */
		
		
	
	</script>