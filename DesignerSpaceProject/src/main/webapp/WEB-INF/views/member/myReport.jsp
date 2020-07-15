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

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<table>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>접수날짜</th>
					<th>완료날짜</th>
					<th>처리상황</th>
				</tr>
			<c:choose>
				<c:when test="${empty reportBoardDto}">
					<tr>
						<td>
							등록된 게시글이 없습니다.
						</td>
					</tr>
				</c:when>
			</c:choose>
			<c:otherwise>
				<c:forEach var="" items="">
					<tr>
						<td>글번호</td>
						<td>제목</td>
						<td>접수날짜</td>
						<td>완료날짜</td>
						<td>처리상황</td>						
					</tr>
				
				</c:forEach>
			</c:otherwise>	
			
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