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
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		
		
		model.addAttribute("member_email",member_email);
		log.info(member_email);
		
		return "login/loginMain";
	}
	
	@RequestMapping(value = "/member/loginCtr.do", method = RequestMethod.POST)
	public String mainboard(String member_email, String member_pwd, HttpSession session, Model model) {
		log.info("로그인 완료페이지 이동");
		
		MemberDto memberDto = memberService.memberExist(member_email, member_pwd);
		System.out.println("dddddddddddddddddddd"+memberDto);
		session.setAttribute("memberDto",memberDto);
		
		if(memberDto.getMember_grade()==0) {
			return "redirect:/main/member.do";	
		}else {
			return "redirect:/main/admin.do";	
		}
		//return /login/loginDone
		
	}
	
	// 로그아웃
		@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
		public String logout(HttpSession session, Model model) {
			log.info("로그아웃 gogo");

			session.invalidate();
			
			return "redirect:/login.do";
		}
	
	
	@RequestMapping(value = "/member/join.do", method = RequestMethod.GET)
	public String memberJoin(Model model) {
		log.info("회원가입페이지 이동");
		return "/login/memberJoin";
	}
	
	@RequestMapping(value = "/member/joinCtr.do", method = RequestMethod.POST)
	public String memberList(MemberDto memberDto, MultipartHttpServletRequest mulRequest, Model model) {
		log.info("회원가입 진행"+memberDto);
		
		
		
		memberService.memberAdd(memberDto, mulRequest);
		
		return "/login/alert/successAlert";
	}
	
	@RequestMapping(value = "/member/findId.do", method = RequestMethod.GET)
	public String findId(Model model) {
		log.info("아이디 찾기페이지로 이동");
		return "/login/findId";
	}
	
	@RequestMapping(value = "/member/findIdCtr.do", method = RequestMethod.POST)
	public String idInput(String member_name, String member_phone, Model model) {
		log.info("회원정보입력(아이디)");
		
		MemberDto memberDto = memberService.memberIdFind(member_name, member_phone);
		System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ"+memberDto);
		
		model.addAttribute("member_email",memberDto.getMember_email());
		System.out.println(memberDto.getMember_email());
		
		return "/login/alert/findIdAlert";
	}
	
	
	@RequestMapping(value = "/member/findPwd.do", method = RequestMethod.GET)
	public String findPwd(Model model) {
		log.info("비밀번호 찾기페이지로 이동");
		return "/login/findPwd";
	}
	
	@RequestMapping(value = "/member/findPwdCtr.do", method = RequestMethod.POST)
	public String pwdInput(String member_email, int member_check_question, String member_check_answer, Model model) {
		log.info("회원정보입력(비밀번호)");
		
		MemberDto memberDto = memberService.memberPwdFind(member_email, member_check_question, member_check_answer);
		System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ"+memberDto);
		model.addAttribute("member_pwd",memberDto.getMember_pwd());
		System.out.println(memberDto.getMember_pwd());
		
		return "/login/alert/findPwdAlert";
	}
	
	
	//회원정보조회
	@RequestMapping(value = "/member/info.do", method = RequestMethod.GET)
	public String memberInfo(HttpSession session, Model model) {
		log.info("회원정보 조회 페이지 이동");
		
		MemberDto sessionMemeberDto = (MemberDto)session.getAttribute("memberDto");
		System.out.println(sessionMemeberDto);
		
		MemberDto memberDto = memberService.memberInfo(sessionMemeberDto.getMember_no());
		
		
		model.addAttribute("memberDto", memberDto);
		
		return "/member/memberInfo";
	}
		
	//회원정보 수정
	@RequestMapping(value = "/member/modInfo.do", method = RequestMethod.GET)
	public String memberMod(HttpSession session, Model model) {
		log.info("회원정보 수정 페이지 이동");
		
		int member_no = ((MemberDto)session.getAttribute("memberDto")).getMember_no();
		System.out.println(member_no);
		
		String getPwd = memberService.memberMod(member_no);
		
		
		model.addAttribute("member_no", member_no);
		model.addAttribute("member_pwd", getPwd);
		
		
		return "/member/memberModify";
	}
	
	//회원정보 수정 상세
		@RequestMapping(value = "/member/modInfoDetail.do", method = RequestMethod.GET)
		public String memberModDetail(HttpSession session, Model model) {
			log.info("회원정보 상세수정 페이지 이동");
			
			int member_no = ((MemberDto)session.getAttribute("memberDto")).getMember_no();
			
			System.out.println(member_no);
			
			MemberDto memberDto = memberService.memberModDetail(member_no);
			
			model.addAttribute("memberDto", memberDto);
			
			
			return "/member/memberModifyDetail";
		}
		
		@RequestMapping(value = "/member/modInfoDetailCtr.do", method = RequestMethod.POST)
		public String memberUpdate(MemberDto memberDto, String change, MultipartHttpServletRequest mulRequest,
			HttpSession session, Model model){
			
			log.info("회원정보 수정 가즈아"+memberDto);
			
			
			memberService.memberUpdate(memberDto, change, mulRequest);
			
			System.out.println("●▅▇█▇▅▄▄▌●▅▇█▇▅▄▄▌성공●▅▇█▇▅▄▄▌●▅▇█▇▅▄▄▌");
			
			memberDto = memberService.memberExist(memberDto.getMember_email(), memberDto.getMember_pwd());
			session.setAttribute("memberDto",memberDto);
			
			return "/member/alert/updateSuccess";
		}
		//----------------------------------------------------------------------
		@RequestMapping(value = "/myBoard.do", method = RequestMethod.GET)
		public String myBoard(MemberDto memberDto, HttpSession session, Model model){
			
			log.info("내글목록보기"+memberDto);
			
			
			
			
			return "/member/myBoard";
		}
		
		@RequestMapping(value = "/myReport.do", method = RequestMethod.GET)
		public String myNotify(MemberDto memberDto, HttpSession session, Model model){
			
			log.info("내 신고글 보기"+memberDto);
			
			
			
			
			return "/member/myReport";
		}
		
		@RequestMapping(value = "/myQna.do", method = RequestMethod.GET)
		public String myQna(MemberDto memberDto, HttpSession session, Model model){
			
			log.info("내 QNA 보기"+memberDto);
			
			return "/member/myQna";
		}
		
		@RequestMapping(value = "/admin/listAdmin.do", method = RequestMethod.GET)
		public String memberList(HttpSession session, Model model){
			
			log.info("관리자용 회원관리");
			
			List<MemberDto> memberList = memberService.getMemberList();
			
			model.addAttribute("memberList", memberList);
			
			return "/member/memberListAdmin";
		}
		
		
		
		@RequestMapping(value = "/listOneAdmin.do", method = RequestMethod.GET)
		public String memberOne(MemberDto memberDto, HttpSession session, Model model){
			
			log.info("관리자용 회원정보보기"+memberDto);
			
			return "/member/memberOneAdmin";
		}
		
}