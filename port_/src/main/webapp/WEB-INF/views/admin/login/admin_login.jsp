<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html/loose.dtd">
<html>
<head>
   <style>
   .content{width:100%; margin:0; padding:0;}
   </style>
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

	
	<h2><c:out value="${error}"/></h2>
	<h2><c:out value="${logout}"/></h2>
        <!-- Sign In Start -->
       
       <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="index.html" class="">
                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>ACADEMY</h3>
                            </a>
                            
                        </div>
                         <form method="post" action="/admin/loginProc">
                        <div class="form-floating mb-3">
                            <input type="id" class="form-control" id="floatingInput" placeholder="id" name="username">
                            <label for="floatingInput">ID</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
                            <label for="floatingPassword">Password</label>
                        </div>
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">자동 로그인</label>
                            </div>
                            
                        </div>
                        <button type="submit" class="btn btn-primary py-3 w-100 mb-4">login</button>
                        <c:if test="${isError }">
							<div class="pt-2" style="color: var(--bs-danger);">${message }</div>
							<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
						</c:if>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"/>
       </form>
                    </div>
                </div>
            </div>
        </div> 
      
       <div>
      
       
       
       
        
       	
       
        <!-- Sign In End -->
    </div>


    
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/resources/admin/lib/chart/chart.min.js"></script>
    <script src="${contextPath}/resources/admin/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/resources/admin/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/resources/admin/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${contextPath}/resources/admin/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${contextPath}/resources/admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${contextPath}/resources/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/admin/js/main.js"></script>
</body>
</html>