package com.project.qnaBoard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.qnaBoard.dao.QnaBoardDao;
import com.project.qnaBoard.model.QnaBoardDto;

@Service
public class QnaBoardServiceImpl implements QnaBoardService{

	@Autowired
	public QnaBoardDao qnaBoardDao;

	@Override
	public List<QnaBoardDto> qnaBoardSelectList() {
		// TODO Auto-generated method stub
		
		List<QnaBoardDto> qnaBoardList = qnaBoardDao.qnaBoardSelectList();
		
		return qnaBoardList;
	}

	@Override
	public QnaBoardDto qnaBoardSelectDetail(int QNA_BOARD_NO) {
		// TODO Auto-generated method stub
		
		return qnaBoardDao.qnaBoardSelectDetail(QNA_BOARD_NO);
	}

	
}
