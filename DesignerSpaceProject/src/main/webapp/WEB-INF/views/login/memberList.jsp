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
	
<style type="text/css">

	tr,td,th{
		border: 1px solid black;
	}

</style>
	
</head>



<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<p style="font-size: 50px; font-weight: bold;">회원목록</p>
			<br>
			<br>
			
			<table>
				<tr>
					<td>회원번호</td>
					<td>닉네임</td>
					<td>성명</td>
					<td>이메일</td>
					<td>가입일자</td>	
				<c:choose>
		<c:when test="${empty memberList}">
			<tr>
				<td colspan="5" style="text-align: center;">
					등록된 게시글이 없습니다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="memberDto" items="${memberList}">
			<tr>
				<td>${memberDto.member_no}</td>
				<td>${memberDto.member_nick}</td>
				<td>${memberDto.member_name}</td>
				<td>${memberDto.member_email}</td>
				<td>
				<fmt:formatDate value="${memberDto.member_cre_date}" 
						pattern="yyyy년MM월dd일 hh시mm분"/>
				</td>
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
			</table>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>