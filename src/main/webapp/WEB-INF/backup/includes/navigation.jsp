<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<style>
	/* reset */
	*				{ margin:0; padding:0 }
	body			{ font:"맑은 고딕"; text-align:center }
	ul, ol			{ list-style-type: none }
	
	/* layout */
	div#container	{ text-align:left; width:1400px; margin:0 auto; background-color:#EEE }
	div#content		{ float:right; width:1160px; background-color:#fff }
	div#navigation	{ float:left; width:120px;  }
	div#footer		{ clear:both; width:100% }
	
	/* navigation */
	div#navigation ul			{ width:118px; margin-top:1px }
	div#navigation li			{ width:118px; background-color:#E9E9E9; border:1px solid #DADADA; margin-top:-1px }
	div#navigation li a			{ display:block; color:#4F4F4F; width:98px; font-weight:bold; padding:5px 10px; font-size:1.1em }
	div#navigation li.selected	{ background:#E0E0E0 }
	div#navigation li a:link	{ color:#4F4F4F; text-decoration:none; }
	div#navigation li a:hover	{ color:#4F4F4F; text-decoration:none; }
	div#navigation li a:visited	{ color:#4F4F4F; text-decoration:none; }
	div#navigation li a:active	{ color:#4F4F4F; text-decoration:none; }
	
</style>   
</head> 

		<div id="navigation">
			<ul>
				<c:choose>
					<c:when test="${param.menu == 'main' }">
						<li class="selected"><a href="${pageContext.request.contextPath }/main/hello.do">자기소개</a></li>
						<li><a href="${pageContext.request.contextPath }/guestbook/index.do">방명록</a></li>
						<li><a href="${pageContext.request.contextPath }/board/index.do">게시판</a></li>
					</c:when>

					<c:when test="${param.menu == 'guestbook'}">
						<li><a href="${pageContext.request.contextPath }/main/hello.do">자기소개</a></li>
						<li class="selected"><a href="${pageContext.request.contextPath }/guestbook/index.do">방명록</a></li>
						<li><a href="${pageContext.request.contextPath }/board/index.do">게시판</a></li>
					</c:when>


					<c:when test="${param.menu == 'boardList' }">
						<li><a href="${pageContext.request.contextPath }/main/hello.do">자기소개</a></li>
						<li><a href="${pageContext.request.contextPath }/guestbook/index.do">방명록</a></li>
						<li class="selected"><a href="${pageContext.request.contextPath }/board/index.do">게시판</a></li>
					</c:when>
					
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath }/main/hello.do">자기소개</a></li>
						<li><a href="${pageContext.request.contextPath }/guestbook/index.do">방명록</a></li>
						<li><a href="${pageContext.request.contextPath }/board/index.do">게시판</a></li>
					</c:otherwise>
				</c:choose>	
			</ul>
		</div>