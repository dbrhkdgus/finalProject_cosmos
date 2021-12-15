package com.kh.cosmos.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@Aspect
public class RuntimeCheckAspect {
	
	@Pointcut("execution(* com.kh.spring.memo.controller.MemoController.insertMemo(..))")
	public void pointcut() {}
	
	/* @Around("pointcut()") */
	@Around("execution(* com.kh.spring.memo.controller.MemoController.insertMemo(..))")
	public Object runtimeCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		Object obj = joinPoint.proceed();
		
		stopWatch.stop();
		
		log.debug("소요시간 : {}ms", stopWatch.getTotalTimeMillis());
		return obj;
	}
}
