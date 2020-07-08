package com.project.reportBoard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.qnaBoard.model.QnaBoardDto;
import com.project.qnaBoard.service.QnaBoardService;

@Controller
public class ReportBoardController {

	private static final Logger log = 
			LoggerFactory.getLogger(ReportBoardController.class);
	
//	@Autowired
//	private QnaBoardService qnaBoardService;
	
	
	// 신고게시판 목록
	@RequestMapping(value = "reportBoard/list.do", method = RequestMethod.GET) 
	public String ReportBoardList(Model model) {
		log.info("Welcome ReportBoardList!");
		
//		List<MemberDto> memberList = memberService.memberSelectList();
		
//		model.addAttribute("memberList", memberList);
		
		return "board/report/reportBoardList";
	}
	
	
	// 신고게시판 상세조회
	@RequestMapping(value = "reportBoard/listDetail.do", method = RequestMethod.GET)
	public String ReportBoardListDetail(Model model) {
		
		log.info("call ReportBoardListDetail!" );
		
//		QnaBoardDto qnaBoardDto = qnaBoardService.qnaBoardSelectDetail(QNA_BOARD_NO);
//		
//		model.addAttribute("qnaBoardDto", qnaBoardDto);
		
		return "board/report/reportBoardDetail";
	}
	
	// 신고게시판 추가
	@RequestMapping(value = "reportBoard/add.do", method = RequestMethod.GET) 
	public String ReportBoardAdd(Model model) {
		log.info("Welcome ReportBoardAdd!");
		
//		List<MemberDto> memberList = memberService.memberSelectList();
		
//		model.addAttribute("memberList", memberList);
		
		return "board/report/reportBoardAdd";
	}
	
	// 신고게시판 추가 로직
	@RequestMapping(value = "reportBoard/addCtr.do", method = RequestMethod.POST) 
	public String ReportBoardAddCtr(Model model) {
		log.info("Welcome ReportBoardAdd_ctr!");
		
//		List<MemberDto> memberList = memberService.memberSelectList();
		
//		model.addAttribute("memberList", memberList);
		
		return "redirect:list.do";
	}
	
	
}
