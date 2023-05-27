package com.academy.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomAuthSuccessHandler implements AuthenticationSuccessHandler {
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		}
		
		String prevUri = (String) request.getSession().getAttribute("prevUri");
		String uri = "/user/main";
		boolean isAdmin = (boolean) request.getSession().getAttribute("admin");
		
		if(isAdmin) {
			uri = "/admin/admin";
		}
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);

		if(savedRequest != null) {
			uri = savedRequest.getRedirectUrl();
			log.info("savedRequest uri: " + uri);
		} else if(prevUri != null && !prevUri.equals("")) {
			uri = prevUri;
			log.info("prevUri uri: " + uri);
		}
		
		log.info("최종 uri: " + uri);
		
		if(prevUri != null) {
			request.getSession().removeAttribute("prevUri");
		}
		
		redirectStrategy.sendRedirect(request, response, uri);
	}

}
