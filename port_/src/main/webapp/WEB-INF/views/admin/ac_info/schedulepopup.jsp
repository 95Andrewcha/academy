<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-sm-12 col-xl-6">
			<div class="bg-light rounded h-100 p-4">
				<h6 class="mb-4">일정등록</h6>
				<form id="enroll">
					<div class="row mb-3">
						<label for="inputEmail3" class="col-sm-2 col-form-label">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="title" id="title">
						</div>
					</div>
					<div class="row mb-3">
						<label for="date" class="col-sm-2 col-form-label">기간</label>
						<div class="col-sm-10 ">
							<input type="text"
								class="w-25 form-control datepicker d-inline-block"
								id="start_date" placeholder="start_date" name="start_date">
							~ <input type="text"
								class="w-25 form-control datepicker d-inline-block"
								id="end_date" placeholder="end_date" name="end_date">
						</div>


					</div>
					<div class="row mb-3">
						<label for="inputPassword3" class="col-sm-2 col-form-label">내용</label>
						<div class="col-sm-10">
							<textarea style="width: 100%" ; class="form-contorl" id="content" name="content"></textarea>

						</div>
					</div>

					
					<button type="submit" class="btn btn-primary" onclick="insert()">등록하기</button>
					<button class="btn btn-primary">취소하기</button>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
$(function(){
    $('#start_date').datepicker({dateFormat:'y-mm-dd'});
    $('#end_date').datepicker({dateFormat:'y-mm-dd'});
    /*기본값으로 당일~당일 */
    $('#start_date').datepicker('setDate', 'today');
    $('#end_date').datepicker('setDate', 'today');
    $.fn.serializeObject = function(){
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
        	var name = $.trim(this.name),
        		value = $.trim(this.value);
            if (o[name]) {
                if (!o[name].push) {
                    o[name] = [o[name]];
                }
                o[name].push(value || '');
            } else {
                o[name] = value || '';
            }
        });
        return o;
    };
    
    
 });
function insert(){
	var scheduleData = JSON.stringify($('form#enroll').serializeObject());
	$.ajax({
		data:scheduleData,
		url : "scheduleadd",
		type : "post",
		dataType : "json",
		contentType: "application/json; charset=UTF-8",
		success : function(data){
			opener.parent.location.reload();
			window.close();
		},
		error : function(xhr, ajaxSettings, thrownError) 
		   {
		       alert("등록하는데 오류가 발생하였습니다.");
		   }
	});
};


	
 
 

</script>
</html>