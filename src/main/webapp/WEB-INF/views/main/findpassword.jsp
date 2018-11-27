<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>비밀번호 찾기</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/image/bookicon.ico"> 
<style>
	.anchor {
	  color: inherit;
	  text-decoration:none;
	}
</style>

</head>
<body>

				<center>
					<h3>비밀번호 찾기</h3>
					<hr>
					<form action="findpassword.do" method="post" >
						<!-- <table border="1" cellpadding="0" cellspacing="0" width="700"> -->
						<table style="width:700px" class="table table-hover">
							<thead>
								<tr>
									<td width=30% style="background-color: #4B515D; color:white">아이디</td>
									<td ><input type="text" name="id" size="20" class="form-control"/></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td  style="background-color: #4B515D; color:white">비밀번호</td>
									<td ><h2><font color="blue">${password}</font></h2></td>
								</tr>
								<tr>
									<td colspan="2" align="right">
										<input type="submit" value="비번찾기" class="btn btn-default"/>
										<input style="margin-left:5px"class="btn btn-default" type="button" value="이전화면" onclick="location.href='loginform.do'"/>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<hr>
					<!-- 
					<div align="center"	style="width:100%	height:50px  margin:20px auto;">
						<input class="btn btn-default" type="button" value="로그인화면" onclick="location.href='loginform.do'"/>
					</div>
					 -->
				</center>

</body>
</html>