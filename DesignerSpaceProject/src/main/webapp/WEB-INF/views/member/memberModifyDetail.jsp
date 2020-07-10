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
	select{
		width: 298px;
		height: 35px;
		border-radius: 5px;
		margin-top: 10px;
	}
	textarea {
	resize: none;
	border-radius: 5px;
	margin-top: 10px;
	margin-bottom: 20px;
	border-radius: 5px;
	}
	.input_span{
		color: #60524E;
		font-size: 20px;
		font-weight: bold;
	}
	.overlap{
		width: 85px;
		height: 35px;
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
	
	#img_div{
		border:1px solid black;
		width: 100px;
		height: 100px;
		border-radius: 50%;
		margin: auto;
		margin-bottom: 20px;
		margin-top: 20px;
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
	.file_input input[type=text]{
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

</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	

</head>



<script type="text/javascript">
	
	
	
	function setThumbnailFnc(event) { 
		
		
		$("#chang_flag").attr('value', 'Y');
// 		$("#file_name").setAttribute("name", "file");
		
		document.getElementById("file_route").value =  $("#file_name").val();
		
		var reader = new FileReader(); 
		
		reader.onload = function(event) { 
			var img = document.getElementById("p_image"); 
			img.setAttribute("src", event.target.result); 
	// 		document.querySelector("div#image_container").appendChild(img); 
		}; 
		
		reader.readAsDataURL(event.target.files[0]); }

	
	function defaultProfileFnc(){
		
		$("#chang_flag").attr('value', 'Y');
// 		$("#file_name").setAttribute("name", "file");
		
	    $("#file_name").val("");
	    $("#file_route").val("");
	    
	    $("#p_image").attr('src', '<%=request.getContextPath()%>/resources/img/profile.png');

 	}

</script>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div id="wrap">
		<div id="innerWrap">
			<div id="innerPage" style="padding: 60px 0px;">
				
				<div style="margin-bottom: 80px; text-align: center;">
					<span style="font-size: 50px;">회원정보 수정</span>
				</div> 
				
				<div id="join_div">
					<form action="modInfoDetailCtr.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="member_no" value="${memberDto.member_no}">
						성명<br> 
						<input type="text" name="member_name" value="${memberDto.member_name}"><br> 
						닉네임<br>
						<input type="text" name="member_nick" value="${memberDto.member_nick}"
						style="width: 200px;">
						<input type="button" class="overlap" value="중복확인"><br>
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
						<div id="img_div">
							<c:choose>
								<c:when test="${empty memberDto.profile_table_stored_name}">
									<img id="p_image" alt="기본 프로필 이미지"  src="<%=request.getContextPath()%>/resources/img/profile.png">
								</c:when>
								<c:otherwise>
									<img id="p_image" alt="프로필 이미지" 
										src="<c:url value='/profileImg/${memberDto.profile_table_stored_name}'/>">
								</c:otherwise>
							</c:choose>
						</div>
						
						<div class="file_input">
						  <input type = "text" readonly="readonly" id="file_route" placeholder="기본프로필 이미지.jpg" 
						  	value="${memberDto.profile_table_original_name}">
							
							<label>
								첨부파일
								<input type="file" id="file_name" name="file" accept="image/*" onchange="setThumbnailFnc(event);"
							style="width: 100px;"/> 
							</label>
							
							<input type="button" value="기본프로필" onclick="defaultProfileFnc()" style="width: 80px;">
						</div>
						<input type="hidden" id="chang_flag" name="change" value="N">
						
						소개<br>
						<textarea rows="8" cols="38"  name="member_comments" >${memberDto.member_comments}</textarea>
						<button>확인</button>
					</form>
					<button>취소</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>