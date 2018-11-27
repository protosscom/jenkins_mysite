<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>새글등록</title>


<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/image/bookicon.ico"> 

<style>
	.anchor {
	  color: inherit;
	  text-decoration:none;
	}
</style>

<script type="text/javascript">
	//폼 체크용 메소드
	function checkText(){
		var id = joinform.id.value;
		var password = joinform.password.value;
		var name = joinform.name.value;
		
		if(id == null || id == ""){
			alert('아이디를 입력해주세요.');
			return false;
		}
		else if(password == null || password == ""){
			alert('비밀번호를 입력해주세요.');
			return false;
		}
		else if(name == null || name == ""){
			alert('이름을 입력해주세요.');
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
					<h3>사용자 등록</h3>
					<hr>
					<form action="${pageContext.request.contextPath }/main/join.do" method="post" name="joinform">
						<!-- <table border="1" cellpadding="0" cellspacing="0" width=700px> -->
						<table style="width:700px" class="table table-hover">
							<thead>
								<tr>
									<td width=20%  style="background-color: #4B515D; color:white">아이디</td>
									<td >&nbsp;&nbsp;<input type="text" name="id" size="20" /></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td  style="background-color: #4B515D; color:white">비밀번호</td>
									<td >&nbsp;&nbsp;<input type="password" name="password" size="20" /></td>
								</tr>
								<tr>
									<td  style="background-color: #4B515D; color:white">이름</td>
									<td >&nbsp;&nbsp;<input type="text" name="name" size="20" />
									</td>
								</tr>
								<tr>
									<td  style="background-color: #4B515D; color:white">권한</td>
									<td >&nbsp;&nbsp;
									<input type="radio" name="role" value="admin" checked="checked"> 어드민
									<input type="radio" name="role" value="user"> 일반사용자
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right">
										<input type="submit" value="회원가입" class="btn btn-default"/>
										<input style="margin-left:5px"class="btn btn-default" type="button" value="이전화면" onclick="location.href='loginform.do'"/>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<hr>
					<br/>
					<br/>
				</center>

</body>
</html>