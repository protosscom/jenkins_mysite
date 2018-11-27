package com.javalec.board.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.javalec.board.vo.UsersVO;

@Repository("usersSpringDao")
public class UsersSpringDAO implements IUsersDAO {
	
	// 스프링 JDBC 사용을 위한 JDBCTemplate 객체 생성
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	//삽입
	public int insert(UsersVO users) {
		
		Object args[] = {users.getId(), users.getPassword(), users.getName(), users.getRole()};
			
		String sql = "INSERT INTO USERS VALUES(?, ?, ?, ?)";
			
		return jdbcTemplate.update(sql, args);
	}
	
	//전체 조회
	public List<UsersVO> selectAll(){
		
		//ORACLE에 보낼 SQL문
		String sql = "SELECT ID, PASSWORD, NAME, ROLE FROM USERS ORDER BY NAME";
			
		// query메소드에 sql문과 Mapper클래스를 인자로 던져준다.
		return jdbcTemplate.query(sql, new UsersMapper());
	}
	
	//단건 조회
	public UsersVO selectOne(String id){
		Object[] args = {id};
		
		String sql = "SELECT ID, PASSWORD, NAME, ROLE FROM USERS WHERE ID = ?";
			
		
		return jdbcTemplate.queryForObject(sql, args, new UsersMapper());
	}
	
	//수정
	public int update(UsersVO Users) {
		Object args[] = {Users.getPassword(), Users.getName(), Users.getRole(), Users.getId()};
		
		String sql = "UPDATE USERS SET PASSWORD = ?, NAME = ?, ROLE = ? WHERE ID = ?";
			
		return jdbcTemplate.update(sql, args);
	}
	
	//삭제
	public int delete(String id) {
		
		String sql = "DELETE FROM Users WHERE ID = ?";
		
		return jdbcTemplate.update(sql, id);
	}
	

	
}
