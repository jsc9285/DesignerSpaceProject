package com.project.projectBoard.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.projectBoard.dao.ProjectBoardDao;
import com.project.projectBoard.model.ProjectBoardDto;

@Service
public class ProjectBoardServiceImpl implements ProjectBoardService{

	private static final Logger log = 
			LoggerFactory.getLogger(ProjectBoardServiceImpl.class);
	
	@Autowired
	public ProjectBoardDao projectBoardDao;

	@Override
	public List<ProjectBoardDto> projectBoardSelectList() {
		
		return projectBoardDao.projectBoardSelectList();
	}

	@Override
	public ProjectBoardDto projectBoardSelectOne(int no) {

		return projectBoardDao.projectBoardSelectOne(no);
	}
	
}