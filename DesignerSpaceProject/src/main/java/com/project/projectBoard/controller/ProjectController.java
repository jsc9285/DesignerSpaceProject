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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.member.model.MemberDto;
import com.project.projectBoard.model.ProjectBoardDto;
import com.project.projectBoard.model.ProjectBoardFileDto;
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
		projectBoardDto.setProject_board_no(project_board_no);
		List<ProjectBoardFileDto> projectBoardFileList = projectBoardService.projectBoardFileSelectList(project_board_no);
		
		model.addAttribute("projectBoardDto", projectBoardDto);
		model.addAttribute("projectBoardFileList", projectBoardFileList);
		
		return "board/project/projectBoardDetail";
	}
	
	@RequestMapping(value = "projectBoard/add.do", method = RequestMethod.GET)
	public String projectBoardAdd(HttpSession session, Model model) {
		
		return "board/project/projectBoardAdd";
	}
	
	@RequestMapping(value = "projectBoard/addCtr.do", method = RequestMethod.POST)
	public String projectBoardAddCtr(ProjectBoardDto projectBoardDto, MultipartHttpServletRequest mulRequest, HttpSession session, Model model) {
		
		MemberDto sessionMemberDto = (MemberDto)session.getAttribute("memberDto");
		
		int checkInsert = projectBoardService.projectBoardInsertOne(projectBoardDto, sessionMemberDto, mulRequest);
		
		return "redirect:/projectBoard/list.do";
	}
	
	@RequestMapping(value = "projectBoard/update.do", method = RequestMethod.GET)
	public String projectBoardUpdate(int project_board_no, HttpSession session, Model model) {
		
		ProjectBoardDto projectBoardDto = projectBoardService.projectBoardSelectOne(project_board_no);
		projectBoardDto.setProject_board_no(project_board_no);
		List<ProjectBoardFileDto> projectBoardFileList = projectBoardService.projectBoardFileSelectList(project_board_no);
		
		model.addAttribute("projectBoardDto", projectBoardDto);
		model.addAttribute("projectBoardFileList", projectBoardFileList);
		
		return "board/project/projectBoardUpdate";
	}
	
	@RequestMapping(value = "projectBoard/updateCtr.do", method = RequestMethod.POST)
	public String projectBoardUpdateCtr(ProjectBoardDto projectBoardDto, MultipartHttpServletRequest mulRequest, HttpSession session, Model model) {		
		
		try {
			int checkUpdate = projectBoardService.projectBoardUpdateOne(projectBoardDto, mulRequest);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("project_board_no", projectBoardDto.getProject_board_no());
		
		return "redirect:/projectBoard/detail.do";
	}
	
	@RequestMapping(value = "projectBoard/deleteCtr.do", method = RequestMethod.GET)
	public String projectBoardUpdateCtr(int project_board_no, HttpSession session, Model model) {		
		
		projectBoardService.projectBoardDeleteOne(project_board_no);
		
		return "redirect:/projectBoard/list.do";
	}
	
//	============================== 관리자용 작품관리 
	@RequestMapping(value = "projectBoard/management.do", method = RequestMethod.GET)
	public String projectBoardManagement(HttpSession session, Model model) {		
				
		List<ProjectBoardDto> projectBoardList = projectBoardService.projectBoardSelectList();
		
		model.addAttribute("projectBoardList", projectBoardList);
		
		return "board/project/projectBoardManagement";
	}
	
	@RequestMapping(value = "projectBoard/ManagementDeleteCtr.do", method = RequestMethod.GET)
	public String projectBoardManagementDelete(int[] projectCheck, HttpSession session, Model model) {		
		
		System.out.println(projectCheck.length);
		for (int i = 0; i < projectCheck.length; i++) {
			projectBoardService.projectBoardDeleteOne(projectCheck[i]);
		}
		
		return "redirect:/projectBoard/management.do";
	}
}