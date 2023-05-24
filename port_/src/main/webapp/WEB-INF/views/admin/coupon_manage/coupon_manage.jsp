<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    
<!-- Form Start -->
          <div class="col-sm-12 col-xl-10 m-sm-auto" style="border:3px solid #e3e3e3">
                        <div class="rounded h-100 p-4">
                            <h6 class="mb-4">Horizontal Form</h6>
                            <form action="search" id="searchid" method="post">
                                <div class="row mb-3">
                                    <label for="title" class="col-sm-2 col-form-label">제목</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="title" name="name">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="active" class="col-sm-2 col-form-label">활성화여부</label>
                                    <div class="col-sm-10">
                                        <input type="radio" name="active" value="0" autocomplete="off" checked>활성화
                                        <input type="radio" name="active" value="1" autocomplete="off">비활성화
                                    </div>
                                </div>
                               
                                <div class="row mb-3">
                                    <label for="date" class="col-sm-2 col-form-label">기간</label>
                                    <div class="col-sm-10 ">
                                        <input type="text" class="w-25 form-control datepicker d-inline-block" id="start_date" placeholder="시작일" name="start_date">
                                        ~
                                        <input type="text" class="w-25 form-control datepicker d-inline-block" id="end_date" placeholder="종료일" name="end_date">
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
                        <h6 class="mb-0">쿠폰관리</h6>
                       
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            
                            <tbody>
                            <tr class="text-dark">
                                    <th scope="col">번호</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">기간</th>
                                    <th scope="col">활성여부</th>
                                    <th scope="col">등록날짜</th>
                                    <th scope="col"></th>
                                </tr>
                                <c:forEach items="${couponList}" var="Clist">
                                <tr>
                                	
                                    <td><c:out value="${Clist.id }"/></td>
                                    <td><c:out value="${Clist.name }"/></td>
                                    <td><fmt:formatDate value="${Clist.start_date}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${Clist.end_date }" pattern="yyyy-MM-dd"/> </td>
                                    <td><c:out value="${Clist.active }"/></td>
                                    <td><fmt:formatDate value="${Clist.reg_date}" pattern="yyyy-MM-dd"/></td> 
                                    <td><button class="btn btn-primary" onclick="Popupopenupdate()">수정하기</button></td>    
                                </tr>
                                </c:forEach>
                                
                               
                                
                               
                            </tbody>
                        </table>
                       
                    </div>
                    
                     <div class="my-2 text-end">
                    	<button class="btn btn-primary" onclick="Popupopen()">등록하기</button>
                    	<!-- <button class="btn btn-primary" >삭제</button> --><!-- 실수로 잘못 클릭해서 삭제하지말라고 버튼삭제 -->
                    </div>
                </div>
            </div>
            <!-- Select table End -->
            
             <div class="col-sm-12 col-xl-12">
                        <div class="bg-light rounded h-100 p-4">
                            <div class="btn-toolbar justify-content-center" role="toolbar">
                                <div class="btn-group me-2" role="group" aria-label="First group">
                                   
	                                    <ul class="pagination ">
						            		<c:if test="${pageMaker.prev}">
						            			<li class="paginate_button previous btn btn-primary me-1">
						            				<a href="${pageMaker.startPage-1}" style="color:white;">Previous</a>
						            			</li>
						            		</c:if>
						            		<c:forEach var ="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						            			<li class="paginate_button btn btn-primary me-1"><a href="${num}" style="color:white;">${num}</a></li>
						            		</c:forEach>
						            		<c:if test="${pageMaker.next}">
						            			<li class="paginate_button next btn btn-primary">
						            				<a href="${pageMaker.endPage + 1}" style="color:white;" >Next</a>
						            			</li>
						            		</c:if>
						            	</ul>
                                </div>
                            </div>
                        </div>
                    </div>
            <div class="pull-right">
            	
            </div>
            
            <form id="actionForm" action="coupon_manage" method="get">
            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
            	<input type="hidden" name="amount" value="${pageMaker.cri.amount }"/>
            </form>
            <!-- end page -->
            
<script>

$(function(){
      $('#start_date').datepicker();
      $('#end_date').datepicker();
   });
   
$(document).ready(function(){
	
	var actionForm= $("#actionForm");
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	
	
	$("#searchid").submit(function(event) {
        event.preventDefault(); // 기본 폼 제출 동작 막기

        var name = $("#title").val();
        var start_date =$("#start_date").val();
        var end_date =$("#end_date").val();
        //var active =$('input[name=active]').val();
        var active =1;
        
        var data = {
        	    name: name,
        	    start_date: start_date,
        	    end_date: end_date,
        	    active: active
        	};

        $.ajax({
            type: "POST",
            url: "search",
            data: data,
            success: function(response) {
            	//var result2 = JSON.parse(response);
                // 검색 결과 처리
                //displaySearchResults(response);
                
                //console.log(result2);
                
                /* for(var i in result2.result) {
                	console.log("결과 : " + result2.result[i]);
                } */
                var table = $("table > tbody > tr");
                console.log(table);
                var td = "";
                td += "<td>테스트</td>";
                table.html("");
                table.html(td);
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.log(error);
            }
        });
    });
	
	
	
	
});
   
   
function Popupopen(){
	 
	 var url = "coupon_enrollpop";
	 var name="coupon_enrollpop";
	 var status ="width=1000, height=600,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50";
	 window.open(url, name, status);
	 
};


    

</script>