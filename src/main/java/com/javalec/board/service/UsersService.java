package com.javalec.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.javalec.board.dao.IUsersDAO;
import com.javalec.board.vo.UsersVO;


// 비즈니스 로직을 수행하는 서비스 클래스.
@Service("usersService")
public class UsersService implements IUsersService {

	//DAO 클래스 DI
	@Autowired
	@Qualifier("usersDao")
	private IUsersDAO dao;
	
	@Override
	public List<UsersVO> getUsersList() {
		return dao.selectAll();
	}
	@Override
	public int insertUsers(UsersVO users) {
		return dao.insert(users);
	}

	@Override
	public int updateUsers(UsersVO users) {
		return dao.update(users);
	}

	@Override
	public int deleteUsers(String id) {
		return dao.delete(id);
	}
	
	@Override
	public UsersVO selectOne(String id) {
		return dao.selectOne(id);
	}  

	
}
