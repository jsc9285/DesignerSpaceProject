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
table {
	border-collapse: collapse;
}

table, tr, th, td{
	border: 1px solid black;
}

#wrap{
	margin-top : 500px;
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
	var memberNoObj = '';
	
	freeBoardNoObj = aTagObj.parent().parent().children('td').eq(0);
	memberNoObj = aTagObj.parent().parent().children('td').eq(7);

	var url = '';
	
	url += './freeBoardView.do?';
	url += 'no=' + freeBoardNoObj.html();
	url += '&keyword=' + keywordObj.val();
	url += '&searchOption=' + searchOptionObj.val();
	url += '&mno=' + memberNoObj.html();
			
	location.href = url;

	return false;
}

	
</script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<h1>자유게시판</h1>
			<div>
				<form action="./freeBoardAdd.do" method="post">
					<input type="submit" value="작성">
					<input type="hidden" id="mno" name="mno" value='3'>
				</form>
			</div>

			<form id='searchingForm' action="./free.do" method="post">
				<select id='searchOption' name='searchOption'>
				<c:choose>
					<c:when test="${searchMap.searchOption eq 'all'}">
						<option value="all" selected="selected">제목+작성자</option>
						<option value="title">제목</option>
						<option value="writer">작성자	</option>
					</c:when>
					
					<c:when test="${searchMap.searchOption eq 'title'}">
						<option value="all">제목+작성자</option>
						<option value="title" selected="selected">제목</option>
						<option value="writer">작성자</option>
					</c:when>
		
					<c:when test="${searchMap.searchOption eq 'writer'}">
						<option value="all">제목+작성자</option>
						<option value="title">제목</option>
						<option value="writer" selected="selected">작성자</option>
					</c:when>
				</c:choose>
				</select>
		<!-- 			<input type="hidden" id='curPage' name='curPage'  -->
		<%-- 			value="${pagingMap.memberPaging.curPage}"> --%>
				<input type="text" id='keyword' 
					name="keyword" value="${searchMap.keyword}"
					placeholder="제목 or 작성자 검색">
				<input type="submit" value="검색">
				
			</form>	
			
			<table>
				<tr>
					<th>글번호</th><th>제목</th>
					<th>작성자</th><th>조회수</th>
					<th>좋아요</th><th>작성일</th>
					<th></th><th></th>
				</tr>
			<c:choose>
				<c:when test="${empty freeBoardList}">
					<tr>
						<td colspan="8" style="text-align: center;">
							등록된 게시글이 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="freeBoardDto" items="${freeBoardList}">
					<tr>
						<td>${freeBoardDto.freeBoardNo}</td>
						<td>
							<a href='#' onclick="freeBoardListOnePageFnc(this, event);">
								${freeBoardDto.freeBoardTitle}
							</a>
						</td>
						<td>${freeBoardDto.memberNick}</td>
						
						<td>${freeBoardDto.freeBoardViews}</td>				
						
						<td>${freeBoardDto.freeBoardLike}</td>
						
						<td>
							<fmt:formatDate value="${freeBoardDto.freeBoardCreDate}" 
								pattern="yyyy년MM월dd일 hh시mm분"/>
						</td>
						<c:choose>
						<c:when test="${freeBoardDto.memberGrade eq 1 || freeBoardDto.memberGrade eq 0}">
						<td>
							<a href='./freeBoardDeleteCtr.do?no=${freeBoardDto.freeBoardNo}'>[삭제]</a>
						</td>
						<td>${freeBoardDto.memberNo}</td>
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
				<input type="hidden" id='searchOption' name="searchOption" value="${searchOption}">
				<input type="hidden" id='keyword' name="keyword" value="${keyword}">
			</form>
			
		
		</div>
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>