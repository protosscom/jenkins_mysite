package com.javalec.board.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javalec.board.vo.UsersVO;


//게시판 DAO
@Repository("usersDao")
public class UsersDAO implements IUsersDAO {

	// MyBatis를 실행하기 위한 SqlSession
	@Autowired
	private SqlSessionTemplate mybatis;

	// 삽입
	public int insert(UsersVO users) {
		return mybatis.insert("UsersDAO.insert", users);
	}

	// 수정
	public int update(UsersVO users) {
		int result = mybatis.update("UsersDAO.update", users);
		return result;
	}

	// 삭제
	public int delete(String id) {
		int result = mybatis.delete("UsersDAO.delete", id);
		return result;
	}

	// 전체 조회
	public List<UsersVO> selectAll() {
		return mybatis.selectList("UsersDAO.selectAll");
	}

	
	// 단건 조회
	public UsersVO selectOne(String id) {
		return mybatis.selectOne("UsersDAO.selectOne", id);
	}

	
}
