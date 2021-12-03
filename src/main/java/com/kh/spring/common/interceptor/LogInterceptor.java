package com.kh.spring.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * preHandle : DispatcherServlet이 handler 호출 전
 * 
 * postHandle : Handler가 DispatcherServlet 리턴 전 
 * 
 * afterCompletion : view 단 작업 후
 * 
 * @author ehqkr
 *
 */

@Slf4j
public class LogInterceptor extends HandlerInterceptorAdapter {
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("============ {} ===============", request.getRequestURI());
		
		return super.preHandle(request, response, handler); // 무조건 true
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		
		super.postHandle(request, response, handler, modelAndView);
		log.debug("-------------------------------");
		log.debug("modelAndView = {}", modelAndView);
		log.debug("-------------------------------");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		log.debug("_____________ view ____________");
		super.afterCompletion(request, response, handler, ex);
		log.debug("=========== end ===============");
	}
	
	
}
