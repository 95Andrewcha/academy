<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- Table Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">

                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">제목입력칸</h6>
                            <table class="table table-bordered">
                                <form>
					<div class="mb-3 mt-3">
						<label for="bno" class="form-label">제목</label> <input type="text"
							class="form-control update" id="title" name="title"
							>
					</div>
					    
					<div class="mb-3">
						<label for="title" class="form-label">구분</label> <input
							type="text" class="form-control update" id="title" name="teacher">
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">내용</label>
						<textarea class="form-control update" id="content" name="content" ></textarea>
					</div>
					<div class="mb-3">
						<label for="regDate" class="form-label">start_date</label> <input
							type="text" class="form-control update" id="start_date" name="start_date" disabled
							 >
					</div>
					<div class="mb-3">
						<label for="writer" class="form-label">student</label> <input 
							type="text" class="form-control update" id="student" name="student">
					</div>
					<div class="mb-3">
                                <label for="formFileMultiple" class="form-label">Multiple files input example</label>
                                <input class="form-control" type="file" id="formFileMultiple" multiple>
                            </div>

				</form>
                            </table>
                        </div>
                    </div>
                    
                    
                </div>
                <div class="my-2 text-end">
                    	<button class="btn btn-primary" id="t_update">수정하기</button>
                    	<button class="btn btn-primary" >삭제</button>
                    	<button class="btn btn-primary">닫기</button>
                </div>
            </div>
            <!-- Table End -->