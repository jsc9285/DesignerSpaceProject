package com.project.reportBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.reportBoard.dao.ReportBoardDao;
import com.project.reportBoard.model.ReportBoardDto;

@Service
public class ReportBoardServiceImpl implements ReportBoardService{

	@Autowired
	public ReportBoardDao reportBoardDao;
	
	@Override
	public List<ReportBoardDto> reportBoardSelectList(String searchOption, String keyword, 
			String sortOption, int start, int end) {
		// TODO Auto-generated method stub
		
		List<ReportBoardDto> reportBoardList = 
				reportBoardDao.reportBoardSelectList(searchOption, keyword, sortOption, start, end);
		
		return reportBoardList;
	}

	@Override
	public int reportBoardSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		
		return reportBoardDao.reportBoardSelectTotalCount(searchOption, keyword);
	}

	@Override
	public int reportSelectCurPage(String searchOption, String keyword, int report_board_no) {
		// TODO Auto-generated method stub
		
		return reportBoardDao.reportSelectCurPage(searchOption, keyword, report_board_no);
	}

	@Override
	public ReportBoardDto reportBoardSelectDetail(int report_board_no) {
		// TODO Auto-generated method stub
		
		ReportBoardDto reportBoardDto = reportBoardDao.reportBoardSelectDetail(report_board_no);
		
		return reportBoardDto;
	}

	@Override
	public void reportBoardInsertOne(ReportBoardDto reportBoardDto) {
		// TODO Auto-generated method stub
		
		reportBoardDao.reportBoardInsertOne(reportBoardDto);
		
	}

}
