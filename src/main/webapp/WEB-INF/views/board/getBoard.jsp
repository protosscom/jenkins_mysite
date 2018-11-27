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

<title>${board.title}</title>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp">
			<c:param name="menu" value="boardList"/>
		</c:import>
		<div id="content">
			<div id="board"  align="center">
					<br/>
					<br/>
					<a href ="${pageContext.request.contextPath }/board/getBoardList.do"><img src ="${pageContext.request.contextPath}/image/Board.png"></a>					
					<br/>
					<br/>
					<form action="${pageContext.request.contextPath }/board/read.do" method="post">

						<!-- <table border="1" cellpadding="0" cellspacing="0" width=700px>  -->
						<table style="width:700px" class="table table-hover">
							<thead>
								<tr>
									<td> 
										<font size="4"><strong>${board.title}</strong></font>
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										${board.writer}
										&nbsp;&nbsp;|&nbsp;&nbsp;
										${board.reg_date}
										&nbsp;&nbsp;|&nbsp;&nbsp;
										조회&nbsp;&nbsp;${board.cnt}
									</td>
								</tr>
								<tr>
									<td width = "700" height="200" style="vertical-align:middle">
										<c:if test="${board.fileURL != '' && board.fileURL != null}">
											<img src="${pageContext.request.contextPath }/image/${board.fileURL}" width="500"><br/><br/>
										</c:if>
										${board.content}
									</td>
								</tr>
								<tr>
									<td align = "right">
										<c:if test="${sessionScope.id == board.id}">
											<input class="btn btn-default" type="button" value="수정" onclick="location.href='${pageContext.request.contextPath }/board/editform.do?no=${board.seq}'"/>&nbsp;&nbsp;
											<input class="btn btn-default" type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath }/board/delete.do?no=${board.seq}'"/>&nbsp;&nbsp;
										</c:if>
										<input class="btn btn-default" type="button" value="목록" onclick="location.href='${pageContext.request.contextPath }/board/getBoardList.do'"/>
									<td>
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
