<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 목록</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
<style type="text/css">
	#boardTitle{
		font-size: 70px;
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
		border: 0;
		outline: 0;
	}
	
	#writeButton:hover{
		float: right;
		text-align: center;
		color: white;
		width: 150px;
		height: 50px;
		margin-top: 40px;
		font-size: 20px;
		background-color: #7D7500;
		border: 0;
		outline: 0;
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
	
	.cell:hover{
		border-bottom: 1px solid black;
		border-top: 1px solid black;
		border-color: #D8D8D8;
		background-color: #7D7500;
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
	
	#admin{
		border-bottom: 1px solid black;
		border-top: 1px solid black;
		border-color: #D8D8D8;
		vertical-align: middle;
		font-size: 30px;
		font-weight: bold;
		text-align: center;
		color: red;
	}
	
	a > #admin { 
	text-decoration:none;
	color: red;
	}
	
	a{
	text-decoration:none;
	color: black;
	} 
	
	.freeBoardTitle:hover{
		color: yellow;
	}
	
	
</style>

<script type="text/javascript" 
	src="/DesignerSpaceProject/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript">
		
function freeBoardListOnePageFnc(obj, event){
	
	var aTagObj = $(obj);
	
	event.preventDefault();
	
	var freeBoardNoObj = '';
	var keywordObj = $('#keyword');
	var searchOptionObj = $('#searchOption');
	var memberNoObj = $('#mno');
	var titleObj = '';
	var rnumObj = '';

	freeBoardNoObj = aTagObj.parent().parent().children('td').eq(0);
	rnumObj = aTagObj.parent().parent().children('td').eq(5).children('input');
	titleObj = aTagObj.parent().parent().children('td').eq(6).children('input');
	
	var url = '';
	
	url += './freeBoardView.do?';
	url += 'no=' + freeBoardNoObj.html();
	url += '&keyword=' + keywordObj.val();
	url += '&searchOption=' + searchOptionObj.val();
	url += '&mno=' + memberNoObj.val();
	url += '&lineTitle=' + titleObj.val();
	url += '&rnum=' + rnumObj.val();
			
	location.href = url;

	return false;
}

	function sortFnc(sort) {
		var aTagObj = $(sort);
		var freeBoardNoObj = '';
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		var memberNoObj = $('#mno');
		var whatKindObj = $(sort).attr('id');		
		
// 		freeBoardNoObj = aTagObj.parent().parent().children('tr').eq(1).children('td').eq(0);
// 		alert(freeBoardNoObj.html())
		var url = '';
		
		url += './free.do?';
// 		url += 'no=' + freeBoardNoObj.html();
		url += 'keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&mno=' + memberNoObj.val();
		url += '&lineTitle=' + whatKindObj;
		
		location.href = url;
	}
	
	function freeBoardDeleteFnc(obj, event) {
		var aTagObj = $(obj);
		
		event.preventDefault();
		
		var freeBoardNoObj = '';
		var url = '';
		
		freeBoardNoObj = aTagObj.parent().parent().children('td').eq(0);
		
		var answer = confirm('회원 정보를 수정하시겠습니까?');
        if (answer) {
           	url += './freeBoardDeleteCtr.do?';
   			url += 'no=' + freeBoardNoObj.html();  			
   			location.href = url;
   			alert('성공적으로 수정되었습니다.');
           return true;
        }else {
           return false;
        }
		
	}
	

	$(document).ready(function () {
		
		for (var i = 0; i < $('.freeBoardTitle').length; i++) {
			var freeBoardTitleStr = $('.freeBoardTitle').eq(i).text();
			if(freeBoardTitleStr.length >= 15){
				
				freeBoardTitleStr = freeBoardTitleStr.substring(0,15) + "...";	
			}
			$('.freeBoardTitle').eq(i).text(freeBoardTitleStr);
		}
		
	})

	
