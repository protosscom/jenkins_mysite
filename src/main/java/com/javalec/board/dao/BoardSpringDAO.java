package com.javalec.board.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.javalec.board.vo.BoardVO;

@Repository("boardSpringDao")
public class BoardSpringDAO implements IBoardDAO {
	
	// 스프링 JDBC 사용을 위한 JDBCTemplate 객체 생성
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	//삽입
	public int insert(BoardVO board) {
		
		Object args[] = {board.getTitle(), board.getWriter(), board.getContent(), board.getId()};
			
		String sql = "INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, 0, ?)";
			
		return jdbcTemplate.update(sql, args);
	}
	
	//전체 조회
	public List<BoardVO> selectAll(){
		
		//ORACLE에 보낼 SQL문
		String sql = "SELECT SEQ, TITLE, WRITER, CONTENT, TO_CHAR(REG_DATE, 'YYYY-MM-DD HH24:MI') RD, CNT, ID FROM BOARD ORDER BY SEQ";
			
		// query메소드에 sql문과 Mapper클래스를 인자로 던져준다.
		return jdbcTemplate.query(sql, new BoardMapper());
	}
	
	//이름 검색
	public List<BoardVO> selectSearchTitle(String keyword){
		Object[] args = {keyword};
			
		String sql = "SELECT SEQ, TITLE, WRITER, CONTENT, TO_CHAR(REG_DATE, 'YYYY-MM-DD HH24:MI') RD, CNT, ID FROM BOARD WHERE UPPER(TITLE) LIKE UPPER(?) ORDER BY SEQ";
			
		
		return jdbcTemplate.query(sql, args, new BoardMapper());
	}
	
	//내용 검색
	public List<BoardVO> selectSearchContent(String keyword){
		Object[] args = {keyword};
			
		String sql = "SELECT SEQ, TITLE, WRITER, CONTENT, TO_CHAR(REG_DATE, 'YYYY-MM-DD HH24:MI') RD, CNT, ID FROM BOARD WHERE UPPER(CONTENT) LIKE UPPER(?) ORDER BY SEQ";
			
		return jdbcTemplate.query(sql, args, new BoardMapper());
	}
	
	//단건 조회
	public BoardVO selectOne(int no){
		Object[] args = {no};
		
		String sql = "SELECT SEQ, TITLE, WRITER, CONTENT, TO_CHAR(REG_DATE, 'YYYY-MM-DD HH24:MI') RD, CNT, ID FROM BOARD WHERE SEQ = ?";
			
		
		return jdbcTemplate.queryForObject(sql, args, new BoardMapper());
	}
	
	//조회수 증가
	@Override
	public int updateCnt(int seq) {
		String sql = "UPDATE BOARD SET CNT = CNT+1 WHERE SEQ = ?";
		return jdbcTemplate.update(sql, seq);
	}
	
	//수정
	public int update(BoardVO board) {
		Object args[] = {board.getTitle(), board.getWriter(), board.getContent(), board.getId()};
		
		String sql = "UPDATE BOARD SET TITLE = ?, CONTENT = ? WHERE SEQ = ?";
			
		return jdbcTemplate.update(sql, args);
	}
	
	//삭제
	public int delete(int seq) {
		
		String sql = "DELETE FROM BOARD WHERE SEQ = ?";
		
		return jdbcTemplate.update(sql, seq);
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> getBoardList(int currentPage, int listSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> selectSearchTitle(String keyword, int currentPage, int listSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> selectSearchContent(String keyword, int currentPage, int listSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int totalCountTitle(String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int totalCountContent(String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
