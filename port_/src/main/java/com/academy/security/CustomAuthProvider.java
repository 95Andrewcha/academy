package com.academy.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.academy.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomAuthProvider implements AuthenticationProvider {

	@Autowired
	private UserDetailsService userDetailService;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		log.info("AuthenticationProvider > authenticate 접근");
		
		String id = (String) authentication.getPrincipal();
		String pw = (String) authentication.getCredentials();
		
		UserVO user = (UserVO) userDetailService.loadUserByUsername(id);
		
		log.info(id);
		log.info(pw);
		
		if(id.equals("f")) {
			throw new BadCredentialsException("zzzzz");
		}
		
		List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
		
		list.add(new SimpleGrantedAuthority("ROLE_AD"));
		
		user.setAuth(list);
		log.info(user.getAuthorities());
		
		return new UsernamePasswordAuthenticationToken(user, pw, user.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		log.info("AuthenticationProvider > supports 접근");
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