</script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<div id='boardTitle'>자유게시판</div>
			<div>
				<form action="./freeBoardAdd.do" method="post">
					<input type="submit" value="작성" id='writeButton'>
					<input type="hidden" id="mno" name="mno" value="${memberDto.member_no}">
				</form>
			</div>

			<form id='searchingForm' action="./free.do" method="post">
				<select id='searchOption' name='searchOption'>
				<c:choose>
					<c:when test="${searchMap.searchOption eq 'all'}">
						<option value="all" selected="selected">제목+작성자</option>
						<option value="free_board_title">제목</option>
						<option value="member_nick">작성자</option>
					</c:when>
					
					<c:when test="${searchMap.searchOption eq 'free_board_title'}">
						<option value="all">제목+작성자</option>
						<option value="free_board_title" selected="selected">제목</option>
						<option value="member_nick">작성자</option>
					</c:when>
		
					<c:when test="${searchMap.searchOption eq 'member_nick'}">
						<option value="all">제목+작성자</option>
						<option value="free_board_title">제목</option>
						<option value="member_nick" selected="selected">작성자</option>
					</c:when>
				</c:choose>
				</select>
		<!-- 			<input type="hidden" id='curPage' name='curPage'  -->
		<%-- 			value="${pagingMap.memberPaging.curPage}"> --%>
				<input type="text" id='keyword' 
					name="keyword" value="${searchMap.keyword}"
					placeholder="제목 or 작성자 검색">
				<input type="submit" value="검색" id='searchButton'>
				
			</form>	
			
			<table id='columnTitle'>
				<tr id='lineTitle'>
					<th class="cell" onclick="sortFnc(this);" id="free_board_no">글번호</th>
					<th class="cell" onclick="sortFnc(this);" id="free_board_title">제목</th>
					<th class="cell" onclick="sortFnc(this);" id="member_nick">작성자</th>
					<th class="cell" onclick="sortFnc(this);" id="free_board_views">조회수</th>
					<th class="cell" onclick="sortFnc(this);" id="nl">좋아요</th>
					<th class="cell" onclick="sortFnc(this);" id="free_board_cre_date" colspan="4">작성일</th>
					
				</tr>
			<c:choose>
				<c:when test="${empty freeBoardList}">
					<tr>
						<td class="cell2" colspan="8" style="text-align: center;">
							등록된 게시글이 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					
					<c:forEach var="freeBoardDto" items="${freeBoardList}">
					<input type="hidden" id="boardTitle" name="boardTitle" value="${freeBoardDto.freeBoardTitle}">
					<tr>
						<td class="cell2">${freeBoardDto.freeBoardNo}</td>
						<c:choose>
						<c:when test="${freeBoardDto.memberGrade eq '0'}">
						<td class="cell2" style="text-align: left;">
							<a href='#' class="freeBoardTitle" onclick="freeBoardListOnePageFnc(this, event);">${freeBoardDto.freeBoardTitle}</a>
						</td>
						</c:when>
						<c:when test="${freeBoardDto.memberGrade eq '1'}">
						<td class="cell2" style="text-align: left;">
							<a id="admin" class="freeBoardTitle" href='#' onclick="freeBoardListOnePageFnc(this, event);">${freeBoardDto.freeBoardTitle}</a>
						</td>
						</c:when>
						</c:choose>
						<c:choose>
						<c:when test="${freeBoardDto.memberGrade eq '0'}">
						<td class="cell2">${freeBoardDto.memberNick}</td>
						</c:when>
						<c:when test="${freeBoardDto.memberGrade eq '1'}">
						<td class="cell2" id="admin">${freeBoardDto.memberNick}</td>
						</c:when>
						</c:choose>
						<td class="cell2">${freeBoardDto.freeBoardViews}</td>				
		
						<td class="cell2">${freeBoardDto.freeBoardLike}</td>
						<td><input type="hidden" id="rnum" name="rnum" value="${freeBoardDto.freeBoardRownum}"></td>
						<td><input type="hidden" id="sortTitle" name="sortTitle" value="${lineTitle}"></td>
						<td class="cell2">
							<fmt:formatDate value="${freeBoardDto.freeBoardCreDate}" 
								pattern="yyyy.MM.dd  HH:mm"/>
						</td>
						<c:choose>
						<c:when test="${memberDto.member_grade eq '1'}">
						<td class="cell2">
							<a href='#' onclick="freeBoardDeleteFnc(this, event);">[삭제]</a>
						</td>
						</c:when>
					
						<c:otherwise>
						
						</c:otherwise>
						</c:choose>
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
			</table>
			
			<jsp:include page="/WEB-INF/views/common/paging.jsp">
				<jsp:param value="${pagingMap}" name="pagingMap"/>
			</jsp:include>
			
			<form action="./free.do" id='pagingForm' method="get">
				<input type="hidden" id='curPage' name='curPage' 
					value="${pagingMap.paging.curPage}">
				<input type="hidden" id='no' name="no" value="${freeBoardDto.freeBoardNo}">
				<input type="hidden" id='searchOption' name="searchOption" value="${searchMap.searchOption}">
				<input type="hidden" id='keyword' name="keyword" value="${searchMap.keyword}">
			</form>
			
		
		</div>
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>