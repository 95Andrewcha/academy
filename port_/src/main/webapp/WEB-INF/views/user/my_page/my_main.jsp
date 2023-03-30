<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Page Header Start -->
<div class="container-fluid page-header">
    <div class="container">
        <h1 class="display-3 mb-3">마이페이지</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item"><a class="text-body" href="#">홈</a></li>
                <li class="breadcrumb-item text-dark active" aria-current="page">마이페이지</li>
            </ol>
        </nav>
    </div>
</div>
<!-- Page Header End -->

<!-- Contact Start -->
<div class="container-xxl py-6">
    <div class="container">
        <div class="row g-5 justify-content-center">
            <div class="col-lg-3 col-md-12">
                <div class="bg-primary text-white d-flex flex-column h-100 p-5">
                	<div class="row">
                		<div class="col-12">나의 정보</div>
                	</div>
                	<div class="row">
                		<div class="col-12">내가 쓴 글</div>
                	</div>
                	<div class="row">
                		<div class="col-12">자녀 성적관리</div>
                	</div>
                	<div class="row">
                		<div class="col-12">자녀 출결관리</div>
                	</div>
                </div>
            </div>
            <div class="col-lg-9 col-md-12 wow fadeInUp" data-wow-delay="0.5s">
                <p class="mb-4">The contact form is currently inactive. Get a functional and working contact form with Ajax & PHP in a few minutes. Just copy and paste the files, add a little code and you're done. <a href="https://htmlcodex.com/contact-form">Download Now</a>.</p>
                <form>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="name" placeholder="Your Name">
                                <label for="name">Your Name</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="email" class="form-control" id="email" placeholder="Your Email">
                                <label for="email">Your Email</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="subject" placeholder="Subject">
                                <label for="subject">Subject</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="Leave a message here" id="message" style="height: 200px"></textarea>
                                <label for="message">Message</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <button class="btn btn-primary rounded-pill py-3 px-5" type="submit">Send Message</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Contact End -->
 