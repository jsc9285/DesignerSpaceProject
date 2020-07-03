<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<style type="text/css">
	.cell{
		border-bottom: 1px solid black;
		border-top: 1px solid black;
		border-color: #D8D8D8;
		background-color: #7D7471;
		vertical-align: middle;
		font-size: 30px;
		color: white;
	}
	
	.cell2{
		border-bottom: 1px solid black;
		border-top: 1px solid black;
		border-color: #D8D8D8;
		vertical-align: middle;
		font-size: 30px;
		font-weight: bold;
		text-align: center;
	}
	
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
<!-- 	<h1>게시글목록</h1> -->
	
<%-- 	<c:forEach var="qnaBoardDto" items="${qnaBoardList}"> --%>
<%-- 		${qnaBoardDto.QNA_BOARD_NO}, --%>
<%-- 		${qnaBoardDto.QNA_BOARD_TITLE}, --%>
<%-- 		${qnaBoardDto.MEMBER_NAME}, --%>
<%-- 		${qnaBoardDto.QNA_BOARD_CRE_DATE}, --%>
<%-- 		${qnaBoardDto.QNA_BOARD_ANSWER_DATE}, --%>
<%-- 		${qnaBoardDto.QNA_BOARD_ANSWER_STATUS} --%>
<%-- 	</c:forEach> --%>

<%-- <c:choose> --%>
<%-- 		<c:when test="${empty memberList}"> --%>
<!-- 			<tr> -->
<!-- 				<td colspan="6" style="text-align: center;"> -->
<!-- 					등록된 게시글이 없습니다. -->
<!-- 				</td> -->
<!-- 			</tr> -->
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<%-- 			<c:forEach var="memberDto" items="${memberList}"> --%>
<!-- 			<tr> -->
<%-- 				<td>${memberDto.no}</td> --%>
<!-- 				<td> -->
<!-- 					<a href='#' onclick="listOnePageFnc(this, event);"> -->
<%-- 						${memberDto.name} --%>
<!-- 					</a> -->
<!-- 				</td> -->
<%-- 				<td>${memberDto.email}</td> --%>
<!-- 				<td> -->
<%-- 					<fmt:formatDate value="${memberDto.createdDate}"  --%>
<!-- 						pattern="yyyy년MM월dd일 hh시mm분"/> -->
<!-- 				</td> -->
				
<%-- 				<c:if test="${empty memberDto.originalFileName}" var="fileFlag"> --%>
<!-- 					<td>첨부파일 없음</td>			 -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${fileFlag eq false}"> --%>
<%-- 					<td>${memberDto.originalFileName}</td>			 --%>
<%-- 				</c:if> --%>
				
<!-- 				<td> -->
<%-- 					<a href='./deleteCtr.do?no=${memberDto.no}'>[삭제]</a> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<%-- 			</c:forEach> --%>
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>

	<div id="wrap">
		<div id="innerWrap">
			<div style="font-size: 80px; font-weight: bold; float: left; color: #7D7471;">QnA</div>
			<select style="margin-top: 40px; margin-left: 20px; width: 138px; height: 50px;
				vertical-align: middle; text-align-last: center; font-size: 17px; float: left;">
				<option>제목</option>
				<option>내용</option>
				<option>제목 + 내용</option>
				<option>작성자</option>
			</select>
			<input type="text" style="margin-top: 40px; width: 420px; height: 45px; float: left;">
			<input type="submit" value="검색" style="margin-top: 40px; width: 50px; height: 50px; float: left;">
			
			<input type="text" value="작성" style="float: right; text-align: center; color: white;
				width: 150px; height: 50px; margin-top: 40px; font-size: 20px; background-color: #7D7471;">
			<select style="margin-top: 40px; margin-left: 20px; width: 138px; height: 50px; margin-right: 10px;
				vertical-align: middle; text-align-last: center; font-size: 17px; float: right;">
				<option>전체</option>
				<option>접수중</option>
				<option>답변중</option>
				<option>기한만료</option>
				<option>답변완료</option>
			</select>
			
			<table style="clear: both; margin-top: 100px; width: 100%">
				<tr style="border-bottom: 1px solid black; height: 77px;">
					<th class="cell">글번호</th>
					<th class="cell">제목</th>
					<th class="cell">작성자</th>
					<th class="cell">작성일</th>
					<th class="cell">답변일</th>
					<th class="cell">처리상태</th>
				</tr>
				
				<c:choose>
					<c:when test="${empty qnaBoardList}">
						<tr>
							<td colspan="6" style="text-align: center;">
								등록된 게시글이 없습니다.
							</td>
						</tr>
					</c:when>
					
					<c:otherwise>
						<c:forEach var="QnaBoardDto" items="${qnaBoardList}">
							<tr>
								<td class="cell2">${QnaBoardDto.QNA_BOARD_NO}</td>
								<td class="cell2">
									<a href='./update.do?QNA_BOARD_NO=${QnaBoardDto.QNA_BOARD_NO }'>
										${QnaBoardDto.QNA_BOARD_TITLE}
									</a>
								</td>
								<td class="cell2">
									${QnaBoardDto.MEMBER_NICK}
								</td>
								<td class="cell2">
									<fmt:formatDate value="${QnaBoardDto.QNA_BOARD_CRE_DATE}" 
										pattern="yyyy.MM.dd hh:mm"/>
								</td>
								<td class="cell2">
									<c:choose>
										<c:when test="${empty QnaBoardDto.QNA_BOARD_ANSWER_DATE}">
											-
										</c:when>
										<c:otherwise>
											<fmt:formatDate value="${QnaBoardDto.QNA_BOARD_ANSWER_DATE}" 
												pattern="yyyy.MM.dd hh:mm"/>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="cell2">
									${QnaBoardDto.QNA_BOARD_ANSWER_STATUS}
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