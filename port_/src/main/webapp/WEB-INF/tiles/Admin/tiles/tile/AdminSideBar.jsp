<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light justify-content-center">
             <a href="/admin/admin" class="navbar-brand ms-4 ms-lg-0">
            <h3 class="fw-bold text-primary m-0">학원<span class="text-secondary">플러스</span></h1>
        </a>
              
                <div class="d-flex align-items-center ms-4 mb-4">
                    
                    <div class="ms-3">
                        <h6 class="mb-0">{user.name}</h6>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="index.html" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>학원정보</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>학원정보</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="/admin/ac_info/ac_info" class="dropdown-item">학원정보</a>
                            <a href="/admin/ac_info/subject_info" class="dropdown-item">수강과목</a>
                            <a href="/admin/ac_info/ac_schedule" class="dropdown-item">시간표</a>
                             <a href="/admin/ac_info/ac_test_manage" class="dropdown-item">시험관리</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>학생관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="/admin/stu_manage/stu_info" class="dropdown-item">학생정보 ${pageContext.request.contextPath}</a>
                            <a href="/admin/stu_manage/grade_manage" class="dropdown-item">성적관리</a>
                            <a href="/admin/stu_manage/att_manage" class="dropdown-item">출결관리</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>게시판</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="/admin/board/data_board" class="dropdown-item">자료게시판</a>
                            <a href="/admin/board/qna_board" class="dropdown-item">문의/답변게시판</a>
                            <a href="/admin/board/review" class="dropdown-item">리뷰/답글게시판</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>문자관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="/admin/text_manage/text_manage" class="dropdown-item">문자관리</a>
                        </div>
                    </div>
                    
                   <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>광고관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="/admin/ad_manage/ad_manage" class="dropdown-item">광고관리</a>
                            <a href="/admin/ad_manage/popup" class="dropdown-item">팝업관리</a>
                            <a href="/admin/ad_manage/ac_accept" class="dropdown-item">입점허가관리</a>
                        </div>
                    </div>
                    
                      <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>쿠폰관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="/admin/coupon_manage/coupon_manage" class="dropdown-item">쿠폰관리</a>
                        </div>
                    </div>
                    
                      <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>통계관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="/admin/stats_manage/stats_manage" class="dropdown-item">통계관리</a>
                        </div>
                    </div>
                    
                  
                    
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->
