package com.project.qnaBoard.service;

import java.util.List;

import com.project.freeBoard.model.FreeBoardDto;
import com.project.qnaBoard.model.QnaBoardDto;

public interface QnaBoardService {

	public List<QnaBoardDto> qnaBoardSelectList(String searchOption, String keyword, int start, int end);

	public QnaBoardDto qnaBoardSelectDetail(int qna_board_no);

	public void qnaBoardInsertOne(QnaBoardDto qnaBoardDto);

	public void qnaBoardUpdateOne(QnaBoardDto qnaBoardDto);
	
	public int qnaBoardDeleteOne(int qna_board_no);

	public int qnaBoardSelectTotalCount(String searchOption, String keyword);

	public int qnaSelectCurPage(String searchOption, String keyword, int qna_board_no);

	public int qnaBoardCommentSelectTotalCount(int qna_board_no);

	public List<QnaBoardDto> qnaBoardCommentSelectList(int qna_board_no, int end);

//	public void qnaBoardCommentInsertOne(QnaBoardDto qnaBoardDto);

	public int qnaBoardCommentInsertOne(int qna_comment_qbno, int qna_comment_mno, String qna_comment_comments);

	public int qnaCommentDeleteOne(int qna_comment_no);

	public void qnaCommentUpdateOne(int qna_comment_no, String qna_comment_comments);

}
