package com.kh.spring.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect
@Component
public class LoginAspect {
	@Pointcut("execution(* com.kh.spring.memo..*(..))")
	public void pointcut() {}
	
	/**
	 * advice 수행할 부가로직을 가지고 있는 메소드
	 * - Around advice : joinPoint 실행 전/후에 수행되는 advice
	 * 
	 * @param joinPoint
	 * @return
	 * @throws Throwable
	 */
	@Around("pointcut()")
	public Object logger(ProceedingJoinPoint joinPoint) throws Throwable {
		// 주 업무 로직의 joinPoint 확인
		Signature signature = joinPoint.getSignature();
		String type = signature.getDeclaringTypeName(); // className
		String methodName = signature.getName(); // 메소드 명
		
		
		// before
		log.debug("[Arround1] {}.{}", type, methodName);
		
		Object obj = joinPoint.proceed();
		
		//after
		log.debug("[Arround2] {}.{}", type, methodName);
		return obj;
	}
}
