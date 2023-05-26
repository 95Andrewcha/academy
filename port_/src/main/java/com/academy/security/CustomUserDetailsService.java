package com.academy.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.academy.service.LoginService;
import com.academy.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	LoginService loginService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO vo = loginService.login(username);
		
		log.info("userDetailsService 접근");
		log.info("username: " + username);
		log.info(vo);
		
		if(vo == null) {
			log.info("UsernameNotFoundException 발생!");
			throw new UsernameNotFoundException("존재하지 않는 계정입니다.");
		}
		
		return vo;
	}

}
