package com.project.qnaBoard.service;

import java.util.List;

import com.project.qnaBoard.model.QnaBoardDto;

public interface QnaBoardService {

	public List<QnaBoardDto> qnaBoardSelectList(String searchOption, String keyword, int start, int end);

	public QnaBoardDto qnaBoardSelectDetail(int QNA_BOARD_NO);

	public void qnaBoardInsertOne(QnaBoardDto qnaBoardDto);

	public void qnaBoardUpdateOne(QnaBoardDto qnaBoardDto);
	
	public int qnaBoardDeleteOne(int QNA_BOARD_NO);

	public int qnaBoardSelectTotalCount(String searchOption, String keyword);

	public int qnaSelectCurPage(String searchOption, String keyword, int QNA_BOARD_NO);
}
