<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designer's Space</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/style.css">

<style type="text/css">

	.errorDiv{
		 margin-top: 30px; 
		 margin-bottom: 30px;
		 font-weight: bold;
		 font-size: 30px;
	}
	
	#backBtn{
		width : 100px;
		height : 40px;
		margin: auto;
	}
	
</style>


<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">
	function backBtnFnc() {
		history.back();
	}
</script>


</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div id="wrap">
		<div id="innerWrap">
			
			<div style=" width: 500px; margin: auto;" >
				<c:if
					test="${requestScope['javax.servlet.error.status_code'] == 404}">
					
					<img alt="404error" src="<%=request.getContextPath()%>/resources/error/404error.png">
					<div class="errorDiv">
						<p>404(찾을 수 없음): 서버가 요청한 페이지를 찾을 수 없습니다.</p><br/>
						<p>죄송합니다 빠르게 수정하겠습니다</p>
					</div>
					
				</c:if>
				<c:if
					test="${requestScope['javax.servlet.error.status_code'] == 500}">
					
					<img alt="404error" src="<%=request.getContextPath()%>/resources/error/500error.png">
					<div class="errorDiv">
						<p>500(찾을 수 없음): 서버가 요청한 페이지를 찾을 수 없습니다.</p><br/>
						<p>죄송합니다 빠르게 수정하겠습니다</p>
					</div>
				</c:if>
					<div id="backBtn">
						<button onclick="backBtnFnc();"
							style="width: 100px; height: 40px; background-color: #FFFFFF">
							돌아가기
						</button>
					</div>
				
				</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>