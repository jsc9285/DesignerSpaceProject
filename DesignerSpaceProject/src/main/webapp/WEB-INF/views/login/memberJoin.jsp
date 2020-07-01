<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designer's Space</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/style.css">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/script.js"></script>

</head>
<style>
input {
	margin-bottom: 10px;
}

select {
	margin-bottom: 10px;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		alert('되는가');

	}
</script>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div id="wrap">
		<div id="innerWrap">

			<div style="margin: auto;">

				<form action="joinCtr.do" method="post">
					<h1>회원가입</h1><br> 
					성명<br> 
					<input type="text" name="member_name" value="홍길동"><br> 
					닉네임<br> 
					<input type="text" name="member_nick" value="홍홍"><br>
					이메일<br> 
					<input type="email" name="member_email" value="hong@test.com"><br> 
					비밀번호<br> 
					<input type="password" name="member_pwd" value="aaa"><br>
					비밀번호확인<br> 
					<input type="password" value="member_phone"><br> 
					휴대폰 번호<br>
					<input type="text" name="member_phone" value="0102345675"><br>
					본인확인<br> <select name="member_check_question">
						<option value="1">나의 보물1호는?</option>
						<option value="2">내가 태어난 고향은?</option>
						<option value="3">가장 친한 친구 이름은?</option>
					</select> <br> 
					<input name="member_check_answer" value="김치"><br>
					 프로필사진<br>
					<input type="file" name="profile"><br> 
					소개<br>
					<input type="text" name="member_comments" value="자기 소개글을 간단히 작성해주세요"><br>
					이용약관<br>
					<div style="overflow: auto; width: 150px; height: 150px; border: 1px solid black; background-color: white;">
						동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의?
						어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어
						보감 동의? 어 보감 동의? 어 보감</div>
					<input type="checkbox" name="member_sign_check" value='Y'>동의합니다 <br>
					<button>가입하기</button>
				</form>
				<button>취소</button>
			</div>

		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>