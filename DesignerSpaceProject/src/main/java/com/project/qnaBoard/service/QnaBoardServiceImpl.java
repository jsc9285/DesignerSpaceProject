package com.project.qnaBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.qnaBoard.dao.QnaBoardDao;
import com.project.qnaBoard.model.QnaBoardDto;

@Service
public class QnaBoardServiceImpl implements QnaBoardService{

	@Autowired
	public QnaBoardDao qnaBoardDao;

	@Override
	public List<QnaBoardDto> qnaBoardSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		
		List<QnaBoardDto> qnaBoardList = 
				qnaBoardDao.qnaBoardSelectList(searchOption, keyword, start, end);
		
		return qnaBoardList;
	}

	@Override
	public QnaBoardDto qnaBoardSelectDetail(int QNA_BOARD_NO) {
		// TODO Auto-generated method stub
		
		QnaBoardDto qnaBoardDto = qnaBoardDao.qnaBoardSelectDetail(QNA_BOARD_NO);
		
		
		return qnaBoardDto;
	}

	@Override
	public void qnaBoardInsertOne(QnaBoardDto qnaBoardDto) {
		// TODO Auto-generated method stub
		
		qnaBoardDao.qnaBoardInsertOne(qnaBoardDto);
	}

	@Override
	public void qnaBoardUpdateOne(QnaBoardDto qnaBoardDto) {
		// TODO Auto-generated method stub
		
		qnaBoardDao.qnaBoardUpdateOne(qnaBoardDto);
	}

	@Override
	public int qnaBoardDeleteOne(int QNA_BOARD_NO) {
		// TODO Auto-generated method stub
		
		return qnaBoardDao.qnaBoardDeleteOne(QNA_BOARD_NO);
	}

	@Override
	public int qnaBoardSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		
		return qnaBoardDao.qnaBoardSelectTotalCount(searchOption, keyword);
	}

	@Override
	public int qnaSelectCurPage(String searchOption, String keyword, int QNA_BOARD_NO) {
		// TODO Auto-generated method stub
		
		return qnaBoardDao.qnaSelectCurPage(searchOption, keyword, QNA_BOARD_NO);
	}

	
}
