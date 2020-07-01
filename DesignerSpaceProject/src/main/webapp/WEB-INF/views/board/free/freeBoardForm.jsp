<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>게시판등록</title>

<script type="text/javascript">
	function pageMoveListFnc(){
		location.href = './free.do';
	}
</script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<h1>게시판등록</h1>
	<form action='./freeBoardAddCtr.do' method='post' 
		enctype="multipart/form-data">
		<input type="hidden" id="mno" name="mno" value="${mno}">
		작성자: <input type='text' id="writer" name='writer' value="${memInfo}"><br>
		제목: <input type='text' id="title" name='title'><br>
		내용: <input type='text' id="contents" name='contents'><br>
		<input type='submit' value='작성완료'>
		<input type='button' value='취소' onclick="pageMoveListFnc();">

	</form>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
</body>
</html>

