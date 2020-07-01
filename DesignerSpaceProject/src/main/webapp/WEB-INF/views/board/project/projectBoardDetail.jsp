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
			padding: 100px 0px;
		}
		#projectInfoArea .profileImg{
			float: left;
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
		#commentArea .profileImg{
			float: left;
			width: 75px;
			height: 75px;
			border-radius: 50%;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
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
				<div class="profileImg" style="background-image: url('<%=request.getContextPath()%>/resources/projectImg/${projectBoardDto.PROFILE_TABLE_STORED_NAME}');"></div>
				<h1>${projectBoardDto.project_board_title}</h1>
				<span>${projectBoardDto.member_nick}</span>
			</div>
			<div id="projectArea">
<!-- 				<div id="exProjectPic"></div> -->
				<div id="exProjectPic2" style="background-image: url('<%=request.getContextPath()%>/resources/projectImg/${projectBoardDto.FILE_TABLE_STORED_FILE_NAME}');"></div>
				
				<input type="button" onclick="location.href='./update.do'" value="수정">			
				<input type="button" onclick="confirm('정말로 삭제하시겠습니까?')" value="삭제">			
				<input type="button" onclick="location.href='./list.do'" value="목록">			
			</div>
			<div id="projectInfoArea">
				<div id="likeBtn">
					<img src="<%=request.getContextPath()%>/resources/img/iconLike_Brown.png">
				</div>
				<h1>${projectBoardDto.project_board_title}</h1>
					
				<img src="<%=request.getContextPath()%>/resources/img/iconLike_grey.png">
				<span>${projectBoardDto.project_board_like}</span>
				<img src="<%=request.getContextPath()%>/resources/img/iconView_grey.png">
				<span>${projectBoardDto.project_board_views}</span>
				<img src="<%=request.getContextPath()%>/resources/img/iconChat_grey.png">
				<span>3</span>
							
				<h6>${projectBoardDto.project_board_cre_date}</h6>
				
				<div class="profileImg" style="background-image: url('<%=request.getContextPath()%>/resources/img/examImg.jpeg');"></div>
				<div style="height: 150px; text-align: left;">
					<h1>${projectBoardDto.member_nick}</h1>
					<span>${projectBoardDto.project_board_contents}</span>
				</div>								
			</div>
			<div id="commentArea">
				<div style="padding: 0px 190px;">
					<div class="profileImg" style="background-image: url('<%=request.getContextPath()%>/resources/img/examImg.jpeg'); margin-top: 13px;"></div>
					<input id="commentInput" type="text" placeholder="댓글 작성하기...">
					<input id="commentWriteBtn" type="button" value="등록">
					
					<c:forEach begin="1" end="9">
						<div style="width: 840px; text-align: left; padding: 50px 0px;">
							<div class="profileImg" style="background-image: url('<%=request.getContextPath()%>/resources/img/examImg.jpeg');"></div>
							<div style="box-sizing: border-box; height: 75px; padding-top: 15px; padding-left: 95px;">
								<span style="font-size: 28px; font-weight: bold; margin-top: 10px;">작성자명</span>
								<span style="font-size: 15px; color: #696969;">댓글 작성일</span>
								<span style="display: block; margin-top: 10px; font-size: 20px;">댓글 내용 댓글 내용댓글 내용댓글 댓글 내용 댓글 내용댓글 내용댓글 댓글 내용 댓글 내용댓글 내용댓글 댓글 내용 댓글 내용댓글 내용댓글 내용댓글 내용댓글 내용댓글 내용댓글 내용댓글 내용</span>
							</div>							
						</div>
					</c:forEach>
					
				</div>
			</div>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>