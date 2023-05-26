package com.academy.security;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import jdk.internal.org.jline.utils.Log;

public class CustomAuthFailureHandler extends SimpleUrlAuthenticationFailureHandler {
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String message;
		
		if(exception instanceof BadCredentialsException) {
			message = "아이디 혹은 비밀번호가 틀립니다.";
		} else if(exception instanceof UsernameNotFoundException) {
			message = "아이디가 존재하지 않습니다.";
		} else if(exception instanceof InternalAuthenticationServiceException) {
			message = "시스템 오류가 발생했습니다.";
		} else if(exception instanceof AuthenticationCredentialsNotFoundException) {
			message = "인증 요청이 거부되었습니다.";
		} else {
			message = "오류가 발생했습니다.";
		}
		
		message = URLEncoder.encode(message, "utf-8");
		
		HttpSession session = request.getSession();
		boolean isAdmin = (boolean) session.getAttribute("admin");
		
		System.out.println("isAdmin" + isAdmin);

		if(isAdmin) {
			setDefaultFailureUrl("/admin/login?error=true&message=" + message);
		} else {
			setDefaultFailureUrl("/user/login?error=true&message=" + message);
		}
		
		super.onAuthenticationFailure(request, response, exception);
	}
}
