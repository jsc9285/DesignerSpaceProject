package com.project.freeBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.freeBoard.model.FreeBoardDto;
import com.project.freeBoard.service.FreeBoardService;
import com.project.util.CommentPaging;
import com.project.util.Paging;

@Controller
public class FreeBoardController {

	private static final Logger log = 
		LoggerFactory.getLogger(FreeBoardController.class);
	
	@Autowired
	private FreeBoardService freeBoardService;
	
	@RequestMapping(value = "/freeBoard/free.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String free(@RequestParam(defaultValue="1") int curPage
			,@RequestParam(defaultValue = "0") int no
			, @RequestParam(defaultValue = "all") String searchOption
			, @RequestParam(defaultValue = "") String keyword
			,Model model) {
		log.info("Welcome free!");
		
		if("title".equals(searchOption)) {
			searchOption = "free_board_title";
		}
		
		if("writer".equals(searchOption)) {
			searchOption = "member_nick";
		}
		
		int totalCount = 
				freeBoardService.freeBoardSelectTotalCount(
						searchOption, keyword
		);
		
		if(no != 0) {
			curPage 
				= freeBoardService.freeBoardSelectCurPage(
						searchOption, keyword, no);
		}
		
		Paging freeBoardPaging = new Paging(totalCount, curPage);
		int start = freeBoardPaging.getPageBegin();
		int end = freeBoardPaging.getPageEnd();

		List<FreeBoardDto> freeBoardList = 
				freeBoardService.freeBoardSelectList(searchOption, keyword
				, start, end);
		
		if("free_board_title".equals(searchOption)) {
			searchOption = "title";
		}
		
		if("member_nick".equals(searchOption)) {
			searchOption = "writer";
		}
		
		HashMap<String, Object> searchMap 
			= new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		// 페이징
		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("freeBoardPaging", freeBoardPaging);
	
		model.addAttribute("freeBoardList", freeBoardList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);
		
		
		return "/board/free/freeBoardListView";
	}

	@RequestMapping(value = "/freeBoard/freeBoardListOne.do"
		, method = RequestMethod.GET)
	public String memberListOne(@RequestParam(defaultValue="0")int no
//			, int fcno
			,String searchOption
			,String keyword
			,@RequestParam(defaultValue="1") int curPage
			,Model model) {
		log.info("call freeBoardListOne! - " + no + "\n" + searchOption
				+ "\n" + keyword);
		
		
		//조회수
		int view = freeBoardService.freeBoardView(no);
		
		Map<String, Object> map = freeBoardService.freeBoardSelectOne(no);
		
		FreeBoardDto freeBoardDto = (FreeBoardDto)map.get("freeBoardDto");
		
		List<Map<String, Object>> fileList = 
			(List<Map<String, Object>>)map.get("fileList");
		

		//////
		int totalCount = 
				freeBoardService.freeBoardCommentSelectTotalCount(no);
		
//		if(no != 0) {
//			curPage 
//				= freeBoardService.freeBoardCommentSelectCurPage(no, fcno);
//		}
		
		CommentPaging freeBoardCommentPaging = new CommentPaging(totalCount, curPage);
		int end = freeBoardCommentPaging.getPageEnd();

		List<FreeBoardDto> freeBoardCommentList = 
				freeBoardService.freeBoardCommentSelectList(no, end);
		
		// 페이징
		
//		Map<String, Object> pagingMap = new HashMap<>();
//		pagingMap.put("totalCount", totalCount);
//		pagingMap.put("freeBoardCommentPaging", freeBoardCommentPaging);
//	
		model.addAttribute("freeBoardCommentList", freeBoardCommentList);
		model.addAttribute("freeBoardCommentPaging", freeBoardCommentPaging);
//		model.addAttribute("pagingMap", pagingMap);
		//////
		
		
		model.addAttribute("freeBoardDto", freeBoardDto);
		model.addAttribute("fileList", fileList);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		
		return "/board/free/freeBoardListOneView";
	}
	
		
}
