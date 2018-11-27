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

<title>${board.title}</title>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp">
			<c:param name="menu" value="main"/>
		</c:import>
		<div id="content">
			<div id="board">
	
				<center>
					<a href ="${pageContext.request.contextPath }/board/index.do" class=".anchor"><h1>게시판</h1></a>
					<hr>
					<form action="${pageContext.request.contextPath }/board/read.do" method="post">

						<!-- <table border="1" cellpadding="0" cellspacing="0" width=700px>  -->
						<table style="width:700px" class="table table-hover">
							<thead>
								<tr>
									<td  width=20%>제목</td>
									<td > ${board.title}</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td >작성자</td>
									<td > ${board.writer}</td>
								</tr>
								<tr>
									<td width = "700" height="200">내용</td>
									<td width = "700" height="200">
										<c:if test="${board.fileURL != '' && board.fileURL != null}">
											<img src="${pageContext.request.contextPath }/image/${board.fileURL}" width="500"><br/><br/>
										</c:if>
										${board.content}
									</td>
								</tr>
<%-- 									<c:if test="${board.fileURL != '' && board.fileURL != null}"> --%>
<!-- 									<tr> -->
<!-- 										<td>이미지</td> -->
<!-- 										<td> -->
<%-- 											<img src="./image/${board.fileURL}" width="500"> --%>
<!-- 										</td> -->
<!-- 									</tr> -->
<%-- 									</c:if> --%>
								<tr>
									<td >등록일</td>
									<td >${board.reg_date}</td>
								</tr>
								<tr>
									<td >조회수</td>
									<td >${board.cnt}</td>
								</tr>
								<tr>
									<td align = "right"  colspan="2">
										<c:if test="${sessionScope.id == board.id}">
											<input class="btn btn-primary" type="button" value="수정" onclick="location.href='${pageContext.request.contextPath }/board/editform.do?no=${board.seq}'"/>&nbsp;&nbsp;
											<input class="btn btn-primary" type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath }/board/delete.do?no=${board.seq}'"/>&nbsp;&nbsp;
										</c:if>
										<input class="btn btn-primary" type="button" value="목록" onclick="location.href='${pageContext.request.contextPath }/board/index.do'"/>
									<td>
								</tr>
							</tbody>
						</table>
					</form>
					<hr>
				<!-- 
				<div align="right"	width:100%	height:50px  margin:20px auto;>
					<c:if test="${sessionScope.id == board.id}">
						<input class="btn btn-primary" type="button" value="변경" onclick="location.href='editform.do?no=${board.seq}'"/>&nbsp;&nbsp;
						<input class="btn btn-primary" type="button" value="삭제" onclick="location.href='delete.do?no=${board.seq}'"/>&nbsp;&nbsp;
					</c:if>
					<input class="btn btn-primary" type="button" value="목록" onclick="location.href='index.do'"/>
				</div>
				 -->
				</div>
				<br/>
				<br/>
				</center>
		</div>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>
