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
                                    <td>
                                    	<button id="detail" class="btn btn-sm btn-primary" data-id="${Plist.id }" onclick="javascript:showDetail('${Plist.id}', this);">자세히보기</button>
	                                    <input type="hidden" name="reg_id" id="reg_id" value="${Plist.REG_ID}">
	                                 
                                    </td>
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
				
					<input type="hidden" name="reg_id" id="reg_id">
					<input type="hidden" name="id" id="id">
					<div class="mb-3 mt-3">
						<label for="bno" class="form-label">제목</label>
						 <input type="text" class="form-control update" id="subject" name="subject"  readonly>
					</div>
					<div class="mb-3">
						<label for="regDate" class="form-label">기간선택</label><br>
						 <input type="text" class="form-control update" style="width:45% !important; display:inline-block;" id="start_date" name="start_date" readonly>
						 &nbsp;&nbsp;&nbsp;
						 <input type="text" class="form-control update" style="width:45% !important; display:inline-block;" id="end_date" name="end_date" readonly>
					</div>
					
					<div class="mb-3">
						<label for="xpx" class="form-label">좌표값 입력</label><br>
						 x:  &nbsp;<input type="text" class="form-control update w-25" style="display:inline-block;" id="xpx" name="xpx" readonly> px
						 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;  &nbsp;
						 y: &nbsp; <input type="text" class="form-control update w-25" style="display:inline-block;" id="ypx" name="ypx" readonly> px
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">참고</label>
						<textarea class="form-control update" id="content" name="content" readonly>
						
						</textarea>
					</div>
					
					<div class="mb-3">
							<label for="formFileMultiple" class="form-label">첨부파일</label>
								 <input class="form-control" type="file" id="formFileMultiple" name="file" multiple>
					</div>
					<div class="mb-3 uploadresult"> 
						<label for="formFileMultiple" class="form-label">업로드 파일</label>
							<ul>
							
							</ul>
					</div><!-- uploadresult -->
					<div class="mb-3">
						<label for="popuplink" class="form-label">팝업링크</label>
						 <input type="text" class="form-control update" id="popuplink" name="popuplink" readonly>
					</div>
					<div class="mb-3">
						<label for="xpx" class="form-label">오늘 하루 안보기여부</label><br>
						<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="0">
						<label class="form-check-label" for="gridRadios1">유</label>
						
						<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="1">
						 <label class="form-check-label" for="gridRadios2">무</label>
					</div>
					
					

				</form>
			</div>
		</div>
	</div>
				
				</div>
				<div class="modal-footer">
					<a class="btn" href="#">미리보기</a>
					<a class="btn" id="modalY" onclick="modify(this);">수정하기</a>
					<a class="btn d-none" id="enroll" onclick="update(this);">등록하기</a>
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
		 $("input[name='file']").on("change", function(e) {
	        	
	 			var formData = new FormData();
	 			var inputFile = $("input[name='file']");
	 			var files = inputFile[0].files;
	 			
	 			for(var i=0; i<files.length; i++){
	 				
	 				formData.append("uploadFile", files[i]);
	 			}
	 			
	 			$.ajax({
	 				url : '/admin/uploadAjaxAction',
	 				processData : false,
	 				contentType : false, 
	 				data : formData,
	 				type : 'POST',
	 				dataType : 'json',
	 					success:function(result){
	 						var data = result['fileList'];
	 						for(var info in data) {
	 							var res = data[info];
	 							var thumhtml = "<img src='/thumbnails?uuid="+ res.uuid +"&file_name="+ res.file_name +"'>";
	 							$(".uploadresult > ul").html(thumhtml);
	 						} ;
	 						
	 					}
	 			});
	 			
	 			
	 		});
		
		 function modify(obj){
			 	var modal = $(obj).parents(".modal");

			 	modal.find("#subject").removeAttr("readonly");
				modal.find("#start_date").removeAttr("readonly");
				modal.find("#end_date").removeAttr("readonly");

				document.getElementById('popuplink').readOnly = false;
				document.getElementById('xpx').readOnly =false;
				document.getElementById('ypx').readOnly =false;
				document.getElementById('content').readOnly =false;
			
				$(obj).siblings("#enroll").removeClass("d-none");
				$(obj).addClass("d-none");
				
				
			}
		 
		 function update(obj){
			 	var modal = $(obj).parents(".modal");
		
		
			 	
				var formData = new FormData();
				var id = modal.find("#id").val();
				var subject = modal.find("#subject").val();
				var start_date = modal.find("#start_date").val();
				var end_date = modal.find("#end_date").val();
				var xpx = $('#xpx').val();
				var ypx = $('#ypx').val();
				var content = $('#content').val();
				var file = $('input[name="file"]');
				var file2 = file[0].files;
				var popuplink = $('#popuplink').val();
				var gridRadios =$("input[name='gridRadios']:checked").val();
				var reg_id = $("#reg_id").val();

				for(var i=0; i<file2.length; i++) {
					formData.append("file", file2[i]);
				}
				formData.append('id', id);
				formData.append('subject', subject);
				formData.append('start_date', start_date);
				formData.append('end_date', end_date);
				formData.append('xpx', xpx);
				formData.append('ypx', ypx);
				formData.append('content', content);
				formData.append('popuplink', popuplink);
				formData.append('gridRadios', gridRadios);
				formData.append('reg_id', reg_id);
				
				for (let key of formData.keys()) {
					console.log(key, ":", formData.get(key));
				}
				
				
				$.ajax({
					type: "post",
					url: "doupdate",
					processData: false,
					contentType: false,
					enctype: "multipart/form-data",
					data: formData,
					success: function(data) {
						alert("글이 등록되었습니다.");
						location.href = "/admin/ad_manage/popup";
					}
				});
			}
		
		
		/* $('#detail').click(function(e){
			e.preventDefault();
			$('#testModal').modal("show");
		}); */
		
		
		
		function showDetail(id, obj) {
			var reg_id = $(obj).siblings("#reg_id").val();
			
			$.ajax({
				type: "get",
				url: "popupDetail/" + id,
				success: function(data) {
					var list = data.list;
					var modal = $('#testModal');
					console.log(data.list);
					console.log(list.id);
					
					var start = new Date(list.start_DATE);
					var year = start.getFullYear();
					var month = String(start.getMonth() + 1).padStart(2, '0');
					var day = String(start.getDate()).padStart(2, '0');
					var formattedDate = year + '-' + month + '-' + day;
					
					var end = new Date(list.end_DATE);
					var end_year = end.getFullYear();
					var end_month = String(end.getMonth() + 1).padStart(2, '0');
					var end_day = String(end.getDate()).padStart(2, '0');
					var end_formattedDate = end_year + '-' + end_month + '-' + end_day;
				
					modal.find("input[name=id]").val(list.id);
					modal.find("input[name='subject']").val(list.name);
					modal.find("input[name='start_date']").val(formattedDate);
					modal.find("input[name='end_date']").val(end_formattedDate);
					modal.find("input[name='xpx']").val(list.position_LEFT);
					modal.find("input[name='ypx']").val(list.position_TOP);
					modal.find("textarea[name='content']").val(list.content);
					modal.find("input[name='popuplink']").val(list.link);
					modal.find("input[name='gridRadios']").val(list.active).prop('checked' , true);
					modal.find("input[name='reg_id']").val(reg_id);
					var thumhtml = "<img src='/thumbnails?uuid="+ list.uuid +"&file_name="+ list.file_name +"'>";
						$(".uploadresult > ul").html(thumhtml);
				
					
					
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