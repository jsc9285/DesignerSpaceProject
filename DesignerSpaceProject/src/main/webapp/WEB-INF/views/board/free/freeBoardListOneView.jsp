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

	function likeFnc() {
		var mnoObj = $('#mno')
		var fbnoObj = $('#fbno');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		var url = '';
		
		url += './like.do?';
		url += 'no=' + fbnoObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&mno=' + mnoObj.val();
		
		location.href = url;
	}
	
	function likeDelFnc() {
		var mnoObj = $('#mno')
		var fbnoObj = $('#fbno');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');

		var url = '';
		
		url += './likeDel.do?';
		url += 'no=' + fbnoObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&mno=' + mnoObj.val();
		
		location.href = url;
	}
	function likeUpdateFnc() {
		var mnoObj = $('#mno')
		var fbnoObj = $('#fbno');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		var url = '';
		
		url += './likeUpdate.do?';
		url += 'no=' + fbnoObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&mno=' + mnoObj.val();
		
		location.href = url;
	}
	
	function commentAddFcn() {
		var mnoObj = $('#mno')
		var fbnoObj = $('#fbno');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		var commentsObj = $('#comments');
		
		var url = '';
		
		url += './commentAdd.do?';
		url += 'no=' + fbnoObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&mno=' + mnoObj.val();
		url += '&comments=' + commentsObj.val();
		
		location.href = url;
	}
	
		
</script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<h1>자유게시판 상세조회</h1>
		

	
	<form action='./freeBoardUpdate.do' method='get'>
		<input type="hidden" id="mno" name="mno" value="${freeBoardDto.memberNo}">
		<input type="hidden" id="no" name="no" value="${freeBoardDto.freeBoardNo}">
		<input type="hidden" id="fbno" name="fbno" value="${freeBoardDto.freeBoardNo}">
		작성자:<input type="text" id="writer" name="writer" readonly="readonly" value="${freeBoardDto.memberNick}"> 
		<br>
		제목:<input type="text" id="title" name="title" readonly="readonly" value="${freeBoardDto.freeBoardTitle}">
		<br>
		내용:<input type="text" id="contents" name="contents" readonly="readonly" value="${freeBoardDto.freeBoardContents}">
		<br>
		작성일:<input type="text" id="credate" name="credate" readonly="readonly" value="${freeBoardDto.freeBoardCreDate}">
		<br>
		조회수:<input type="text" id="views" name="views" readonly="readonly" value="${freeBoardDto.freeBoardViews}"> 
		<br>
		
		<c:if test="${empty freeBoardLikeList}">
				<input type="button" onclick="likeFnc();" value="좋아요">
		</c:if>
		
		<c:forEach var="freeBoardLike" items="${freeBoardLikeList}">

		<c:choose>
				<c:when test="${freeBoardLike.freeLikeFlag eq 'Y'}">
						<input type="button" onclick="likeDelFnc();" value="좋아요 취소 ${freeBoardDto.freeBoardLike}">
				</c:when>
				
				<c:when test="${freeBoardLike.freeLikeFlag eq 'N'}">
						<input type="button" onclick="likeUpdateFnc();" value="좋아요">
				</c:when>
				
				
		</c:choose>
		
		<c:if test="${empty freeBoardLike.freeLikeFlag}">
						<input type="button" onclick="likeFnc();" value="좋아요">
		</c:if>
		</c:forEach>
		
			
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
		댓글 : <input type="text" id="comments" name="comments">
		<input type="button" onclick="commentAddFcn();" value="작성">
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
				<td>
					<img alt="image not found" style="width: 30px; height:30px;"  
					src="<c:url value='/img/${freeBoardDto.profileTableStoredName}'/>">
				</td>
				<td>
					<fmt:formatDate value="${freeBoardDto.freeCommentCreDate}" pattern="yyyy-MM-dd hh:mm"/>
				</td>

				
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