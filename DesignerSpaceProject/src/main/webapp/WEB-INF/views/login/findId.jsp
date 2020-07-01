<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h1>아이디찾기</h1>
			<form action="findIdCtr.do" method="post">
				이름
				<input name="member_name" value="관리자">
				휴대폰 번호
				<input name="member_phone" value="010-0000-0000">
				<button>아이디 찾기</button>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>