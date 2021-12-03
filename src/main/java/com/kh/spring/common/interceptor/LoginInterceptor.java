package com.kh.spring.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.cosmos.member.model.vo.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(loginMember == null) {
			// 메시지 처리
			FlashMap flashMap = new FlashMap();
			flashMap.put("msg", "로그인 후 이용할 수 있습니다.");
			FlashMapManager manager = RequestContextUtils.getFlashMapManager(request);
			manager.saveOutputFlashMap(flashMap, request, response);
			
			
			// 로그인 성공시 redirect처리
			String url = request.getRequestURL().toString();
			String queryString = request.getQueryString();
			
			if(queryString != null) {
				url += "?" + queryString;
			}
			session.setAttribute("redirect", url);
			
			response.sendRedirect(request.getContextPath()+"/member/memberLogin.do");
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}
	
}
