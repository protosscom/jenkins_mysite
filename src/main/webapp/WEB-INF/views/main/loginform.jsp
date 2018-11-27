<%@page import="com.javalec.board.vo.UsersVO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/image/bookicon.ico"> 

<style>
	.anchor {
	  color: inherit;
	  text-decoration:none;
	}
</style>


<title>로그인</title>

<script type="text/javascript">
	//폼 체크용 메소드
	function checkText(){
		var id = loginform.id.value;
		var password = loginform.password.value;
		
		if(id == null || id == ""){
			alert('ID를 입력해주세요.');
			return false;
		}
		else if(password == null || password == ""){
			alert('비밀번호를 입력해주세요.'); 
			return false;
		}
		else{
			 return true;
		}
	}
</script>

</head>
<body>


	<center>
		<h1>로그인</h1>
		<hr>
		<form action="${pageContext.request.contextPath }/main/login.do" method="post" name = "loginform" onsubmit="return checkText()">
			<!-- <table class="tbl-ex" align="center"   width=400>  -->
			<table style="width:400px" class="table table-striped">
				<tr>
					<td style="background-color: #4B515D; color:white">아이디</td>
					
					<td><input type="text" name="id" class="form-control" /></td>
					
				</tr>
				<tr>
					<td  style="background-color: #4B515D; color:white">비밀번호</td>
					
					<td><input type="password" name="password" class="form-control" /></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="로그인" class="btn btn-default"/>
					</td>
				</tr>
			</table>
		</form>
		
		<hr>
		
		<c:choose>
			<c:when test="${loginstatus=='fail'}">
				<h3> <font color="red"> 아이디/비밀번호를 확인해 주세요!!</font></h3>
			</c:when>
			<c:when test="${loginstatus=='joinsuccess'}">
				<h3> <font color="blue"> 회원가입 완료!!</font></h3>
			</c:when>
		</c:choose>
			
		<input class="btn btn-default" type="button" value="회원가입" onclick="location.href='${pageContext.request.contextPath }/main/joinform.do'"/>&nbsp;&nbsp;
		<input class="btn btn-default" type="button" value="비번찾기" onclick="location.href='${pageContext.request.contextPath }/main/findpassword.do'"/>
		<br/>
		<br/>
	</center>


</body>
</html>