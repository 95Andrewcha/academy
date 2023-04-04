package com.academy.security;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.academy.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO vo = new UserVO();
		vo.setId(username);
		vo.setPassword("admin");
		
		log.info("userDetailsService 접근");
		log.info("username: " + username);
		log.info(vo);
		return vo;
	}

}
