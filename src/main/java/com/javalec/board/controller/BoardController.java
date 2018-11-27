package com.javalec.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.javalec.board.service.IBoardService;
import com.javalec.board.vo.BoardVO;



//전체 총합 컨트롤러
@Controller("boardController")
@RequestMapping("/board")	// 컨트롤러에 리퀘스트 매핑을 추가함으로써, 경로를 추가해줄 수 있음.
public class BoardController {
	
	//서비스 클래스 DI
	@Autowired
	@Qualifier("boardService")
	private IBoardService service;
	
	//게시판 조회 컨트롤러
	@RequestMapping(value = "/getBoardList.do")
	public String getBoardList(HttpSession session, Model model, HttpServletRequest request,
									@RequestParam(name="currentpage", required=true, defaultValue="1") Integer currentPage,
									@RequestParam(name="keyword", required=false) String keyword,
									@RequestParam(name="searchtype", required=false) String searchtype) {

		// 세션이 생성되었는지 여부 확인. 없으면 로그인폼으로 이동
//		String id = (String) session.getAttribute("id");
//
//		if (session.isNew() || id == null) {
//			return "loginform";
//		}
//
//		session.setAttribute("password", null);
//		
		// 서비스에서 분기 수행
		Map<String, Object> map = service.getBoardList(keyword, searchtype, currentPage);
		
		// 값을 전달하고싶으면 model에 addAttribute 이용
		model.addAttribute("map", map);

		// 리턴값은 주소로
		return "board/getBoardList";
	}
	
	//게시판 단건 조회 컨트롤러
	@RequestMapping(value="/read.do")
	public String read(HttpServletRequest request, HttpServletResponse response, Model model,
						@RequestParam(value="no", required=true) int no) throws ServletException, IOException {

		//DB로부터 해당 게시판 받아옴
		BoardVO board = service.read(no);
		model.addAttribute("board", board);
		
		return "board/getBoard";
	}
	
	//게시판 작성 컨트롤러
	@RequestMapping(value="/add.do")
	public String add(BoardVO board, Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 멀티파트파일 추가 후 vo로부터 업로드파일 받아옴
		MultipartFile uploadFile = board.getUploadFile() ;

		// 업로드한 파일이 존재할 경우
		if(!uploadFile.isEmpty()) {
			// 파일 이름 받아오고
			String fileName = uploadFile.getOriginalFilename() ;
			// 업로드한 파일을 지정한 경로에 저장. 
			// 경로는 워크스페이스 밑의 메타데이터 밑에 숨겨진 프로젝트에 업로드해야 바로 나타남.
			uploadFile.transferTo(new File("C:/bit2018/spring_workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/mysite/image/"+ fileName));
			board.setFileURL(fileName);
		}
		else {
			board.setFileURL("");
		}

		service.insertBoard(board);
	
		return "redirect:getBoardList.do";
	}
	
	//게시판 작성 양식 컨트롤러
	@RequestMapping(value="/addform.do")
	public String addform() {
		return "board/insertBoard";
	}
	
	//게시판 삭제 컨트롤러
	@RequestMapping(value="/delete.do")
	public String delete(HttpServletRequest request, HttpServletResponse response, Model model,
				@RequestParam(value="no", required=true) int no) throws ServletException, IOException {
		

		//삭제
		service.deleteBoard(no);

		return "redirect:getBoardList.do";
	}
	
	//게시판 수정 컨트롤러
	@RequestMapping(value="/edit.do")
	public String edit(HttpServletRequest request, HttpServletResponse response, BoardVO board, Model model,
				@RequestParam(value="seq", required=true) int seq) throws ServletException, IOException {

		
		// 멀티파트파일 추가 후 vo로부터 업로드파일 받아옴
		MultipartFile uploadFile = board.getUploadFile() ;
		
		// 업로드한 파일이 존재할 경우
		if (uploadFile != null && !uploadFile.isEmpty()) {
			// 파일 이름 받아오고
			String fileName = uploadFile.getOriginalFilename();
			// 업로드한 파일을 지정한 경로에 저장.
			// 경로는 워크스페이스 밑의 메타데이터 밑에 숨겨진 프로젝트에 업로드해야 바로 나타남.
			uploadFile.transferTo(new File("C:/bit2018/spring_workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/mysite/image/"+ fileName));
			board.setFileURL(fileName);
		} else {
			BoardVO original = service.selectOne(board.getSeq());
			
			String originalURL = original.getFileURL();
			
			if(originalURL != null && !originalURL.isEmpty()) {
				board.setFileURL(originalURL);
			}
			else {
				board.setFileURL("");
			}
		}
		
		service.updateBoard(board);
		board=service.selectOne(board.getSeq());
		
		return "redirect:getBoardList.do";
	}

	//게시판 수정 양식 컨트롤러
	@RequestMapping(value="/editform.do")
	public String editform2(HttpServletRequest request, HttpServletResponse response, Model model,
				@RequestParam(value="no", required=true) int no) throws ServletException, IOException {

		BoardVO board = service.selectOne(no);
		
		model.addAttribute("board", board);

		//editform.jsp로 이동
		return "board/modifyBoard";
	}
	


}
