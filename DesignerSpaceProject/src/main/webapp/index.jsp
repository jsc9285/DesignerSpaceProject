<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Spring</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css?after">

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

</head>


<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerPage">	
		
			<input type="button" value="로그인" onclick="location.href='#'">
			
			<input type="button" value="회원목록" onclick="location.href='#'">						
			
			<input type="button" value="작품게시판" onclick="location.href='#'">
			
			<input type="button" value="자유게시판" onclick="location.href='#'">
			
			<input type="button" value="QnA게시판" onclick="location.href='#'">
			
			<input type="button" value="신고하기" onclick="location.href='#'">
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	

</body>
</html>