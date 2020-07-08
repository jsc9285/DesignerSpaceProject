package com.project.projectBoard.dao;

import java.util.List;
import java.util.Map;

import com.project.projectBoard.model.ProjectBoardDto;
import com.project.projectBoard.model.ProjectBoardFileDto;

public interface ProjectBoardDao {

	public List<ProjectBoardDto> projectBoardSelectList();
	
	public ProjectBoardDto projectBoardSelectOne(int no);	
	public List<ProjectBoardFileDto> projectBoardFileSelectList(int no);
	
	public int projectBoardInsertOne(ProjectBoardDto projectBoardDto);
	public int insertFile(Map<String, Object> map);
	
	public int projectBoardUpdateOne(ProjectBoardDto projectBoardDto);
	public int deleteFile(int project_board_no);
	public List<Map<String, Object>> fileSelectStoredFileName(int project_board_no);
	
	public int projectBoardDeleteOne(int no);
}