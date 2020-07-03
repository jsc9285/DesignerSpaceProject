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

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">
		
</script>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="wrap">
		<div id="innerWrap">
			<div style="font-size: 80px; font-weight: bold; color: #7D7471; text-align: center;">
				QnA
			</div>
			
			<div id="innerPage" style="height: 809px; margin-top: 40px;">
				<form action='./update.do' method='get'>
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
						작성일
						<span style="margin-left: 100px;">
							<fmt:formatDate value="${qnaBoardDto.QNA_BOARD_CRE_DATE}" 
								pattern="yyyy.MM.dd hh:mm"/>
						</span>
					</div>
					<div style="margin-left: 120px; float: left;">
						답변일
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
						처리상태&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						${qnaBoardDto.QNA_BOARD_ANSWER_STATUS}
					</div>
					<div style="margin-left: 200px;">
						<input type="hidden" id='QNA_BOARD_NO' name="QNA_BOARD_NO" value="${qnaBoardDto.QNA_BOARD_NO}">
					</div>
				</form>	
			</div>
		</div>
		
		<div style="text-align: center; margin-top: -20px;">
			<input type="text" value="목록" style="margin-bottom: 50px; width: 150px; height: 50px;
				margin-top: -40px; text-align: center; font-size: 20px; background-color: #7D7471;
				color: white; border-collapse: collapse;">
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>