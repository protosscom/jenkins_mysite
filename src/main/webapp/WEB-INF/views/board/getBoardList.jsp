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

<title>게시판</title>
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
					<!-- 검색 시작 -->
					<form action="${pageContext.request.contextPath }/board/getBoardList.do" method="post">
						<!-- <table border="1" cellpadding="0" cellspacing="0" width=700px> -->
						<div style="width:700px" align="right">
						
							<select name="searchtype" class="form-control" style="width:100px; display: inline;">
								<option value="title">제목
								<option value="content">내용
							</select> 
							<input name="keyword" type="text" class="form-control" style="width:150px; display: inline;"/> <!-- <input type="submit" value="검색" /> -->
							<input class="btn btn-default" type="submit" value="검색" />
							
						</div>
					</form>
					<!-- 검색 종료 -->
					<br/>

					<!-- <table border="1" cellpadding="0" cellspacing="0" width=700px> -->
					<table style="width: 700px" class="table table-hover">
						<thead style="background-color: #4B515D; color:white">
							<tr>
								<th style="width: 100px">번호</th>
								<th style="width: 100px">작성자</th>
								<th style="width: 200px">제목</th>
								<th style="width: 200px">날짜</th>
								<th style="width: 100px">조회</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${map.list}" var="board">
								<tr onClick="location.href='${pageContext.request.contextPath }/board/read.do?no=${board.seq}'"
									style="cursor: pointer">
									<td>${board.seq}</td>
									<td>${board.writer}</td>
									<td align="left">${board.title}</td>
									<td>${board.reg_date}</td>
									<td>${board.cnt}</td>
								</tr>
							</c:forEach>
						</tbody>
						<tr>
							<td align = "right" colspan="5">
								<input class="btn btn-default" type="button" value="작성"
									onclick="location.href='${pageContext.request.contextPath }/board/addform.do'" />
							</td>
						</tr>
					</table>


					<div>
						<ul class="pagination">
							<c:if test="${map.prevPage > 0 }">
								<a
									href="getBoardList.do?currentpage=${map.prevPage}&keyword=${map.keyword }&searchtype=${map.searchCondition}">◀</a>

							</c:if>

							<c:forEach begin="${map.beginPage }"
								end="${map.beginPage + map.listSize - 1 }" var="page">
								<c:choose>

									<c:when test="${map.endPage < page }">

									</c:when>

									<c:when test="${map.currentPage == page }">
										<li><a href="#" class="active" style="background-color: #4B515D; color:white" >${page }</a></li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="getBoardList.do?currentpage=${page}&keyword=${map.keyword }&searchtype=${map.searchCondition}" style="color:#4B515D">${page}</a>
										</li>
									</c:otherwise>


								</c:choose>
							</c:forEach>

							<c:if test="${map.nextPage > 0}">
								<a
									href="getBoardList.do?currentpage=${map.nextPage}&keyword=${map.keyword }&searchtype=${map.searchCondition}">▶</a>
							</c:if>

						</ul>
					</div>
					<br/>
					<br/>
					<br/>
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>