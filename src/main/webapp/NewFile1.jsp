<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body { height: 100%; margin: 0; padding: 0; } 
	.header { height: 100px; background: #ddd; position: relative; z-index: 1; } 
	.content-box { min-height: 100%; margin: -100px 0 -50px; } 
	.content-box { height: 100%; } 
	.content { padding: 100px 0 50px; } 
	.footer { height: 50px; background: #ddd; } 
</style>
</head>
<body>
	
	<div class="header"> header (height 100pixel) </div> 
		<div class="content-box"> 
			<div class="content"> 
				<p>contents</p>
				<p>contents</p>
				<p>contents</p> 
			</div> 
		</div>
	<div class="footer"> footer (height 50pixel) </div> 
	
</body>
</html>