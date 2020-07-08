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

		tr,td,th{
			border: 1px solid black;
		}

	</style>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
	
	<script type="text/javascript">
	
		window.onload = function(){
			
			
			if($('#board_cnt').val == null){
				$('#get_board_cnt').val =$('#board_cnt').val;
				
			}
			
		}
	
	</script>

	
</head>



<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
		
			<button onclick="location.href='listOneAdmin.do'">회원눌렀을시 이동</button>
			<p style="font-size: 50px; font-weight: bold;">회원목록</p>
			<br>
			<br>
			
			<table>
				<tr>
					<td>회원번호</td>
					<td>닉네임</td>
					<td>이메일</td>
					<td>작품수</td>
					<td>좋아요</td>	
					<td>가입일자</td>	
						
				<c:choose>
		<c:when test="${empty memberList}">
			<tr>
				<td colspan="6" style="text-align: center;">
					등록된 게시글이 없습니다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="memberDto" items="${memberList}">
			<tr>
				<td>${memberDto.member_no}</td>
				<td>${memberDto.member_nick}</td>
				<td>${memberDto.member_email}</td>
				<c:choose>
					<c:when test="${empty memberDto.boardCnt}">
						<td id="board_cnt">0</td>
					</c:when>
					<c:otherwise>
						<td id="board_cnt">${memberDto.boardCnt}</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty memberDto.likeCnt}">
						<td id="like_cnt">0</td>
					</c:when>
					<c:otherwise>
						<td id="like_cnt">${memberDto.likeCnt}</td>
					</c:otherwise>
				</c:choose>
				
				<td>
					<h5><fmt:formatDate value="${memberDto.member_cre_date}" 
						pattern="yyyy.MM.dd"/></h5>
					<h5><fmt:formatDate value="${memberDto.member_cre_date}" 
						pattern="hh:mm"/></h5>
				</td>
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
			</table>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>