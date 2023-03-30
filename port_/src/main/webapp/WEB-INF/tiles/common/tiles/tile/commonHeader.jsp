<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container-fluid fixed-top px-0 wow fadeIn" data-wow-delay="0.1s">
    <nav class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
        <a href="index.html" class="navbar-brand ms-4 ms-lg-0">
            <h1 class="fw-bold text-primary m-0">학원<span class="text-secondary">플러스</span></h1>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav p-4 p-lg-0 m-auto">
                <a href="index.html" class="nav-item nav-link active">정보</a>
                <a href="about.html" class="nav-item nav-link">학원</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">커뮤니티</a>
                    <div class="dropdown-menu m-0">
                        <a href="blog.html" class="dropdown-item">수다게시판</a>
                        <a href="feature.html" class="dropdown-item">자료게시판</a>
                        <a href="testimonial.html" class="dropdown-item">문의게시판</a>
                        <a href="testimonial.html" class="dropdown-item">리뷰</a>
                        <a href="404.html" class="dropdown-item">404 Page</a>
                    </div>
                </div>
            </div>
            <div class="d-none d-lg-flex ms-2">
                <a class="ms-3 text-body" href="${contextPath }/login/login">로그인</a>
                <a class="ms-3 text-body" href="#">회원가입</a>
            </div>
        </div>
    </nav>
</div>