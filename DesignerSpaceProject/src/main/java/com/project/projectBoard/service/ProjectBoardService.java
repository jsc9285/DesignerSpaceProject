package com.project.projectBoard.service;

import java.util.List;

import com.project.projectBoard.model.ProjectBoardDto;

public interface ProjectBoardService {
	
	public List<ProjectBoardDto> projectBoardSelectList(); 
	public ProjectBoardDto projectBoardSelectOne(int no);
	
}