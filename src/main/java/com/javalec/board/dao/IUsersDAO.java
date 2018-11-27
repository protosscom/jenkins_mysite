package com.javalec.board.dao;

import java.util.List;

import com.javalec.board.vo.UsersVO;

public interface IUsersDAO {
	public int insert(UsersVO user);
	public int update(UsersVO user);
	public int delete(String id);
	public List<UsersVO> selectAll();
	public UsersVO selectOne(String id);
	
}
