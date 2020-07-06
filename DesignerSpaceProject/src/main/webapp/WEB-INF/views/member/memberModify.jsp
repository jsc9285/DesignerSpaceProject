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
			<p style="font-size: 20px; font-weight: bold;">회원정보 수정</p>
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
			<input type="text" value="${member_no}" name='member_no'>
			<br>
			비밀번호
			<br>
			<input type="text" id="chkpwd" value="비밀번호를 입력해주세요">
			<br>
			<br>
			<input type="text" value="${member_pwd}" name='member_pwd'>
			<br>
			
			
			<button onclick="location.href='modInfoDetail.do'">확인</button>
			<button >취소</button>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>