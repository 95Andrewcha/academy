<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <div class="container-fluid px-4">
		<h1 class="mt-4"></h1>
		<div class="card mb-4">
			<div class="card-body">
				<form>
					<div class="mb-3">
						<label for="content" class="form-label">내용</label>
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
	
	<script>
	function close(){
		self.close() 
	}
	</script>