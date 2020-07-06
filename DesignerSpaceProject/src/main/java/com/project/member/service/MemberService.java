package com.project.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.member.model.MemberDto;

public interface MemberService {

	
	public MemberDto memberExist(String member_email, String member_pwd);
	public MemberDto memberIdFind(String member_name, String member_phone);
	public MemberDto memberPwdFind(String member_email, int member_check_question, String member_check_answer);
	public void memberAdd(MemberDto memberDto, MultipartHttpServletRequest mulRequest);
	
	public List<MemberDto> getMemberList();
	public MemberDto memberInfo(int member_no);
	public String memberMod(int member_no);
	public MemberDto memberModDetail(int member_no);
	void memberUpdate(MemberDto memberDto, MultipartHttpServletRequest mulRequest);
}
