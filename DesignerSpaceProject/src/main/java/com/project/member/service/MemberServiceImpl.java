package com.project.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.member.dao.MemberDao;
import com.project.member.model.MemberDto;
import com.project.member.model.MemberFileDto;


@Service
public class MemberServiceImpl implements MemberService{

	private static final Logger log = 
			LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	public MemberDao memberDao;	
	

	@Override
	public MemberDto memberExist(String member_email, String member_pwd) {
		// TODO Auto-generated method stub
		
		MemberDto memberDto = memberDao.memberExist(member_email, member_pwd);
		
		return memberDto;
	}
	
	@Override
	public void memberAdd(MemberDto memberDto) {
		// TODO Auto-generated method stub
		System.out.println("ooooooo00000000000000000000000ooooooooooo");
		
		
		memberDao.memberAdd(memberDto);
		
		
		
	}
	
	@Override
	public MemberDto memberIdFind(String member_name, String member_phone) {
		// TODO Auto-generated method stub
		
		MemberDto memberDto = memberDao.memberIdFind(member_name, member_phone);
		
		return memberDto;
	}
	
	
	@Override
	public MemberDto memberPwdFind(String member_email, int member_check_question, String member_check_answer) {
		// TODO Auto-generated method stub
		
		MemberDto memberDto = memberDao.memberPwdFind(member_email, member_check_question, member_check_answer);
		
		return memberDto;
	}

	

	@Override
	public List<MemberDto> getMemberList() {
		// TODO Auto-generated method stub
		System.out.println("회원목록 service 접속");
		List<MemberDto> getMemberList = memberDao.getMemberList();
		
		return getMemberList;
	}

	

	
}
