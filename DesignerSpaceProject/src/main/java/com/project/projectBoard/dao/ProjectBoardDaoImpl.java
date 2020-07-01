package com.project.projectBoard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.projectBoard.model.ProjectBoardDto;


@Repository
public class ProjectBoardDaoImpl implements ProjectBoardDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.project.projectBoard.";

	@Override
	public List<ProjectBoardDto> projectBoardSelectList() {
		
		List<ProjectBoardDto> projectBoardList = sqlSession.selectList(namespace + "projectBoardSelectList"); 
		
		return projectBoardList;
	}

	@Override
	public ProjectBoardDto projectBoardSelectOne(int no) {
		
		ProjectBoardDto projectBoardDto = sqlSession.selectOne(namespace + "projectBoardSelectOne", no);
		
		return projectBoardDto;
	}

}
