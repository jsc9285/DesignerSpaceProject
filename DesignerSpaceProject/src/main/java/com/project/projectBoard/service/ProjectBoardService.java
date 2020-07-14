package com.project.projectBoard.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.member.model.MemberDto;
import com.project.projectBoard.model.ProjectBoardDto;
import com.project.projectBoard.model.ProjectBoardFileDto;
import com.project.projectBoard.model.ProjectCommentDto;

public interface ProjectBoardService {
	
	public List<ProjectBoardDto> projectBoardSelectList(String searchOption, String keyword, String sortOption, String categoryOption, int end);
	public int projectBoardTotalCount(String searchOption, String keyword, String categoryOption);
	
	public ProjectBoardDto projectBoardSelectOne(int no);	
	public List<ProjectBoardFileDto> projectBoardFileSelectList(int no);
	public List<ProjectCommentDto> projectCommentSelectList(int no);
	
	public int projectBoardInsertOne(ProjectBoardDto projectBoardDto, MemberDto sessionMemberDto,  MultipartHttpServletRequest mulRequest);
	public int projectBoardUpdateOne(String[] chkListFlag, String[] chkListFile, ProjectBoardDto projectBoardDto, MultipartHttpServletRequest mulRequest) throws Exception;
	
	public int projectBoardDeleteOne(int no);
	
	public int projectCommentInsertOne(ProjectCommentDto projectCommentDto);
	public int projectCommentUpdateOne(ProjectCommentDto projectCommentDto);
	public int projectCommentDeleteOne(int no);
}