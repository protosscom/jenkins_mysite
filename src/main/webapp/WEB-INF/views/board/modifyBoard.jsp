<%@page import="com.javalec.board.vo.BoardVO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/image/bookicon.ico"> 

<script>
	//취소 메소드
	function moveMain(choice){
		var choice;
		
		if(choice == true){
			location.href = 'getBoardList.do';
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

<title>게시판 수정</title>
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
					<form action="edit.do" method="post" name="editform" onsubmit="return checkText()"  enctype="multipart/form-data">
						<input type="hidden" name="seq" value="${board.seq}"/>
						<input type="hidden" name="writer" value="${board.writer}"/>

						<table style="width:700px;" class="table table-hover">
							<thead>
								<tr>
									<td style="vertical-align:middle; background-color: #4B515D; color:white">제목</td>
									<td ><input name="title" type="text" value="${board.title}"  class="form-control"/></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="vertical-align:middle;background-color: #4B515D; color:white">작성자</td>
									<td >&nbsp;${board.writer}</td>
								</tr>
								<tr>
									<td style="vertical-align:middle;background-color: #4B515D; color:white">내용</td>
									<td >
										<textarea name="content" cols="70" rows="10"  class="form-control" >${board.content}</textarea>
									</td>
								</tr>
								<tr>
									<td style="vertical-align:middle; background-color: #4B515D;color:white">이미지</td>
									<td ><input type="file" name="uploadFile" />
								</tr>
								<tr>
									<td style="vertical-align:middle;background-color: #4B515D; color:white">등록일</td>
									<td >${board.reg_date}</td>
								</tr>
								<tr>
									<td colspan="2" align="right">
										<input type="submit" value="수정" class="btn btn-default"/>
										<input class="btn btn-default" type="button" value="취소" onclick="location.href='${pageContext.request.contextPath }/board/getBoardList.do'"/>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<hr>
				<br/>
				<br/>
		</div>
		</div>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>
