<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designer's Space</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
	
	<style type="text/css">
		#innerWrap{
			padding-bottom: -180px;
		}
		#topMenu{
			display: inline-flex;
		}
		#topMenu select{
			width: 130px;
		 	height: 50px;
		 	vertical-align: middle;
		 	font-size: 17px;
		 	margin: auto;
		 	text-align-last: center; 
		}
		#topMenu input{
			width: 420px;
			height: 50px;
			box-sizing: border-box;
		}
		#topCategory{
			margin-left: 100px;
			margin-right: 550px;
		}
		#topCategory button{
			width: 100px;
			height: 50px;
			border-style: none;			
			border-radius: 5px;
			background-color: #60524E;
			font-size: 13px;
			color: #fff;
		}
		#topCategory button:hover{
			background-color: #4AD674;
		}
		#searchBtn{
		 	width: 50px;
		 	height: 50px;
		 	background-color: #60524E;
		 	border-style: none;
		 	border-radius: 5px;
		 	vertical-align: middle;
		}
		#projectView{
			display: inline-table;
			margin-top: 20px;
		}
		.projectList{
			margin: 0px 10px 20px;
			display: inline-block;
			width: 320px;
		}
		.projectList .thumbnailPic{
			width: 320px;
			height: 250px;
			border-radius: 5px;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
		}
		.projectList img{
			vertical-align: middle;
		}
		.projectList .profilePic{
			width: 30px;
			height: 30px;
			border-radius: 50%;
			margin: 5px auto;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
			display: inline-block;
			vertical-align: middle;
		}
		.projectList .profileNic{
			display: inline-block;
			width: 150px;
			overflow: hidden;
			white-space: nowrap;
			text-overflow: ellipsis;
		}
	</style>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">		
<!-- 			검색, 카테고리 선택, 정렬방법 -->
			<div id="topMenu">
				<select>
					<option>작성자</option>
					<option>제목</option>
				</select>
				<input type="text">
				<button id="searchBtn"><img src="<%=request.getContextPath()%>/resources/img/iconSearch.png"></button>
				
				<div id="topCategory">
					<button>전체</button>
					<button>그림</button>
					<button>사진</button>
				</div>
				
				<select>
					<option>최신순</option>
					<option>좋아요</option>
					<option>조회수</option>
				</select>
			</div>
<!-- 			프로젝트 조회 -->		
			<div id="projectView">
				<c:forEach begin="1" end="25">
					<div class="projectList">
						<div class="thumbnailPic" style="background-image: url('<%=request.getContextPath()%>/resources/img/examImg.jpeg');"></div>
						<div style="float: left;">
							<div class="profilePic" style="background-image: url('<%=request.getContextPath()%>/resources/img/examImg.jpeg');"></div>
							<span class="profileNic">Steven Gerrard</span>
						</div>												
						<div style="float: right; padding-top: 10px;">
							<img src="<%=request.getContextPath()%>/resources/img/iconLike.png">
							<span>100</span>
							<img src="<%=request.getContextPath()%>/resources/img/iconView.png">
							<span>200</span>
						</div>						
					</div>
				</c:forEach>
			</div>	

<!-- 			프로젝트 페이징 -->
			<div id="paging">
			
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>