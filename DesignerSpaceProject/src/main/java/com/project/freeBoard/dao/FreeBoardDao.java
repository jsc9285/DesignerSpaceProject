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

//	public int freeBoardCommentSelectCurPage(int no, int fcno);

	public List<FreeBoardDto> freeBoardCommentSelectList(int no, int end);

}
