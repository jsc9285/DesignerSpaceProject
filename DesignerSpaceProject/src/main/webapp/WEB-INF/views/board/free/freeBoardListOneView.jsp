<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>자유게시판 상세조회</title>
<style type="text/css">
	#totalDiv, #totalDiv > div{
		clear: both;
		border: 1px solid black;
		width: 500px;
		height: 60px;
	}
	#totalDiv > div > div {
		border: 1px solid black;
		width: 500px;
		height: 15px;
	}
	
</style>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">


<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>



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
	
	function commentAddFnc() {
		var commentsObj = $('#comments');
		if(commentsObj.val() != ''){
			var mnoObj = $('#mno')
			var fbnoObj = $('#fbno');
			var keywordObj = $('#keyword');
			var searchOptionObj = $('#searchOption');
			
			
			var url = '';
			
			url += './commentAdd.do?';
			url += 'no=' + fbnoObj.val();
			url += '&keyword=' + keywordObj.val();
			url += '&searchOption=' + searchOptionObj.val();
			url += '&mno=' + mnoObj.val();
			url += '&comments=' + commentsObj.val();
			
			location.href = url;
		}else{
			alert('댓글을 써주세용');
		}
		
	}
	
	function freeBoardCommentUpdateFnc(obj, event) {
		
			var aTagObj = $(obj);
			
			event.preventDefault();
			
			var mnoObj = $('#mno')
			var fbnoObj = $('#fbno');
			var keywordObj = $('#keyword');
			var searchOptionObj = $('#searchOption');
			var commentsObj = '';
			var fcnoObj = '';
			
			fcnoObj = aTagObj.parent().parent().children('td').eq(6).children();
			commentsObj = aTagObj.parent().parent().children('td').eq(1).children();
			
			var url = '';
			if(commentsObj.val() != ''){	
			url += './freeBoardCommentUpdateCtr.do?';
			url += 'no=' + fbnoObj.val();
			url += '&keyword=' + keywordObj.val();
			url += '&searchOption=' + searchOptionObj.val();
			url += '&mno=' + mnoObj.val();
			url += '&fcno=' + fcnoObj.val();
			url += '&comments=' + commentsObj.val();
			
			location.href = url;
		}else{
			alert('댓글을 써주세용');
			
		}
		
		
	}

	function freeBoardCommentUpdateOneFnc(obj, event) {
		var aTagObj = $(obj);
		
		event.preventDefault();
		
		var commentsObj = '';
		
		commentsObj = aTagObj.parent().parent().children('td').eq(1).children();
		
		commentsObj.removeAttr('disabled');
		
		var updaObj = '';
		
		updaObj = aTagObj.parent().parent().children('td').eq(5).children();
		
		var confirmBtn = $('<input type="button" value="수정 완료" onclick="freeBoardCommentUpdateFnc(this,event);">');
		
		updaObj.parent().append(confirmBtn);
		updaObj.remove();
	}
	
	function freeBoardCommentDeleteFnc(obj, event) {
		var aTagObj = $(obj);
		
		event.preventDefault();
		
		var mnoObj = $('#mno')
		var fbnoObj = $('#fbno');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		var commentsObj = '';
		var fcnoObj = '';
		
		fcnoObj = aTagObj.parent().parent().children('td').eq(6).children();
		commentsObj = aTagObj.parent().parent().children('td').eq(1).children();
		
		var url = '';
		
		url += './freeBoardCommentDeleteCtr.do?';
		url += 'no=' + fbnoObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&mno=' + mnoObj.val();
		url += '&fcno=' + fcnoObj.val();
		url += '&comments=' + commentsObj.val();
		
		location.href = url;
	}
	
	function freeBoardDelteFnc() {
		var fbnoObj = $('#fbno');
		var url = '';
		
		url += './freeBoardDeleteCtr.do?';
		url += 'no=' + fbnoObj.val();
		
		location.href = url;
	}
	
// 	$(document).ready(function() {
// 		var likeObj = $('#like');
// 		likeObj.focus();		
// 	});
	
