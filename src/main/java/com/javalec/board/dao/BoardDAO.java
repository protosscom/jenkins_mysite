package com.javalec.board.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javalec.board.vo.BoardVO;

//게시판 DAO
@Repository("boardDao")
public class BoardDAO implements IBoardDAO {

	// MyBatis를 실행하기 위한 SqlSession
	@Autowired
	private SqlSessionTemplate mybatis;

	// 삽입
	public int insert(BoardVO board) {
		return mybatis.insert("BoardDAO.insert", board);
	}

	// 수정
	public int update(BoardVO board) {
		int result = mybatis.update("BoardDAO.update", board);
		return result;
	}

	// 삭제
	public int delete(int no) {
		int result = mybatis.delete("BoardDAO.delete", no);
		return result;
	}

	// 전체 조회
	public List<BoardVO> selectAll() {
		return mybatis.selectList("BoardDAO.selectAll");
	}
	
	// 전체 조회 페이징
	public List<BoardVO> getBoardList(int currentPage, int listSize) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("page", currentPage);
		params.put("size", listSize);
		
		return mybatis.selectList("BoardDAO.getBoardList", params);
	}

	// 조회수 증가
	public int updateCnt(int seq) {
		int result = mybatis.update("BoardDAO.updateCnt", seq);
		return result;
	}
	
	// 단건 조회
	public BoardVO selectOne(int no) {
		return mybatis.selectOne("BoardDAO.selectOne", no);
	}

	// 제목 검색
	@Override
	public List<BoardVO> selectSearchTitle(String keyword, int currentPage, int listSize) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("keyword", "%" + keyword + "%");
		params.put("page", currentPage);
		params.put("size", listSize);
		
		return mybatis.selectList("BoardDAO.getBoardListTitle", params);
	}
	// 내용 검색
	@Override
	public List<BoardVO> selectSearchContent(String keyword, int currentPage, int listSize) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("keyword", "%" + keyword + "%");
		params.put("page", currentPage);
		params.put("size", listSize);
		
		return mybatis.selectList("BoardDAO.getBoardListContent", params);
	}
	
	// 전체 게시물 개수
	public int totalCount() {
		return mybatis.selectOne("BoardDAO.totalCount");
	}
	
	// 제목 검색 결과 개수
	@Override
	public int totalCountTitle(String keyword) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("keyword", "%" + keyword + "%");
		return mybatis.selectOne("BoardDAO.totalCountTitle", params);
	}

	// 내용 검색 결과 개수
	@Override
	public int totalCountContent(String keyword) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("keyword", "%" + keyword + "%");
		return mybatis.selectOne("BoardDAO.totalCountContent", params);
	}
	
}
