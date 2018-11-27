package com.javalec.board.dao;

import java.util.List;

import com.javalec.board.vo.BoardVO;

public interface IBoardDAO {
	public int insert(BoardVO gb);
	public int update(BoardVO gb);
	public int delete(int no);
	public List<BoardVO> selectAll();
	public BoardVO selectOne(int no);
	public int updateCnt(int seq);
	
	public List<BoardVO> selectSearchTitle(String keyword, int currentPage, int listSize);
	public List<BoardVO> selectSearchContent(String keyword, int currentPage, int listSize);
	
	public int totalCount();
	public int totalCountTitle(String keyword);
	public int totalCountContent(String keyword);
	public List<BoardVO> getBoardList(int currentPage, int listSize);
}
