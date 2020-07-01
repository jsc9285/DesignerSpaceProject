package com.project.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.member.model.MemberDto;
import com.project.member.service.MemberService;


@Controller
public class memberController {


	
	private static final Logger log = 
		LoggerFactory.getLogger(memberController.class);


	@Autowired
	private MemberService memberService;	
	
	@RequestMapping(value = "/login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String mainLogin(@RequestParam(defaultValue = "")String member_email, Model model) {
		
		log.info("로그인 메인페이지 이동");
		
		System.out.println(member_email);
		model.addAttribute("member_email",member_email);
		System.out.println(member_email);
		return "login/loginMain";
	}
	
	@RequestMapping(value = "/loginCtr.do", method = RequestMethod.POST)
	public String mainboard(String member_email, String member_pwd, HttpSession session, Model model) {
		log.info("로그인 완료페이지 이동");
		
		MemberDto memberDto = memberService.memberExist(member_email, member_pwd);
		System.out.println("dddddddddddddddddddd"+memberDto);
		session.setAttribute("memberDto",memberDto);
		return "/login/loginDone";
	}
	
	
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String memberJoin(Model model) {
		log.info("회원가입페이지 이동");
		return "/login/memberJoin";
	}
	
	@RequestMapping(value = "/joinCtr.do", method = RequestMethod.POST)
	public String memberList(MemberDto memberDto, Model model) {
		log.info("회원가입 진행"+memberDto);
		
		
		memberService.memberAdd(memberDto);
		
		return "/login/alert/successAlert";
	}
	
	@RequestMapping(value = "/findId.do", method = RequestMethod.GET)
	public String findId(Model model) {
		log.info("아이디 찾기페이지로 이동");
		return "/login/findId";
	}
	
	@RequestMapping(value = "/findIdCtr.do", method = RequestMethod.POST)
	public String idInput(String member_name, String member_phone, Model model) {
		log.info("회원정보입력(아이디)");
		
		MemberDto memberDto = memberService.memberIdFind(member_name, member_phone);
		System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ"+memberDto);
		
		model.addAttribute("member_email",memberDto.getMember_email());
		System.out.println(memberDto.getMember_email());
		
		return "/login/alert/findIdAlert";
	}
	
	
	@RequestMapping(value = "findPwd.do", method = RequestMethod.GET)
	public String findPwd(Model model) {
		log.info("비밀번호 찾기페이지로 이동");
		return "/login/findPwd";
	}
	
	@RequestMapping(value = "/findPwdCtr.do", method = RequestMethod.POST)
	public String pwdInput(String member_email, int member_check_question, String member_check_answer, Model model) {
		log.info("회원정보입력(비밀번호)");
		
		MemberDto memberDto = memberService.memberPwdFind(member_email, member_check_question, member_check_answer);
		System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ"+memberDto);
		model.addAttribute("member_pwd",memberDto.getMember_pwd());
		System.out.println(memberDto.getMember_pwd());
		
		return "/login/alert/findPwdAlert";
	}
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String memberList(Model model) {
		log.info("회원목록이동");
		
		List<MemberDto> memberList = memberService.getMemberList();
		
		model.addAttribute("memberList", memberList);
		
		return "/login/memberList";
	}
	
	
		
}