<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>자유게시판 상세조회</title>

<script type="text/javascript" 
	src="/DesignerSpaceProject/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript">

	function pageMoveListFnc(){
		var noObj = $('#no');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		var url = '';
		
		url += './free.do?';
		url += 'no=' + noObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		
		location.href = url;
	}
	
	
		
</script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<h1>자유게시판 상세조회</h1>
	<form action='./update.do' method='get'>
		작성자: ${freeBoardDto.memberNick}
		<br>
		제목: ${freeBoardDto.freeBoardTitle}
		<br>
		내용: ${freeBoardDto.freeBoardContents}
		<br>
		작성일: ${freeBoardDto.freeBoardCreDate}
		<br>
		조회수: ${freeBoardDto.freeBoardViews}
		<br>
		좋아요: ${freeBoardDto.freeBoardLike}
		<br>

		<div>
			<input type="hidden" id='no' name="no" value="${freeBoardDto.freeBoardNo}">
			<input type="hidden" id='searchOption' 
				name="searchOption" value="${searchOption}">
			<input type="hidden" id='keyword' 
				name="keyword" value="${keyword}">
		</div>
		<div>
			<input type='submit' value='수정'>
			<input type='button' value='삭제'>
			<input type='button' value='목록' onclick='pageMoveListFnc();'>
		</div>
	</form>
	
	
		<table>
		<tr>
			<th>이름</th><th>코멘트</th>
			<th>프로필이미지</th><th>작성일</th>
			<th></th><th></th>
		</tr>
	<c:choose>
		<c:when test="${empty freeBoardCommentList}">
			<tr>
				<td colspan="8" style="text-align: center;">
					댓글이 없습니다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="freeBoardDto" items="${freeBoardCommentList}">
			<tr>
				<td>${freeBoardDto.memberNick}</td>
				
				<td>${freeBoardDto.freeCommentComments}</td>
				
				<td>${freeBoardDto.profileTableStoredName}</td>
			
				<td>${freeBoardDto.freeCommentCreDate}</td>				
				
<%-- 				<td>코멘트 번호:${freeBoardDto.freeCommentNo}</td>				 --%>
				
				<td>
					<a href='./deleteCtr.do?no=${freeBoardDto.memberNo}'>[삭제]</a>
				</td>
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
	</table>

	<jsp:include page="/WEB-INF/views/common/commentpaging.jsp">
		<jsp:param value="${freeBoardCommentPaging}" name="freeBoardCommentPaging"/>
	</jsp:include>
	
	<form action="./freeBoardListOne.do" id='pagingForm' method="get">
		<input type="hidden" id='curPage' name='curPage' 
			value="${freeBoardCommentPaging.curPage}">
		<input type="hidden" id='no' name="no" value="${freeBoardDto.freeBoardNo}">
		<input type="hidden" id='searchOption' name="searchOption" value="${searchOption}">
		<input type="hidden" id='keyword' name="keyword" value="${keyword}">
	</form>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>