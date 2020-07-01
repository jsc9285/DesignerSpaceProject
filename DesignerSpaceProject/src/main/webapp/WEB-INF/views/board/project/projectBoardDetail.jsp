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
		#projectInfo{
			width: 1350px;
			margin: 0px auto 50px;
		}		
		#projectInfo h1{
			padding: 10px 100px;
			font-weight: bold;
			font-size: 30px;			
		}
		#projectInfo span{
			font-size: 20px;	
			padding-left: 20px;		
		}
		#projectInfo .profileImg{
			width: 80px;
			height: 80px;
			float: left;
			border-radius: 50%;
			margin: 5px auto;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
		}
		#projectArea{
			width: 1350px;
			margin: auto;
			background-color: #fff;
			text-align: right;
		}
		#projectArea input{
			width: 150px;
			height: 50px;
			border-style: none;
			border-radius: 5px;
			background-color: #60524E;
			color: #fff;
			font-size: 20px;
			cursor: pointer;
		}
		#projectArea input:hover{
			background-color: #4AD674;
		}
		#exProjectPic{
			background-color: #D3D3D3;
			height: 700px;
			margin-bottom: 10px;
		}
		#exProjectPic2{
			height: 700px;
			margin-bottom: 10px;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
		}
		#projectInfoArea{
			width: 1350px;
			margin: auto;
			text-align: center;
		}
		#projectInfoArea .profileImg{
			width: 150px;
			height: 150px;
			border-radius: 50%;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
		}
		#projectInfoArea h1{
			font-size: 35px;
		}
		#likeBtn{		
			width: 150px;
			height: 150px;
			margin: auto;
			background-color: #4AD674;
			border-radius: 50%;			
		}
		#likeBtn img{		
			margin-top: 54px;				
		}		
		#contextArea{
			width: 1350px;
			margin: auto;
		}
		#commentArea{
			width: 1350px;
			margin: auto;
			padding: 50px 0px;
			background-color: #fff;
			text-align: center;
		}
		#commentArea img{
			vertical-align: middle;
			margin: 0px 15px;
		}
		#commentInput{
			width: 750px;
			height: 100px;		
			box-sizing: border-box;	
		}
		#commentWriteBtn{
			width: 100px;
			height: 100px;
			background-color: #60524E;
			color: #fff;
			font-weight: bold;
			font-size: 20px;
			vertical-align: middle;
			margin-left: -6px;
		}
	</style>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<div id="projectInfo">
				<div class="profileImg" style="background-image: url('<%=request.getContextPath()%>/resources/img/examImg.jpeg');"></div>
				<h1>프로젝트 제목</h1>
				<span>작성자명</span>
			</div>
			<div id="projectArea">
				<div id="exProjectPic"></div>
				<div id="exProjectPic2" style="background-image: url('<%=request.getContextPath()%>/resources/img/examImg.jpeg');"></div>
				
				<input type="button" value="수정">			
				<input type="button" value="삭제">			
				<input type="button" value="목록">			
			</div>
			<div id="projectInfoArea">
				<div id="likeBtn">
					<img src="<%=request.getContextPath()%>/resources/img/iconLike_Brown.png">
				</div>
				<h1>프로젝트 제목</h1>
					
				<img src="<%=request.getContextPath()%>/resources/img/iconLike_grey.png">
				<span>100</span>
				<img src="<%=request.getContextPath()%>/resources/img/iconView_grey.png">
				<span>200</span>
				<img src="<%=request.getContextPath()%>/resources/img/iconChat_grey.png">
				<span>3</span>
							
				<h6>작성일 : </h6>
				
				<div class="profileImg" style="background-image: url('<%=request.getContextPath()%>/resources/img/examImg.jpeg');"></div>
				<h1>작성자명</h1>
				<span>게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용</span>				
			</div>
			<div id="commentArea">
				<img src="<%=request.getContextPath()%>/resources/img/iconNone.png">
				<input id="commentInput" type="text" placeholder="댓글 작성하기...">
				<input id="commentWriteBtn" type="button" value="등록">
			</div>

			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>