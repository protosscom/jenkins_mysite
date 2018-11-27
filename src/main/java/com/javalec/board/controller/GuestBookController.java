package com.javalec.board.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.javalec.board.service.IGuestBookService;
import com.javalec.board.vo.GuestBookVO;


//전체 총합 컨트롤러
@Controller("guestbookController")
@RequestMapping("/guestbook")
public class GuestBookController {
	
	//서비스 클래스 DI
	@Autowired
	@Qualifier("service")
	private IGuestBookService service;
	
	//방명록 조회 컨트롤러
	@RequestMapping(value = "/getGuestBookList.do")
	public String getGuestBookList(HttpSession session, Model model, HttpServletRequest request,
									@RequestParam(name="keyword", required=false) String keyword,
									@RequestParam(name="schtype", required=false) String schtype) {
		
		// 세션이 생성되었는지 여부 확인. 없으면 로그인폼으로 이동
//		String id = (String) session.getAttribute("id");
//
//		if (session.isNew() || id == null) {
//			return "main/loginform";
//		}

		
		// 서비스에서 분기 수행
		List<GuestBookVO> list = service.getGuestBookList(keyword, schtype);
		
		// 값을 전달하고싶으면 model에 addAttribute 이용
		model.addAttribute("list", list);
		
		// 리턴값은 주소로
		return "guestbook/getGuestBookList";
	}
	
	//방명록 작성 컨트롤러
	@RequestMapping(value="/add.do")
	public String add(GuestBookVO gb, Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {

		service.insertGuestBook(gb);

		return "redirect:getGuestBookList.do";
	}
	
	//방명록 작성 양식 컨트롤러
	@RequestMapping(value="/addform.do")
	public String addform() {
		return "guestbook/addform";
	}
	
	//방명록 삭제 컨트롤러
	@RequestMapping(value="/delete.do")
	public String delete(HttpServletRequest request, HttpServletResponse response, Model model,
						@RequestParam(value="no", required=true) int no,
						@RequestParam(value="password") String password) throws ServletException, IOException {
	
		GuestBookVO gb = service.selectOne(no);

		// 비밀번호가 틀리면 틀렸다고 띄우고 종료
		if (!gb.getPassword().equals(password)) {
			model.addAttribute("result", "passwordfail");
			return "guestbook/result";
		} 
		else {
			// 삭제
			service.deleteGuestBook(no);
		}
		
		return "redirect:getGuestBookList.do";
	}
	
	//방명록 삭제 양식 컨트롤러
	@RequestMapping(value="/deleteform.do")
	public String deleteform() {
		return "guestbook/deleteform";
	}
	
	//방명록 수정 컨트롤러
	@RequestMapping(value="/edit.do")
	public String edit(HttpServletRequest request, HttpServletResponse response, GuestBookVO gb, Model model,
						@RequestParam(value="no", required=true) int no) throws ServletException, IOException {

		//수정
		service.updateGuestBook(gb);
		
		// result.jsp로 이동.!!
		return "redirect:getGuestBookList.do";
	}

	//방명록 수정 양식 컨트롤러
	@RequestMapping(value="/editform.do")
	public String add() {
		return "guestbook/editform";
	}
	
	//방명록 수정 양식2 컨트롤러
	@RequestMapping(value="/editform2.do")
	public String editform2(HttpServletRequest request, HttpServletResponse response, Model model,
							@RequestParam(value="no", required=true) int no,
							@RequestParam(value="password") String password) throws ServletException, IOException {


		GuestBookVO gb = service.selectOne(no);

		// 비밀번호가 틀리면 틀렷다고 띄우고 종료
		if (!gb.getPassword().equals(password)) {
			model.addAttribute("result", "passwordfail");
			return "guestbook/result";
		} else {
			model.addAttribute("gb", gb);
		}
		

		//editform2.jsp로 이동
		return "guestbook/editform2";
	}
}
