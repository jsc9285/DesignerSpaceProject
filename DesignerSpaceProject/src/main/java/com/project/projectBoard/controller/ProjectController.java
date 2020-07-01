package com.project.projectBoard.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ProjectController {

	private static final Logger log = 
		LoggerFactory.getLogger(ProjectController.class);

	
	@RequestMapping(value = "main/member.do", method = RequestMethod.GET)
	public String mainMember(HttpSession session, Model model) {
		
		return "main/memberMain";
	}
	
	@RequestMapping(value = "main/admin.do", method = RequestMethod.GET)
	public String adminMember(HttpSession session, Model model) {
		
		return "main/adminMain";
	}
		
}