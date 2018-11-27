package com.javalec.board.dao;

import java.util.List;

import com.javalec.board.vo.GuestBookVO;

public interface IGuestBookDAO {
	public int insert(GuestBookVO gb);
	public List<GuestBookVO> selectAll();
	public GuestBookVO selectOne(int no);
	public List<GuestBookVO> selectSearchName(String keyword);
	public List<GuestBookVO> selectSearchContent(String keyword);
	public int update(GuestBookVO gb);
	public int delete(int no);
	
}
