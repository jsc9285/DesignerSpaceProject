<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	function writeButtonFnc() {
		location.href = './add.do';
	}
	
	function listDetailPageFnc(obj, event) {
		
		var aTagObj = $(obj);
		
		event.preventDefault();
		
		var qnaBoardNoObj = '';
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		// 회원이름 클릭시 자신의 회원번호 td태그
		qnaBoardNoObj = aTagObj.parent().parent().children('td').eq(0);
		
		var url = '';
		
		url += './listDetail.do?';
		url += 'qna_board_no=' + qnaBoardNoObj.html();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
				
		location.href = url;

		return false;
	}
	
	function sortOptionChangeFnc(e) {
		var sortOption = document.getElementById('sortOption');
		
		if(e.value == "qna_board_whole"){
			sortOption.value = e.value;
		}else if(e.value == "qna_board_accept"){
			sortOption.value = e.value;
		}else if(e.value == "qna_board_answer"){
			sortOption.value = e.value;
		}else if (e.value == "qna_board_time_limit") {
			sortOption.value = e.value;
		}else if (e.value == "qna_board_answer_complete") {
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
			<div id='boardTitle'>QnA</div>
			
			<form action="./list.do" method="get">
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
				<input type="button" value="작성" id='writeButton' onclick="writeButtonFnc();">
				
				<select id='selectProcessStatus' onchange="sortOptionChangeFnc(this);">
					<c:choose>
						<c:when test="${searchMap.sortOption eq 'qna_board_whole'}">
							<option value="qna_board_whole" selected="selected">전체</option>
							<option value="qna_board_accept">접수중</option>
							<option value="qna_board_answer">답변중</option>
							<option value="qna_board_time_limit">기한만료</option>
							<option value="qna_board_answer_complete">답변완료</option>
						</c:when>
						<c:when test="${searchMap.sortOption eq 'qna_board_accept'}">
							<option value="qna_board_whole">전체</option>
							<option value="qna_board_accept" selected="selected">접수중</option>
							<option value="qna_board_answer">답변중</option>
							<option value="qna_board_time_limit">기한만료</option>
							<option value="qna_board_answer_complete">답변완료</option>
						</c:when>
						<c:when test="${searchMap.sortOption eq 'qna_board_answer'}">
							<option value="qna_board_whole">전체</option>
							<option value="qna_board_accept">접수중</option>
							<option value="qna_board_answer" selected="selected">답변중</option>
							<option value="qna_board_time_limit">기한만료</option>
							<option value="qna_board_answer_complete">답변완료</option>
						</c:when>
						<c:when test="${searchMap.sortOption eq 'qna_board_time_limit'}">
							<option value="qna_board_whole">전체</option>
							<option value="qna_board_accept">접수중</option>
							<option value="qna_board_answer">답변중</option>
							<option value="qna_board_time_limit" selected="selected">기한만료</option>
							<option value="qna_board_answer_complete">답변완료</option>
						</c:when>
						<c:when test="${searchMap.sortOption eq 'qna_board_answer_complete'}">
							<option value="qna_board_whole">전체</option>
							<option value="qna_board_accept">접수중</option>
							<option value="qna_board_answer">답변중</option>
							<option value="qna_board_time_limit">기한만료</option>
							<option value="qna_board_answer_complete" selected="selected">답변완료</option>
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
					<c:when test="${empty qnaBoardList}">
						<tr>
							<td colspan="6" style="text-align: center;">
								등록된 게시글이 없습니다.
							</td>
						</tr>
					</c:when>
					
					<c:otherwise>
`						<c:forEach var="QnaBoardDto" items="${qnaBoardList}">
							<tr>
								<td class="cell2">${QnaBoardDto.qna_board_no}</td>
								<td class="cell2">
									<a href='#' onclick="listDetailPageFnc(this, event);">
										${QnaBoardDto.qna_board_title}
									</a>
								</td>
								<td class="cell2">
									${QnaBoardDto.member_nick}
								</td>
								<td class="cell2">
									<fmt:formatDate value="${QnaBoardDto.qna_board_cre_date}" 
										pattern="yyyy.MM.dd hh:mm"/>
								</td>
								<td class="cell2">
									<c:choose>
										<c:when test="${empty qna_comment_no}">
											-
										</c:when>
										<c:otherwise>
											<fmt:formatDate value="${QnaBoardDto.qna_board_answer_date}" 
												pattern="yyyy.MM.dd hh:mm"/>
										</c:otherwise>
									</c:choose>
								</td>
								<c:if test="${QnaBoardDto.qna_board_answer_status eq '접수중'}">
									<td class="cell2" style="color: #E14E4E;">
										${QnaBoardDto.qna_board_answer_status}
									</td>
								</c:if>
								<c:if test="${QnaBoardDto.qna_board_answer_status eq '답변중'}">
									<td class="cell2" style="color: #2E89D4;">
										${QnaBoardDto.qna_board_answer_status}
									</td>
								</c:if>
								<c:if test="${QnaBoardDto.qna_board_answer_status eq '기한만료'}">
									<td class="cell2" style="color: #E8CA35;">
										${QnaBoardDto.qna_board_answer_status}
									</td>
								</c:if>
								<c:if test="${QnaBoardDto.qna_board_answer_status eq '답변완료'}">
									<td class="cell2" style="color: #BBBBBB;">
										${QnaBoardDto.qna_board_answer_status}
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			
		</div>
	</div>
	
	<input type="hidden" value="${qna_comment_no}" name="qna_comment_no">
	
	<jsp:include page="/WEB-INF/views/common/paging.jsp">
		<jsp:param value="${pagingMap}" name="pagingMap"/>
	</jsp:include>
	
	<form action="./list.do" id='pagingForm' method="get">
		<input type="hidden" id='curPage' name='curPage' 
			value="${pagingMap.paging.curPage}">
		<input type="hidden" id='qna_board_no' name="qna_board_no" value="${qnaBoardDto.qna_board_no}">
		<input type="hidden" id='searchOption' name="searchOption" value="${searchOption}">
		<input type="hidden" id='keyword' name="keyword" value="${keyword}">
		<input type="hidden" id='sortOption' name='sortOption' value="${sortOption}">	
	</form>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>