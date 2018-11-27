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
	
	
	#board { margin:20px auto;	width:1100px; }
</style>

<script>
	//폼 체크용 메소드
	function checkText(){
		var title = editform.title.value;
		var content = editform.content.value;
		
		if(title == null || title == ""){
			alert('제목을 입력해주세요.');
			return false;
		}
		else if(content == null || content == ""){
			alert('내용을 입력해주세요.');
			return false;
		}
		else{
			 return true;
		}
	}
</script>

</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="content">
			<div id="board">
	

				<center>
					<a href ="${pageContext.request.contextPath }/board/index.do" class=".anchor"><h1>게시판</h1></a>
					<hr>
					<form action="${pageContext.request.contextPath }/board/add.do" method="post" name="editform" onsubmit="return checkText()" enctype="multipart/form-data">
						<input type="hidden" name="id" value="${sessionScope.id}"/>
						<input type="hidden" name="writer" value="${sessionScope.name}"/>
						<!-- <table border="1" cellpadding="0" cellspacing="0" width=700px> -->
						<table style="width:700px" class="table table-hover">
							<thead>
								<tr>
									<td bgcolor="#999">제목</td>
									<td >&nbsp;&nbsp;<input type="text" name="title" size="50" class="form-control"/></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td bgcolor="#999">작성자</td>
									<td >&nbsp;&nbsp;${sessionScope.name}</td>
								</tr>
								<tr>
									<td bgcolor="#999">내용</td>
									<td >&nbsp;&nbsp;<textarea name="content" cols="70"rows="10"  class="form-control" ></textarea></td>
								</tr>
								<tr>
									<td bgcolor="#999">이미지</td>
									<td >&nbsp;&nbsp;<input type="file" name="uploadFile" />
								</tr>
	
								<tr>
									<td colspan="2" align="right">
									<input class="btn btn-primary"  type="submit" value="작성 " />
									<input class="btn btn-primary" type="button" value="목록" onclick="location.href='${pageContext.request.contextPath }/board/index.do'"/>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<hr>
				<!--  
				<div align="right"	width:100%	height:50px  margin:20px auto;>
					<input class="btn btn-primary" type="button" value="목록" onclick="location.href='index.do'"/>
				</div>
				-->
				</div>
				<br/>
				<br/>
				
				</center>
		</div>
		<c:import url="/WEB-INF/views/includes/navigation.jsp">
			<c:param name="menu" value="boardList" />
		</c:import>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>

</body>
</html>