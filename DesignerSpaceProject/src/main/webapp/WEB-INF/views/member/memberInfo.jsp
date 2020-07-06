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
		#pImage{
		width: 100px;
		height: 100px;
		border-radius: 50%;
		}
		
		#imgDiv{
			border:1px solid black;
			width: 100px;
			height: 100px;
			border-radius: 50%;
		}
	</style>
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<p style="font-size: 20px; font-weight: bold;">회원정보 조회</p>
			<br>
			<br>
			
			프로필 이미지<br>
			<div id="imgDiv">
			<c:choose>
				<c:when test="${empty memberDto.profile_table_stored_name}">
					<img id="pImage" alt="기본 프로필 이미지"  src="<%=request.getContextPath()%>/resources/img/profile.png">
				</c:when>
				<c:otherwise>
					<img id="pImage" alt="프로필 이미지" 
						src="<c:url value='/profileImg/${memberDto.profile_table_stored_name}'/>">
				</c:otherwise>
			</c:choose>
			</div>
			<br>
			<input type="hidden" value="${memberDto.member_no}" name='member_no'>
			<br>
			닉네임
			<br>
			<input type="text" value="${memberDto.member_nick}" name='member_nick'>
			<br>
			이메일
			<br>
			<input type="text" value="${memberDto.member_email}" name='member_email'>
			<br>
			성명
			<br>
			<input type="text" value="${memberDto.member_name}" name='member_name'>
			<br>
			휴대번호
			<br>
			<input type="text" value="${memberDto.member_phone}" name='member_phone'>
			<br>
			
			자기소개
			<br>
			<div style="overflow: auto; width: 150px; height: 150px; border: 1px solid black; background-color: white;">
				${memberDto.member_comments}
			</div>
			<br>
			
			<button onclick="location.href='modInfo.do'">수정</button>
			<button >삭제</button>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>