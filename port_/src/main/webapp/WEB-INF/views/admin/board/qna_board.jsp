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
                        <h6 class="mb-0">답변</h6>
                       
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            
                            <tbody>
                            <tr class="text-dark">
                                    
                                    <th scope="col">번호</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">질문날짜</th>
                                    <th scope="col">답변날짜</th>
                                    <th scope="col">답변여부</th>
                                    <th scope="col">질문횟수</th>
                                </tr>
                                <tr>
                                    
                                    <td>{번호}</td>
                                    <td><a href="javascript:showPopUp()">{제목]</a></td>
                                    <td>{작성자}</td>
                                    <td>{질문날짜}</td>
                                    <td>{답변날짜}</td>
                                    <td>{답변여부}</td>
                                    <td>{질문횟수}</td>
                                    
                                </tr>
                                <tr>
                                    
                                    <td>{번호}</td>
                                    <td>{제목]</td>
                                    <td>{작성자}</td>
                                    <td>{질문날짜}</td>
                                    <td>{답변날짜}</td>
                                    <td>{답변여부}</td>
                                    <td>{질문횟수}</td>
                                    
                                </tr>
                               
                                
                               
                            </tbody>
                        </table>
                       
                    </div>
                    
                     
                </div>
            </div>
            <!-- Select table End -->
            
            
<script>
function showPopUp(){
	
	var url ="showPopUp";
	
	var name="show_board";
	
	window.open(url, name, "width=1000,heightght=1000,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50");
	}



   
</script>