<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<div class="col-sm-12 col-xl-10 m-sm-auto" style="border:3px solid #e3e3e3">
                        <div class="rounded h-100 p-4">
                            <h6 class="mb-4">시간표</h6>
                            <table>
                            <tr>
                            	<th>a</th>
                            	<td>b</td>
                            	<td>c</td>
                            	<td>d</td>
                            	<td>e</td>
                            	<td>f</td>
                            	<td>g</td>
                            </tr>
                            	
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
	
	</script>