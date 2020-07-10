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
		#find_id_div{
			width : 300px;
 			text-align: left; 
			margin: auto;
		}	
	</style>


	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	

	<script type="text/javascript">
		function backMoveFnc() {
			location.href='<%=request.getContextPath()%>/login.do';
		}
	</script>

</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			
			
				
			<div style="margin-bottom: 80px; text-align: center;">
				<span style="font-size: 50px;">아이디찾기</span><br>
			</div>
			
			<div id="find_id_div">
				<form action="findIdCtr.do" method="post">
					<span class="input_span">이름</span><br>
					<input name="member_name" value="관리자"><br>
					<span class="input_span">휴대폰번호</span><br>
					<input name="member_phone" value="010-0000-0000"><br>
					<button style="margin-top: 50px;">아이디 찾기</button>
				</form>
					<button style="background-color: #FFFFFF;
						color: #60524E;" onclick="backMoveFnc()">취소</button>
			</div>
			
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>