<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출결 관리 (attendence)</title>

</head>
<body>
 <!-- Form Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    
                    <div class="col-sm-12 col-xl-12">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">검색</h6>
                             <div class="form-floating mb-3">
                                <select class="form-select w-50" id="floatingSelect"
                                    aria-label="Floating label select example">
                                    <option selected>반을 선택하세요</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                </select>
                                <label for="floatingSelect">반</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control w-50" id="floatingInput"
                                    placeholder="이름">
                                <label for="floatingInput">이름</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingPassword"
                                    placeholder="text">
                                <label for="floatingPassword">datepicker</label>
                            </div>
                            <input type="button" value="검색">  
                        </div>
                    </div>
                </div>
            </div>
            <!-- Form End -->
            
            
             <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                   
                    <div class="col-sm-12 col-xl-12">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">학생 정보 조회</h6>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">번호</th>
                                        <th scope="col">이름</th>
                                        <th scope="col">주소</th>
                                        <th scope="col">성별</th>
                                        <th scope="col">생년월일</th>
                                        <th scope="col">출결여부</th>
                                        <th scope="col">사유</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">row.num</th>
                                        <td>user.name</td>
                                        <td>user.add</td>
                                        <td>user.sex</td>
                                        <td>user.birth</td>
                                        <td>att.출결여부</td>
                                        <td>att.이유</td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                            <button 
 type="button" id="mdshow"
 class="btn btn-primary" 
 data-toggle="modal" 
 data-target="#exampleModal" 
 data-what="hello">버튼</button>
                            
                        </div>
                    </div>
                </div>
            </div>
            <!-- board end -->
            
            
            <!-- Chart Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4 justify-content-center">
                      <div class="col-sm-6 col-xl-6">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">출석률 </h6>
                            <canvas id="myChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Chart End -->
            
            
            
            
            
            <!-- Modal -->
<div class="modal fade" id="att_update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="myModalLabel">출결 여부 수정 선택 해주세요. </h5>
      </div>
      <div class="modal-body">
        <select name="select">
		  <option value="value1">Value 1</option> 
		  <option value="value2" selected>Value 2</option>
		  <option value="value3">Value 3</option>
		</select>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="att_update();">확인</button>
      </div>
    </div>
  </div></div>
            
             <script>
            
             
             // 차트를 그럴 영역을 dom요소로 가져온다.
             var chartArea = document.getElementById('myChart').getContext('2d');
             // 차트를 생성한다. 
             var myChart = new Chart(chartArea, {
                 // ①차트의 종류(String)
                 type: 'doughnut',
                 // ②차트의 데이터(Object)
                 data: {
                     // ③x축에 들어갈 이름들(Array)
                     labels: ['출석', '결석', '병가', '휴무'],
                     // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                     datasets: [{
                         // ⑤dataset의 이름(String)
                         label: '# of Votes',
                         // ⑥dataset값(Array)
                         data: [12, 19, 3, 5],
                         // ⑦dataset의 배경색(rgba값을 String으로 표현)
                         backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(255, 99, 132, 0.4)', 'rgba(255, 99, 132, 0.6)', 'rgba(255, 99, 132, 0.8)' ],
                         // ⑧dataset의 선 색(rgba값을 String으로 표현)
                         borderColor: 'rgba(255, 99, 132, 1)',
                         // ⑨dataset의 선 두께(Number)
                         borderWidth: 1
                     }]
                 },
                 // ⑩차트의 설정(Object)
                 options: {
                     // ⑪축에 관한 설정(Object)
                     scales: {
                         // ⑫y축에 대한 설정(Object)
                         y: {
                             // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
                             beginAtZero: true
                         }
                     }
                 }
             });
        </script>
          
</body>
</html>