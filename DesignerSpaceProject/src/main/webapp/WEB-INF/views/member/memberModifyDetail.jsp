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


</head>
<style>
input {
	margin-bottom: 10px;
}

select {
	margin-bottom: 10px;
}

#pImage{
	width: 100px;
	height: 100px;
	border-radius: 50%;
}
#image_container{
	border-radius: 50%;
}
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	

<script type="text/javascript">
	function setThumbnailFnc(event) { 
		var reader = new FileReader(); 
		
		reader.onload = function(event) { 
			var img = document.getElementById("pImage"); 
			img.setAttribute("src", event.target.result); 
	// 		document.querySelector("div#image_container").appendChild(img); 
		}; 
		
		reader.readAsDataURL(event.target.files[0]); }

	
	function defaultProfileFnc(){
		
		
		
	    $("#fileName").val("");
	    
	    $("#pImage").attr('src', '<%=request.getContextPath()%>/resources/img/profile.png');

 	}

</script>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div id="wrap">
		<div id="innerWrap">

			<div style="margin: auto;">

				<form action="modInfoDetailCtr.do" method="post" enctype="multipart/form-data">
					<h1>회원가입</h1><br> 
					번호(히든할것)
					<input type="text" name="member_no" value="${memberDto.member_no}">
					성명<br> 
					<input type="text" name="member_name" value="${memberDto.member_name}"><br> 
					닉네임<br> 
					<input type="text" name="member_nick" value="${memberDto.member_nick}"><br>
					이메일<br> 
					<input type="email" name="member_email" value="${memberDto.member_email}"><br> 
					비밀번호<br> 
					<input type="password" name="member_pwd" value="${memberDto.member_pwd}"><br>
					비밀번호확인<br> 
					<input type="password" value=""><br> 
					휴대폰 번호<br>
					<input type="text" name="member_phone" value="${memberDto.member_phone}"><br>
					본인확인<br> <select name="member_check_question">
						<c:choose>
							<c:when test="${memberDto.member_check_question eq 1}">
								<option value="1" selected="selected">나의 보물1호는?</option>
							</c:when>
							<c:otherwise>
								<option value="1">나의 보물1호는?</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${memberDto.member_check_question eq 2}">
								<option value="2" selected="selected">내가 태어난 고향은?</option>
							</c:when>
							<c:otherwise>
								<option value="2">내가 태어난 고향은?</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${memberDto.member_check_question eq 3}">
								<option value="3" selected="selected">가장 친한 친구 이름은?</option>
							</c:when>
							<c:otherwise>
								<option value="3">가장 친한 친구 이름은?</option>
							</c:otherwise>
						</c:choose>
					</select> <br> 
					<input name="member_check_answer" value="${memberDto.member_check_answer}"><br>
					
					
					 프로필사진<br>
					<input type="file" id="fileName" name="file" accept="image/*" onchange="setThumbnailFnc(event);" /> 
					<br>
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
					<input type="button" value="기본프로필 사용" onclick="defaultProfileFnc()">
				
					
					<br>
					소개<br>
					<input type="text" name="member_comments" value="${memberDto.member_comments}"><br>
					<button>확인</button>
				</form>
				<button>취소</button>
			</div>

		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>