package com.javalec.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.javalec.board.dao.IGuestBookDAO;
import com.javalec.board.vo.GuestBookVO;

// 비즈니스 로직을 수행하는 서비스 클래스.
@Service("service")
public class GuestBookService implements IGuestBookService {

	//DAO 클래스 DI
	@Autowired
	@Qualifier("dao")
	private IGuestBookDAO dao;
	
	@Override
	public List<GuestBookVO> getGuestBookList(String keyword, String schtype) {

		List<GuestBookVO> list = null;
		
		// 검색 키워드가 없을 경우, 전체 조회
		if (keyword == null || keyword.isEmpty()) {
			list = dao.selectAll();
		}
		// 검색 키워드가 있으면, 검색 결과 조회
		else {
			if (schtype.equals("schname")) {
				list = dao.selectSearchName(keyword);
			} else {
				list = dao.selectSearchContent(keyword);
			}
		}
		
		return list;
	}

	@Override
	public int insertGuestBook(GuestBookVO gb) throws Exception {
		return dao.insert(gb);
	}

	@Override
	public int updateGuestBook(GuestBookVO gb) {
		return dao.update(gb);
	}

	@Override
	public int deleteGuestBook(int no) {
		return dao.delete(no);
	}

	@Override
	public List<GuestBookVO> searchName(String keyword) {
		return dao.selectSearchName("%" + keyword + "%");
	}

	@Override
	public List<GuestBookVO> searchContent(String keyword) {
		return dao.selectSearchContent("%" + keyword + "%");
	}
	
	@Override
	public GuestBookVO selectOne(int no) {
		return dao.selectOne(no);
	}

	
}
