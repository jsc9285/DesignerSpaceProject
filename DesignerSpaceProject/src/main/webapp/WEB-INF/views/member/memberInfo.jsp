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
		.input_span{
			color: #60524E;
			font-size: 20px;
			font-weight: bold;
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
			margin-top: 20px;
			margin-bottom: 20px;	
		}
	</style>


	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
	<script type="text/javascript">
		function backMoveFnc() {
			location.href='<%=request.getContextPath()%>/projectBoard/list.do';
		}
	</script>
	
	
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<div id="innerPage" style="padding: 60px 0px;">
				<div style="margin-bottom: 80px; text-align: center;">
					<span style="font-size: 50px;">회원정보 조회</span>
				</div> 
			
				<div id="join_div">
					<input type="hidden" value="${memberDto.member_no}" name='member_no'>
					<br>
					닉네임
					<br>
					<input type="text" value="${memberDto.member_nick}" name='member_nick'>
					<br>
					이메일
					<br>
					<input type="text" value="${memberDto.member_email}" name='member_email'>
					<br>
					성명
					<br>
					<input type="text" value="${memberDto.member_name}" name='member_name'>
					<br>
					휴대번호
					<br>
					<input type="text" value="${memberDto.member_phone}" name='member_phone'>
					<br>
					
					프로필 이미지<br>
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
					
					자기소개
					<br>
					<div style="overflow: auto; width: 298px; height: 150px; border: 1px solid black; 
						background-color: white; margin-top: 10px; margin-bottom: 40px; font-size: 16px;">
						${memberDto.member_comments}
					</div>
					
					
					<button onclick="location.href='modInfo.do'">수정</button>
					<button style="background-color: #FFFFFF;
					color: #60524E;">탈퇴</button>
					<button style="background-color: #FFFFFF;
					color: #60524E;" onclick="backMoveFnc()">뒤로가기</button>
				</div>	
				
			</div>
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>