package com.project.qnaBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.qnaBoard.model.QnaBoardDto;

@Repository
public class QnaBoardDaoImpl implements QnaBoardDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.project.qnaBoard.";
	
	@Override
	public List<QnaBoardDto> qnaBoardSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		List<QnaBoardDto> qnaBoardList = sqlSession.selectList(namespace + "qnaBoardSelectList", map);
		
		return qnaBoardList;
		
	}

	@Override
	public QnaBoardDto qnaBoardSelectDetail(int QNA_BOARD_NO) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace + "qnaBoardSelectDetail", QNA_BOARD_NO);
		
	}

	@Override
	public void qnaBoardInsertOne(QnaBoardDto qnaBoardDto) {
		// TODO Auto-generated method stub
		
		sqlSession.insert(namespace + "qnaBoardInsertOne", qnaBoardDto);
	}

	@Override
	public void qnaBoardUpdateOne(QnaBoardDto qnaBoardDto) {
		// TODO Auto-generated method stub
		
		sqlSession.update(namespace + "qnaBoardUpdateOne", qnaBoardDto);
	}

	@Override
	public int qnaBoardDeleteOne(int QNA_BOARD_NO) {
		// TODO Auto-generated method stub
		
		return sqlSession.delete(namespace + "qnaBoardDeleteOne", QNA_BOARD_NO);
	}

	@Override
	public int qnaBoardSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace + "qnaBoardSelectTotalCount", paramMap);
	}

	@Override
	public int qnaSelectCurPage(String searchOption, String keyword, int QNA_BOARD_NO) {
		// TODO Auto-generated method stub
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("QNA_BOARD_NO", QNA_BOARD_NO);
		
		return sqlSession.selectOne(namespace + "qnaSelectCurPage", paramMap);
	}

}
