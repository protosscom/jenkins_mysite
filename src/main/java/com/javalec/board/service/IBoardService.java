package com.javalec.board.service;

import java.util.*;

import com.javalec.board.vo.BoardVO;

public interface IBoardService {
	public Map<String, Object> getBoardList(String keyword, String schtype, int currentPage);
	
	public BoardVO read(int no);
	
	public int insertBoard(BoardVO gb);
	
	public int updateBoard(BoardVO gb);
	public int deleteBoard(int seq);
	public BoardVO selectOne(int seq);
	
}
