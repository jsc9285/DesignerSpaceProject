package com.project.qnaBoard.service;

import java.util.List;

import com.project.qnaBoard.model.QnaBoardDto;

public interface QnaBoardService {

	public List<QnaBoardDto> qnaBoardSelectList();

	public QnaBoardDto qnaBoardSelectDetail(int QNA_BOARD_NO);
}
