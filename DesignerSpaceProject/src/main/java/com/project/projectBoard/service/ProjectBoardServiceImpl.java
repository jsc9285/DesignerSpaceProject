package com.project.projectBoard.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.projectBoard.dao.ProjectBoardDao;

@Service
public class ProjectBoardServiceImpl implements ProjectBoardService{

	private static final Logger log = 
			LoggerFactory.getLogger(ProjectBoardServiceImpl.class);
	
	@Autowired
	public ProjectBoardDao projectBoardDao;
	
}