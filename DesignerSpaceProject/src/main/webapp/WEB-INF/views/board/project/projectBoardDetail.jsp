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
		#exProjectPic2{
			height: 700px;
			margin-bottom: 10px;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
		}
		.exProjectPic{
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
		#likeBtn h5{
			font-size: 20px;
			color: #4AD674;
			opacity: 0;
			margin-top: 10px;
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
		.profileInfo{
			 box-sizing: border-box; 
			 height: 75px; 
			 padding-top: 15px; 
			 padding-left: 95px;
		}
		.profileInfo .profileInfoNic{
			 font-size: 28px; 
			 font-weight: bold; 
			 margin-top: 10px;
		}	 		
		.profileInfo .profileInfoDate{
			 font-size: 15px; 
			 color: #696969;
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
		.commentBtn{
			padding: 5px 25px;
			background-color: #000;
			border-radius: 30px;
			color: #fff;
			font-size: 7px;
		}
		.commentContext{
			display: block;
			margin-top: 10px; 
			font-size: 20px;
			border: none;
			resize: none;
			width: 855px; 
			height: 80px;
		}		
	</style>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
	<script type="text/javascript">
		function projectDeleteFnc() {		
			var deleteProjectNum = document.getElementById('deleteProjectNum').value;

		 	if(confirm('정말로 삭제하시겠습니까?')){
		 		
		 		location.href='./deleteCtr.do?project_board_no=' + deleteProjectNum;
		 	}else{
		 		return false;
		 	}	
		}
		
		function projectLikeFnc() {
			var likeBtnObj = document.getElementById('likeBtn');
			
			if(likeBtnObj.children[0].getAttribute('src') == '<%=request.getContextPath()%>' + "/resources/img/iconLike_Brown.png"){
				likeBtnObj.children[0].setAttribute('src', '<%=request.getContextPath()%>' + "/resources/img/iconLike_Green.png");
				likeBtnObj.style.backgroundColor = "#60524E";
				likeBtnObj.children[0].style.marginTop = "40px";
				likeBtnObj.children[1].style.opacity = "1";
			}else{
				likeBtnObj.children[0].setAttribute('src', '<%=request.getContextPath()%>' + "/resources/img/iconLike_Brown.png");
				likeBtnObj.style.backgroundColor = "#4AD674";
				likeBtnObj.children[0].style.marginTop = "54px";
				likeBtnObj.children[1].style.opacity = "0";
			}
		}
		
		function commentUpdateFnc(obj) {
			var commentContextObj = obj.parentNode.lastElementChild;
			var otherBtn = obj.nextSibling.nextSibling;
			var commentNo = obj.previousSibling.previousSibling;
			
			var sendCommentNoObj = document.getElementById('PROJECT_COMMENT_NO');
			var sendCommentCommentsObj = document.getElementById('PROJECT_COMMENT_COMMENTS');
			var updateFormObj = document.getElementById('commentUpdateForm');
			
			sendCommentNoObj.value = commentNo.value;
			sendCommentCommentsObj.value = commentContextObj.value;

			if(obj.innerHTML == "수정"){
				commentContextObj.removeAttribute("readonly");
				commentContextObj.setAttribute("style", "border: 1px solid #000;")	
				obj.innerHTML = "수정완료";
				otherBtn.innerHTML = "취소";
			}else if(obj.innerHTML == "수정완료"){
				commentContextObj.setAttribute("readonly", "readonly");
				commentContextObj.setAttribute("style", "")	
				obj.innerHTML = "수정";
				otherBtn.innerHTML = "삭제";				
				//★댓글수정로직

				updateFormObj.submit();
			}
			
		}
		
		function commentDeleteFnc(obj) {
			var commentContextObj = obj.parentNode.lastElementChild;
			var otherBtn = obj.previousSibling.previousSibling;
			var commentNo = otherBtn.previousSibling.previousSibling;
			
			var sendCommentNoObj = document.getElementById('PROJECT_COMMENT_NO_DELETE');
			var deleteFormObj = document.getElementById('commentDeleteForm');
			
			sendCommentNoObj.value = commentNo.value;
			
			//삭제 경우 - Main !
			if(obj.innerHTML == "삭제"){
				//★댓글삭제로직
				
				if(confirm("정말로 삭제하시겠습니까?")){
					deleteFormObj.submit();	
				}else{
					return false;
				}
			}else if(obj.innerHTML == "취소"){ // 취소 경우
				commentContextObj.setAttribute("readonly", "readonly");
				commentContextObj.setAttribute("style", "")					
				otherBtn.innerHTML = "수정";
				obj.innerHTML = "삭제";
			}
		}
	</script>
	
</head>

<body>
<!-- 	삭제용 작품번호 저장 -->
	<input type="hidden" id='deleteProjectNum' value="${projectBoardDto.project_board_no}">
	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<div id="projectInfo">
				<div class="profileImg" style="background-image: url(<c:url value='/profileImg/${projectBoardDto.PROFILE_TABLE_STORED_NAME}'/>);"></div>
				<h1>${projectBoardDto.project_board_title}</h1>
				<span>${projectBoardDto.member_nick}</span>
			</div>
			<div id="projectArea">
				<c:forEach var="projectBoardFileDto" items="${projectBoardFileList}">
					<div class="exProjectPic" style="background-image: url(<c:url value='/projectImg/${projectBoardFileDto.FILE_TABLE_STORED_FILE_NAME}'/>)"></div>
				</c:forEach>				
				
				<c:choose>
					<c:when test="${memberDto.member_grade eq 0}">
						<c:choose>
							<c:when test="${memberDto.member_no eq projectBoardDto.project_board_mno}">
								<input type="button" onclick="location.href='./update.do?project_board_no=${projectBoardDto.project_board_no}'" value="수정">			
								<input type="button" onclick="projectDeleteFnc();" value="삭제">					
							</c:when>
							<c:when test="${memberDto.member_no ne projectBoardDto.project_board_mno}">
								<input type="button" onclick="location.href='<%=request.getContextPath()%>/reportBoard/add.do'" value="신고"> 
							</c:when>
						</c:choose>
					</c:when>
					<c:when test="${memberDto.member_grade eq 1}">
						<input type="button" onclick="projectDeleteFnc();" value="삭제">
					</c:when>
				</c:choose>			
				<input type="button" onclick="location.href='./list.do'" value="목록">			
			</div>
			<div id="projectInfoArea">
				<div id="likeBtn" onclick="projectLikeFnc();">
					<img src="<%=request.getContextPath()%>/resources/img/iconLike_Brown.png">
					<h5>${projectBoardDto.project_board_like}</h5>
				</div>
				<h1>${projectBoardDto.project_board_title}</h1>
					
				<img src="<%=request.getContextPath()%>/resources/img/iconLike_grey.png">
				<span>${projectBoardDto.project_board_like}</span>
				<img src="<%=request.getContextPath()%>/resources/img/iconView_grey.png">
				<span>${projectBoardDto.project_board_views}</span>
				<img src="<%=request.getContextPath()%>/resources/img/iconChat_grey.png">
				<span>${projectBoardDto.project_comment_cnt}</span>
							
				<h6>작성일 <fmt:formatDate value="${projectBoardDto.project_board_cre_date}" pattern="yyyy년 MM월 dd일"/></h6>
				
				<div class="profileImg" 
					style="background-image: url(<c:url value='/profileImg/${projectBoardDto.PROFILE_TABLE_STORED_NAME}'/>);"></div>
				<div style="height: 150px; text-align: left;">
					<h1>${projectBoardDto.member_nick}</h1>
					<span>${projectBoardDto.project_board_contents}</span>
				</div>								
			</div>
			<div id="commentArea">
				<div style="padding: 0px 190px;">
					<form action="./commentAddCtr.do#commentArea" method="get">
<!-- 			▶(댓글작성)컨트롤러로 보내야 할 데이터 : 작성자번호, 게시물번호, 댓글내용 -->
						<input type="hidden" name="PROJECT_COMMENT_MNO" value="${memberDto.member_no}">
						<input type="hidden" name="PROJECT_COMMENT_PBNO" value="${projectBoardDto.project_board_no}">
					
						<div class="profileImg" 
							style="background-image: url(<c:url value='/profileImg/${memberDto.profile_table_stored_name}'/>);
								   margin-top: 13px;"></div>
						<input id="commentInput" type="text" name="PROJECT_COMMENT_COMMENTS" placeholder="댓글 작성하기...">
						<input id="commentWriteBtn" type="submit" value="등록">
					</form>
							
<!-- 			▶업데이트 시 컨트롤러로 전달																											 -->
					<form action="./commentUpdateCtr.do#commentArea" id="commentUpdateForm" method="get">
						<input type="hidden" id="PROJECT_COMMENT_NO" name="PROJECT_COMMENT_NO" value="">
						<input type="hidden" id="PROJECT_COMMENT_COMMENTS" name="PROJECT_COMMENT_COMMENTS" value="">
						<input type="hidden" id='PROJECT_COMMENT_PBNO' name="PROJECT_COMMENT_PBNO" value="${projectBoardDto.project_board_no}">
					</form>		
					
<!-- 			▶삭제 시 컨트롤러로 전달																											 -->
					<form action="./commentDeleteCtr.do#commentArea" id="commentDeleteForm" method="get">
						<input type="hidden" id="PROJECT_COMMENT_NO_DELETE" name="PROJECT_COMMENT_NO" value="">
						<input type="hidden" id='PROJECT_COMMENT_PBNO_DELETE' name="PROJECT_COMMENT_PBNO" value="${projectBoardDto.project_board_no}">
					</form>															
					
					<c:forEach var="projectCommentDto" items="${projectCommentList}">						
						<div style="width: 840px; text-align: left; padding: 30px 0px;">
							<div class="profileImg"
								style="background-image: url(<c:url value='/profileImg/${projectCommentDto.profile_table_stored_name}'/>);"></div>
							<div class="profileInfo">
								<span class="profileInfoNic">${projectCommentDto.member_nick}</span>
								<span class="profileInfoDate">
									<c:choose>
										<c:when test="${projectCommentDto.PROJECT_COMMENT_MOD_DATE eq null}">
											· <fmt:formatDate value="${projectCommentDto.PROJECT_COMMENT_CRE_DATE}" pattern="yyyy.MM.dd"/> 작성	
										</c:when>
										<c:when test="${projectCommentDto.PROJECT_COMMENT_MOD_DATE ne null}">
											· <fmt:formatDate value="${projectCommentDto.PROJECT_COMMENT_MOD_DATE}" pattern="yyyy.MM.dd"/> 수정 
										</c:when>
									</c:choose>
								</span>								
								<input type="hidden" value="${projectCommentDto.PROJECT_COMMENT_NO}">
								<c:choose>
									<c:when test="${memberDto.member_grade eq 0}">
										<c:choose>
											<c:when test="${projectCommentDto.PROJECT_COMMENT_MNO eq memberDto.member_no}">
												<a class="commentBtn" onclick="commentUpdateFnc(this);">수정</a>
												<a class="commentBtn" onclick="commentDeleteFnc(this);">삭제</a>
											</c:when>											
										</c:choose>										
									</c:when>
									<c:when test="${memberDto.member_grade eq 1}">
										<c:choose>
											<c:when test="${projectCommentDto.PROJECT_COMMENT_MNO eq memberDto.member_no}">
												<a class="commentBtn" onclick="commentUpdateFnc(this);">수정</a>
												<a class="commentBtn" onclick="commentDeleteFnc(this);">삭제</a>
											</c:when>
											<c:when test="${projectCommentDto.PROJECT_COMMENT_MNO ne memberDto.member_no}">
												<a class="commentBtn" onclick="commentDeleteFnc(this);">삭제</a>
											</c:when>
										</c:choose>										
									</c:when>
								</c:choose>								
								<textarea class="commentContext" readonly="readonly">${projectCommentDto.PROJECT_COMMENT_COMMENTS}</textarea>
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