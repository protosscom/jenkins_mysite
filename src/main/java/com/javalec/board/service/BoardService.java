package com.javalec.board.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.javalec.board.dao.IBoardDAO;
import com.javalec.board.vo.BoardVO;


// 비즈니스 로직을 수행하는 서비스 클래스.
@Service("boardService")
public class BoardService implements IBoardService {
	
	//리스팅되는 게시물의 수
	private static final int LIST_SIZE = 5; 
	//페이지 리스트의 페이지 수	
	private static final int PAGE_SIZE = 5; 

	//DAO 클래스 DI
	@Autowired
	@Qualifier("boardDao")
	private IBoardDAO dao;
	
	// 페이징 조회
	public Map<String, Object> getBoardList(String keyword, String schtype, int currentPage) {
			
			// 게시물, Board의 row 개수 구함.
			int totalCount = 0; 
			List<BoardVO> list = null;
			Map<String, Object> map = new HashMap<String, Object>();
		
			// 키워드가 없을 경우 전체 조회
			if (keyword == null || keyword.isEmpty()) {
				// DAO로부터 전체 게시물의 개수(totalCount)를 받아온다.
				totalCount = dao.totalCount(); 
			}
			else {
				// 있을경우, schtype에 따라 제목/내용 검색
				if (schtype.equals("title")) {
					// DAO로부터 각각 검색 게시물의 개수를 받아온다.
					totalCount = dao.totalCountTitle(keyword);
				} else {
					totalCount = dao.totalCountContent(keyword);
				}
			}
			
			// 게시판의 총 페이지 개수
			int pageCount = (int)Math.ceil( (double)totalCount / LIST_SIZE );
			// 블록(페이지 묶음)의 개수
			int blockCount = (int)Math.ceil( (double)pageCount / PAGE_SIZE );
			// 현재 블록 위치
			int currentBlock = (int)Math.ceil( (double)currentPage / PAGE_SIZE );
			
			// 현재 페이지를 처리해주는 작업을 함
			// 현재 페이지가 0보다 작을경우 현재 페이지와 현재 블록(currentBlock)을 1로 처리
			if( currentPage < 1 ) {
				currentPage = 1;
				currentBlock = 1;
			}
			// 현재 페이지가 최대 페이지(pageCount)를 넘겨버리면 현재 페이지를
			// 최대 페이지와 동일하게 하고 현재 블록을 다시 구함.
			else if( currentPage > pageCount ) {
				currentPage = pageCount;
				currentBlock = (int)Math.ceil( (double)currentPage / PAGE_SIZE );
			}
			
			// 시작 페이지
			int beginPage = currentBlock == 0 ? 1 : (currentBlock - 1)*PAGE_SIZE + 1;
			// 이전 페이지
			int prevPage = ( currentBlock > 1 ) ? ( currentBlock - 1 ) * PAGE_SIZE : 0;
			// 다음 페이지
			int nextPage = ( currentBlock < blockCount ) ? currentBlock * PAGE_SIZE + 1 : 0;
			// 마지막 페이지
			int endPage = ( nextPage > 0 ) ? ( beginPage - 1 ) + PAGE_SIZE : pageCount;
			
			// DAO에 현재 페이지값을 주고 리스트를 받아옴.
			if (keyword == null || keyword.isEmpty()) {
				list = dao.getBoardList(currentPage, LIST_SIZE);
			}
			else {
				if (schtype.equals("title")) {
					list = dao.selectSearchTitle(keyword, currentPage, LIST_SIZE);
				} else {
					list = dao.selectSearchContent(keyword, currentPage, LIST_SIZE);
				}
			}
			
			// 마지막으로 map에다 리스트, 총 게시물 개수, 리스트 사이즈, 현재 페이지, 시작 페이지, 마지막 페이지,
			// 이전 페이지, 다음 페이지, 키워드를 전부 넣어주고 리턴함.
			map.put( "list", list );
			map.put( "totalCount", totalCount );
			map.put( "listSize", LIST_SIZE );
			map.put( "pageSize", PAGE_SIZE );
			map.put( "currentPage", currentPage );
			map.put( "beginPage", beginPage );
			map.put( "endPage", endPage );
			map.put( "prevPage", prevPage );
			map.put( "nextPage", nextPage );
			map.put( "keyword", keyword );
			
			return map ; 
			
	}
	
	
	@Override
	public BoardVO read(int seq) {
		dao.updateCnt(seq);
		return dao.selectOne(seq);
	}


	@Override
	public int insertBoard(BoardVO board) {
		return dao.insert(board);
	}

	@Override
	public int updateBoard(BoardVO board) {
		return dao.update(board);
	}

	@Override
	public int deleteBoard(int seq) {
		return dao.delete(seq);
	}
	
	@Override
	public BoardVO selectOne(int seq) {
		return dao.selectOne(seq);
	}

	
}
