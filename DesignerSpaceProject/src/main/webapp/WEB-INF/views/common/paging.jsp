<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style type="text/css">
#navList > ul {
 	list-style-type: none; 
    padding: 0;
    overflow: hidden;
    background-color: #333333; 
    display: table; /* table을 주면  요소의 내용에 맞게 자동으로 크기 */ 
    margin-left: auto;
    margin-right: auto;
    
}

#navList > ul > li {
	float: left;
}

#navList > ul > li > a {
    display: block;
    color: white;  
    text-align: center;
    padding: 16px;
    text-decoration: none;
} 

#navList > ul > li > a:hover { 
     color: #FFD9EC; 
     background-color: #5D5D5D; 
     font-weight: bold; 
 }  
 
.active {
	color: #FFD9EC;
	background-color: #5D5D5D;
	font-weight: bold;  
}
</style>

<!-- <script type="text/javascript"  -->
<!-- 	src="/DesignerSpaceProject/resources/js/jquery-3.5.1.js"></script> -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	function goPageFnc(pageNumber){
// 		alert(pageNumber);
		var curPage = $('#curPage');
		
// 		curPage.value = pageNumber;
		curPage.val(pageNumber);
		
		var pagingForm = $('#pagingForm');
		pagingForm.submit();
	}
	
	window.onload = function(){
		var curPage = document.getElementById('curPage');
		var pageButtonId = 'pageButton' + curPage.value;
		
		document.getElementById(pageButtonId)
			.setAttribute('class', 'active');
	}
</script>
	
	<nav id="navList">
		<ul>
			<li>
				<a href="#" 
					onclick="goPageFnc(${pagingMap.paging.prevPage});">
					<span>≪</span>
				</a>
			</li>
			<li>
				<c:if test="${pagingMap.paging.blockBegin eq 1 && pagingMap.paging.blockEnd eq 0}">
					<a href="#">
						<c:out value="1"/>
					</a>
				</c:if>			
			</li>
			
			<c:forEach var="num" 
				begin="${pagingMap.paging.blockBegin}" 
				end="${pagingMap.paging.blockEnd}">
				
				<li id='pageButton${num}'>
					<a href="#" onclick="goPageFnc(${num});">
						<c:out value="${num}"/>
					</a>
				</li>
				
			</c:forEach>

			<li>
				<a href="#"
					onclick="goPageFnc(${pagingMap.paging.nextPage});">
					<span>≫</span>
				</a>
			</li>

		</ul>
	</nav>

	
	
	