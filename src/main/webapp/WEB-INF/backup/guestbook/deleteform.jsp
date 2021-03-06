<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 방명록 삭제 입력 페이지 -->
<title>방명록 삭제</title>
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
	function moveMain(choice){
		var choice;
		
		if(choice == true){
			location.href = 'index.do';
		}
	}
	
	//비밀번호 null값 체크
	function chkpw(){
		var pw = deleteform.password.value;
		
		if(pw == null || pw == ""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
	<c:if test="${(param.no == null) || (param.no == '')}">
		<script>
			alert("잘못된 경로입니다.");
			location.href = "${pageContext.request.contextPath }/guestbook/index.do";
		</script>
	</c:if>
	
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="content">
			<div id="board" align="center">
					<a href ="${pageContext.request.contextPath }/guestbook/index.do" class=".anchor"><h1>방명록</h1></a><br/>
			
					<!-- 비밀번호를 입력받음. 삭제할 번호는 히든에 숨겨서 delete.jsp로 넘겨줌. -->
					<form action="${pageContext.request.contextPath }/guestbook/delete.do" method="get" name="deleteform" onsubmit="return chkpw()">
						<input type="hidden" name="no" value="${param.no}">
				
						<table style="width:400px" class="table table-hover">
							<tr>
								<th colspan="3">게시물 삭제</th>
							</tr>
							<tr>
								<td>비밀번호
								</td>
								<td><input  class="form-control" type="password" name="password" placeholder="●●●●"/>
								</td>
								<td>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<input style="float:right; margin:5px" class="btn btn-primary" type="button" value="취소" onClick="moveMain(true)">
									&nbsp;&nbsp;&nbsp;
									<input style="float:right; margin:5px" class="btn btn-primary" type="submit" value="삭제" />
								</td>
							</tr>
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