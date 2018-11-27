<%@page import="com.javalec.board.vo.GuestBookVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%pageContext.setAttribute( "newLine", "\n" );%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 방명록 메인 페이지 -->
<title>방명록</title>
<!-- 테이블 모양 설정 CSS -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/image/bookicon.ico"> 

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">

<style>
	.anchor {
	  color: inherit;
	  text-decoration:none;
	}
	
	#board { margin:20px auto;	width:1100px; }
</style>


</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="content">
			<div id="board" align="center">
			
				<!-- 검색 폼 -->
					
					<a href ="${pageContext.request.contextPath }/guestbook/index.do" class=".anchor"><h1>방명록</h1></a><br/>
					
					<table style="width:700px" class="table table-hover">
						<tr>
							<td align="right">
								<form action="${pageContext.request.contextPath }/guestbook/index.do" method="get" style="margin-left:50px; display: inline;">
									<select name="schtype"  class="form-control" style="width:100px; display: inline;">
										<option value="schname">이름</option>
										<option value="schcontent">내용</option>
									</select> 
									<input type="text" name="keyword"  class="form-control" style="width:150px; display: inline;"/> 
									<input style="margin-left:10px" class="btn btn-primary" type="submit" value="검색">
								</form>
								<!-- 작성 폼 -->
								<input style="margin-left:10px" class="btn btn-primary" type="button" value="작성" onclick="location.href='${pageContext.request.contextPath }/guestbook/addform.do'"/>
							</td>
						</tr>
					</table>
				
				<br/>
				
				<!-- 리스트를 받아와서 테이블로 만들어서 for문으로 출력 -->
			
				<span style="float:center">
					<c:forEach items="${list}" var="gb">
							<table style="width:700px" class="table table-hover">
								<thead>
									<tr>
										<th width="200">${gb.no}</th>
										<th width="200">${gb.name}</th>
										<th width="200">${gb.reg_date}</th>
				
										<!-- 수정&삭제버튼. submit으로 넘어가며 번호는 hidden값으로 숨겨져서 deleteform.jsp에 넘겨줌 -->
										<th width="50">
											<form action="${pageContext.request.contextPath }/guestbook/editform.do" method="post">
												<input type="hidden" value="${gb.no}" name="no"> 
												<input class="btn btn-primary" type="submit" value="수정">
											</form>
										</th>
										<th width="50">
											<form action="${pageContext.request.contextPath }/guestbook/deleteform.do" method="post">
												<input type="hidden" value="${gb.no}" name="no"> 
												<input class="btn btn-primary" type="submit" value="삭제">
											</form>
										</th>
				
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="4"  align="center">${fn:replace(gb.content, newLine, "<br>")}</td>
									</tr>
								</tbody>
							</table>
						<br />
					</c:forEach>
				</span>
				<br/>
				<br/>
				</div>
		</div>
		<c:import url="/WEB-INF/views/includes/navigation.jsp">
			<c:param name="menu" value="guestbook" />
		</c:import>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>