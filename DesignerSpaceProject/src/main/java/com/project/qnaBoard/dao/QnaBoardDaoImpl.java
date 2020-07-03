package com.project.qnaBoard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.qnaBoard.model.QnaBoardDto;

@Repository
public class QnaBoardDaoImpl implements QnaBoardDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<QnaBoardDto> qnaBoardSelectList() {
		// TODO Auto-generated method stub
		
		List<QnaBoardDto> qnaBoardList = sqlSession.selectList("com.project.qnaBoard.qnaBoardSelectList");
		
		return qnaBoardList;
		
//		return null;
	}

	@Override
	public QnaBoardDto qnaBoardSelectDetail(int QNA_BOARD_NO) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("com.project.qnaBoard.qnaBoardSelectDetail", QNA_BOARD_NO);
		
//		return null;
	}

}
