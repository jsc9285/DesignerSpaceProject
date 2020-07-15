<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designer's Space</title>


	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
	
<style type="text/css">
	#boardTitle{
		font-size: 80px;
		font-weight: bold;
		float: left;
		color: #7D7471;
	}

	#searchOption{
		margin-top: 40px;
		margin-left: 20px;
		width: 138px;
		height: 50px;
		vertical-align: middle;
		text-align-last: center;
		font-size: 17px;
		float: left;
	}
	
	#keyword{
		margin-top: 40px;
		width: 420px;
		height: 45px;
		float: left;
	}
	
	#searchButton{
		margin-top: 40px;
		width: 50px;
		height: 50px;
		float: left;
	}
	
	#writeButton{
		float: right;
		text-align: center;
		color: white;
		width: 150px;
		height: 50px;
		margin-top: 40px;
		font-size: 20px;
		background-color: #7D7471;
	}
	
	#selectProcessStatus{
		margin-top: 40px;
		margin-left: 20px;
		width: 138px;
		height: 50px;
		margin-right: 10px;
		vertical-align: middle;
		text-align-last: center;
		font-size: 17px;
		float: right;
	}
	
	#columnTitle{
		clear: both;
		margin-top: 100px;
		width: 100%;
	}
	
	#lineTitle{
		border-bottom: 1px solid black;
		height: 77px;
	}
	
	.cell{
		border-bottom: 1px solid black;
		border-top: 1px solid black;
		border-color: #D8D8D8;
		background-color: #7D7471;
		vertical-align: middle;
		font-size: 30px;
		color: white;
	}
	
	.cell2{
		border-bottom: 1px solid black;
		border-top: 1px solid black;
		border-color: #D8D8D8;
		vertical-align: middle;
		font-size: 30px;
		font-weight: bold;
		text-align: center;
	}
	
</style>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">

function sortOptionChangeFnc(e) {
	var sortOption = document.getElementById('sortOption');
	
	if(e.value == "report_board_whole"){
		sortOption.value = e.value;
	}else if(e.value == "report_board_accept"){
		sortOption.value = e.value;
	}else if(e.value == "report_board_reject"){
		sortOption.value = e.value;
	}else if (e.value == "report_board_processing_complete") {
		sortOption.value = e.value;
	}
	
	var curPage = document.getElementById('curPage');
	curPage.value = 1;
	
	var pagingForm = document.getElementById('pagingForm'); 
	pagingForm.submit();						
}

