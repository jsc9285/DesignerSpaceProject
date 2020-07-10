package com.project.reportBoard.controller;

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
import com.project.reportBoard.model.ReportBoardDto;
import com.project.reportBoard.service.ReportBoardService;

@Controller
public class ReportBoardController {

	private static final Logger log = 
			LoggerFactory.getLogger(ReportBoardController.class);
	
	@Autowired
	private ReportBoardService reportBoardService;
	
	
	@RequestMapping(value = "reportBoard/list.do", method = RequestMethod.GET)
	public String reportBoardList(@RequestParam(defaultValue = "1") int curPage
							 , @RequestParam(defaultValue = "0") int report_board_no
							 , @RequestParam(defaultValue = "titleAndContent") String searchOption
							 , @RequestParam(defaultValue = "report_board_whole") String sortOption
							 , @RequestParam(defaultValue = "") String keyword
							 , Model model) {
		log.info("Welcome reportBoardList! " + curPage + " : ????"
				+ searchOption + " : " + keyword);
		
		if("writer".equals(searchOption)) {
			searchOption = "member_nick";
		}
		
		if("title".equals(searchOption)) {
			searchOption = "report_board_title";
		}
		
		if("content".equals(searchOption)) {
			searchOption = "report_board_contents";
		}
		
		int totalCount = 
				reportBoardService.reportBoardSelectTotalCount(searchOption, keyword);
		
		if(report_board_no != 0) {
			curPage 
				= reportBoardService.reportSelectCurPage(searchOption, keyword, report_board_no);
		}
		
		com.project.util.Paging reportBoardPaging = new com.project.util.Paging(totalCount, curPage);
		int start = reportBoardPaging.getPageBegin();
		int end = reportBoardPaging.getPageEnd();
				
		List<ReportBoardDto> reportBoardList = reportBoardService.reportBoardSelectList(
				searchOption, keyword, sortOption, start, end);
		
//		 화면의 form의 이름을 맞추기 위한 작업
		if("member_nick".equals(searchOption)) {
			searchOption = "writer";
		}
		
		if("report_board_title".equals(searchOption)) {
			searchOption = "title";
		}
		
		if("report_board_contents".equals(searchOption)) {
			searchOption = "content";
		}
		
		// 검색
		HashMap<String, Object> searchMap 
			= new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		searchMap.put("sortOption", sortOption);
		
		// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("paging", reportBoardPaging);

		model.addAttribute("reportBoardList", reportBoardList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);
		
		return "board/report/reportBoardList";
	}
	
	
	@RequestMapping(value = "reportBoard/listDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String reportBoardListDetail(@RequestParam(defaultValue = "1") int curPage
			 , @RequestParam(defaultValue = "0") int report_board_no
			 , @RequestParam(defaultValue = "titleAndContent") String searchOption
			 , @RequestParam(defaultValue = "") String keyword
			 , Model model) {
		
		log.info("Welcome reportBoardListDetail! " + curPage + " : ????"
				+ searchOption + " : " + keyword);
		
		ReportBoardDto reportBoardDto = reportBoardService.reportBoardSelectDetail(report_board_no);
		
		model.addAttribute("reportBoardDto", reportBoardDto);
		
//		int totalCount = 
//				reportBoardService.qnaBoardCommentSelectTotalCount(report_board_no);
		
//		CommentPaging reportCommentPaging = new CommentPaging(totalCount, curPage);
//		int end = reportCommentPaging.getPageEnd();
				
//		List<ReportBoardDto> reportBoardCommentList = 
//				reportBoardService.qnaBoardCommentSelectList(report_board_no, end);
		
//		model.addAttribute("qnaBoardCommentList", qnaBoardCommentList);
//		model.addAttribute("freeBoardCommentPaging", qnaCommentPaging);
		
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		
		return "board/report/reportBoardDetail";
	}
	
	// 신고게시판 추가 화면
	@RequestMapping(value = "reportBoard/add.do", method = RequestMethod.GET) 
	public String ReportBoardAdd(Model model) {
		
		log.info("Welcome ReportBoardAdd!");
		
		return "board/report/reportBoardAdd";
	}
	
	// 신고게시판 추가 로직
	@RequestMapping(value = "reportBoard/addCtr.do", method = RequestMethod.POST) 
	public String ReportBoardAddCtr(ReportBoardDto reportBoardDto, Model model) {
		
		log.info("Welcome ReportBoardAdd_ctr!");
		
		reportBoardService.reportBoardInsertOne(reportBoardDto);
		
		return "redirect:./list.do";
	}
	
}