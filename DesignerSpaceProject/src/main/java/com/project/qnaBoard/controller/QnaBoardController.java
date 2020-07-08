package com.project.qnaBoard.controller;

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

import com.project.qnaBoard.model.QnaBoardDto;
import com.project.qnaBoard.service.QnaBoardService;

@Controller
public class QnaBoardController {

	private static final Logger log = 
			LoggerFactory.getLogger(QnaBoardController.class);
	
	@Autowired
	private QnaBoardService qnaBoardService;
	
	
	// qna게시판 목록
	@RequestMapping(value = "qnaBoard/list.do", method = RequestMethod.GET)
	public String qnaBoardList(@RequestParam(defaultValue = "1") int curPage
							 , @RequestParam(defaultValue = "0") int QNA_BOARD_NO
							 , @RequestParam(defaultValue = "titleAndContent") String searchOption
							 , @RequestParam(defaultValue = "") String keyword
							 , Model model) {
		log.info("Welcome qnaBoardList! " + curPage + " : ????"
				+ searchOption + " : " + keyword);
		
		if("writer".equals(searchOption)) {
			searchOption = "MEMBER_NICK";
		}
		
		if("title".equals(searchOption)) {
			searchOption = "QNA_BOARD_TITLE";
		}
		
		if("content".equals(searchOption)) {
			searchOption = "QNA_BOARD_CONTENTS";
		}
		
		int totalCount = 
				qnaBoardService.qnaBoardSelectTotalCount(searchOption, keyword);
		
		if(QNA_BOARD_NO != 0) {
			curPage 
				= qnaBoardService.qnaSelectCurPage(searchOption, keyword, QNA_BOARD_NO);
		}
		
		com.project.util.Paging qnaBoardPaging = new com.project.util.Paging(totalCount, curPage);
		int start = qnaBoardPaging.getPageBegin();
		int end = qnaBoardPaging.getPageEnd();
				
		List<QnaBoardDto> qnaBoardList = qnaBoardService.qnaBoardSelectList(
				searchOption, keyword, start, end);
		
//		 화면의 form의 이름을 맞추기 위한 작업
		if("MEMBER_NICK".equals(searchOption)) {
			searchOption = "writer";
		}
		
		if("QNA_BOARD_TITLE".equals(searchOption)) {
			searchOption = "title";
		}
		
		if("QNA_BOARD_CONTENTS".equals(searchOption)) {
			searchOption = "content";
		}
		
		// 검색
		HashMap<String, Object> searchMap 
			= new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("paging", qnaBoardPaging);

		model.addAttribute("qnaBoardList", qnaBoardList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);
		
		model.addAttribute("qnaBoardList", qnaBoardList);
		
		return "board/qna/qnaBoardList";
	}
	
	// qna 게시판 상세조회
	@RequestMapping(value = "qnaBoard/listDetail.do", method = RequestMethod.GET)
	public String qnaBoardListDetail(int QNA_BOARD_NO, Model model) {
		
		log.info("call qnaBoardListDetail! {}", QNA_BOARD_NO);
		
		QnaBoardDto qnaBoardDto = qnaBoardService.qnaBoardSelectDetail(QNA_BOARD_NO);
		
		model.addAttribute("qnaBoardDto", qnaBoardDto);
		
		return "board/qna/qnaBoardDetail";
	}
	
	
	// qna 게시물 수정
	@RequestMapping(value = "qnaBoard/update.do", method = RequestMethod.GET)
	public String qnaBoardUpdate(int QNA_BOARD_NO, Model model) {
		
		log.info("call qnaBoardUpdate! {}", QNA_BOARD_NO);
		
		QnaBoardDto qnaBoardDto = qnaBoardService.qnaBoardSelectDetail(QNA_BOARD_NO);
		
		model.addAttribute("qnaBoardDto", qnaBoardDto);
		
		return "board/qna/qnaBoardUpdate";
	}
	
	// qna 게시물 수정 로직
	@RequestMapping(value = "qnaBoard/updateCtr.do", method = RequestMethod.POST)
	public String qnaBoardUpdateCtr(QnaBoardDto qnaBoardDto, Model model) {
		
		log.info("call qnaBoardUpdateCtr! " + qnaBoardDto);
		
		qnaBoardService.qnaBoardUpdateOne(qnaBoardDto);
		
		model.addAttribute("qnaBoardDto", qnaBoardDto);
		
		return "redirect:list.do";
	}
	
	@RequestMapping(value = "qnaBoard/add.do", method = RequestMethod.GET)
	public String qnaBoardAdd(Model model) {
		
		log.info("call qnaBoardAdd!");
		
		return "board/qna/qnaBoardAdd";
	}
	
	@RequestMapping(value = "qnaBoard/addCtr.do", method = RequestMethod.POST)
	public String qnaBoardAddCtr(QnaBoardDto qnaBoardDto, Model model) {
		
		log.info("call qnaBoardAdd_ctr! {}", qnaBoardDto);
		
		qnaBoardService.qnaBoardInsertOne(qnaBoardDto);
		
		return "redirect:list.do";
	}
	
	@RequestMapping(value = "qnaBoard/deleteCtr.do", method = RequestMethod.GET)
	public String qnaBoardDeleteCtr(int QNA_BOARD_NO, Model model) {
		
		log.info("call qnaBoardDelete_ctr! " + QNA_BOARD_NO);
		
		qnaBoardService.qnaBoardDeleteOne(QNA_BOARD_NO);
		
		return "redirect:list.do";
	}

}
