<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판 작성</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/image/bookicon.ico"> 

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
		<c:import url="/WEB-INF/views/includes/header.jsp">
			<c:param name="menu" value="boardList"/>
		</c:import>
		<div id="content">
			<div id="board" align="center">
					<br/>
					<br/>
					<a href ="${pageContext.request.contextPath }/board/getBoardList.do"><img src ="${pageContext.request.contextPath}/image/Board.png"></a>
					<br/>
					<br/>
					<form action="${pageContext.request.contextPath }/board/add.do" method="post" name="editform" onsubmit="return checkText()" enctype="multipart/form-data">
						<input type="hidden" name="id" value="${sessionScope.id}"/>
						<input type="hidden" name="writer" value="${sessionScope.name}"/>
						<!-- <table border="1" cellpadding="0" cellspacing="0" width=700px> -->
						<table style="width:700px;" class="table table-hover">
							<thead>
								<tr>
									<td style="vertical-align:middle; background-color: #4B515D; color:white">제목</td>
									<td><input type="text" name="title" size="50" class="form-control" placeholder="제목"/></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="vertical-align:middle; background-color: #4B515D;color:white">작성자</td>
									<td>&nbsp;${sessionScope.name}</td>
								</tr>
								<tr>
									<td style="vertical-align:middle; background-color: #4B515D;color:white">내용</td>
									<td >
										<textarea name="content" cols="70"rows="10"  class="form-control" placeholder="내용을 입력하세요"></textarea>
									</td>
								</tr>
								<tr>
									<td style="vertical-align:middle; background-color: #4B515D;color:white">이미지</td>
									<td ><input type="file" name="uploadFile" />
								</tr>
	
								<tr>
									<td colspan="2" align="right">
									<input class="btn btn-default"  type="submit" value="작성 " />
									<input class="btn btn-default" type="button" value="취소" onclick="location.href='${pageContext.request.contextPath }/board/getBoardList.do'"/>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<hr>
				
				</div>
				<br/>
				<br/>
				
		</div>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>

</body>
</html>