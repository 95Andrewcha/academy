<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-xxl">
    <div class="container">
   		<div class="section-header text-center mx-auto mb-5">
            <h1 class="display-5 mb-3">LOGIN</h1>
        </div>
        <div class="row g-5 justify-content-center">
            <div class="col-lg-12">
                <form role="form" action="/login" method="post">
                    <div class="row g-3 flex-column align-items-center">
                         <div class="col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="username" name="username" placeholder="아이디">
                                <label for="email">아이디</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-floating">
                                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
                                <label for="password">비밀번호</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <button class="btn btn-primary py-3 px-5 w-100" type="submit">로그인</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>