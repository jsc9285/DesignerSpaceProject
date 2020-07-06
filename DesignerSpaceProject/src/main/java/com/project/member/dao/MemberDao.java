package com.project.member.dao;

import java.util.List;
import java.util.Map;

import com.project.member.model.MemberDto;


public interface MemberDao {


	public MemberDto memberExist(String member_email, String member_pwd);
	public MemberDto memberIdFind(String member_name, String member_phone);
	public MemberDto memberPwdFind(String member_email, int member_check_question, String member_check_answer);
	public void memberAdd(MemberDto memberDto);
	public List<MemberDto> getMemberList();
	public void profileAdd(Map<String, Object> map);//프로필 추가
	public MemberDto memberInfo(int member_no);
	public String memberMod(int member_no);
	public MemberDto memberModDetail(int member_no);
	public void memberUpdate(MemberDto memberDto);//멤버업데이트
	public Map<String, Object> profileSelectStoredFileName(int profile_table_mno);//존재하는 프로필검색
	public void profileDelete(int profile_table_mno);//프로필 삭제

}

