package com.kh.spring.common.aop;

import java.security.InvalidParameterException;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class MemoAspect {
	
	
	@Pointcut("execution(* com.kh.spring.memo.model.service..deleteMemo(..))")
	public void deletePointcut() {}
	
	@Before("deletePointcut()")
	public void beforeAdvice(JoinPoint joinPoint) {
		//타겟메소드 실행전 코드
		
		// 매개인자(arguments)가져오기
		Object[] args = joinPoint.getArgs();
		int no = (int) args[0];
		String password = (String)args[1];
		
		log.debug("no = {}, password = {}",no,password);
		
		// no 레코드 가져오기
		/*
		 * Memo memo = memoService.selectOneMemo(no); log.debug("memo = {}",memo);
		 * if(memo != null && !password.equals(memo.getPassword())) { throw new
		 * InvalidParameterException("비밀번호가 일치하지 않습니다."); }
		 */
	}
}
