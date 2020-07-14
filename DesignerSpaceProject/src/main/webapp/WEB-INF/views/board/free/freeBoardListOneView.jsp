<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>자유게시판 상세조회</title>
<style type="text/css">
	#boardTitle{
		font-size: 80px;
		font-weight: bold;
		color: #7D7471;
		text-align: center;
	}
	
	#listButton{
		margin-bottom: 50px;
		width: 150px; 
		height: 50px;
		margin-top: -40px; 
		text-align: center; 
		font-size: 20px; 
		background-color: #7D7471;
		color: white; 
		border-collapse: collapse;
	}
	
	#boardTitle:hover{
		font-size: 80px;
		font-weight: bold;
		color: #7D7500;
		text-align: center;
	}
	
	#listButton:hover{
		margin-bottom: 50px;
		width: 150px; 
		height: 50px;
		margin-top: -40px; 
		text-align: center; 
		font-size: 20px; 
		background-color: #7D7500;
		color: white; 
		border-collapse: collapse;
	}
	
	
	hr{
		text-align: center;
		width: 80%;
	} 
	
	#writeCompleteButton{
		 text-align: center; 
		 width: 150px; 
		 height: 50px; 
		 background-color: #60524E; 
		 color: white;"
		 box-shadow: none;
	}
	
	#resetButton{
		 text-align: center; 
		 width: 150px; 
		 height: 50px; 
		 background-color: #60524E; 
		 color: white;"
		 box-shadow: none;
	}
	textarea {
		
		resize: none;
	}
	span{
     word-wrap: break-word;

	}
	
	.imgObj{
		position: absolute;
		top: 1200px;
  		left: 930px;
  		bottom: auto;
  		right: auto;
	}
 	#likeCount{ 
 		position: absolute; 
 		top: 1240px; 
   		left: 950px; 
   		bottom: auto; 
   		right: auto; 
   		color: #4AD674;
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
			var rnumObj = $('#rnum');
			var lineTitleObj = $('#lineTitle');
			var searchOptionObj = $('#searchOption');
			
			
			var url = '';
			
			url += './commentAdd.do?';
			url += 'no=' + fbnoObj.val();
			url += '&keyword=' + keywordObj.val();
			url += '&searchOption=' + searchOptionObj.val();
			url += '&mno=' + mnoObj.val();
			url += '&comments=' + commentsObj.val();
			url += '&rnum=' + rnumObj.val();
			url += '&lineTitleObj=' + lineTitleObj.val();
			
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
			var rnumObj = $('#rnum');
			var keywordObj = $('#keyword');
			var searchOptionObj = $('#searchOption');
			var lineTitleObj = $('#lineTitle');
			var commentsObj = '';
			var fcnoObj = '';
			
			fcnoObj = aTagObj.parent().parent().children('div').eq(1).children().eq(1);
			
			commentsObj = aTagObj.parent().parent().children('div').eq(1).children();
			
			var url = '';
			if(commentsObj.val() != ''){	
			url += './freeBoardCommentUpdateCtr.do?';
			url += 'no=' + fbnoObj.val();
			url += '&keyword=' + keywordObj.val();
			url += '&searchOption=' + searchOptionObj.val();
			url += '&mno=' + mnoObj.val();
			url += '&fcno=' + fcnoObj.val();
			url += '&rnum=' + rnumObj.val();
			url += '&comments=' + commentsObj.val();
			url += '&lineTitleObj=' + lineTitleObj.val();
			
			location.href = url;
		}else{
			alert('댓글을 써주세용');
			
		}
		
		
	}

	function freeBoardCommentUpdateOneFnc(obj, event) {
		var aTagObj = $(obj);
		
		event.preventDefault();
		
		var commentsObj = '';
		
		commentsObj = aTagObj.parent().parent().children('div').eq(1).children('span').eq(0);
		
// 		alert(commentsObj.html());
// 		commentsObj.removeAttr('disabled');
		
		var updaObj = '';
		
		updaObj = aTagObj.parent().parent().children('div').eq(0).children('input').eq(0);
		
		var confirmBtn = $('<input type="button" value="수정 완료" onclick="freeBoardCommentUpdateFnc(this,event);">');
		
		updaObj.after(confirmBtn);
		updaObj.remove();
		var reTextarea = $('<textarea rows="5" cols="112" class="comments" onkeyup="reTextareaFnc();" name="comments">');
		commentsObj.after(reTextarea);
		commentsObj.remove();
	}
	
	function freeBoardCommentDeleteFnc(obj, event) {
		var aTagObj = $(obj);
		
		event.preventDefault();
		
		var mnoObj = $('#mno')
		var fbnoObj = $('#fbno');
		var keywordObj = $('#keyword');
		var rnumObj = $('#rnum');
		var searchOptionObj = $('#searchOption');
		var lineTitleObj = $('#lineTitle');
		var commentsObj = '';
		var fcnoObj = '';
		
		fcnoObj = aTagObj.parent().parent().children('div').eq(1).children().eq(1);
		
		commentsObj = aTagObj.parent().parent().children('div').eq(1).children('span').eq(0);
		
		var url = '';
		
		url += './freeBoardCommentDeleteCtr.do?';
		url += 'no=' + fbnoObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&mno=' + mnoObj.val();
		url += '&fcno=' + fcnoObj.val();
		url += '&rnum=' + rnumObj.val();
		url += '&comments=' + commentsObj.val();
		url += '&lineTitleObj=' + lineTitleObj.val();
		
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

	function reTextareaFnc() {
		$('.comments').keyup(function (e){
			var comments = $(this).val();		
			if(comments.length > 20){
				alert('댓글은 최대 20자까지입니당.');
				$(this).val(content.substring(0, 20));
			}
		});
	}
	
	function prePageFnc() {
		
		  var fbnoObj = $('#fbno');
		  var mnoObj = $('#mno');
	      var rnumObj = $('#rnum');
	      var keywordObj = $('#keyword');
	      var searchOptionObj = $('#searchOption');
	      var lineTitleObj = $('#lineTitle');
	      
	      var url = '';
	      
	      url += './prePage.do?';
	      url += 'no=' + fbnoObj.val();
	      url += '&mno=' + mnoObj.val();
	      url += '&rnum=' + rnumObj.val();
	      url += '&keyword=' + keywordObj.val();
	      url += '&searchOption=' + searchOptionObj.val();
	      url += '&lineTitleObj=' + lineTitleObj.val();
	      
	      
	      location.href = url;
	}
	
	function nextPageFnc() {
		  var fbnoObj = $('#fbno');
		  var mnoObj = $('#mno');
	      var rnumObj = $('#rnum');
	      var keywordObj = $('#keyword');
	      var searchOptionObj = $('#searchOption');
	      var lineTitleObj = $('#lineTitle');
	      
	      var url = '';
	      
	      url += './nextPage.do?';
	      url += 'no=' + fbnoObj.val();
	      url += '&mno=' + mnoObj.val();
	      url += '&rnum=' + rnumObj.val();
	      url += '&keyword=' + keywordObj.val();
	      url += '&searchOption=' + searchOptionObj.val();
	      url += '&lineTitleObj=' + lineTitleObj.val();
	      
	      
	      location.href = url;
	}

	
	$(document).ready(function () {
		$('.comments').keyup(function (e){
			var comments = $(this).val();		
			if(comments.length > 20){
				alert('댓글은 최대 20자까지입니당.');
				$(this).val(content.substring(0, 20));
			}
		});
	});
	
</script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	

				
					<form action='./freeBoardUpdate.do' method='get'>
					<div id="wrap">
						<div id="innerWrap">
							<div id='boardTitle'>자유게시판</div>
							<div id='innerPage' style="height: 809px; margin-top: 40px;">
						<br>
						<br>
						<br>
						<br>
						<input type="hidden" id="mno" name="mno" value="${mno}">
						<input type="hidden" id="no" name="no" value="${no}">
						<input type="hidden" id="fbno" name="fbno" value="${freeBoardDto.freeBoardNo}">
						<input type="hidden" id="writer" name="writer" value="${freeBoardDto.memberNick}">
						<input type="hidden" id="title" name="title" value="${freeBoardDto.freeBoardTitle}">
						<input type="hidden" id="contents" name="contents" value="${freeBoardDto.freeBoardContents}">
						<input type="hidden" id="rnum" name="rnum" value="${rnum}">
						<input type="hidden" id="lineTitle" name="lineTitle" value="${lineTitle}">
						
						<div style="margin-left: 200px;">
							<span style="width: 50px; ">작성자</span>
							<span id="writer" style="margin-left: 80px;">${freeBoardDto.memberNick}</span>					
						</div>
						
						<br>
						<hr>
						<br>
						<br>
						<div style="margin-left: 200px;">
							<span style="width: 50px;">제목</span>
							<span id="title" style="margin-left: 86px;
									width: 780px; height: 50px;">${freeBoardDto.freeBoardTitle}</span>
						</div>
						<br>
						<hr>
						<br>
						<br>
						<div style="margin-left: 200px; height: 400px;">
							<span style="width: 50px; margin-bottom: 50px;">내용</span>
							<span id="contents" style=" margin-left: 86px;
									width: 780px; height: 400px; display:inline-block; white-space: pre-wrap;">${freeBoardDto.freeBoardContents}</span>
						</div>
						<br>
						<hr>
						<br>
						<br>
						<div style="margin-left: 200px;">
						<span style="width: 600px;">작성일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; 
						<fmt:formatDate value="${freeBoardDto.freeBoardCreDate}" 
																pattern="yyyy.MM.dd HH:mm"/> 
						</span>
						</div>

						<div>
							<input type="hidden" id='no' name="no" value="${freeBoardDto.freeBoardNo}">
							<input type="hidden" id='searchOption' 
								name="searchOption" value="${searchOption}">
							<input type="hidden" id='keyword' 
								name="keyword" value="${keyword}">
						</div>
						<br>
						<br>
						<br>
						<br>
						
						</div>
						<div style="text-align: center;">
							<c:if test="${empty freeBoardLikeList}">
									<div>
									<br>
									<br>
									<input type="button" id="like" onclick="likeFnc();" value="" 
									style="border-radius: 50%; 
									width:75px; height:75px; background-color:#4AD674; ">
									<img class="imgObj" src="<%=request.getContextPath()%>/resources/img/iconLike_Brown.png">
									</div>
							</c:if>
					
							<c:choose>
					
								<c:when test="${freeBoardLikeList eq 'Y'}">
									<div>
									<br>
									<br>
										<input style="border-radius: 50%; width:75px; height:75px; 
										background-color:#60524E; color:#4AD674" type="button" id="like" onclick="likeDelFnc();" 
										value="">
										<span id="likeCount">${freeBoardDto.freeBoardLike}</span>
										<img class="imgObj" src="<%=request.getContextPath()%>/resources/img/iconLike_Green.png"> 
									</div>
								</c:when>
								
								<c:when test="${freeBoardLikeList eq 'N'}">
									<div>
									<br>
									<br>
										<input style="border-radius: 50%; width:75px; height:75px; 
										background-color:#4AD674; " type="button" id="like" 
										onclick="likeUpdateFnc();" value="">
										<img class="imgObj" src="<%=request.getContextPath()%>/resources/img/iconLike_Brown.png">
									</div>
								</c:when>
												
								</c:choose>
								<br>
								<span style="font-size: 35px;">${freeBoardDto.freeBoardTitle}</span>
								<br>
								<br>
								<div style="width: 200px; height: 15px; margin-left: 805px;">
								<img style="float: left;" src="<%=request.getContextPath()%>/resources/img/iconLike.png">
								<span style="float: left;">${freeBoardDto.freeBoardLike}</span>
								<img style="float: left;" src="<%=request.getContextPath()%>/resources/img/iconView.png">
								<span style="float: left;" id="views">${freeBoardDto.freeBoardViews}</span>
								<img style="float: left;" src="<%=request.getContextPath()%>/resources/img/iconChat_grey.png">
								<span style="float: left;" id="commentCount">${commentCount}</span>
								</div>
	<%-- 							조회수:<input type="text" id="views" name="views" readonly="readonly" value="${freeBoardDto.freeBoardViews}">  --%>
	<%-- 							댓글 수:<input type="text" id="commentCount" name="commentCount" readonly="readonly" value="${commentCount}"> --%>
								<br>
								<br>
								<span>작성일 <fmt:formatDate value="${freeBoardDto.freeBoardCreDate}" 
																	pattern="yyyy년  MM월  dd일 "/> 
								</span>
								
								<br>
								<br>
								<c:choose>
								<c:when test="${rnum eq 1}">
								
								</c:when>
								<c:otherwise>
									<input type="button" id="preBtn" onclick="prePageFnc();" value="이전 글">
								</c:otherwise>
								</c:choose>
								<c:if test="${freeBoardDto.memberNo eq memberDto.member_no}">
									<input type='submit' style="text-align: center; 
											 width: 150px;  height: 50px; 
											 background-color: #60524E;  color: white;" value='수정'>
								</c:if>
								<c:if test="${freeBoardDto.memberNo eq memberDto.member_no || memberDto.member_grade eq '1'}">
								<input type='button' style="text-align: center; 
											 width: 150px;  height: 50px; 
											 background-color: #60524E;  color: white;" value='삭제' onclick="freeBoardDelteFnc();">
								</c:if>
								<input type='button' style="text-align: center; 
											 width: 150px;  height: 50px; 
											 background-color: #60524E;  color: white;" value='목록' onclick='pageMoveListFnc();'>
								<c:choose>
								<c:when test="${rnum eq totalMoveCount}">
								
								</c:when>
								<c:otherwise>
									<input type="button" id="nextBtn" onclick="nextPageFnc();" value="다음 글">
								</c:otherwise>
								</c:choose>			 
								</div>
							</div>	
						</div>
					</form>
		
	<div id="wrap">
		<div id="innerWrap">
			<div id='innerPage'>
				  <div style="text-align: center; margin-left:70px;">
		               <img alt="프로필 이미지"  style="vertical-align: middle;"
		                src="<%=request.getContextPath()%>/resources/img/iconNone.png">
		                
		               <textarea id="comments" class="comments" name="comments" style="vertical-align:middle;" placeholder="댓글을 써주세용" rows="7" cols="112"></textarea>
<!-- 		               <input type="text" id="comments" -->
<!-- 		                  class="comments" name="comments" style="width: 800px; height: 100px;"> -->
		               <input type="button" value="등록" onclick="commentAddFnc();" 
		                  style="margin-left:-7px; width: 105px; height: 107px; text-align: center;
		                   background-color: #60524E;  color: white;">
		          </div>
					<c:choose>
		               <c:when test="${empty freeBoardCommentList}">
		                  	<span style="margin-left: 300px; margin-bottom: 100px; font-weight: bold; font-size: 24px;">댓글이 없습니다</span>
		               </c:when>
		               <c:otherwise>
		                  <c:forEach var="freeBoardDto" items="${freeBoardCommentList}">
		                  <br>
		                     <div style="margin-left: 210px; width: 950px; height: 116px;">
		                        <img alt="프로필 이미지" src="<c:url value='/img/${freeBoardDto.profileTableStoredName}'/>"
		                           style="border-radius: 50%; width: 75px; height: 75px; float: left;">
		                        <div>
		                           <span style="font-size: 25px;">
		                              ${freeBoardDto.memberNick}
		                           </span>
		                           <fmt:formatDate value="${freeBoardDto.freeCommentCreDate}" pattern="yyyy.MM.dd / hh:mm"/>
		                           <c:if test="${freeBoardDto.freeCommentMno eq memberDto.member_no || memberDto.member_grade eq '1'}">
		                           		<input type="button" value="수정 " onclick="freeBoardCommentUpdateOneFnc(this,event);">
		                           		<input type="button" value="삭제 " onclick="freeBoardCommentDeleteFnc(this,event);">
		                           </c:if>
		                        </div>
		                        <div style="margin-top: 10px;">
		                        	<span>${freeBoardDto.freeCommentComments}</span>
		                        	<input type="hidden" id="fcno" name="fcno" value="${freeBoardDto.freeCommentNo}">
		                        </div>
		                     </div>
		                  </c:forEach>
		               </c:otherwise>
		            </c:choose>
	
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
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>