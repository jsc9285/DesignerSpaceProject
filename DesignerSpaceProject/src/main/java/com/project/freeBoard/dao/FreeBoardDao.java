package com.project.freeBoard.dao;

import java.util.List;
import java.util.Map;

import com.project.freeBoard.model.FreeBoardDto;

public interface FreeBoardDao {
	
	public int freeBoardSelectTotalCount(String searchOption, String keyword);

	public int freeBoardSelectCurPage(String searchOption, String keyword, int no);

	public List<FreeBoardDto> freeBoardSelectList(String searchOption, String keyword, int start, int end);
	
	public FreeBoardDto freeBoardSelectOne(int no);

	public List<Map<String, Object>> fileSelectList(int no);
	
	public int freeBoardView(int no);
	
	public int freeBoardCommentSelectTotalCount(int no);

	public List<FreeBoardDto> freeBoardCommentSelectList(int no, int end);

	public int freeBoardLikeInsert(int no,int mno);

	public List<Object> freeBoardLikeSelectList(int no, int mno);

	public int freeBoardLikeUpdate(int no, int mno);

	public int freeBoardLikeDel(int no, int mno);

	public void freeBoardAdd(int mno, String title, String contents);

	public String freeBoardAddOne(int mno);

	public int freeBoardLikeDelete(int no);

	public int freeBoardCommentDelete(int no);

	public int freeBoardDelete(int no);

	public int freeBoardCommentAdd(int no,int mno,String comments);

	public void freeBoardUpdate(int no, String title, String contents);

}

