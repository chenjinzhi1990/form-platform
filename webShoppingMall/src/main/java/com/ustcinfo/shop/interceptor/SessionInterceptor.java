package com.ustcinfo.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor implements HandlerInterceptor{

	

	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
			throws Exception {
		System.out.println("SpreHandle");
		String path = req.getServletPath();
		System.out.println(path);
		if(path.equals("/toselectassembly")){
			return true;
		}
		HttpSession session=req.getSession();
		Object obj=session.getAttribute("user");
		System.out.println(obj);
		if(obj==null){
		
			res.sendRedirect("/shop/toLogin");
			return false;
			
		}
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
	

}
