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
                                <tr>
                                    <td>{번호}</td>
                                    <td>{제목]</td>
                                    <td>{기간}</td>
                                    <td>{활성여부}</td>
                                    <td>{등록날짜}</td> 
                                    <td>{등록날짜}</td>    
                                </tr>
                                 <tr>
                                    <td>{번호}</td>
                                    <td>{제목]</td>
                                    <td>{기간}</td>
                                    <td>{활성여부}</td>
                                    <td>{등록날짜}</td>   
                                    <td>{등록날짜}</td>  
                                </tr>
                               
                                
                               
                            </tbody>
                        </table>
                       
                    </div>
                    
                     <div class="my-2 text-end">
                    	<button class="btn btn-primary" onclick="enroll()">등록하기</button>
                    	<!-- <button class="btn btn-primary" >삭제</button> --><!-- 실수로 잘못 클릭해서 삭제하지말라고 버튼삭제 -->
                    </div>
                </div>
            </div>
            <!-- Select table End -->