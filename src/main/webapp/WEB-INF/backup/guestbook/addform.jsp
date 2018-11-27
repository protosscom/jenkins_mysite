<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 작성</title>

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



<script type="text/javascript">
	//취소 메소드
	function moveMain(choice) {
		var choice;

		if (choice == true) {
			location.href = '${pageContext.request.contextPath }/guestbook/index.do';
		}
	}

	//폼 체크용 메소드
	function checkText() {
		var name = addForm.name.value;
		var password = addForm.password.value;
		var content = addForm.content.value;

		if (name == null || name == "") {
			alert('이름을 입력해주세요.');
			return false;
		} 
		else if (password == null || password == "") {
			alert('비밀번호를 입력해주세요.');
			return false;
		} 
		else if (content == null || content == "") {
			alert('내용을 입력해주세요.');
			return false;
		} 
		else {
			return true;
		}
	}
</script>

</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp"/>
		<div id="content">
			<div id="board"  style="text-align:center">
				<!-- 방명록 작성 테이블 -->
					<a href ="${pageContext.request.contextPath }/guestbook/index.do" class=".anchor"><h1>방명록</h1></a><br/>
				
					<form action="${pageContext.request.contextPath }/guestbook/add.do" method="post" name="addForm" onsubmit="return checkText()">
						
						<table style="width:700px; margin: 0 auto" class="table table-hover">
							<!-- 이름&비밀번호 -->
							<thead>
								<tr>
									<th width="150">이름</th>
									<th width="200"><input  class="form-control" type="text" name="name" placeholder="이름"></th>
									<th width="150">비밀번호</th>
									<th width="200"><input class="form-control" type="password" name="password" placeholder="●●●●"></th>
								</tr>
							</thead>
							<!-- 내용 -->
							<tbody>
								<tr>
									<td colspan="4"><textarea  class="form-control" style="resize: none;" cols="85" rows="15" name="content" placeholder="내용을 입력하세요"></textarea></td>
								</tr>
								<!-- 제출 -->
								<tr>
									<td colspan="4">
										<input style="float:right" class="btn btn-primary" type="button" value="취소" onClick="moveMain(true)">
										&nbsp; <input style="float:right" class="btn btn-primary" type="submit" value="작성" />
									</td>
								</tr>
							</tbody>
						</table>
					</form>
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