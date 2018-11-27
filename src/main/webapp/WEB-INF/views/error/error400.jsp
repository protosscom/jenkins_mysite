<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="5;url=${pageContext.request.contextPath }/main/hello.do">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/image/bookicon.ico">

	<style>
		body {
			margin: auto;
			max-width: 600px;
			padding:5px;
			width: 100%;
		}
		
		.anchor {
			color: inherit;
			text-decoration:none;
		}
	</style>

<title>에러 페이지</title>
</head>
<body>
		<div style="color: #173047; margin:200px 0px">
			<h1 style="font-size: 40px; color:#168">Error400</h1>
			<h3>죄송합니다. 요청하신 페이지를 찾을 수 없습니다.</h3>
			<h3>5초 후 자동으로 메인페이지로 이동합니다.</h3>
			<br/>
			<br/>
			<br/>
			<a href="${pageContext.request.contextPath }/main/hello.do" class="anchor"><h3>바로 이동</h3></a>
		</div>
</body>
</html>