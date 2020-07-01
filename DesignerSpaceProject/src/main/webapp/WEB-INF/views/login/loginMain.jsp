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
	
	<script type="text/javascript">
	

			
	
	
	</script>
	
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<form action="./loginCtr.do" method="post">
			<c:choose>
				<c:when test="${empty member_email}">
					<input id="emailInput" type="text" name='member_email' placeholder="이메일 입력" value="dda">
				</c:when>
				<c:otherwise>
					<input id="emailInput" type="text" name='member_email' placeholder="이메일 입력" value="${member_email}">
				</c:otherwise>
			</c:choose>
			<br>
			<input type="text" name='member_pwd' placeholder="비밀번호 입력" value="dd"><br>
			
			<button>로그인</button>
			</form>
			<a href="findId.do">아이디찾기</a>
			<a href="findPwd.do">비밀번호찾기</a>
			<a href="join.do">회원가입</a>
			<a href="list.do">회원목록</a>
			
<%-- 			<c:if test="${not empty memberDto.email}"> --%>
<%-- 				${memberDto.email} --%>
<%-- 			</c:if> --%>
			
			<input id="searchEmail" type="hidden" value="${member_email}">
			
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>