package com.javalec.board.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.javalec.board.vo.BoardVO;


//RowMapper를 구현하는 BoardMapper 클래스. 제네릭 필요.
public class BoardMapper implements RowMapper<BoardVO> {

	//추상 메소드인 mapRow를 반드시 구현해줘야 한다.
	@Override
	public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		//mapRow가 하는 역할은 SELECT문으로부터 받아온 값들을 특정 객체에 집어넣고 리턴해준다.
		
		int seq = rs.getInt("SEQ");
		String title = rs.getString("TITLE");
		String writer = rs.getString("WRITER");
		String content = rs.getString("CONTENT");
		String reg_date = rs.getString("RD");
		int cnt = rs.getInt("CNT");
		String id = rs.getString("ID");
		
		BoardVO Board = new BoardVO(seq, title, writer, content, reg_date, cnt, id);
		
		return Board;
	}

}
