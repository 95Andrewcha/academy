<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <!-- Chart Start -->
           <div class="container-fluid pt-4 px-4">
                <div class="row g-4 justify-content-center">
                    <div class="col-sm-10 col-xl-10 ">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">최근 4개월 학원인원 현황</h6>
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
        <c:forEach var="item" items="${man}">
        var man = {
			JA: ${item.JA},
			FE: ${item.FE},
			MARCH: ${item.MARCH},
			A: ${item.A},
			MA: ${item.MA},
			JUNE: ${item.JUNE},
			JULY: ${item.JULY},
			AGUST: ${item.AGUST},
			SEP: ${item.SEP},
			OCT: ${item.OCT},
			NOM: ${item.NOM},
			DE: ${item.DE}
        }
        </c:forEach>
        
       <c:forEach var="item" items="${woman}">
        var woman = {
       		JA: ${item.JA},
       		FE: ${item.FE},
       		MARCH: ${item.MARCH},
            A: ${item.A},
            MA: ${item.MA},
            JUNE: ${item.JUNE},
            JULY: ${item.JULY},
            AGUST: ${item.AGUST},
            SEP: ${item.SEP},
            OCT: ${item.OCT},
            NOM: ${item.NOM},
            DE: ${item.DE}
        };
        
        </c:forEach>
      
        <c:forEach var="item" items="${sum}">
        var sum={
        		JA: ${item.JA},
    			FE: ${item.FE},
    			MARCH: ${item.MARCH},
    			A: ${item.A},
    			MA: ${item.MA},
    			JUNE: ${item.JUNE},
    			JULY: ${item.JULY},
    			AGUST: ${item.AGUST},
    			SEP: ${item.SEP},
    			OCT: ${item.OCT},
    			NOM: ${item.NOM},
    			DE: ${item.DE}
        }
        </c:forEach>
        manArray=[];
        womanArray=[];
        sumArray=[]

        for(var m in man) {
        	manArray.push(man[m]);
        	console.log("남자: " + manArray);
        }
        
        for(var w in woman) {
        	womanArray.push(woman[w]);
        	console.log("여자: " + womanArray);
        }
        
        for(var s in sum){
        	sumArray.push(sum[s]);
        	console.log("sum:::" + sum);
        }

        
        let date = new Date();
        const month = date.getMonth()+1;
        date.setMonth(date.getMonth() - 1);
        const month_1 = date.getMonth() +1 ;
        date.setMonth(date.getMonth() - 1);
        const month_2 = date.getMonth() +1;
        date.setMonth(date.getMonth() - 1);
        const month_3 = date.getMonth() +1;
        
 
        
/*     	var AA = manArray[month - 1];
		var BB = manArray[month_1 - 1];
		var CC = manArray[month_2 - 1];
		var DD = manArray[month_3 - 1];   */
     for(var i=0; i<12; i++){
        	
        	if(month==i) {
        		var manMonth = [];
        		manMonth.push((i - 3 > 0)? manArray[i-4] : manArray[i+8]);
        		manMonth.push((i - 2 > 0)? manArray[i-3] : manArray[i+9]);
        		manMonth.push((i - 1 > 0)? manArray[i-2] : manArray[i+10]);
        		manMonth.push(manArray[i-1]);
        		
        		var womanMonth = [];
        		womanMonth.push((i - 3 > 0)? womanArray[i-4] : womanArray[i+8]);
        		womanMonth.push((i - 2 > 0)? womanArray[i-3] : womanArray[i+9]);
        		womanMonth.push((i - 1 > 0)? womanArray[i-2] : womanArray[i+10]);
        		womanMonth.push(womanArray[i-1]);
        		
        		var sumMonth =[];
        		sumMonth.push((i - 3 > 0)? sumArray[i-4] : sumArray[i+8]);
        		sumMonth.push((i - 2 > 0)? sumArray[i-3] : sumArray[i+9]);
        		sumMonth.push((i - 1 > 0)? sumArray[i-2] : sumArray[i+10]);
        		sumMonth.push(sumArray[i-1]);

        		
        		/* var AA = manArray[i-1];
        		var BB = (i - 1 > 0)? manArray[i-2] : manArray[i+10];
        		var CC = (i - 2 > 0)? manArray[i-3] : manArray[i+9];
        		var DD = (i - 3 > 0)? manArray[i-4] : manArray[i+8]; */	
        	}
        	
        };  
		
       
        
        const data = {
        		labels: [month_3 +"월", month_2 +"월", month_1 +"월" , month +"월"],
        		  datasets: [
        		    {
        		      label: 'Man',
        		      data: manMonth,
        		      backgroundColor: 'rgba(75, 192, 192, 0.2)',
        		      borderColor: 'rgba(75, 192, 192, 1)',
        		      borderWidth: 1
        		    },
        		    {
        		      label: 'woman',
        		      data: womanMonth,
        		      backgroundColor: 'rgba(75, 192, 192, 0.9)',
        		      borderColor: 'rgba(75, 192, 192, 1)',
        		      borderWidth: 1
        		    },
        		    {
        		      label: 'Sum',
        		      data: sumMonth,
        		      backgroundColor: 'rgba(255, 99, 132, 0.2)',
        		      borderColor: 'rgba(255, 99, 132, 1)',
        		      borderWidth: 1
        		    }
        		  ]
        		};
        
        
    
  

		        
        
     // Worldwide Sales Chart
	    var ctx1 = $("#worldwide-sales").get(0).getContext("2d");
	    var myChart1 = new Chart(ctx1, {
	        type: "bar",
	        data: data,
	        options: {
	            responsive: true
	        }
	    });

        
        </script>

	
