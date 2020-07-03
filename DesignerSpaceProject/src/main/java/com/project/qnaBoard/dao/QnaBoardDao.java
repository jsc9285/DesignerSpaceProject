package com.project.qnaBoard.dao;

import java.util.List;

import com.project.qnaBoard.model.QnaBoardDto;

public interface QnaBoardDao {

	public List<QnaBoardDto> qnaBoardSelectList();
	
	public QnaBoardDto qnaBoardSelectDetail(int QNA_BOARD_NO);
}
