<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- Chart Start -->
           <div class="container-fluid pt-4 px-4">
                <div class="row g-4 justify-content-center">
                    <div class="col-sm-10 col-xl-10 ">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">Multiple Bar Chart</h6>
                            <canvas id="worldwide-sales"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Chart End -->
			  <!-- Table Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                   
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">문의 게시판</h6>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">First Name</th>
                                        <th scope="col">Last Name</th>
                                        <th scope="col">Email</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>John</td>
                                        <td>Doe</td>
                                        <td>jhon@email.com</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>mark@email.com</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>jacob@email.com</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">컴플레인 문의게시판</h6>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">번호</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">내용</th>
                                        <th scope="col">아이디</th>
                                        <th scope="col">답변유무</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>John</td>
                                        <td>Doe</td>
                                        <td>jhon@email.com</td>
                                        <td>완료</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>mark@email.com</td>
                                         <td>완료</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>jacob@email.com</td>
                                         <td>완료</td>
                                    </tr>
                                     <tr>
                                        <th scope="row">4</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>jacob@email.com</td>
                                         <td>완료</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    
                    
                    
                    
                </div>
            </div>

            


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        
        <script>
     // Worldwide Sales Chart
	    var ctx1 = $("#worldwide-sales").get(0).getContext("2d");
	    var myChart1 = new Chart(ctx1, {
	        type: "bar",
	        data: {
	            labels: ["10월", "11월", "12월", "13월 ", "14월", "15월 ", "16월"],
	            datasets: [{
	                    label: "남자",
	                    data: [15, 30, 55, 65, 60, 80, 95],
	                    backgroundColor: "rgba(0, 156, 255, .7)"
	                },
	                {
	                    label: "여자",
	                    data: [8, 35, 40, 60, 70, 55, 75],
	                    backgroundColor: "rgba(0, 156, 255, .5)"
	                },
	                {
	                    label: "총합",
	                    data: [23, 65, 95, 105, 130, 140, 150],
	                    backgroundColor: "rgba(0, 156, 255, .3)"
	                }
	            ]
	            },
	        options: {
	            responsive: true
	        }
	    });

        
        </script>

	
