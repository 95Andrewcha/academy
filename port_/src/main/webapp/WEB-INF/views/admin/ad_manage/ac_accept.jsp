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
                                    <label for="name" class="col-sm-2 col-form-label">학원명</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="name" name="name">
                                    </div>
                                </div>
								<fieldset class="row mb-3">
                                    <legend class="col-form-label col-sm-2 pt-0">성별</legend>
                                    <div class="col-sm-10">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="gridRadios"
                                                id="gridRadios1" value="승인" checked>
                                            <label class="form-check-label" for="gridRadios1">
                                                승인
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="gridRadios"
                                                id="gridRadios2" value="보류">
                                            <label class="form-check-label" for="gridRadios2">
                                                보류
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="gridRadios"
                                                id="gridRadios2" value="거절">
                                            <label class="form-check-label" for="gridRadios2">
                                                거절
                                            </label>
                                        </div>
                                    </div>
                                </fieldset>
                               
								<button type="submit" class="btn btn-primary">조회하기</button>
                                <button type="reset" class="btn btn-primary">초기화</button>
                                   
                            
                                
                                
                            </form>
                        </div>
                        </div>
                   
            <!-- Form End -->
            
            
 <!-- select table Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">학원 입점 허가 관리</h6>
                       
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            
                            <tbody>
                            <tr class="text-dark">
                                    <th scope="col"><input class="form-check-input" id="chkboxAll" type="checkbox" name="chkboxAll" onclick=checkAll();></th>
                                    <th scope="col">번호</th>
                                    <th scope="col">학원명</th>
                                    <th scope="col">주소</th>
                                    <th scope="col">대표자</th>
                                    <th scope="col">대표자 전화번호</th>
                                    <th scope="col">사업자등록 번호</th>
                                    <th scope="col">입점여부</th>
                                    <th scope="col">결제여부</th>
                                    <th scope="col">자세히보기</th>
                                </tr>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox" name="chkbox"></td>
                                    <td>{번호}</td>
                                    <td>{학원명]</td>
                                    <td>{주소</td>
                                    <td>{대표자}</td>
                                    <td>{대표자 전화번호}</td>
                                    <td>{사업자등록 번호}</td>
                                    <td>{입점여부}</td>
                                    <td>{결제여부}</td>
                                    <td>{자세히보기}</td>
                                    
                                    <td><button id="detail" class="btn btn-sm btn-primary" >자세히보기</button></td>
                                </tr>
                                 <tr>
                                    <td><input class="form-check-input" type="checkbox" name="chkbox"></td>
                                    <td>{번호}</td>
                                    <td>{학원명]</td>
                                    <td>{주소</td>
                                    <td>{대표자}</td>
                                    <td>{대표자 전화번호}</td>
                                    <td>{사업자등록 번호}</td>
                                    <td>{입점여부}</td>
                                    <td>{결제여부}</td>
                                    <td>{자세히보기}</td>
                                    
                                    <td><button id="detail" class="btn btn-sm btn-primary" onclick="acceptPopup()" >자세히보기</button></td>
                                </tr>
                               
                                
                               
                            </tbody>
                        </table>
                       
                    </div>
                    <div class="my-2 text-end">
                    	<button class="btn btn-primary">승인</button>
                    	<button class="btn btn-primary" onclick="rejectpopup()">거절</button>
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
             
             function rejectpopup(){
            	 
            	 var url = "rejectPopup";
            	 
            	 var name="rejectpopup";
            	 var status ="width=500, height=300,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50";
           
            	 window.open(url, name, status);
            	 
             }
             
             function acceptPopup(){
				var url = "acceptPopup";
            	 
            	 var name="acceptPopup";
            	 var status ="width=1000, height=600,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50";
           
            	 window.open(url, name, status);
           
             }
            	 
         
            </script>
