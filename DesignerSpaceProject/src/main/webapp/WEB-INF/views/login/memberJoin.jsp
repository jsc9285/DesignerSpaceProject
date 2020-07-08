<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designer's Space</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/style.css">


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
	#join_div{
		width : 300px;
		text-align: left; 
		margin: auto;
	}	
	#p_image{
		width: 100px;
		height: 100px;
		border-radius: 50%;
	}
	
	#image_container{
		width: 100px; 
		height: 100px; 
		border: 1px solid black;
		margin: auto;
		border-radius: 50%;
		margin-bottom: 10px;
		margin-top: 20px;
	}
	.overlap{
		width: 85px;
		height: 35px;
	}
	.file_input label{
		position: relative;
		cursor: pointer;
		display: inline-block;
		vertical-align: middle;
		overflow: hidden;
		width: 80px;
		height: 30px;
		background: #e9e9e9;
		border : 1px solid #60524E;
		color: #777;
		text-align: center;
		line-height: 30px;
		border-radius: 5px;
		font-size: 13px;
	}
	
	.file_input label input{
		position: absolute;
		width: 0;
		height: 0;
		overflow: hidden;
		border: 0;
		
	}
	.file_input input[type=text]
	{
		vertical-align: middle;
		display: inline-block;
		width: 120px;
		height: 28px;
		line-height: 28px;
		font-size: 11px;
		border: 1px solid #777;
		padding: 0;
		margin: 0;
	}
	
	input[type=checkbox]{
		width: 15px;
		height: 15px;
	}
	
	textarea {
	resize: none;
	border-radius: 5px;
	margin-top: 10px;
	margin-bottom: 20px;
	}
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	

<script type="text/javascript">
	function setThumbnailFnc(event) { 
		
		document.getElementById("file_route").value = $("#fileName").val();
		
		var reader = new FileReader(); 
		
		reader.onload = function(event) { 
			var img = document.getElementById("p_image"); 
			img.setAttribute("src", event.target.result); 
	// 		document.querySelector("div#image_container").appendChild(img); 
		}; 
		
		reader.readAsDataURL(event.target.files[0]); 
	}

	
	function defaltProfileFnc(){
		
	    $("#fileName").val("");
	    
	    $("#p_image").attr('src', '<%=request.getContextPath()%>/resources/img/profile.png');


 	}
	
	function backMoveFnc() {
		location.href='<%=request.getContextPath()%>/login.do';
	}

</script>

</head>



<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div id="wrap">
		<div id="innerWrap">

			

			<div style="margin-bottom: 80px; text-align: center;">
				<span style="font-size: 50px;">회원가입</span>
			</div> 
			
			<div id="join_div">
				<form action="joinCtr.do" method="post" enctype="multipart/form-data">
					성명<br> 
					<input type="text" name="member_name" value="홍길동"><br> 
					닉네임<br> 
					<input type="text" name="member_nick" value="홍홍"
						style="width: 200px;">
					<input type="button" class="overlap" value="중복확인"><br>
					이메일<br> 
					<input type="email" name="member_email" value="hong@test.com"
						style="width: 200px;">
					<input type="button" class="overlap" value="중복확인"><br> 
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
					<div id="image_container">
						<c:if  test="${empty fileList}">
							<img id="p_image" src="<%=request.getContextPath()%>/resources/img/profile.png">
						</c:if>
					</div>
					
					<div class="file_input">
					  <input type = "text" readonly="readonly" id="file_route">
						
						<label>
							첨부파일
							<input type="file" id="fileName" name="file" accept="image/*" onchange="setThumbnailFnc(event);"
						style="width: 100px;"/> 
						</label>
						
						<input type="button" value="기본프로필" onclick="defaltProfileFnc()" style="width: 80px;">
					</div>
					
					
					소개<br>
					<textarea rows="8" cols="38"  name="member_comments" placeholder="자기소개글을 작성해 주세요"></textarea>
					
					이용약관<br>
					<div style="overflow: auto; width: 296px; height: 150px; 
						margin-top: 10px; border: 1px solid black; background-color: white;">
						동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의?
						어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어 보감 동의? 어
						보감 동의? 어 보감 동의? 어 보감</div>
						
					<input type="checkbox" name="member_sign_check" value='Y'>동의합니다
					<button>가입하기</button>  
				</form>
				<button style="background-color: #FFFFFF;
					color: #60524E;" onclick="backMoveFnc()">취소</button>
			</div>
			
		</div>

	</div>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>