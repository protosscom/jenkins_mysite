<%@page import="com.javalec.board.vo.UsersVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
<style>
	.anchor {
	  color: inherit;
	  text-decoration:none;
	}

	/* reset */
	*				{ margin:0; padding:0 }
	body			{ font:"맑은 고딕"; text-align:center }
	ul, ol			{ list-style-type: none }
	
	/* layout */
	div#container	{ text-align:left; width:1400px; margin:0 auto; background-color:#EEE }
	div#content		{ float:right; width:1160px; background-color:#fff }
	div#navigation	{ float:left; width:120px;  }
	div#footer		{ clear:both; width:100% }
	
	/* header */
	div#header	h1				{ height:70px; line-height:70px; margin:0; padding-left:10px; color:#2d81cf }
	div#header	ul				{ height:20px; margin:0 20px 10px 0 } 
	div#header	li				{ float:right }
	div#header	li a 			{ color:#4F4F4F; font-weight:bold; margin-left:10px; text-decoration:none; }
	
	
</style>   
</head> 

		<div id="header">
			<h1><a href="${pageContext.request.contextPath }/main/hello.do" class=".anchor">MySite</a></h1>
			<ul>
			<li><a href="${pageContext.request.contextPath }/main/logout.do"> Log-out</a>  </li>

			<li>    ${sessionScope.name} 님 환영합니다!</li>
			
								
			</ul>
		</div>
