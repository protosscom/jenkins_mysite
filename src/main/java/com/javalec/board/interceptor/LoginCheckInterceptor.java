package com.javalec.board.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


// 인터셉터(Interceptor) 클래스. 컨트롤러가 실행되기전에 연결을 가로채서(Intercept) 실행되는 클래스이다.
// HandlerInterceptorAdapter를 상속받아야 만들 수 있음.
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	
	// preHandle : 컨트롤러 실행 전에 실행되는 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		// 세션 클래스 받아옴
		HttpSession session = request.getSession();
	
		// 세션으로부터 id 값을 받아옴
		String id = (String) session.getAttribute("id");
	
		// id가 없을 경우(세션이 없을 경우)
		if (session.isNew() || id == null) {
			
			// loginform.do로 리다이렉트 시킴
			response.sendRedirect("/mysite/main/loginform.do");
			// 원래 컨트롤러로 가지 못하므로 false 리턴
			return false;
		}
	
		session.setAttribute("password", null);
		
		// 세션이 있다면 원래 컨트롤러 정상 실행
		return true;
	}
	
	// postHandle : 컨트롤러가 실행되고 나서 실행되는 메소드
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		// TODO Auto-generated method stub
//		super.postHandle(request, response, handler, modelAndView);
//	}
}
