<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Form Start -->
          <div class="col-sm-12 col-xl-10 m-sm-auto" style="border:3px solid #e3e3e3">
                        <div class="rounded h-100 p-4">
                            <h6 class="mb-4">Horizontal Form</h6>
                            <form action="insert" method="get">
                                <div class="row mb-3">
                                    <label for="subject" class="col-sm-2 col-form-label">제목</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="subject" name="subject">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="teacher" class="col-sm-2 col-form-label">작성자</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="teacher" name="teacher">
                                    </div>
                                </div>
                               
                                <div class="row mb-3">
                                    <label for="date" class="col-sm-2 col-form-label">기간</label>
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
                                    <th scope="col">번호</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">조회수</th>
                                    <th scope="col">첨부파일</th>
                                </tr>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox" name="chkbox"></td>
                                    <td>{과목명}</td>
                                    <td>{담당강사]</td>
                                    <td>{학생명</td>
                                    <td>{시험일}</td>
                                    <td>{점수}</td>
                                    
                                </tr>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox" name="chkbox"></td>
                                    <td>{과목명2}</td>
                                    <td>{담당강사2]</td>
                                    <td>{학생명2</td>
                                    <td>{시험일2}</td>
                                    <td>{점수2}</td>
                                    
                                </tr>
                               
                                
                               
                            </tbody>
                        </table>
                       
                    </div>
                    <div class="my-2 text-end">
                    	<button class="btn btn-primary" onclick="enroll()">등록하기</button>
                    	<button class="btn btn-primary" id="t_update">수정하기</button>
                    	<button class="btn btn-primary" >삭제</button>
                    </div>
                     
                </div>
            </div>
            <!-- Select table End -->
            
            <script>
            $(function(){
      	         $('#start_date').datepicker();
      	         $('#end_date').datepicker();
      	      })
      	      
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
         
         function enroll(){
        	 
        	 var url = "enroll"
        	 
        	 var name="enroll_board"
       
        	 window.open(url, name,"width=1000,heightght=1000,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50");
        	 
         }
            
            </script>
