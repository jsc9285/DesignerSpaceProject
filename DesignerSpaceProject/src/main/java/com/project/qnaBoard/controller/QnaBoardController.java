package com.project.qnaBoard.controller;

import java.util.List;

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
public class QnaBoardController {

	private static final Logger log = 
			LoggerFactory.getLogger(QnaBoardController.class);
	
	@Autowired
	private QnaBoardService qnaBoardService;
	
	@RequestMapping(value = "qnaBoard/list.do", method = RequestMethod.GET)
	public String qnaBoardList(Model model) {
		log.info("Welcome MemberList!");
		
		List<QnaBoardDto> qnaBoardList = qnaBoardService.qnaBoardSelectList();
		
		model.addAttribute("qnaBoardList", qnaBoardList);
		
		return "board/qna/qnaBoardList";
	}
	
	@RequestMapping(value = "qnaBoard/update.do", method = RequestMethod.GET)
	public String qnaBoardListDetail(int QNA_BOARD_NO, Model model) {
		
		log.info("call qnaBoardListDetail! {}", QNA_BOARD_NO);
		
		QnaBoardDto qnaBoardDto = qnaBoardService.qnaBoardSelectDetail(QNA_BOARD_NO);
		
		model.addAttribute("qnaBoardDto", qnaBoardDto);
		
		return "board/qna/qnaBoardDetail";
	}
}
