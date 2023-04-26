<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-fluid pt-4 px-4">
                <div class="row g-4">
<div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">쿠폰등록</h6>
                            <form>
                                <div class="row mb-3">
                                    <label for="inputEmail3" class="col-sm-2 col-form-label">제목</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="title">
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
                                <div class="row mb-3">
                                    <label for="inputPassword3" class="col-sm-2 col-form-label">내용</label>
                                    <div class="col-sm-10">
                                    	<textarea style="width:100%"; class="form-contorl" id="content"></textarea>
                                       
                                    </div>
                                </div>
                               
                                <fieldset class="row mb-3">
                                    <legend class="col-form-label col-sm-2 pt-0">할인</legend>
                                    <div class="col-sm-10">
                                        <div class="form-check">
                                            <input class="form-check-input dis" type="radio" name="gridRadios"
                                                id="check_pay" value="option1" checked>
                                            <label class="form-check-label" for="gridRadios1">
                                               비율 할인
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input dis" type="radio" name="gridRadios"
                                                id="check_per" value="option2">
                                            <label class="form-check-label" for="gridRadios2">
                                                금액 할인
                                            </label>
                                        </div>
                                    </div>
                                </fieldset>
                                <div class="row mb-3 align-items-center">
                                    <label for="inputEmail3" class="col-sm-2 col-form-label">할인 금액 입력</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="pay">
                                    </div>
                                    <div class="col-sm-3 p-0">
                                    	<div class="d-flex align-items-center">
                                    		원
                                    	</div>
                                    	
                                    </div>
                                   
                                </div>
                                
                                 <div class="row mb-3 align-items-center">
                                    <label for="inputEmail3" class="col-sm-2 col-form-label">할인 비율</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="percent" disabled>
                                    </div>
                                   <div class="col-sm-3 p-0">
                                    	<div class="d-flex align-items-center">
                                    		%
                                    	</div>
                                    	
                                    </div>
                                   
                                </div>
                               
                                <button type="submit" class="btn btn-primary">등록하기</button>
                                <button class="btn btn-primary">취소하기</button>
                            </form>
                        </div>
                    </div>
           </div>
</div>
<script>

$(function(){
      $('#start_date').datepicker();
      $('#end_date').datepicker();
   });
   
   
   
	var dis = document.getElementsByClassName('dis');
	
	for(var i=0; i<dis.length; i++){
		dis[i].addEventListener('click', () =>{
			var check_pay = document.getElementById('check_pay');
			var check_per = document.getElementById('check_per');
			if(check_pay.checked){
				document.getElementById('pay').disabled = false;
				document.getElementById('percent').disabled = true;	
			}
			
			
			if(check_per.checked){
				document.getElementById('percent').disabled = false;
				document.getElementById('pay').disabled = true;
				
				}
			
		});
	}
	
	

	
</script>