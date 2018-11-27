package com.javalec.board.service;

import java.util.List;

import com.javalec.board.vo.GuestBookVO;

public interface IGuestBookService {
	public List<GuestBookVO> getGuestBookList(String keyword, String schtype);
	
	public int insertGuestBook(GuestBookVO gb) throws Exception ;
	
	public int updateGuestBook(GuestBookVO gb);
	public int deleteGuestBook(int no);
	public List<GuestBookVO> searchName(String keyword);
	public List<GuestBookVO> searchContent(String keyword);
	public GuestBookVO selectOne(int no);
}
