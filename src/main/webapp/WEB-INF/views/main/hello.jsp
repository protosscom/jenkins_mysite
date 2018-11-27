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

<title>MySite</title>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp">
			<c:param name="menu" value="main"/>
		</c:import>
			<div id="content">
				<div id="board" align="center">
					<br>
					<br>
					<img id="profile" src="${pageContext.request.contextPath }/image/spring.jpg" width="500px" height="400px">
					<h2>메인 페이지</h2>
					
						스프링 예제 사이트에 오신것을 환영합니다!<br/>
						방명록과 게시판을 자유롭게 써보세요!<br/>
						위의 메뉴에서 원하시는 페이지로 이동할 수 있습니다.<br/>
						<br>
						<br>
						<br>
					
					<br/>
					<br/>
				</div>
			</div>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>