</script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	
		
	<div id="wrap">
		<div id="innerWrap">
		<h1>자유게시판</h1>
		<form action='./freeBoardUpdate.do' method='get'>
		<input type="hidden" id="mno" name="mno" value="${memberDto.member_no}">
		<input type="hidden" id="no" name="no" value="${freeBoardDto.freeBoardNo}">
		<input type="hidden" id="fbno" name="fbno" value="${freeBoardDto.freeBoardNo}">
		작성자:<input type="text" id="writer" name="writer" readonly="readonly" value="${freeBoardDto.memberNick}"> 
		<br>
		제목:<input type="text" id="title" name="title" readonly="readonly" value="${freeBoardDto.freeBoardTitle}">
		<br>
		내용:<input type="text" id="contents" name="contents" readonly="readonly" value="${freeBoardDto.freeBoardContents}">
		<br>
		작성일 :<fmt:formatDate value="${freeBoardDto.freeBoardCreDate}" 
								pattern="yyyy.MM.dd HH:mm"/>
		<br>
		조회수:<input type="text" id="views" name="views" readonly="readonly" value="${freeBoardDto.freeBoardViews}"> 
		<br>
		댓글 수:<input type="text" id="commentCount" name="commentCount" readonly="readonly" value="${commentCount}">
		<br>
		
		<c:if test="${empty freeBoardLikeList}">
				<input type="button" id="like" onclick="likeFnc();" value="좋아요">
		</c:if>

		<c:choose>

				<c:when test="${freeBoardLikeList eq 'Y'}">
						<input type="button" id="like" onclick="likeDelFnc();" value="좋아요 취소 ${freeBoardDto.freeBoardLike}">
				</c:when>
				
				<c:when test="${freeBoardLikeList eq 'N'}">
						<input type="button" id="like" onclick="likeUpdateFnc();" value="좋아요">
				</c:when>
							
		</c:choose>
		
			
		<div>
			<input type="hidden" id='no' name="no" value="${freeBoardDto.freeBoardNo}">
			<input type="hidden" id='searchOption' 
				name="searchOption" value="${searchOption}">
			<input type="hidden" id='keyword' 
				name="keyword" value="${keyword}">
		</div>
		<div>
			<c:if test="${freeBoardDto.memberNo eq memberDto.member_no}">
			<input type='submit' value='수정'>
			</c:if>
			<c:if test="${freeBoardDto.memberNo eq memberDto.member_no || memberDto.member_grade eq '1'}">
			<input type='button' value='삭제' onclick="freeBoardDelteFnc();">
			</c:if>
			<input type='button' value='목록' onclick='pageMoveListFnc();'>
		</div>
	</form>
		댓글 : <input type="text" id="comments" name="comments">
		<input type="button" onclick="commentAddFnc();" value="작성">
		
		
<!-- 		<div id="totalDiv"> -->
<!-- 			<div id="imgssDiv"> -->
<!-- 			img -->
<!-- 			</div> -->
<!-- 			<div id="infoDiv"> -->
<!-- 				<div id="nameDiv"> -->
<!-- 				name -->
<!-- 				</div> -->
<!-- 				<div id="datesdfsdfDiv"> -->
<!-- 				date -->
<!-- 				</div> -->
<!-- 				<div id="updateDiv"> -->
<!-- 				update -->
<!-- 				</div> -->
<!-- 				<div id="deleteDiv"> -->
<!-- 				delete -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div id="commentsdfDiv"> -->
<!-- 			comment -->
<!-- 			</div> -->
<!-- 		</div> -->
		
		
		
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
				<td><input type="text" disabled="disabled" value="${freeBoardDto.freeCommentComments}"></td>
				<td>
					<img alt="image not found" style="width: 30px; height:30px;"  
					src="<c:url value='/img/${freeBoardDto.profileTableStoredName}'/>">
				</td>
				<td>
					<fmt:formatDate value="${freeBoardDto.freeCommentCreDate}" pattern="yyyy.MM.dd / hh:mm"/>
				</td>
				
				<c:if test="${freeBoardDto.freeCommentMno eq memberDto.member_no || memberDto.member_grade eq '1'}">
				<td>
					<input type="button" value="삭제 " onclick="freeBoardCommentDeleteFnc(this,event);">
				</td>
				
				<td>
					<input type="button" value="수정 " onclick="freeBoardCommentUpdateOneFnc(this,event);">
				</td>
				</c:if>
				<td><input type="hidden" id="fcno" name="fcno" value="${freeBoardDto.freeCommentNo}"></td>
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
	</table>

	<jsp:include page="/WEB-INF/views/common/commentpaging.jsp">
		<jsp:param value="${freeBoardCommentPaging}" name="freeBoardCommentPaging"/>
	</jsp:include>
	
	<form action="./freeBoardListOne.do#navList" id='pagingForm' method="get">
		<input type="hidden" id='curPage' name='curPage' 
			value="${freeBoardCommentPaging.curPage}">
		<input type="hidden" id='no' name="no" value="${freeBoardDto.freeBoardNo}">
		<input type="hidden" id='searchOption' name="searchOption" value="${searchOption}">
		<input type="hidden" id='keyword' name="keyword" value="${keyword}">
		<input type="hidden" id="comments" name="comments">
	</form>
		</div>
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>