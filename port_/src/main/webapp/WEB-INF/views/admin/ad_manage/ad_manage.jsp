<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Form Start -->
          <div class="col-sm-12 col-xl-10 m-sm-auto" style="border:3px solid #e3e3e3">
                        <div class="rounded h-100 p-4">
                            <h6 class="mb-4">검색</h6>
                            <form action="select" method="get">
                               
                               
                                <div class="row mb-3">
                                    <label for="date" class="col-sm-2 col-form-label">기간</label>
                                    <div class="col-sm-10 ">
                                        <input type="text" class="w-25 form-control datepicker d-inline-block" id="date" placeholder="date" name="date">
                                        
                                    </div>

                                   
                                </div>
                                
                                <button type="submit" class="btn btn-primary">Sign in</button>
                                <button type="reset" class="btn btn-primary">reset</button>
                            </form>
                        </div>
                    </div>
            <!-- Form End -->
            
            <!-- ***** Most Popular Start ***** -->
				<div class="most-popular">
					<div class="row">
						<div class="col-lg-12">
							<div class="heading-section">
								<h4>
									광고
								</h4>
							</div>
							<div class="row">
								<div class="col-lg-4 col-sm-6">
									<div class="item">
										<img
											src="${contextPath }/resources/common/assets/images/popular-01.jpg"
											alt="">
										<h4>
											학원명<br>
											<span>금액</span>
											
										</h4>
									</div>
								</div>
								<div class="col-lg-4 col-sm-6">
									<div class="item">
										<img
											src="${contextPath }/resources/common/assets/images/popular-02.jpg"
											alt="">
										<h4>
											학원명<br>
											<span>금액</span>
											
										</h4>
									</div>
								</div>
								<div class="col-lg-4 col-sm-6">
									<div class="item">
										<img
											src="${contextPath }/resources/common/assets/images/popular-03.jpg"
											alt="">
										<h4>
											학원명<br>
											<span>금액</span>
											
										</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ***** Most Popular End ***** -->
				
				
            
            <!-- select table Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">광고관리</h6>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-middle table-bordered table-hover mb-0">
                           <!--  <colgroup><col width="2%"></colgroup>
                            <colgroup><col width="10%"></colgroup>
                            <colgroup><col width="10%"></colgroup>
                            <colgroup><col width="10%"></colgroup>
                            <colgroup><col width="10%"></colgroup>
                            <colgroup><col width="10%"></colgroup>
                            <colgroup><col width="10%"></colgroup> -->
                            <tbody>
                            <tr class="text-dark">
                                    <th scope="col"><input class="form-check-input" id="chkboxAll" type="checkbox" name="chkboxAll" onclick=checkAll();></th>
                                    <th scope="col">학원명</th>
                                    <th scope="col">대표자</th>
                                    <th scope="col">날짜</th>
                                    <th scope="col">전화번호</th>
                                    <th scope="col">승인여부</th>
                                    <th scope="col">링크</th>
                                    
                                   
                                </tr>
                                
                                <tr>
                                    <td><input class="form-check-input" type="checkbox" name="chkbox"></td>
                                    <td>블루아카데미</td>
                                    <td>블루사장</td>
                                    <td>2023-04-07</td>
                                    <td>063-422-2321</td>
                                    <td>승인</td>
                                    <td><a href="#" class="btn btn-sm btn-primary px-2">바로가기</a></td>
                                    <td>
                                    	<button class="btn btn-sm btn-primary px-2">승인</button>
                                    	<button class="btn btn-sm btn-primary px-2" onclick="postpone()">보류</button>
                                    	<button class="btn btn-sm btn-primary px-2" onclick="reject()">거절</button>
                                   </td>
                                  
                                </tr>
                               
                               
                                
                               
                            </tbody>
                        </table>
                       
                    </div>
                    
                     
                </div>
            </div>
            <!-- Select table End -->
            
            <script>
            
            $(function(){
   	         $('#date').datepicker();
   	         
   	      })
   	      
   	      
            function postpone(){
            	var name = "postpone";
            	var url = 'reasonpopup?name=' + name;
            	
            	
            	
            	var status ="width=500, height=400,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50"
            	
            	window.open(url, name, status);
            }
            </script>