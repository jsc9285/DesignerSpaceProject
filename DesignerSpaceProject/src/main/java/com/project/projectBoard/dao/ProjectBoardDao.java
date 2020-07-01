package com.project.projectBoard.dao;

import java.util.List;

import com.project.projectBoard.model.ProjectBoardDto;

public interface ProjectBoardDao {

	public List<ProjectBoardDto> projectBoardSelectList(); 
	public ProjectBoardDto projectBoardSelectOne(int no);
}