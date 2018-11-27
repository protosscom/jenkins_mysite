<%@page import="com.javalec.board.vo.UsersVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css"> 

</head>

	<nav class="navbar navbar-inverse" style="margin:0 auto;  width:70%; position:relative;">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="${pageContext.request.contextPath }/main/hello.do" class="navbar-brand" href="#">MySite</a>
			</div>
			<ul class="nav navbar-nav">
			
				<c:choose>
					<c:when test="${param.menu == 'main' }">
						<li class="active"><a href="${pageContext.request.contextPath }/main/hello.do"><span class="glyphicon glyphicon-home"></span>
						Home</a></li>
						<li><a href="${pageContext.request.contextPath }/guestbook/getGuestBookList.do"><span class="glyphicon glyphicon-book"></span>
						Guestbook</a></li>
						<li><a href="${pageContext.request.contextPath }/board/getBoardList.do"><span class="glyphicon glyphicon-blackboard"></span>
						Board</a></li>
					</c:when>

					<c:when test="${param.menu == 'guestbook'}">
						<li><a href="${pageContext.request.contextPath }/main/hello.do"><span class="glyphicon glyphicon-home"></span>
						Home</a></li>
						<li class="active"><a href="${pageContext.request.contextPath }/guestbook/getGuestBookList.do"><span class="glyphicon glyphicon-book"></span>
						Guestbook</a></li>
						<li><a href="${pageContext.request.contextPath }/board/getBoardList.do"><span class="glyphicon glyphicon-blackboard"></span>
						Board</a></li>
					</c:when>


					<c:when test="${param.menu == 'boardList' }">
						<li><a href="${pageContext.request.contextPath }/main/hello.do"><span class="glyphicon glyphicon-home"></span>
						Home</a></li>
						<li><a href="${pageContext.request.contextPath }/guestbook/getGuestBookList.do"><span class="glyphicon glyphicon-book"></span>
						Guestbook</a></li>
						<li class="active"><a href="${pageContext.request.contextPath }/board/getBoardList.do"><span class="glyphicon glyphicon-blackboard"></span>
						Board</a></li>
					</c:when>
					
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath }/main/hello.do"><span class="glyphicon glyphicon-home"></span>
						Home</a></li>
						<li><a href="${pageContext.request.contextPath }/guestbook/getGuestBookList.do"><span class="glyphicon glyphicon-book"></span>
						Guestbook</a></li>
						<li><a href="${pageContext.request.contextPath }/board/getBoardList.do"><span class="glyphicon glyphicon-blackboard"></span>
						Board</a></li>
					</c:otherwise>
				</c:choose>	
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath }/main/logout.do"><span class="glyphicon glyphicon-log-out"></span>
						Logout</a></li>
			</ul>
		</div>
	</nav>
