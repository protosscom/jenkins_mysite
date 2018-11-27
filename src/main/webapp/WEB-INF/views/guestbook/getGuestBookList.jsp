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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">

</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp">
			<c:param name="menu" value="guestbook"/>
		</c:import>
		<div id="content">
			<div id="board" align="center">
					<br/>
					<br/>
				<!-- 검색 폼 -->
					<a href ="${pageContext.request.contextPath }/guestbook/getGuestBookList.do"><img src ="${pageContext.request.contextPath}/image/gb.png"></a>	
					<br/>
					<br/>		
					<div style="width:700px" align="right">
						
							<form action="${pageContext.request.contextPath }/guestbook/getGuestBookList.do" method="get" style="margin-left:50px; display: inline;">
								<select name="schtype"  class="form-control" style="width:100px; display: inline;">
									<option value="schname">이름</option>
									<option value="schcontent">내용</option>
								</select> 
								<input type="text" name="keyword"  class="form-control" style="width:150px; display: inline;"/> 
								<input style="margin-left:5px" class="btn btn-default" type="submit" value="검색">
							</form>
							<!-- 작성 폼 -->
							<input style="margin-left:5px" class="btn btn-default" type="button" value="작성" onclick="location.href='${pageContext.request.contextPath }/guestbook/addform.do'"/>
							
					</div>
				<br/>
				<!-- 리스트를 받아와서 테이블로 만들어서 for문으로 출력 -->
					<c:forEach items="${list}" var="gb">
							<table style="width:700px" class="table table-bordered">
								<thead style="background-color: #4B515D; color:white">
									<tr>
										<th width="600">
											<font size="2">${gb.no} &nbsp;&nbsp; </font> 
											<font size="3"><strong>${gb.name}</strong> &nbsp;&nbsp; </font>
											<font size="2">${gb.reg_date} &nbsp;&nbsp;</font>
										</th>
										<th width="100" align="center">
												&nbsp;
												<a href="${pageContext.request.contextPath }/guestbook/editform.do?no=${gb.no}" class=".anchor">수정</a>
												&nbsp;
												<a href="${pageContext.request.contextPath }/guestbook/deleteform.do?no=${gb.no}" class=".anchor">삭제</a>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td align="center" colspan="2">${fn:replace(gb.content, newLine, "<br>")}</td>
									</tr>
								</tbody>
							</table>
						<br />
					</c:forEach>
				<br/>
				<br/>
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>