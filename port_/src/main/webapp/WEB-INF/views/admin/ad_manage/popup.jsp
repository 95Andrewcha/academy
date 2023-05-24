<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<!-- Form Start -->
          <div class="col-sm-12 col-xl-10 m-sm-auto" style="border:3px solid #e3e3e3">
                        <div class="rounded h-100 p-4">
                            <h6 class="mb-4">팝업 관리</h6>
                            <form action="insert" method="get">
                                <div class="row mb-3">
                                    <label for="subject" class="col-sm-2 col-form-label">제목</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="subject" name="subject">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="teacher" class="col-sm-2 col-form-label">등록자</label>
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
                                
                                <button type="submit" class="btn btn-primary">검색</button>
                                <button type="reset" class="btn btn-primary">초기화</button>
                            </form>
                        </div>
                    </div>
            <!-- Form End -->
            <!-- select table Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">팝업 조회</h6>
                       
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            
                            <tbody>
                            <tr class="text-dark">
                                    <th scope="col"><input class="form-check-input" id="chkboxAll" type="checkbox" name="chkboxAll" onclick=checkAll();></th>
                                    <th scope="col">제목</th>
                                    <th scope="col">기간</th>
                                    <th scope="col">등록자</th>
                                    <th scope="col">내용</th>
                                </tr>
                                <c:forEach items="${list}" var="Plist">
                                <tr>
                                    <td><input class="form-check-input" type="checkbox" name="chkbox" value="${Plist.id }"></td>
                                    <td><c:out value="${Plist.NAME }"/></td>
                                   
                                    <td><fmt:formatDate value="${Plist.START_DATE}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${Plist.END_DATE }" pattern="yyyy-MM-dd"/> </td>
                                    <td><c:out value="${Plist.REG_ID}"/></td>
                                    <td><c:out value="${Plist.CONTENT}"/></td>
                                    <td><button id="detail" class="btn btn-sm btn-primary" data-id="${Plist.id }" onclick="javascript:showDetail('${Plist.id}');">자세히보기</button></td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                       
                    </div>
                     <form name="frmPopup">
                     <input type="hidden" name="popupenroll">
                     </form>
         	
       
                    <div class="my-2 text-end">
                    	<button class="btn btn-primary" onclick="Popupopen(name)";>등록하기</button>
                    	<button class="btn btn-primary" id="t_update" type="submit" data-oper="update">수정하기</button>
                    	<button class="btn btn-primary" id="pop_delete" type="submit" data-oper="delete" >삭제</button>
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
						<label for="bno" class="form-label">제목</label>
						 <input type="text" class="form-control update" id="subject" name="subject" value="" disabled>
					</div>
					<div class="mb-3">
						<label for="regDate" class="form-label">기간선택</label><br>
						 <input type="text" class="form-control update" style="width:45% !important; display:inline-block;" id="start_date" name="start_date" disabled>
						 &nbsp;&nbsp;&nbsp;
						 <input type="text" class="form-control update" style="width:45% !important; display:inline-block;" id="end_date" name="end_date" disabled>
					</div>
					
					<div class="mb-3">
						<label for="xpx" class="form-label">좌표값 입력</label><br>
						 x:  &nbsp;<input type="text" class="form-control update w-25" style="display:inline-block;" id="xpx" name="xpx" disabled> px
						 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;  &nbsp;
						 y: &nbsp; <input type="text" class="form-control update w-25" style="display:inline-block;" id="ypx" name="ypx" disabled> px
					</div>
					<div class="mb-3">
					<c:out value="${Plist.CONTENT}"/>
						<label for="content" class="form-label">참고</label>
						<textarea class="form-control update" id="content" name="content" disabled>
						
						</textarea>
					</div>
					
					<div class="mb-3">
							<label for="formFileMultiple" class="form-label">첨부파일</label>
								 <input class="form-control" type="file"
								id="formFileMultiple" multiple>
					</div>
					<div class="mb-3">
						<label for="popuplink" class="form-label">팝업링크</label>
						 <input type="text" class="form-control update" id="popuplink" name="popuplink" disabled>
					</div>
					<div class="mb-3">
						<label for="xpx" class="form-label">오늘 하루 안보기여부</label><br>
						<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="유">
						<label class="form-check-label" for="gridRadios1">유</label>
						
						<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="무" checked>
						 <label class="form-check-label" for="gridRadios2">무</label>
					</div>
					
					

				</form>
			</div>
		</div>
	</div>
				
				</div>
				<div class="modal-footer">
					<a class="btn" href="#">미리보기</a>
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
	      });
		/* $('#detail').click(function(e){
			e.preventDefault();
			$('#testModal').modal("show");
		}); */
		
		function showDetail(id) {
			$.ajax({
				type: "get",
				url: "popupDetail/" + id,
				success: function(data) {
					var list = data.list;
					var modal = $('#testModal');
					console.log(data.list);
					
					var start = new Date(list.start_DATE);
					
					modal.find("input[name='subject']").val(list.name);
					modal.find("input[name='start_date']").val(start);
					modal.find("input[name='end_date']").val(list.end_DATE);
					alert("성공");
					
					
					
					
					
					$('#testModal').modal("show");
				},
				error: function(data) {
					alert("실패");
				}
			});
		}
		
		$('#close').click(function(e){
			e.preventDefault();
			$('#testModal').modal("hide");
		});
		
		$('.close').click(function(e){
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
		 
		 
		//전체 체크 선택
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
         
         $("#pop_delete").click(function(){
         var tdArr = new Array();
         var checkbox = $("input[name=chkbox]:checked");
         
         checkbox.each(function(index){
         	var tr = checkbox.parent().parent().eq(index);
         	var td = tr.children();
         	var id = $(this).val();
         	tdArr.push(id);
         });
         $.ajax({
 			type : 'post',
 			url : 'delete',
 			traditional: true,
 			data : {
 				"tdArr" : tdArr
 			},
 			success : function(result){
 				location.href='popup'
 				console.log(result);
 			},
 			error : function(xhr){
 				console.log(xhr.responseText);
 			}
 		});
         
         });
        
         
         function Popupopen(name){
        	 var url = "popupenroll";
        	 var name = "popupenroll";
        	 var status ="width=1000, height=600,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50";
        	 window.open(url, name, status);        	 
         }
		

	</script>