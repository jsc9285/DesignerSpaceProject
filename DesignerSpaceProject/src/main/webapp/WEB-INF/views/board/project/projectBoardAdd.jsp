<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designer's Space</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
	
	<style type="text/css">
		#exProjectPic{
			background-color: #D3D3D3;
			height: 700px;
		}
		#exProjectPic2{
			height: 700px;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
		}
		#projectPicArea{
			text-align: right;
		}
		#projectPicArea button{
			width: 150px;
			height: 50px;
			box-sizing: border-box;
			text-align: center;
			margin: 10px 20px;
			background-color: #60524E;
			border-style: none;
			border-radius: 5px;
			font-size: 20px;
			color: #fff;
			cursor: pointer;
		}
		#addFileBtn{
			width: 150px;
			height: 50px;
			border-style: none;
			border-radius: 5px;
			background-color: #4AD674;
			color: #fff;
			margin-top: 20px;
			margin-left: calc(100% - 170px);
			margin-bottom: 20px;
			font-size: 20px;
			cursor: pointer;
		}
		#contextArea{
			padding: 0px 100px;
			text-align: center;
		}
		#contextArea textarea{	
			width: 100%;
			resize: none;
			margin-bottom: 20px;
			border-radius: 3px;
		}
		#contextArea h1{
			float: left;
			font-size: 35px;
			font-weight: bold;
			margin-bottom: 10px;
			color: #60524E;
		}
		#contextArea input{
			width: 150px;
			height: 50px;
			border-style: none;
			border-radius: 5px;
			background-color: #60524E;
			color: #fff;
			font-size: 20px;
			margin-bottom: 100px;
			cursor: pointer;
		}
		#contextArea input:hover{
			background-color: #4AD674;
		}
	</style>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<div id="innerPage">
				<div id="projectPicArea">
					<div id="exProjectPic">

					</div>
					<input type="file" value="파일선택">
					<div id="exProjectPic2" style="background-image: url('<%=request.getContextPath()%>/resources/img/examImg.jpeg');">
	
					</div>
					<input type="file" value="파일선택">
					<button>파일삭제</button>					
				</div>
				<input id="addFileBtn" type="button" value="파일추가">
				
				<div id="contextArea">
					<h1>제목</h1>
					<textarea style="height: 120px;"></textarea>
					<h1>설명</h1>
					<textarea style="height: 360px;"></textarea>
					
					<input type="submit" value="확인">
					<input type="button" value="취소">
				</div>
			</div>

		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>