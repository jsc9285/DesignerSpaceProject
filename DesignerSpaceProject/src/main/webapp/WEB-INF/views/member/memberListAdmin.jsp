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

	#boardTitle{
		font-size: 80px;
		font-weight: bold;
		float: left;
		color: #7D7471;
	}

	#searchOption{
		margin-top: 40px;
		margin-left: 20px;
		width: 138px;
		height: 50px;
		vertical-align: middle;
		text-align-last: center;
		font-size: 17px;
		float: left;
	}
	
	#keyword{
		margin-top: 40px;
		width: 420px;
		height: 45px;
		float: left;
	}
	
	#searchButton{
		margin-top: 40px;
		width: 50px;
		height: 50px;
		float: left;
	}
	#delDiv{
		float: right; 
		margin-top: 65px;
		margin-bottom: 10px;
	}
	
	#writeButton{
		float: right;
		text-align: center;
		color: white;
		width: 150px;
		height: 50px;
		margin-top: 40px;
		font-size: 20px;
		background-color: #7D7471;
	}
	
	#selectProcessStatus{
		margin-top: 40px;
		margin-left: 20px;
		width: 138px;
		height: 50px;
		margin-right: 10px;
		vertical-align: middle;
		text-align-last: center;
		font-size: 17px;
		float: right;
	}
	
	#columnTitle{
		clear: both;
		margin-top: 100px;
		width: 100%;
	}
	
	#lineTitle{
		border-bottom: 1px solid black;
		height: 77px;
	}
	
	.cell{
		border-bottom: 1px solid black;
		border-top: 1px solid black;
		border-color: #D8D8D8;
		background-color: #7D7471;
		vertical-align: middle;
		font-size: 30px;
		color: white;
		text-align: center;
	}
	
	.cell2{
		border-bottom: 1px solid black;
		border-top: 1px solid black;
		border-color: #D8D8D8;
		vertical-align: middle;
		font-size: 30px;
		font-weight: bold;
		text-align: center;
		background-color: #FFFFFF;
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
     
	
	
	</script>

	
</head>



<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap" style="overflow: hidden;">
			<div style="float: left; width: 1000px;">
				<div id='boardTitle'>회원목록</div>
				<form id='searchingForm' action="./listAdmin.do" method="post">
						<select id='searchOption' name='searchOption'>
						<c:choose>
							<c:when test="${searchMap.searchOption eq 'all'}">
								<option value="all" selected="selected">전체</option>
								<option value="member_nick">닉네임</option>
								<option value="member_email">이메일</option>
							</c:when>
							
							<c:when test="${searchMap.searchOption eq 'member_nick'}">
								<option value="all">전체</option>
								<option value="member_nick" selected="selected">닉네임</option>
								<option value="member_email">이메일</option>
							</c:when>
				
							<c:when test="${searchMap.searchOption eq 'member_email'}">
								<option value="all">전체</option>
								<option value="member_nick">닉네임</option>
								<option value="member_email" selected="selected">이메일</option>
							</c:when>
						</c:choose>
						</select>
				<!-- 			<input type="hidden" id='curPage' name='curPage'  -->
				<%-- 			value="${pagingMap.memberPaging.curPage}"> --%>
						<input type="text" id='keyword' 
							name="keyword" value="${searchMap.keyword}"
							placeholder="회원이름 or 이메일 검색">
						<input type="submit" id='searchButton' value="검색">
				</form>	
				
			</div>
			
			<form action="../member/remove.do" method="get">
			
			<div id="delDiv">
				<button style="width: 100px; height: 40px; background-color: #FF0000;
					color: #FFFFFF; border: 0px; font-size: 15px;">
					회원삭제
				</button>
			</div>
			
			
			<table id='columnTitle'>
				<tr id='lineTitle'>
					<td class="cell"><input type="checkbox" id="allCheck"></td>
					<td class="cell">회원번호</td>
					<td class="cell">닉네임</td>
					<td class="cell">이메일</td>
					<td class="cell">작품수</td>
					<td class="cell">좋아요</td>	
					<td class="cell">가입일자</td>	
						
	<c:choose>
		<c:when test="${empty memberList}">
			<tr>
				<td class="cell2" colspan="6" style="text-align: center;">
					일치하는 회원이 없습니다
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="memberBoardDto" items="${memberList}">
				<tr>
					<td class="cell2">
						<input type="checkbox" name='member_chk' class="checkbox" value="${memberBoardDto.member_no}">
					</td>
					<td class="cell2">
						${memberBoardDto.member_no}
					</td>
					<td class="cell2">
						<a href="./listOneAdmin.do?member_no=${memberBoardDto.member_no}">${memberBoardDto.member_nick}</a></td>
					<td class="cell2">${memberBoardDto.member_email}</td>
					<c:choose>
						<c:when test="${empty memberBoardDto.board_cnt}">
							<td id="board_cnt" class="cell2">0</td>
						</c:when>
						<c:otherwise>
							<td id="board_cnt" class="cell2">${memberBoardDto.board_cnt}</td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${empty memberBoardDto.like_cnt}">
							<td id="like_cnt" class="cell2">0</td>
						</c:when>
						<c:otherwise>
							<td id="like_cnt" class="cell2">${memberBoardDto.like_cnt}</td>
						</c:otherwise>
					</c:choose>
					
					<td class="cell2">
						<h5><fmt:formatDate value="${memberBoardDto.member_cre_date}" 
							pattern="yyyy.MM.dd"/></h5>
						<h5><fmt:formatDate value="${memberBoardDto.member_cre_date}" 
							pattern="hh:mm"/></h5>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
			</table>
			</form>
			<jsp:include page="/WEB-INF/views/common/paging.jsp">
				<jsp:param value="${pagingMap}" name="pagingMap"/>
			</jsp:include>
		
			<form action="./listAdmin.do" id='pagingForm' method="get">
				<input type="hidden" id='curPage' name='curPage' 
					value="${pagingMap.paging.curPage}">
			</form>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>