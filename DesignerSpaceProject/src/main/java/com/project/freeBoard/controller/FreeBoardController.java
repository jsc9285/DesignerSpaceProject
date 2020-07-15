package com.project.freeBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.freeBoard.model.FreeBoardDto;
import com.project.freeBoard.service.FreeBoardService;
import com.project.reportBoard.model.ReportBoardDto;
import com.project.util.CommentPaging;
import com.project.util.Paging;

@Controller
public class FreeBoardController {

	private static final Logger log = 
		LoggerFactory.getLogger(FreeBoardController.class);
	
	@Autowired
	private FreeBoardService freeBoardService;
	
	@RequestMapping(value = "/freeBoard/free.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String free(@RequestParam(defaultValue="1") int curPage
			,@RequestParam(defaultValue = "0") int no
			, @RequestParam(defaultValue = "all") String searchOption
			, @RequestParam(defaultValue = "") String keyword
			, @RequestParam(defaultValue = "free_board_no") String lineTitle
			,@RequestParam(defaultValue = "0") int mno
			,Model model) {
		log.info("Welcome free!");
		
		
		int totalCount = 
				freeBoardService.freeBoardSelectTotalCount(
						searchOption, keyword
		);
		
		if(no != 0) {
			curPage 
				= freeBoardService.freeBoardSelectCurPage(
						searchOption, keyword, no, lineTitle);
		}
		
		Paging freeBoardPaging = new Paging(totalCount, curPage);
		int start = freeBoardPaging.getPageBegin();
		int end = freeBoardPaging.getPageEnd();

		List<FreeBoardDto> freeBoardList = 
				freeBoardService.freeBoardSelectList(searchOption, keyword
				, start, end, lineTitle);
		
		
		HashMap<String, Object> searchMap 
			= new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		// 페이징
		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("paging", freeBoardPaging);
		
		model.addAttribute("lineTitle", lineTitle);
		model.addAttribute("freeBoardList", freeBoardList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);
		
		
		return "/board/free/freeBoardListView";
	}

	@RequestMapping(value = "/freeBoard/freeBoardListOne.do"
		, method = {RequestMethod.GET,RequestMethod.POST})
	public String freeBoardList(@RequestParam(defaultValue="0")int no
			,@RequestParam(defaultValue = "all")String searchOption
			,@RequestParam(defaultValue = "")String keyword
			,@RequestParam(defaultValue="1") int curPage
			,int rnum
			,Model model
			,@RequestParam(defaultValue = "free_board_no") String lineTitle
			,@RequestParam(defaultValue="0") int mno
			) {
		log.info("call freeBoardListOne! - " + no + "\n" + searchOption
				+ "\n" + keyword + "\n" + mno + "rnum : " + rnum + "lineTitle : " + lineTitle);
		
		
		Map<String, Object> map = freeBoardService.freeBoardSelectOne(no);
		
		FreeBoardDto freeBoardDto = (FreeBoardDto)map.get("freeBoardDto");
		
		//////

		int totalMoveCount = freeBoardService.selectTotalMoveCount(searchOption, keyword
				,lineTitle);
		
		//////
		int totalCount = 
				freeBoardService.freeBoardCommentSelectTotalCount(no);
		
		CommentPaging freeBoardCommentPaging = new CommentPaging(totalCount, curPage);
		int end = freeBoardCommentPaging.getPageEnd();
		
		List<FreeBoardDto> freeBoardCommentList = 
				freeBoardService.freeBoardCommentSelectList(no, end);
		
		int commentCount = freeBoardService.freeBoardCommentTotalCount(no);
		
		model.addAttribute("freeBoardCommentList", freeBoardCommentList);
		model.addAttribute("freeBoardCommentPaging", freeBoardCommentPaging);
		//////

		String freeBoardLikeList = freeBoardService.freeBoardLikeSelectList(no, mno);
		
		model.addAttribute("no", no);
		model.addAttribute("mno", mno);
		model.addAttribute("totalMoveCount", totalMoveCount);
		model.addAttribute("lineTitle", lineTitle);
		model.addAttribute("rnum", rnum);
		model.addAttribute("commentCount", commentCount);
		model.addAttribute("freeBoardLikeList", freeBoardLikeList);
		model.addAttribute("freeBoardDto", freeBoardDto);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		
		return "/board/free/freeBoardListOneView";
	}
	
	@RequestMapping(value="/freeBoard/like.do", method = RequestMethod.GET)
	public String like(int mno, int no,String searchOption,int rnum
			,String keyword) {
		log.info("좋아요 추가"+mno + ": 회원번호 " + no + "게시물 번호"+ searchOption + keyword);
		freeBoardService.freeBoardLikeInsert(no, mno);
		return "forward:/freeBoard/freeBoardListOne.do";
	}
	
