<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 수정</title>
<!-- 테이블 모양 설정 CSS -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/image/bookicon.ico">   

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">

<script>
	//취소 메소드
	function moveMain(choice){
		var choice;
		
		if(choice == true){
			location.href = 'getGuestBookList.do';
		}
	}
	
	//폼 체크용 메소드
	function checkText(){
		var name = editform2.name.value;
		var password = editform2.password.value;
		var content = editform2.content.value;
		
		if(name == null || name == ""){
			alert('이름을 입력해주세요.');
			return false;
		}
		else if(password == null || password == ""){
			alert('비밀번호를 입력해주세요.'); 
			return false;
		}
		else if(content == null || content == ""){
			alert('내용을 입력해주세요.');
			return false;
		}
		else{
			 return true;
		}
	}
</script>

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
				<a href ="${pageContext.request.contextPath }/guestbook/getGuestBookList.do"><img src ="${pageContext.request.contextPath}/image/gb.png"></a>	
				<br/>
				<br/>
				<!-- 방명록 수정 테이블 -->
				<div style="text-align: center">
					<form action="${pageContext.request.contextPath }/guestbook/edit.do" method="post" name="editform2" onsubmit="return checkText()">
						<input type="hidden" name="no" value="${gb.no}"> 
						<table style="width:700px; margin: 0 auto" class="table">
							<!-- 이름 -->
							<thead style="background-color: #4B515D; color:white">
								<tr>
									<th width="150" style="vertical-align:middle;">이름
									</th>
									<th width="200"><input  class="form-control" type="text" id="name" name="name" value="${gb.name}">
									</th>
									<th width="150" style="vertical-align:middle;">비밀번호
									</th>
									<th width="200"><input  class="form-control" type="password" id="password" name="password" value="${gb.password}">
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- 내용 -->
								<tr>
									<td colspan="4"><textarea  class="form-control" style="resize: none;" cols="85" rows="15" id="content" name="content">${gb.content}</textarea></td>
								</tr>
								<!-- 제출 -->
								<tr>
									<td colspan="4">
										<input style="float:right; margin-left:5px" class="btn btn-default" type="button" value="취소" onClick="moveMain(true)">
										&nbsp; <input style="float:right; margin-left:5px" class="btn btn-default" type="submit" value="수정" />
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<br/>
				<br/>
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>

</body>
</html>