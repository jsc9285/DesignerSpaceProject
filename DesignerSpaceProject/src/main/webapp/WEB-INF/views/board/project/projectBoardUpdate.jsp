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
		.exProjectPic{
			width: 1350px;
			height: 600px;
			margin-bottom: 10px;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
			background-color: gray;
		}
	</style>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
	<script type="text/javascript">
 	var createFlag = false;
 		
	function fileAddFnc() { 			 
 			if(!createFlag){
	 			
 			var str = "<a>";
			str += "<div class='exProjectPic' style=''></div>";
			str += "<input type='file' value='파일선택' accept='image/*' onchange='setThumbnailFnc(event, this);'>";
			str += "<button name='delete' onclick='fileDelFnc($(this));'>파일삭제</button>";
			str += "</a>";
			

			if($("button[name='delete']").length < 5){
				$('#projectPicArea').append(str);
			}
				
			createFlag = true;
 			}
			
 		}
 		
 		function fileDelFnc(obj) {
			obj.parent().remove();			
			
			createFlag = false;
		}
 		
 		function fileNamingFnc() {
			var projectList = document.getElementById('projectPicArea').children;
			var projectSize = projectList.length;
			
			for (var i = 0; i < projectSize; i++) {
				projectList[i].children[1].setAttribute('name', 'file_' + (i+1));
			}
		}
 		
 		function setThumbnailFnc(event, obj) { 
		      var reader = new FileReader(); 
		      var imgObj = obj.parentNode.children[0];
		      
		      reader.onload = function(event) { 
		         imgObj.setAttribute("src", event.target.result);
		         imgObj.setAttribute("style", 'background-image: url(' + event.target.result +')');        
		         
		    	 createFlag = false;
		      }; 
		      
		      reader.readAsDataURL(event.target.files[0]); 
 		}
	</script>
	
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<div id="innerPage">
				<form action="./updateCtr.do" method="post"
					enctype="multipart/form-data">
					<div id="projectPicArea">
					<c:forEach var="projectBoardFileDto" items="${projectBoardFileList}">
						<a>
						<div class='exProjectPic' style='background-image: url(<c:url value='/projectImg/${projectBoardFileDto.FILE_TABLE_STORED_FILE_NAME}'/>)'></div>
						<input type='file' value='파일선택' accept='image/*' onchange='setThumbnailFnc(event, this);'>
						<button name='delete' onclick='fileDelFnc($(this));'>파일삭제</button>
						</a>		
					</c:forEach>
										    									
					</div>
					<input id="addFileBtn" type="button" value="파일추가"
						onclick="fileAddFnc();">
					
					<div id="contextArea">
						<input type="hidden" name="project_board_no" value="${projectBoardDto.project_board_no}">
						<input type="hidden" name="project_board_mno" value="${memberDto.member_no}">
						<h1>제목</h1>
						<textarea name="project_board_title" placeholder="${projectBoardDto.project_board_title}" style="height: 120px;"></textarea>
						<h1>설명</h1>
						<textarea name="project_board_contents" placeholder="${projectBoardDto.project_board_contents}" style="height: 360px;"></textarea>
						
						<div>
							<c:choose>
								<c:when test="${projectBoardDto.project_board_category eq 'p'}">
									사진<input type="radio" name='project_board_category' value="p" checked="checked"/>
									일러스트<input type='radio' name='project_board_category' value="i"/>
								</c:when>
								<c:when test="${projectBoardDto.project_board_category eq 'i'}">
									사진<input type="radio" name='project_board_category' value="p"/>
									일러스트<input type='radio' name='project_board_category' value="i" checked="checked"/>
								</c:when>
							</c:choose>
						</div>
						
						<input type="submit" value="수정완료" onclick="fileNamingFnc();">
						<input type="button" value="취소" onclick="location.href='./list.do'">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>