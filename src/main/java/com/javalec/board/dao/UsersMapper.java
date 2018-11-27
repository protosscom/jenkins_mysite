package com.javalec.board.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.javalec.board.vo.UsersVO;


//RowMapper를 구현하는 BoardMapper 클래스. 제네릭 필요.
public class UsersMapper implements RowMapper<UsersVO> {

	//추상 메소드인 mapRow를 반드시 구현해줘야 한다.
	@Override
	public UsersVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		//mapRow가 하는 역할은 SELECT문으로부터 받아온 값들을 특정 객체에 집어넣고 리턴해준다.
		
		String id = rs.getString("ID");
		String password = rs.getString("PASSWORD");
		String name = rs.getString("NAME");
		String role = rs.getString("ROLE");
		
		UsersVO user = new UsersVO(id, password, name, role);
		
		return user;
	}

}
