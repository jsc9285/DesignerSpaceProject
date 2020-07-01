package com.project.projectBoard.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ProjectController {

	private static final Logger log = 
		LoggerFactory.getLogger(ProjectController.class);

//	============================== 메인페이지
	@RequestMapping(value = "main/member.do", method = RequestMethod.GET)
	public String mainMember(HttpSession session, Model model) {
		
		return "main/mainMember";
	}
	
	@RequestMapping(value = "main/admin.do", method = RequestMethod.GET)
	public String adminMember(HttpSession session, Model model) {
		
		return "main/mainAdmin";
	}
//	============================== 작품게시판
	@RequestMapping(value = "projectBoard/list.do", method = RequestMethod.GET)
	public String projectBoard(HttpSession session, Model model) {
		
		return "board/project/projectBoardList";
	}
	
	@RequestMapping(value = "projectBoard/detail.do", method = RequestMethod.GET)
	public String projectBoardDetail(HttpSession session, Model model) {
		
		return "board/project/projectBoardDetail";
	}
	
	@RequestMapping(value = "projectBoard/add.do", method = RequestMethod.GET)
	public String projectBoardAdd(HttpSession session, Model model) {
		
		return "board/project/projectBoardAdd";
	}
	
	@RequestMapping(value = "projectBoard/update.do", method = RequestMethod.GET)
	public String projectBoardUpdate(HttpSession session, Model model) {
		
		return "board/project/projectBoardUpdate";
	}
//	============================== 
}