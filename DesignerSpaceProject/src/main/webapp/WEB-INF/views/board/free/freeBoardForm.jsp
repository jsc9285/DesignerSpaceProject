<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>게시판등록</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<style type="text/css">
	#boardTitle{
		font-size: 80px;
		font-weight: bold;
		color: #7D7471;
		text-align: center;
	}
	
	#listButton{
		margin-bottom: 50px;
		width: 150px; 
		height: 50px;
		margin-top: -40px; 
		text-align: center; 
		font-size: 20px; 
		background-color: #7D7471;
		color: white; 
		border-collapse: collapse;
	}
	
	hr{
		text-align: center;
		width: 80%;
	} 
	
	#writeCompleteButton{
		 text-align: center; 
		 width: 150px; 
		 height: 50px; 
		 background-color: #60524E; 
		 color: white;"
		 box-shadow: none;
	}
	
	#resetButton{
		 text-align: center; 
		 width: 150px; 
		 height: 50px; 
		 background-color: #60524E; 
		 color: white;"
		 box-shadow: none;
	}
</style>

<script type="text/javascript">
	function pageMoveListFnc(){
		location.href = './free.do';
	}
</script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	<div id="wrap">
		<div id="innerWrap">
			<div id='boardTitle'>자유 게시판 작성</div>
				<div id="innerPage" style="height: 809px; margin-top: 40px;">
					<form action='./freeBoardAddCtr.do' method='post' 
						enctype="multipart/form-data">
						<br>
						<br>
						<br>
						<br>
						<div style="margin-left: 200px;">
							<input type="hidden" id="mno" name="mno" value="${memberDto.member_no}">
							<span style="width: 200px;">작성자</span>
							<span id="writer" style="margin-left: 80px;">${memberDto.member_nick}</span>
						</div>
						<br>
						<hr>
						<br>
						<br>
						<div style="margin-left: 200px;">
							<span style="width: 200px;">제목</span>
							<input type='text' style="margin-left: 86px;
								width: 850px; height: 50px;"  placeholder="제목을 입력해 주세요" id="title" name='title'>
						</div>
						<br>
						<hr>
						<br>
						<br>
						<div style="margin-left: 200px; height: 400px;">
							<span style="width: 200px;">내용</span>
							<textarea id="contents" name='contents' style="margin-left: 86px; 
								vertical-align: top;" cols="115" rows="25"></textarea>
						</div>
						<br>
						<hr>
						<br>
						<br>
						<div style="text-align: center;">
							<input type='submit' value='작성완료' id='writeCompleteButton'>
							<input type='button' value='취소' id='resetButton' onclick="pageMoveListFnc();">
						</div>
					</form>
				</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
</body>
</html>

