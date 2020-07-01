<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>게시판 수정</title>

<script type="text/javascript" 
	src="/DesignerSpaceProject/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript">

	function pageMoveListFnc(){
		var mnoObj = $('#mno')
		var fbnoObj = $('#no');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		var url = '';
		
		url += './freeBoardListOne.do?';
		url += 'no=' + fbnoObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&mno=' + mnoObj.val();
		
		location.href = url;
	}
	
	function pageMoveDeleteFnc(no){
		var url = "./deleteCtr.do?no=" + no;
		location.href = url;
	}
	

</script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<h1>게시판 수정</h1>
	<form action='./freeBoardUpdateCtr.do' method='post' 
		enctype="multipart/form-data">
		<input type="hidden" id="no" name="no" value="${no}">
		<input type="hidden" id="mno" name="mno" value="${mno}">
		<input type="text" id='searchOption' 
				name="searchOption" value="${searchOption}">
			<input type="text" id='keyword' 
				name="keyword" value="${keyword}">
		작성자: <input type='text' id="writer" name='writer' readonly="readonly" value="${memInfo}"><br>
		제목: <input type='text' id="title" name='title' value="${title}"><br>
		내용: <input type='text' id="contents" name='contents' value="${contents}"><br>
		<input type='submit' value='수정완료'>
		<input type='button' value='취소' onclick="pageMoveListFnc();">

	</form>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
</body>
</html>