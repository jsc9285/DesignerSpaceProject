package com.project.freeBoard.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.freeBoard.dao.FreeBoardDao;
import com.project.freeBoard.model.FreeBoardDto;
import com.project.util.FileUtils;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{

	private static final Logger log = 
			LoggerFactory.getLogger(FreeBoardServiceImpl.class);
	
	@Autowired
	public FreeBoardDao freeBoardDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public int freeBoardSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return freeBoardDao.freeBoardSelectTotalCount(searchOption
				, keyword);
	}

	@Override
	public int freeBoardSelectCurPage(String searchOption, String keyword, int no) {
		// TODO Auto-generated method stub
		return freeBoardDao.freeBoardSelectCurPage(searchOption, keyword, no);
	}

	@Override
	public List<FreeBoardDto> freeBoardSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		List<FreeBoardDto> freeboardList = 
				freeBoardDao.freeBoardSelectList(searchOption, keyword
					, start, end);
		
		return freeboardList;
	}

	@Override
	public Map<String, Object> freeBoardSelectOne(int no) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		FreeBoardDto freeBoardDto = freeBoardDao.freeBoardSelectOne(no);
		
		resultMap.put("freeBoardDto", freeBoardDto);

		
		List<Map<String, Object>> fileList = freeBoardDao.fileSelectList(no);
		resultMap.put("fileList", fileList);
		
		return resultMap;
	}

	@Override
	public int freeBoardView(int no) {
		// TODO Auto-generated method stub
		return freeBoardDao.freeBoardView(no);
	}
	
	@Override
	public int freeBoardCommentSelectTotalCount(int no) {
		// TODO Auto-generated method stub
		return freeBoardDao.freeBoardCommentSelectTotalCount(no);
	}

//	@Override
//	public int freeBoardCommentSelectCurPage(int no, int fcno) {
//		// TODO Auto-generated method stub
//		
//		return freeBoardDao.freeBoardCommentSelectCurPage(no, fcno);
//	}

	@Override
	public List<FreeBoardDto> freeBoardCommentSelectList(int no, int end) {
		// TODO Auto-generated method stub
		List<FreeBoardDto> freeboardCommentList = 
				freeBoardDao.freeBoardCommentSelectList(no, end);
		
		return freeboardCommentList;
	}

	@Override
	public int freeBoardLikeInsert(int no,int mno) {
		// TODO Auto-generated method stub
		return freeBoardDao.freeBoardLikeInsert(mno, no);
	}

	@Override
	public List<Object> freeBoardLikeSelectList(int no, int mno) {
		// TODO Auto-generated method stub
				
		
		return freeBoardDao.freeBoardLikeSelectList(no, mno);
	}

	@Override
	public int freeBoardLikeUpdate(int no, int mno) {
		
		return freeBoardDao.freeBoardLikeUpdate(no, mno);	
		
	}

	@Override
	public int freeBoardLikeDel(int no, int mno) {
		return freeBoardDao.freeBoardLikeDel(no, mno);
		
	}

	@Override
	public void freeBoardAdd(int mno, String title, String contents) {
		// TODO Auto-generated method stub
		freeBoardDao.freeBoardAdd(mno, title, contents);
	}

	@Override
	public String freeBoardAddOne(int mno) {
		// TODO Auto-generated method stub
		
		return freeBoardDao.freeBoardAddOne(mno);
	}

	@Override
	public int freeBoardLikeDelete(int no) {
		// TODO Auto-generated method stub
		return freeBoardDao.freeBoardLikeDelete(no);
	}

	@Override
	public int freeBoardCommentDelete(int no) {
		// TODO Auto-generated method stub
		return freeBoardDao.freeBoardCommentDelete(no);
	}

	@Override
	public int freeBoardDelete(int no) {
		// TODO Auto-generated method stub
		return freeBoardDao.freeBoardDelete(no);
	}

	@Override
	public int freeBoardCommentAdd(int no,int mno, String comments) {
		// TODO Auto-generated method stub
		return freeBoardDao.freeBoardCommentAdd(no,mno,comments);
	}

	@Override
	public void freeBoardUpdate(int no, String title, String contents) {
		// TODO Auto-generated method stub
		freeBoardDao.freeBoardUpdate(no, title, contents);
	}

	
}
