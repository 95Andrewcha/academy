<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<title>학생정보</title>

 <!-- Form Start -->
          <div class="col-sm-12 col-xl-10 m-sm-auto" style="border:3px solid #e3e3e3">
                        <div class="rounded h-100 p-4">
                            <h6 class="mb-4">Horizontal Form</h6>
                            <form action="select" method="get">
                                <div class="row mb-3">
                                    <label for="name" class="col-sm-2 col-form-label">이름</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="name" name="name">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="year" class="col-sm-2 col-form-label">생년</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="year" name="year">
                                    </div>
                                </div>
								<fieldset class="row mb-3">
                                    <legend class="col-form-label col-sm-2 pt-0">성별</legend>
                                    <div class="col-sm-10">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="gridRadios"
                                                id="gridRadios1" value="남자" checked>
                                            <label class="form-check-label" for="gridRadios1">
                                                남자
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="gridRadios"
                                                id="gridRadios2" value="여자">
                                            <label class="form-check-label" for="gridRadios2">
                                                여자
                                            </label>
                                        </div>
                                    </div>
                                </fieldset>
                               
								<button type="submit" class="btn btn-primary">Sign in</button>
                                <button type="reset" class="btn btn-primary">reset</button>
                                   
                                </div>
                                
                                
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
                                    <th scope="col">이름</th>
                                    <th scope="col">주소</th>
                                    <th scope="col">성별</th>
                                    <th scope="col">출석률</th>
                                    <th scope="col">학원등록일</th>
                                    <th scope="col">등록비 납부여부</th>
                                    <th scope="col">상세정보</th>
                                </tr>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox" name="chkbox"></td>
                                    <td>{이름}</td>
                                    <td>{주소]</td>
                                    <td>{성별</td>
                                    <td>{출석률}</td>
                                    <td>{학원등록일}</td>
                                    <td>{등록비 납부여부}</td>
                                    <td>{상세정보}</td>
                                    <td><button id="detail" class="btn btn-sm btn-primary" >자세히보기</button></td>
                                </tr>
                                <tr>
                                     <td><input class="form-check-input" type="checkbox" name="chkbox"></td>
                                    <td>{이름}</td>
                                    <td>{주소]</td>
                                    <td>{성별</td>
                                    <td>{출석률}</td>
                                    <td>{학원등록일}</td>
                                    <td>{등록비 납부여부}</td>
                                    <td>{상세정보}</td>
                                    <td><button id="detail" class="btn btn-sm btn-primary" onclick="Popupopen()">자세히보기</button></td>
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
            
            
            <script>
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
             
             function Popupopen(){
            	 
            	 var url = "open_detail";
            	 
            	 var name="detail_name";
            	 var status ="width=1000, height=600,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50";
           
            	 window.open(url, name, status);
            	 
             }
            	 
         
            </script>
