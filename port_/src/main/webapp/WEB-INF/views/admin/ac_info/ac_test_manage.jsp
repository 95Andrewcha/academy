<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


                    
<!-- Form Start -->
          <div class="col-sm-12 col-xl-10 m-sm-auto" style="border:3px solid #e3e3e3">
                        <div class="rounded h-100 p-4">
                            <h6 class="mb-4">Horizontal Form</h6>
                            <form action="insert" method="get">
                                <div class="row mb-3">
                                    <label for="subject" class="col-sm-2 col-form-label">과목명</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="subject" name="subject">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="teacher" class="col-sm-2 col-form-label">담당강사</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="teacher" name="teacher">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="student" class="col-sm-2 col-form-label">학생명</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="student" name="student">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="date" class="col-sm-2 col-form-label">시험일</label>
                                    <div class="col-sm-10 ">
                                        <input type="text" class="w-25 form-control datepicker d-inline-block" id="start_date" placeholder="start_date" name="start_date">
                                        ~
                                        <input type="text" class="w-25 form-control datepicker d-inline-block" id="end_date" placeholder="end_date" name="end_date">
                                    </div>

                                   
                                </div>
                                
                                <button type="submit" class="btn btn-primary">Sign in</button>
                                <button type="reset" class="btn btn-primary">reset</button>
                            </form>
                        </div>
                    </div>
            <!-- Form End -->
            
            
 <!-- select table Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">학생정보</h6>
                       
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            
                            <tbody>
                            <tr class="text-dark">
                                    <th scope="col"><input class="form-check-input" id="chkboxAll" type="checkbox" name="chkboxAll" onclick=checkAll();></th>
                                    <th scope="col">과목명</th>
                                    <th scope="col">담당강사</th>
                                    <th scope="col">학생명</th>
                                    <th scope="col">시험일</th>
                                    <th scope="col">점수</th>
                                </tr>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox" name="chkbox"></td>
                                    <td>{과목명}</td>
                                    <td>{담당강사]</td>
                                    <td>{학생명</td>
                                    <td>{시험일}</td>
                                    <td>{점수}</td>
                                    <td><button id="detail" class="btn btn-sm btn-primary" >자세히보기</button></td>
                                </tr>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox" name="chkbox"></td>
                                    <td>{과목명2}</td>
                                    <td>{담당강사2]</td>
                                    <td>{학생명2</td>
                                    <td>{시험일2}</td>
                                    <td>{점수2}</td>
                                    <td><button id="detail" class="btn btn-sm btn-primary" >자세히보기</button></td>
                                </tr>
                               
                                
                               
                            </tbody>
                        </table>
                       
                    </div>
                    <div class="my-2 text-end">
                    	<button class="btn btn-primary">등록하기</button>
                    	<button class="btn btn-primary" id="t_update">수정하기</button>
                    	<button class="btn btn-primary" >삭제</button>
                    </div>
                     
                </div>
            </div>
            <!-- Select table End -->

  <!--  Modal-->
	<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">모달</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">
		<div class="container-fluid px-4">
		<h1 class="mt-4">자세히보기</h1>
		<div class="card mb-4">
			<div class="card-body">
				<form>
					<div class="mb-3 mt-3">
						<label for="bno" class="form-label">과목명</label> <input type="text"
							class="form-control update" id="subject" name="subject" disabled
							>
					</div>
					    
					<div class="mb-3">
						<label for="title" class="form-label">teacher</label> <input
							type="text" class="form-control update" id="title" name="teacher" disabled
							 >
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">참고</label>
						<textarea class="form-control update" id="content" name="content" disabled
							></textarea>
					</div>
					<div class="mb-3">
						<label for="regDate" class="form-label">start_date</label> <input
							type="text" class="form-control update" id="start_date" name="start_date" disabled
							 >
					</div>
					<div class="mb-3">
						<label for="writer" class="form-label">student</label> <input 
							type="text" class="form-control update" id="student" name="student" disabled
							>
					</div>

				</form>
			</div>
		</div>
	</div>
				
				</div>
				<div class="modal-footer">
					<a class="btn" id="modalY" href="#">수정하기</a>
					<button class="btn" type="button" data-dismiss="modal" id="close">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
		<script>
		
		$(function(){
	         $('#start_date').datepicker();
	         $('#end_date').datepicker();
	      })
	      
	      
		$('#detail').click(function(e){
			e.preventDefault();
			$('#testModal').modal("show");
		});
		
		$('#close').click(function(e){
			e.preventDefault();
			$('#testModal').modal("hide");
		});
		
		$('#modalY').click(function(e){
			e.preventDefault();
			$(".update").attr("disabled", false);
			
		});
		
		 function checkAll() {
         	if($("#chkboxAll").is(':checked')) {
         		$("input[name=chkbox]").prop("checked", true);
         	} else {
         		$("input[name=chkbox]").prop("checked", false);
         	}
         }
         
         $(document).on("click", "input:checkbox[name=chkbox]", function(e) {
         	
         	var chks = document.getElementsByName("chkbox");
         	var chksChecked = 0;
         	
         	for(var i=0; i<chks.length; i++) {
         		var cbox = chks[i];
         		
         		if(cbox.checked) {
         			chksChecked++;
         		}
         	}
         	
         	if(chks.length == chksChecked){
         		$("#chkboxAll").prop("checked", true);
         	}else{
         		$("#chkboxAll").prop("checked",false);
         	}
         	
         });
         
         $("#t_update").click(function(){
         	
        
         var tdArr = new Array();
         var checkbox = $("input[name=chkbox]:checked");
         
         checkbox.each(function(index){
         	var tr = checkbox.parent().parent().eq(index);
         	var td = tr.children();
         	
         	
         	var subject = td.eq(1).text() + ",";
         	var teacher = td.eq(2).text() + ",";
         	
         	subject = subject.substring(0,subject.length-1);
         	teacher = teacher.substring(0, teacher.length-1);
         	
         	tdArr.push(subject);
         	tdArr.push(teacher);
         	
         	console.log("subject :" + subject);
         	console.log("teacher :" + teacher);
         	console.log("tdArr:" + tdArr);
         	
         	});
         
         });
         
         
		

	</script>
           