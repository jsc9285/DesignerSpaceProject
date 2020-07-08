<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">

<style type="text/css">
	#boardTitle{
		font-size: 80px;
		font-weight: bold;
		color: #7D7471;
		text-align: center;
	}
	
	#updateButton{
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
	
	#deleteButton{
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
	
</style>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">

	function pageMoveListFnc() {
		
		var noObj = $('#QNA_BOARD_NO');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		var url = '';
		
		url += './list.do?';
		url += 'QNA_BOARD_NO=' + noObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		
		location.href = url;
	}
	
	function pageMoveDeleteFnc(QNA_BOARD_NO) {
		var reQuestion = confirm('게시물을 삭제하시겠습니까?');
		
		if (reQuestion) {
			var url = "./deleteCtr.do?QNA_BOARD_NO=" + QNA_BOARD_NO;
			location.href = url;
		}else {
			alert("다시 되돌아갑니다");
		}
		
	}

</script>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="wrap">
		<form action='./update.do' method='get'>
			<div id="innerWrap">
				<div id='boardTitle'>
					QnA
				</div>
				
				<div id="innerPage" style="height: 809px; margin-top: 40px;">
					<br>
					<br>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">작성자</span>
						<span style="margin-left: 100px;">${qnaBoardDto.MEMBER_NICK}</span>
					</div>
					<br>
					<hr style="text-align: center; width: 80%;">
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">제목</span>
						<span style="margin-left: 117px;">${qnaBoardDto.QNA_BOARD_TITLE}</span>
					</div>
					<br>
					<hr style="text-align: center; width: 80%;">
					<br>
					<br>
					<div style="margin-left: 200px; height: 400px;">
						<span style="width: 200px;">질문내용</span>
						<span style="margin-left: 86px;">${qnaBoardDto.QNA_BOARD_CONTENTS}</span>
					</div>
					<br>
					<hr style="text-align: center; width: 80%;">
					<br>
					<br>
					<div style="margin-left: 200px; float: left;">
						<span style="width: 200px;">작성일</span>
						<span style="margin-left: 100px;">
							<fmt:formatDate value="${qnaBoardDto.QNA_BOARD_CRE_DATE}" 
								pattern="yyyy.MM.dd hh:mm"/>
						</span>
					</div>
					<div style="margin-left: 120px; float: left;">
						<span style="width: 200px;">답변일</span>
						<span style="margin-left: 100px;">
							<c:choose>
								<c:when test="${empty qnaBoardDto.QNA_BOARD_ANSWER_DATE}">
									-
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${qnaBoardDto.QNA_BOARD_ANSWER_DATE}" 
										pattern="yyyy.MM.dd hh:mm"/>
								</c:otherwise>
							</c:choose>
						</span> 
						
					</div>
					<div style="margin-left: 200px; float: left;">
						<span style="width: 200px;">처리상태</span>
						<span style="margin-left: 86px;">${qnaBoardDto.QNA_BOARD_ANSWER_STATUS}</span>
					</div>
					<div style="margin-left: 200px;">
						<input type="hidden" id='QNA_BOARD_NO' 
							name="QNA_BOARD_NO" value="${qnaBoardDto.QNA_BOARD_NO}">
						<input type="hidden" id='MEMBER_NICK' 
							name="MEMBER_NICK" value="${qnaBoardDto.MEMBER_NICK}">
						<input type="hidden" id='searchOption' name="searchOption" value="${searchOption}">
						<input type="hidden" id='keyword' name="keyword" value="${keyword}">
					</div>
				</div>
			</div>
			
			<div style="text-align: center; margin-top: -20px;">
				<input type="submit" value="수정" id='updateButton'>
				<input type="button" value="삭제" id='deleteButton'
					 onclick="pageMoveDeleteFnc(${qnaBoardDto.QNA_BOARD_NO});">
				<input type="button" value="목록" id='listButton' onclick="pageMoveListFnc();">
			</div>
		</form>
	</div>
	
<!-- 	<div id='innerPage'> -->
<!-- 		<div style="text-align: center;"> -->
<!-- 			<img alt="" src="" style="width: 75px; height: 75px; border: 1px solid black;"> -->
<!-- 			<input type="text" value="" style="width: 800px; height: 100px;"> -->
<!-- 			<input type="button" value="등록" style="width: 100px; height: 100px;"> -->
<!-- 		</div> -->
		
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${empty qnaBoardList}"> --%>
<!-- 				등록된 댓글이 없습니다 -->
<%-- 			</c:when> --%>
			
<%-- 			<c:otherwise> --%>
<%-- 				<c:forEach> --%>
<!-- 					<div> -->
				
<!-- 						<div> -->
							
<!-- 						</div>	 -->
				
<!-- 					</div> -->
<%-- 				</c:forEach> --%>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
		
		
<!-- 	</div> -->
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>