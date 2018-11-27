package com.javalec.board.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javalec.board.vo.GuestBookVO;


//방명록 DAO
@Repository("dao")
public class GuestBookDAO implements IGuestBookDAO {
	
	// MyBatis를 실행하기 위한 SqlSession
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	// 삽입
	public int insert(GuestBookVO guestBook) {
		return mybatis.insert("GuestBookDAO.insert", guestBook);
	}
	
	// 전체 조회
	public List<GuestBookVO> selectAll(){
		return mybatis.selectList("GuestBookDAO.selectAll");
	}
	
	// 이름 검색
	public List<GuestBookVO> selectSearchName(String keyword){
		return mybatis.selectList("GuestBookDAO.selectSearchName", keyword);
	}
	
	// 내용 검색
	public List<GuestBookVO> selectSearchContent(String keyword){
		return mybatis.selectList("GuestBookDAO.selectSearchContent", keyword);
	}
	
	
	// 단건 조회
	public GuestBookVO selectOne(int no){
		return mybatis.selectOne("GuestBookDAO.selectOne", no);
	}
	
	// 수정
	public int update(GuestBookVO guestBook) {
		return mybatis.update("GuestBookDAO.update", guestBook);
	}
	
	// 삭제
	public int delete(int no) {
		return mybatis.delete("GuestBookDAO.delete", no);
	}
}
