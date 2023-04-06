<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>통계관리</title>

<!-- Form Start -->
          <div class="col-sm-12 col-xl-10 m-sm-auto" style="border:3px solid #e3e3e3">
                        <div class="rounded h-100 p-4">
                            <h6 class="mb-4">Horizontal Form</h6>
                            <form action="insert" method="get">
                                <div class="row mb-3">
                                    <label for="subject" class="col-sm-2 col-form-label">검색조건</label>
                                    <div class="col-sm-10">
                                          <select class="form-select w-50" id="floatingSelect"
                                    aria-label="Floating label select example">
                                    <option selected>검색 조건을 선택 하세요</option>
                                    <option value="1">학원 인원수</option>
                                    <option value="2">학원비</option>
                                    <option value="3">컴플레인 건수</option>
                                </select>
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

            
            <!-- Chart Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-9 col-xl-9 m-sm-auto my-sm-4">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">학원 인원수</h6>
                            <canvas id="line-chart"></canvas>
                        </div>
                    </div>
                    <div class="col-sm-9 col-xl-9 m-sm-auto">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">학원비 . 결제/미납</h6> <button onclick="Popupopen()">상세보기</button>
                            <canvas id="salse-revenue"></canvas>
                        </div>
                    </div>
                    <div class="col-sm-9 col-xl-9 m-sm-auto">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">컴플레인 건수</h6>
                            <canvas id="bar-chart"></canvas>
                        </div>
                    </div>
                    
                </div>
            </div>
            <!-- Chart End -->
            
            <script>
         // 학원 인원수
            var ctx3 = $("#line-chart").get(0).getContext("2d");
            var myChart3 = new Chart(ctx3, {
                type: "line",
                data: {
                    labels: [50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150],
                    datasets: [{
                        label: "Salse",
                        fill: false,
                        backgroundColor: "rgba(0, 156, 255, .3)",
                        data: [7, 8, 8, 9, 9, 9, 10, 11, 14, 14, 15]
                    }]
                },
                options: {
                    responsive: true
                }
            });
            
         // 학원비 결제/미납
            var ctx2 = $("#salse-revenue").get(0).getContext("2d");
            var myChart2 = new Chart(ctx2, {
                type: "line",
                data: {
                    labels: ["2016", "2017", "2018", "2019", "2020", "2021", "2022"],
                    datasets: [{
                            label: "Salse",
                            data: [15, 30, 55, 45, 70, 65, 85],
                            backgroundColor: "rgba(0, 156, 255, .5)",
                            fill: true
                        },
                        {
                            label: "Revenue",
                            data: [99, 135, 170, 130, 190, 180, 270],
                            backgroundColor: "rgba(0, 156, 255, .3)",
                            fill: true
                        }
                    ]
                    },
                options: {
                    responsive: true
                }
            });
            
            
         // 컴플레인건수
            var ctx4 = $("#bar-chart").get(0).getContext("2d");
            var myChart4 = new Chart(ctx4, {
                type: "bar",
                data: {
                    labels: ["Italy", "France", "Spain", "USA", "Argentina"],
                    datasets: [{
                        backgroundColor: [
                            "rgba(0, 156, 255, .7)",
                            "rgba(0, 156, 255, .6)",
                            "rgba(0, 156, 255, .5)",
                            "rgba(0, 156, 255, .4)",
                            "rgba(0, 156, 255, .3)"
                        ],
                        data: [55, 49, 44, 24, 15]
                    }]
                },
                options: {
                    responsive: true
                }
            });
            
            
            $(function(){
   	         $('#start_date').datepicker();
   	         $('#end_date').datepicker();
   	      })
   	      
   	      function Popupopen(){
            	 
            	 var url = "select"
            	 
            	 var name="detail_name"
           
            	 window.open(url, name,"width=1000,heightght=1000,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50");
            	 
             }
            </script>