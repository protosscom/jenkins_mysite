<%@page import="com.javalec.board.vo.BoardVO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
	
	
	#board { margin:20px auto;	width:1100px; }
</style>


<script>
	//취소 메소드
	function moveMain(choice){
		var choice;
		
		if(choice == true){
			location.href = 'index.do';
		}
	}
	
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

<title>게시글 수정</title>
</head>
<body>

	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="content">
			<div id="board">


				<center>
					<a href ="${pageContext.request.contextPath }/board/index.do" class=".anchor"><h1>게시판</h1></a>
					<hr>
					<form action="edit.do" method="post" name="editform" onsubmit="return checkText()">
						<input type="hidden" name="seq" value="${board.seq}"/>
						<input type="hidden" name="writer" value="${board.writer}"/>

						<!-- <table border="1" cellpadding="0" cellspacing="0" width=700px> -->
						<table style="width:700px" class="table table-hover">
							<thead>
								<tr>
									<td  width=20%>제목</td>
									<td >&nbsp;&nbsp;
										<input name="title" type="text" value="${board.title}"  class="form-control"/></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td >작성자</td>
									<td >&nbsp;&nbsp; ${board.writer}</td>
								</tr>
								<tr>
									<td >내용</td>
									<td >&nbsp;&nbsp;
										<textarea name="content" cols="70" rows="10"  class="form-control" >${board.content}</textarea>
									</td>
								</tr>
								<tr>
									<td >등록일</td>
									<td >${board.reg_date}</td>
								</tr>
								<tr>
									<td >조회수</td>
									<td >${board.cnt}</td>
								</tr>
								<tr>
									<td colspan="2" align="right">
										<input type="submit" value="수정" class="btn btn-primary"/>
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
				<br/>
				<br/>
				</center>
		</div>
		</div>
		<c:import url="/WEB-INF/views/includes/navigation.jsp">
			<c:param name="menu" value="boardList" />
		</c:import>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>
