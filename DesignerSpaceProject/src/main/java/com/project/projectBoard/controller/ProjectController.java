package com.project.projectBoard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.projectBoard.model.ProjectBoardDto;
import com.project.projectBoard.service.ProjectBoardService;


@Controller
public class ProjectController {

	private static final Logger log = 
		LoggerFactory.getLogger(ProjectController.class);

	@Autowired
	private ProjectBoardService projectBoardService;
	
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
		
		List<ProjectBoardDto> projectBoardList = projectBoardService.projectBoardSelectList();
				
		// 작품 리스트 출력정보
		// ( 작품제목, 작품파일(이미지 1개), 프로필 사진, 작성자명, 조회 수, 좋아요 수 )
		model.addAttribute("projectBoardList", projectBoardList);
		
		return "board/project/projectBoardList";
	}
	
	@RequestMapping(value = "projectBoard/detail.do", method = RequestMethod.GET)
	public String projectBoardDetail(int project_board_no, HttpSession session, Model model) {
		
		ProjectBoardDto projectBoardDto = projectBoardService.projectBoardSelectOne(project_board_no);
		
		model.addAttribute("projectBoardDto", projectBoardDto);
		
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