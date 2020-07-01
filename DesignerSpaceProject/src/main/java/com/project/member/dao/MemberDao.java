package com.project.member.dao;

import java.util.List;
import java.util.Map;

import com.project.member.model.MemberDto;
import com.project.member.model.MemberFileDto;


public interface MemberDao {


	public MemberDto memberExist(String member_email, String member_pwd);
	public MemberDto memberIdFind(String member_name, String member_phone);
	public MemberDto memberPwdFind(String member_email, int member_check_question, String member_check_answer);
	public void memberAdd(MemberDto memberDto);
	public List<MemberDto> getMemberList();
	
}

