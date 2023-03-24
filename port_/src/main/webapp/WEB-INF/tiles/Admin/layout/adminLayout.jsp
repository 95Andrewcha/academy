<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminLayout</title>

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${contextPath}/resources/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${contextPath}/resources/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${contextPath}/resources/admin/css/style.css" rel="stylesheet">
    
</head>
<body>

	<div id="AdminSideBar">
		<tiles:insertAttribute name="AdminSideBar"/>
	</div>
	<div class="content">
	<header id="Adminheader">
		<tiles:insertAttribute name="Adminheader"/>
	</header>
	 
	<div id="Adminbody">
		<tiles:insertAttribute name="Adminbody"/>
	</div>
 	</div> 
	<footer id="Adminfooter">
		<tiles:insertAttribute name="Adminfooter"/>
	</footer>
	
	
	
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