package com.project.projectBoard.dao;

import java.util.List;
import java.util.Map;

import com.project.projectBoard.model.ProjectBoardDto;
import com.project.projectBoard.model.ProjectBoardFileDto;
import com.project.projectBoard.model.ProjectCommentDto;

public interface ProjectBoardDao {

	public List<ProjectBoardDto> projectBoardSelectList(String searchOption, String keyword, String sortOption, String categoryOption, int end);
	public int projectBoardTotalCount(String searchOption, String keyword, String categoryOption);
	
	public ProjectBoardDto projectBoardSelectOne(int no);	
	public List<ProjectBoardFileDto> projectBoardFileSelectList(int no);
	public List<ProjectCommentDto> projectCommentSelectList(int no);
	
	public int projectBoardInsertOne(ProjectBoardDto projectBoardDto);
	public int insertFile(Map<String, Object> map);
	
	public int projectBoardUpdateOne(ProjectBoardDto projectBoardDto);
	public int deleteFile(int project_board_no);
	public List<Map<String, Object>> fileSelectStoredFileName(int project_board_no);
	
	public int projectBoardDeleteOne(int no);
	
	public int projectCommentInsertOne(ProjectCommentDto projectCommentDto);
	public int projectCommentUpdateOne(ProjectCommentDto projectCommentDto);
	public int projectCommentDeleteOne(int no);
}