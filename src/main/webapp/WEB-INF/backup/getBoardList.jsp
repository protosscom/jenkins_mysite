<%@page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">

<style>
	.anchor {
	  color: inherit;
	  text-decoration:none;
	}
</style>

<title>글 목록</title>
</head>
<body>
	

			<center>
				<a href ="index.do" class=".anchor"><h1>게시판 목록</h1></a>
				<h3>

				</h3>
				<!-- 검색 시작 -->
				<form action="index.do" method="post">
					<!-- <table border="1" cellpadding="0" cellspacing="0" width=700px> -->
					<table style="width:700px" class="table table-hover">
						<tr>
							<td align="right">
								<select name="searchtype">
									<option value="title">제목
									<option value="content">내용 
								</select> 
								<input name="keyword" type="text" /> 
								<!-- <input type="submit" value="검색" /> -->
								<input class="btn btn-primary" type="submit" value="검색" />
							</td>
						</tr>
					</table>
				</form>
				<!-- 검색 종료 -->


				<!-- <table border="1" cellpadding="0" cellspacing="0" width=700px> -->
				<table style="width:700px" class="table table-hover">
					<thead>
						<tr>
							<th style="width:100px">번호</th>
							<th style="width:100px">작성자</th>
							<th style="width:200px">제목</th>
							<th style="width:200px">등록일</th>
							<th style="width:100px">조회수</th>
						</tr>
					</thead>
					<c:forEach items="${map.list}" var="board">
					<tbody>
						<tr onClick="location.href='read.do?no=${board.seq}'" style="cursor:pointer">
							<td>${board.seq}</td>
							<td>${board.writer}</td>
							<td align="left">${board.title}</td>
							<td>${board.reg_date}</td>
							<td>${board.cnt}</td>
						</tr>
					</tbody>
					</c:forEach>
				</table>
				
				<div class="pager">
					<ul>
						<c:if test="${map.prevPage > 0 }" >
							<a href="index.do?currentpage=${map.prevPage}&keyword=${map.keyword }&searchtype=${map.searchCondition}">◀</a>
						
						</c:if>
						
						<c:forEach begin="${map.beginPage }" end="${map.beginPage + map.listSize - 1 }" var="page">
							<c:choose>
							 
								<c:when test="${map.endPage < page }">
								
								</c:when> 
 
								<c:when test="${map.currentPage == page }">
								    <li class="selected"><a href="#">${page } </a></li> 
								</c:when>
								<c:otherwise> 
								    <li><a href="index.do?currentpage=${page}&keyword=${map.keyword }&searchtype=${map.searchCondition}">${page}</a></li>
								</c:otherwise>


							</c:choose>
						</c:forEach>
						
						<c:if test="${map.nextPage > 0}" >
							<a href="index.do?currentpage=${map.nextPage}&keyword=${map.keyword }&searchtype=${map.searchCondition}">▶</a>
						</c:if>	

					</ul>
				</div>

				
				<br>
				<div align="center"	style="width:100%	height:50px  margin:20px auto;">
					<input class="btn btn-primary" type="button" value="글 작성" onclick="location.href='addform.do'"/>&nbsp;&nbsp;
					<input class="btn btn-primary" type="button" value="로그아웃" onclick="location.href='logout.do'"/>
				</div>
			</center>

</body>
</html>