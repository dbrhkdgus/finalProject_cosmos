package com.kh.security.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kh.security.model.dao.SecurityDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SecurityService implements UserDetailsService{

	@Autowired
	private SecurityDao securityDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.debug("username = {}",username); // id
		
		UserDetails member = securityDao.loadUserByUsername(username);
		log.debug("member = {}", member);
		/**
		 * 조회된 회원이 없다면 예외를 던져서 security에 알림.
		 */
		if(member == null)
			throw new UsernameNotFoundException(username);
		
		return member;
	}
	
}
