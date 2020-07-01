package com.project.freeBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.freeBoard.model.FreeBoardDto;



@Repository
public class FreeBoardDaoImpl implements FreeBoardDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.project.freeBoard.";

	@Override
	public int freeBoardSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace + "freeBoardSelectTotalCount"
				, paramMap);
	}

	@Override
	public int freeBoardSelectCurPage(String searchOption, String keyword, int no) {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("no", no);
			
		return sqlSession.selectOne(namespace 
				+ "freeBoardSelectCurPage", paramMap);
	}

	@Override
	public List<FreeBoardDto> freeBoardSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		List<FreeBoardDto> freeBoardList = 
				sqlSession.selectList(namespace + "freeBoardSelectList"
				, map);
		
		
		return freeBoardList;
	}

	@Override
	public FreeBoardDto freeBoardSelectOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "freeBoardSelectOne"
				, no);
	}

	@Override
	public List<Map<String, Object>> fileSelectList(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int freeBoardView(int no) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "freeBoardView", no);
	}
	
	@Override
	public int freeBoardCommentSelectTotalCount(int no) {
		// TODO Auto-generated method stub
	
		return sqlSession.selectOne(namespace + "freeBoardCommentSelectTotalCount", no);
	}

//	@Override
//	public int freeBoardCommentSelectCurPage(int no, int fcno) {
//		// TODO Auto-generated method stub
//		Map<String, Object> map = new HashMap<>();
//		map.put("no", no);
//		map.put("fcno", fcno);
//		
//		return sqlSession.selectOne(namespace + "freeBoardCommentSelectCurPage", map);
//	}

	@Override
	public List<FreeBoardDto> freeBoardCommentSelectList(int no, int end ) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("end", end);
		map.put("no", no);
		
		List<FreeBoardDto> freeBoardCommentList = 
				sqlSession.selectList(namespace + "freeBoardCommentSelectList", map);
		
		
		return freeBoardCommentList;
	}
	
	
	

}
