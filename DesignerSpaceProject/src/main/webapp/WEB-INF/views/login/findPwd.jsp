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

	<script type="text/javascript">
	function aFnc() {
		var a = $('#checkQuestion').val();
		
		alert(a);
	}
	
	</script>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<h1>비밀번호 찾기</h1>
			<br>
			<form action="./findPwdCtr.do" method="post">
				이메일<br>
				<input id="email" value="dd" name="member_email">
				<select id="checkQuestion" name="member_check_question">
					<option value="1">나의 보물1호는?</option>
					<option value="2">내가 태어난 고향은?</option>
					<option value="3">가장 친한 친구 이름은?</option>
				</select>
				<input value="몰라" name="member_check_answer" >
				<button onclick="aFnc();">버튼</button>
			</form>

			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>