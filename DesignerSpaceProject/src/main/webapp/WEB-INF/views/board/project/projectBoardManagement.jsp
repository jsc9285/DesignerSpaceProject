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
		tr{
			border: 1px solid black;
		}
		#topMenu{
			display: inline-flex;
		}
		#topMenu > h1{
			font-size: 80px;
			font-weight: bold;
			color: #60524E;
		}
		#topMenu input{
			width: 420px;
			height: 50px;
			box-sizing: border-box;
		}
		#innerPage{
			margin-top: 30px;
		}
	</style>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
	<script type="text/javascript">	
		$(document).ready(function() {
			//체크박스 전체선택
		   $('#allCheck').click(function() {
		      var allChecked = $(this).prop('checked');
		      
		      if (allChecked) {
		         $('.checkbox').each(function(){
		        	 $(this).prop('checked', true);
		         });
		      } else{
		         $('.checkbox').prop('checked', false);
		      }
		      
		   });
		   //전체선택에서 개별 선택시 전체선택 비활성화
		   $('.checkbox').click(function() {
		       if (!$(this).prop('checked')) {
		           $("#allCheck").prop('checked', false);
		       }
		   });
		});	
		
		function projectDeleteFnc() {			
			if(confirm('정말로 삭제하시겠습니까?')){
		 		return true;
		 	}else{
		 		return false;
		 	}
		}
	</script>
	
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
<!-- 			페이지정보, 검색, 파일삭제Btn -->
			<form action="./ManagementDeleteCtr.do" method="get">
			<div id="topMenu">
				<h1>작품관리</h1>
			
				<input type="text">
				<button id="searchBtn"><img src="<%=request.getContextPath()%>/resources/img/iconSearch.png"></button>
				
				<input type="submit" value="작품삭제" onclick="projectDeleteFnc();">				
			</div>
			<div id="innerPage">			
<!-- 			프로젝트 관리 테이블 ( 작품 게시물 정보 ) -->
			<table>
				<tr>
					<th><input id="allCheck" type="checkbox"></th>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>댓글수</th>
					<th>조회수</th>
					<th>좋아요</th>
					<th>작성일</th>					
				</tr>
				<c:forEach var="projectList" items="${projectBoardList}">
					<tr>
						<td><input name='projectCheck' type="checkbox" class='checkbox' value="${projectList.project_board_no}"></td>
						<td>${projectList.project_board_no}</td>
						<td>${projectList.project_board_title}</td>
						<td>${projectList.member_nick}</td>
						<td>${projectList.project_comment_cnt}</td>
						<td>${projectList.project_board_views}</td>
						<td>${projectList.project_board_like}</td>
						<td><fmt:formatDate value="${projectList.project_board_cre_date}" 
							pattern="yyyy.MM.dd"/><br>
							<fmt:formatDate value="${projectList.project_board_cre_date}" 
							pattern="hh:mm"/></td>
					</tr>
				</c:forEach>				
			</table>
			
<!-- 			페이징 -->
			</div>
			</form>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>