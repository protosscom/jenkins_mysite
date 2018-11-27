package com.javalec.board.service;

import java.util.List;

import com.javalec.board.vo.UsersVO;

public interface IUsersService {
	public List<UsersVO> getUsersList();
	public int insertUsers(UsersVO users);
	public int updateUsers(UsersVO users);
	public int deleteUsers(String id);
	public UsersVO selectOne(String id);
	
}
