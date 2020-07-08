<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designer's Space</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">

	<style type="text/css">
		body {
			font-size: 20px;
			font-weight: bold;
			color: #60524E;
		}
		input {
			width: 292px;
			height: 30px;
			margin-top : 10px;
			margin-bottom: 20px;
			border-radius: 5px;
			border: 1px solid #60524E
		}
		button {
			width: 300px;
			height: 35px;
			color: #FFFFFF;
			margin-bottom: 10px;
			background-color: #60524E;
			font-weight: bold;
			border: 1px solid #60524E;
			border-radius: 5px;
		}
		.input_span{
			color: #60524E;
			font-size: 20px;
			font-weight: bold;
		}
		select{
			width: 298px;
			height: 35px;
			border-radius: 5px;
			margin-top: 10px;
		}
		#find_pwd_div{
			width : 300px;
 			text-align: left; 
			margin: auto;
		}	
	
	</style>


	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
</head>

	<script type="text/javascript">
	
	
	function backMoveFnc() {
		location.href='<%=request.getContextPath()%>/login.do';
	}
	
	</script>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
		
			
				
			<div style="margin-bottom: 80px; text-align: center;">
				<span style="font-size: 50px;">비밀번호 찾기</span>
			</div>
			
			
			<div id="find_pwd_div">
				<form action="findPwdCtr.do" method="post">
					이메일<br>
					<input id="email" value="dd" name="member_email"><br>
					본인확인<br>
					<select id="checkQuestion" name="member_check_question">
						<option value="1">나의 보물1호는?</option>
						<option value="2">내가 태어난 고향은?</option>
						<option value="3">가장 친한 친구 이름은?</option>
					</select><br>
					<input value="몰라" name="member_check_answer" ><br>
					<button style="margin-top: 10px;">확인</button>
					</form>
					<button style="background-color: #FFFFFF;
						color: #60524E;" onclick="backMoveFnc()">취소</button>
				
			</div>
		
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>