	@RequestMapping(value="/freeBoard/likeUpdate.do", method = RequestMethod.GET)
	public String likeUpdate(int mno, int no,String searchOption,int rnum
			,String keyword) {
		log.info("좋아요 수정"+mno + ": 회원번호 " + no + "게시물 번호"+ searchOption + keyword);
		freeBoardService.freeBoardLikeUpdate(no,mno);
		return "forward:/freeBoard/freeBoardListOne.do";
	}
	
	
	
	@RequestMapping(value="/freeBoard/likeDel.do", method = RequestMethod.GET)
	public String likeDel(int mno, int no, String searchOption,int rnum
			,String keyword) {
		log.info("좋아요 삭제"+mno + ": 회원번호 " + no + "게시물 번호" + searchOption + keyword);
		freeBoardService.freeBoardLikeDel(no, mno);
		return "forward:/freeBoard/freeBoardListOne.do";
	}
	
	@RequestMapping(value="/freeBoard/freeBoardAdd.do", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String freeBoardAdd(@RequestParam(defaultValue = "0") int mno
			,Model model) {
		log.info(mno +"회원번호");
		String memInfo = freeBoardService.freeBoardAddOne(mno);
		
		model.addAttribute("memInfo", memInfo);	
		model.addAttribute("mno", mno);
		return "/board/free/freeBoardForm";
	}
	
	@RequestMapping(value="/freeBoard/freeBoardAddCtr.do", method = RequestMethod.POST) 
	public String freeBoardAddCtr(@RequestParam(defaultValue="0") int mno
			,String writer
			,String title
			,String contents) {
		log.info("게시물 작성 "+mno +"회원번호" + title + contents);
		
		freeBoardService.freeBoardAdd(mno, title, contents);
		
		return "redirect:/freeBoard/free.do";
	}
	
	@RequestMapping(value="/freeBoard/freeBoardView.do", method = RequestMethod.GET)
	public String freeBoardView(int mno, int no, String searchOption
			,String keyword) {
		log.info("조회수"+mno + ": 회원번호 " + no + "게시물 번호" + searchOption + keyword);
		freeBoardService.freeBoardView(no);
		return "forward:/freeBoard/freeBoardListOne.do";
	}
	
	@RequestMapping(value="/freeBoard/freeBoardDeleteCtr.do", method = RequestMethod.GET)
	public String freeBoardDel(int no) {
		log.info("게시물 삭제"+ ": 게시물번호 " + no);
		freeBoardService.freeBoardLikeDelete(no);
		freeBoardService.freeBoardCommentDelete(no);
		freeBoardService.freeBoardDelete(no);
		return "redirect:/freeBoard/free.do";
	}
	
	@RequestMapping(value="/freeBoard/commentAdd.do", method = RequestMethod.GET)
	public String commentAdd(int mno, int no,String searchOption
			,int rnum
			,String keyword
			,String comments) {
		log.info("댓글 추가"+mno + ": 회원번호 " + no + "게시물 번호"+ searchOption + keyword);
		freeBoardService.freeBoardCommentAdd(no,mno,comments);
		return "forward:/freeBoard/freeBoardListOne.do";
	}
	@RequestMapping(value="/freeBoard/freeBoardUpdate.do", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String freeBoardUpdate(@RequestParam(defaultValue = "0") int no
			,int mno		,String writer
			,String title	,String contents
			,String searchOption	,String keyword
			,Model model, int rnum) {
		log.info("수정 알넘 : "+ rnum);
		String memInfo = freeBoardService.freeBoardAddOne(mno);
		
		Map<String, Object> map = new HashMap<>();
		map.put("mno", mno);
		map.put("no", no);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("writer", writer);
		map.put("title", title);
		map.put("contents", contents);
		map.put("rnum", rnum);
		
		model.addAttribute("memInfo", memInfo);	
		model.addAttribute("map", map);	
		return "/board/free/freeBoardUpdateForm";
	}
	
	@RequestMapping(value="/freeBoard/freeBoardUpdateCtr.do", method = RequestMethod.POST) 
	public String freeBoardUpdateCtr(@RequestParam(defaultValue="0") int no
			,String title
			,String contents
			,String searchOption
			,String keyword
			,int rnum) {
		log.info("게시물 수정 "+no +"게시물번호" + title + contents);
		freeBoardService.freeBoardUpdate(no, title, contents);
		return "forward:/freeBoard/freeBoardListOne.do";
	}
	
	@RequestMapping(value="/freeBoard/freeBoardCommentDeleteCtr.do", method = RequestMethod.GET)
	public String freeBoardCommentDeleteCtr(int no, int fcno) {
		log.info("게시물 댓글 삭제"+ ": 댓글번호 " + fcno);
		
		freeBoardService.freeBoardCommentOneDelete(fcno);
		
		return "forward:/freeBoard/freeBoardListOne.do";
	}
	
	@RequestMapping(value="/freeBoard/freeBoardCommentUpdateCtr.do", method = RequestMethod.GET) 
	public String freeBoardCommentUpdateCtr(
			@RequestParam(defaultValue="0") int no
			,String title
			,String searchOption
			,String keyword
			,int rnum
			,String comments
			,int fcno) {
		log.info("댓글 수정 "+fcno +"댓글 내용" + comments);
		freeBoardService.freeBoardCommentUpdate(fcno, comments);
		return "forward:/freeBoard/freeBoardListOne.do";
	}
	
	
	@RequestMapping(value="/freeBoard/prePage.do", method = RequestMethod.GET)
	public String freeBoardPrePage(int mno, int rnum, int no, String searchOption
			,String keyword,@RequestParam(defaultValue = "free_board_no") String lineTitle,Model model) {
		log.info(mno + ": 회원번호 " +no+ " : 게시물 번호 " + rnum + " : 알넘" +searchOption + keyword);
		FreeBoardDto freeBoardDto = freeBoardService.selectPrePage(searchOption, keyword
				,lineTitle, rnum);
		
		System.out.println(freeBoardDto.getFreeBoardRownum());
		System.out.println(freeBoardDto.getMemberNo());
		System.out.println(freeBoardDto.getFreeBoardNo());
		model.addAttribute("rnum", freeBoardDto.getFreeBoardRownum());
		model.addAttribute("mno", freeBoardDto.getMemberNo());
		model.addAttribute("no", freeBoardDto.getFreeBoardNo());
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("lineTitle", lineTitle);
		return "redirect:/freeBoard/freeBoardListOne.do";
	}
	
	@RequestMapping(value="/freeBoard/nextPage.do", method = RequestMethod.GET)
	public String freeBoardNextPage(int mno, int rnum, int no, String searchOption
			,String keyword,@RequestParam(defaultValue = "free_board_no") String lineTitle,Model model ) {
		log.info(mno + ": 회원번호 " +no+ " : 게시물 번호 " + rnum + " : 알넘" +searchOption + keyword);
		FreeBoardDto freeBoardDto = freeBoardService.selectNextPage(searchOption, keyword
				,lineTitle, rnum);
		
		System.out.println(freeBoardDto.getFreeBoardRownum());
		System.out.println(freeBoardDto.getMemberNo());
		System.out.println(freeBoardDto.getFreeBoardNo());
		model.addAttribute("rnum", freeBoardDto.getFreeBoardRownum());
		model.addAttribute("mno", freeBoardDto.getMemberNo());
		model.addAttribute("no", freeBoardDto.getFreeBoardNo());
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("lineTitle", lineTitle);
		return "redirect:/freeBoard/freeBoardListOne.do";
	}
	
	@RequestMapping(value = "/freeBoard/myList.do", method = RequestMethod.GET)
	public String myReportBoardList(@RequestParam(defaultValue = "1") int curPage
							 , @RequestParam(defaultValue = "0") int report_board_no
							 , @RequestParam(defaultValue = "titleAndContent") String searchOption
							 , @RequestParam(defaultValue = "report_board_whole") String sortOption
							 , @RequestParam(defaultValue = "") String keyword
							 , @RequestParam(defaultValue = "5")int mno
							 , Model model) {
		log.info("Welcome reportBoardList! " + curPage + " : ????"
				+ searchOption + " : " + keyword);
		
		if("writer".equals(searchOption)) {
			searchOption = "member_nick";
		}
		
		if("title".equals(searchOption)) {
			searchOption = "report_board_title";
		}
		
		if("content".equals(searchOption)) {
			searchOption = "report_board_contents";
		}
		
		int totalCount = 
				freeBoardService.reportBoardSelectTotalCount(searchOption, keyword, sortOption, mno);
		System.out.println(totalCount);
		Paging reportBoardPaging = new Paging(totalCount, curPage);
		int start = reportBoardPaging.getPageBegin();
		int end = reportBoardPaging.getPageEnd();
				
		List<ReportBoardDto> reportBoardList = freeBoardService.reportBoardSelectList(
				searchOption, keyword, sortOption, start, end, mno);
		
//		 화면의 form의 이름을 맞추기 위한 작업
		if("member_nick".equals(searchOption)) {
			searchOption = "writer";
		}
		
		if("report_board_title".equals(searchOption)) {
			searchOption = "title";
		}
		
		if("report_board_contents".equals(searchOption)) {
			searchOption = "content";
		}
		
		// 검색
		HashMap<String, Object> searchMap 
			= new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		searchMap.put("sortOption", sortOption);
		
		// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("paging", reportBoardPaging);

		model.addAttribute("reportBoardList", reportBoardList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);
		
		return "member/myReport";
	}
	
}
