package com.javalec.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.board.service.IUsersService;
import com.javalec.board.vo.UsersVO;

@Controller("usersController")
@RequestMapping("/main")
public class UserController {

	// 서비스 클래스 DI
	@Autowired
	@Qualifier("usersService")
	private IUsersService service;
	
	//로그인 컨트롤러
	@RequestMapping(value = "/login.do", method=RequestMethod.POST)
	public String login(HttpServletRequest req, HttpServletResponse resp, HttpSession session, 
						Model model,
						@RequestParam(value="id") String id,
						@RequestParam(value="password") String password,
						@RequestParam(value="remember", required=false) String remember) throws ServletException, IOException {
		
		// 쿠기 생성
		if (remember != null) {
			Cookie cookie = new Cookie("id", id);

			resp.addCookie(cookie);
		}
		
		UsersVO user = service.selectOne(id);
		if(user == null || !password.equals(user.getPassword())) {
			model.addAttribute("loginstatus", "fail");
			return "main/loginform";
		}

		// 세션에 값 집어넣음
		session.setAttribute("id", user.getId());
		session.setAttribute("name", user.getName());
		session.setAttribute("password", user.getPassword());

		return "redirect:hello.do";
	}
	
	//로그아웃 컨트롤러
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		// 세션 종료
		session.invalidate();

		return "redirect:loginform.do";
	}
	
	//로그인 폼 컨트롤러
	@RequestMapping(value = "/loginform.do")
	public String loginForm() {
		return "main/loginform";
	}
	
	@RequestMapping(value = "/join.do")
	public String join(HttpServletRequest req, HttpServletResponse resp, HttpSession session, 
						Model model, UsersVO vo) throws ServletException, IOException {
		
		service.insertUsers(vo);
		model.addAttribute("loginstatus", "joinsuccess");
		
		return "main/loginform";
	}
	
	@RequestMapping(value = "/joinform.do")
	public String joinForm() {
		return "main/joinform";
	}
	
	@RequestMapping(value = "/findpassword.do")
	public String findpassword(@RequestParam(value="id", required=false) String id, Model model){
		
		if(id != null && id != "") {
			UsersVO user = service.selectOne(id);
			
			if (user != null) {
				model.addAttribute("password", user.getPassword());
			} 
			else {
				model.addAttribute("password", "유저 정보를 찾을 수 없습니다.");
			}
		}
		else {
			model.addAttribute("password", null);
		}
		return "main/findpassword";
	}
	
	@RequestMapping(value = "/hello.do")
	public String main(HttpSession session) {
		
//		String id = (String) session.getAttribute("id");
//
//		if (session.isNew() || id == null) {
//			return "main/loginform";
//		}

		session.setAttribute("password", null);
		
		return "main/hello";
	}
}
