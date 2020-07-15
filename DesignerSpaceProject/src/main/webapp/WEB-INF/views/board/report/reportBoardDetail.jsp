<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">

<style type="text/css">
	#boardTitle{
		font-size: 80px;
		font-weight: bold;
		color: #7D7471;
		text-align: center;
	}
	
	#updateButton{
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
	
	#deleteButton{
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
	
</style>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">

	function pageMoveListAdminFnc() {
		
		location.href = './list.do';
	}
	
<<<<<<< HEAD
	function pageMoveListUserFnc() {
		
		location.href = '../member/myReport.do';
	}
	
	function pageMoveDeleteFnc(report_board_no) {
		var reQuestion = confirm('게시물을 삭제하시겠습니까?');
=======
// 	function pageMoveDeleteFnc(qna_board_no) {
// 		var reQuestion = confirm('게시물을 삭제하시겠습니까?');
>>>>>>> branch 'master' of https://github.com/jsc9285/DesignerSpaceProject.git
		
<<<<<<< HEAD
		if (reQuestion) {
			var url = "./deleteCtr.do?report_board_no=" + report_board_no;
			location.href = url;
		}
=======
// 		if (reQuestion) {
// 			var url = "./deleteCtr.do?report_board_no=" + qna_board_no;
// 			location.href = url;
// 		}else {
// 			alert("다시 되돌아갑니다");
// 		}
>>>>>>> branch 'master' of https://github.com/jsc9285/DesignerSpaceProject.git
		
// 	}
	
</script>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="wrap">
		<form action='./listDetail.do' method='get'>
			<div id="innerWrap">
				<div id='boardTitle'>
					신고글
				</div>
				
				<div id="innerPage" style="height: 809px; margin-top: 40px;">
					<br>
					<br>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">작성자</span>
						<span style="margin-left: 100px;">${reportBoardDto.member_nick}</span>
						<span style="width: 200px; margin-left: 300px;">신고대상</span>
						<span style="margin-left: 100px;">${reportBoardDto.member_nick}</span>
					</div>
					<br>
					<hr style="text-align: center; width: 80%;">
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">신고작품</span>
						<a style="margin-left: 85px;" href="<%=request.getContextPath()%>
							/projectBoard/detail.do?project_board_no=${project_board_no}&chkPage=3">
							${reportBoardDto.report_board_title}
						</a>
					</div>
					<br>
					<hr style="text-align: center; width: 80%;">
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">신고사유</span>
						<span style="margin-left: 85px;">${reportBoardDto.report_board_reason}</span>
					</div>
					<br>
					<hr style="text-align: center; width: 80%;">
					<br>
					<br>
					<div style="margin-left: 200px; height: 400px;">
						<span style="width: 200px;">신고내용</span>
						<span style="margin-left: 86px;">${reportBoardDto.report_board_contents}</span>
					</div>
					<br>
					<hr style="text-align: center; width: 80%;">
					<br>
					<br>
					<div style="margin-left: 200px; float: left;">
						<span style="width: 200px;">작성일</span>
						<span style="margin-left: 100px;">
							<fmt:formatDate value="${reportBoardDto.report_board_cre_date}" 
								pattern="yyyy.MM.dd HH:mm"/>
						</span>
					</div>
					
					<div style="margin-left: 120px; float: left;">
						<span style="width: 200px;">처리일</span>
						<span style="margin-left: 100px;">
							<c:choose>
								<c:when test="${empty qnaBoardDto.qna_board_answer_date}">
									-
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${qnaBoardDto.qna_board_answer_date}" 
										pattern="yyyy.MM.dd hh:mm"/>
								</c:otherwise>
							</c:choose>
						</span> 
						
					</div>
					
					<div style="margin-left: 200px; float: left;">
						<span style="width: 200px;">처리상태</span>
						<c:if test="${reportBoardDto.report_board_answer_status eq '접수중'}">
							<span style="margin-left: 86px; color: #E14E4E;">
								${reportBoardDto.report_board_answer_status}
							</span>
						</c:if>
						<c:if test="${reportBoardDto.report_board_answer_status eq '처리기각'}">
							<span style="margin-left: 86px; color: #BFC506;">
								${reportBoardDto.report_board_answer_status}
							</span>
						</c:if>
						<c:if test="${reportBoardDto.report_board_answer_status eq '처리완료'}">
							<span style="margin-left: 86px; color: #BABABA;">
								${reportBoardDto.report_board_answer_status}
							</span>
						</c:if>
					</div>
					<div style="margin-left: 200px;">
						<input type="hidden" id='report_board_no' 
							name="report_board_no" value="${reportBoardDto.report_board_no}">
						<input type="hidden" id='member_nick' 
							name="member_nick" value="${reportBoardDto.member_nick}">
						<input type="hidden" id='searchOption' name="searchOption" value="${searchMap.searchOption}">
						<input type="hidden" id='project_board_no' name="project_board_no" 
							value="${projectBoardDto.project_board_no}">
						<input type="hidden" id='chkPage' name="chkPage" value="${projectBoardDto.chkPage}">
					</div>
				</div>
			</div>
			
<<<<<<< HEAD
			
			<c:if test="${memberDto.member_grade == 1}">
				<div style="text-align: center; margin-top: 50px;">
					<input type="button" value="삭제" id='deleteButton'
						 onclick="pageMoveDeleteFnc(${reportBoardDto.report_board_no});">
					<input type="button" value="목록" id='listButton' onclick="pageMoveListAdminFnc();">
				</div>
			</c:if>
			
			<c:if test="${memberDto.member_grade == 0}">
				<c:if test="${memberDto.member_nick eq reportBoardDto.member_nick}">
					<div style="text-align: center; margin-top: 50px;">
						<input type="button" value="삭제" id='deleteButton'
							 onclick="pageMoveDeleteFnc(${reportBoardDto.report_board_no});">
						<input type="button" value="목록" id='listButton' onclick="pageMoveListUserFnc();">
					</div>
				</c:if>
				<c:if test="${memberDto.member_nick ne reportBoardDto.member_nick}">
					<div style="text-align: center; margin-top: 50px;">
						<input type="button" value="목록" id='listButton' onclick="pageMoveListUserFnc();">
					</div>
				</c:if>	
			</c:if>
			
			
			
=======
			<div style="text-align: center; margin-top: 50px;">
				<input type="button" value="목록" id='listButton' onclick="pageMoveListFnc();">
			</div>
>>>>>>> branch 'master' of https://github.com/jsc9285/DesignerSpaceProject.git
			
		</form>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>