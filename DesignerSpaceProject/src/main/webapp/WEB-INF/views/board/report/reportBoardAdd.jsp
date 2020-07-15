<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">

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
	}
	
	#resetButton{
		 text-align: center; 
		 width: 150px; 
		 height: 50px; 
		 background-color: #60524E; 
		 color: white;" 
	}
</style>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">
	function pageMoveListFnc() {
		location.href = './list.do';
	}
</script>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="wrap">
		<div id="innerWrap">
			<div id='boardTitle'>
				신고하기
			</div>
			
			<div id="innerPage" style="height: 809px; margin-top: 40px;">
				<form action='./addCtr.do' method='post'>
					<br>
					<br>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">작성자</span>
						<span style="margin-left: 100px;">${memberDto.member_nick}</span>
						<span style="width: 200px; margin-left: 300px;">신고대상</span>
						<span style="margin-left: 100px;">${projectBoardDto.member_nick}</span>
					</div>
					<br>
					<hr>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">신고작품</span>
<%-- 						<span style="margin-left: 84px;">${projectBoardDto.project_board_title}</span> --%>
						<span style="margin-left: 84px;">${projectBoardDto.project_board_title}</span>
					</div>
					<br>
					<hr>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">신고사유</span>
						<input type="text" name="report_board_reason" value="${reportBoardDto.report_board_reason}" 
							style="margin-left: 87px;
							width: 850px; height: 50px;">
					</div>
					<br>
					<hr>
					<br>
					<br>
					<div style="margin-left: 200px; height: 400px;">
						<span style="width: 200px; margin-top: 0px;">신고내용</span>
						<textarea name="report_board_contents" style="margin-left: 86px; 
							vertical-align: top;" cols="115" rows="25"></textarea>
					</div>
					<br>
					<hr>
					<br>
					<br>
					<div style="text-align: center;">
						<input type="submit" value="작성완료" id='writeCompleteButton'>
						<input type="button" value="취소" id='resetButton' onclick="pageMoveListFnc();">
						<input type="text" value="${projectBoardDto.project_board_mno}" 
							 name="project_board_mno">
						<input type="hidden" value="${projectBoardDto.member_nick}" 
							 name="member_nick">
						<input type="hidden" value="${projectBoardDto.project_board_mno}"
							 name="report_board_mno">
						<input type="hidden" value="${projectBoardDto.project_board_title}"
							 name="report_board_title">
						<input type="hidden" value="${memberDto.member_name}"
							 name="report_board_name">
						<input type="hidden" value="${project_board_no}"
							 name="report_board_no">
					</div>
				</form>	
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>