</script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<div id='boardTitle'>신고글</div>
			
			<form action="./myList.do" method="get">
				<select id='searchOption' name="searchOption">
					<c:choose>
						<c:when test="${searchMap.searchOption eq 'titleAndContent'}">
							<option value="titleAndContent" selected="selected">제목 + 내용</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
						</c:when>
						
						<c:when test="${searchMap.searchOption eq 'title'}">
							<option value="titleAndContent">제목 + 내용</option>
							<option value="title" selected="selected">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
						</c:when>
						
						<c:when test="${searchMap.searchOption eq 'content'}">
							<option value="titleAndContent">제목 + 내용</option>
							<option value="title">제목</option>
							<option value="content" selected="selected">내용</option>
							<option value="writer">작성자</option>
						</c:when>
						
						<c:when test="${searchMap.searchOption eq 'writer'}">
							<option value="titleAndContent">제목 + 내용</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer" selected="selected">작성자</option>
						</c:when>
					</c:choose>
				</select>
				
				<input type="text" id='keyword' name="keyword" value="${searchMap.keyword}">
				<input type="submit" value="검색" id='searchButton'>
				<input id="reportWrite" name="reportWrite" type="button" onclick="reportWriteFnc();" 
				    style="float:right; margin-top: 40px; width: 105px; height: 50px; text-align: center;
		                   background-color: #60524E;  color: white;" value="작성">
				<select id='selectProcessStatus' onchange="sortOptionChangeFnc(this);">
					<c:choose>
						<c:when test="${searchMap.sortOption eq 'report_board_whole'}">
							<option value="report_board_whole" selected="selected">전체</option>
							<option value="report_board_accept">접수중</option>
							<option value="report_board_reject">처리기각</option>
							<option value="report_board_processing_complete">처리완료</option>
						</c:when>
						<c:when test="${searchMap.sortOption eq 'report_board_accept'}">
							<option value="report_board_whole">전체</option>
							<option value="report_board_accept" selected="selected">접수중</option>
							<option value="report_board_reject">처리기각</option>
							<option value="report_board_processing_complete">처리완료</option>
						</c:when>
						<c:when test="${searchMap.sortOption eq 'report_board_reject'}">
							<option value="report_board_whole">전체</option>
							<option value="report_board_accept">접수중</option>
							<option value="report_board_reject" selected="selected">처리기각</option>
							<option value="report_board_processing_complete">처리완료</option>
						</c:when>
						<c:when test="${searchMap.sortOption eq 'report_board_processing_complete'}">
							<option value="report_board_whole">전체</option>
							<option value="report_board_accept">접수중</option>
							<option value="report_board_reject">처리기각</option>
							<option value="report_board_processing_complete" selected="selected">처리완료</option>
						</c:when>
					</c:choose>
				</select>
					
			</form>
		
			
			<table id='columnTitle'>
				<tr id='lineTitle'>
					<th class="cell">글번호</th>
					<th class="cell">제목</th>
					<th class="cell">작성자</th>
					<th class="cell">작성일</th>
					<th class="cell">답변일</th>
					<th class="cell">처리상태</th>
				</tr>
				
				<c:choose>
					<c:when test="${empty reportBoardList}">
						<tr>
							<td colspan="6" style="text-align: center; font-size: 20px;">
								등록된 게시글이 없습니다.
							</td>
						</tr>
					</c:when>
					
					<c:otherwise>
`						<c:forEach var="reportBoardDto" items="${reportBoardList}">
							<tr>
								<td class="cell2">${reportBoardDto.report_board_no}</td>
								<td class="cell2">
									<a href="#">
										${reportBoardDto.report_board_title}
									</a>
								</td>
								<td class="cell2">
									${reportBoardDto.member_nick}
								</td>
								<td class="cell2">
									<fmt:formatDate value="${reportBoardDto.report_board_cre_date}" 
										pattern="yyyy.MM.dd HH:mm"/>
								</td>
								<td class="cell2">
									<c:choose>
									<c:when test="${empty reportBoardDto.report_board_answer_date}">
										-
									</c:when>
									<c:otherwise>
									<fmt:formatDate value="${reportBoardDto.report_board_answer_date}" 
										pattern="yyyy.MM.dd HH:mm"/>
									</c:otherwise>
									</c:choose>
								</td>
								<c:if test="${reportBoardDto.report_board_answer_status eq '접수중'}">
									<td class="cell2" style="color: #E14E4E;">
										${reportBoardDto.report_board_answer_status}
									</td>
								</c:if>
								<c:if test="${reportBoardDto.report_board_answer_status eq '처리기각'}">
									<td class="cell2" style="color: #BFC506;">
										${reportBoardDto.report_board_answer_status}
									</td>
								</c:if>
								<c:if test="${reportBoardDto.report_board_answer_status eq '처리완료'}">
									<td class="cell2" style="color: #BABABA;">
										${reportBoardDto.report_board_answer_status}
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			
				<jsp:include page="/WEB-INF/views/common/paging.jsp">
					<jsp:param value="${pagingMap}" name="pagingMap"/>
				</jsp:include>
				
				<form action="./myList.do" id='pagingForm' method="get">
					<input type="hidden" id='curPage' name='curPage' 
						value="${pagingMap.paging.curPage}">
					<input type="hidden" id='qna_board_no' name="qna_board_no" value="${reportBoardDto.report_board_no}">
					<input type="hidden" id='searchOption' name="searchOption" value="${searchMap.searchOption}">
					<input type="hidden" id='keyword' name="keyword" value="${searchMap.keyword}">
					<input type="hidden" id='sortOption' name='sortOption' value="${searchMap.sortOption}">	
				</form>
			
		</div>
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>