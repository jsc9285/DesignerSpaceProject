package com.project.projectBoard.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.member.model.MemberDto;
import com.project.projectBoard.model.ProjectBoardDto;
import com.project.projectBoard.model.ProjectBoardFileDto;

public interface ProjectBoardService {
	
	public List<ProjectBoardDto> projectBoardSelectList();
	
	public ProjectBoardDto projectBoardSelectOne(int no);	
	public List<ProjectBoardFileDto> projectBoardFileSelectList(int no);
	
	public int projectBoardInsertOne(ProjectBoardDto projectBoardDto, MemberDto sessionMemberDto,  MultipartHttpServletRequest mulRequest);
	public int projectBoardUpdateOne(ProjectBoardDto projectBoardDto, MultipartHttpServletRequest mulRequest) throws Exception;
	
	public int projectBoardDeleteOne(int no);
}