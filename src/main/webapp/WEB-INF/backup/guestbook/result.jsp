<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과창</title>
</head>
<body>

<!-- 결과 알림창용 jsp. 상황에 맞게 알림창 띄움 -->

<c:choose>
	<c:when test="${result == 'loginsuccess'}">
		<script>
			alert('로그인 되었습니다.'); 
			location.href = '${pageContext.request.contextPath }/guestbook/index.do';
		</script>
	</c:when>
	
	<c:when test="${result == 'logoutsuccess'}">
		<script>
			alert('로그아웃 되었습니다.'); 
			location.href = '${pageContext.request.contextPath }/guestbook/loginform.do';
		</script>
	</c:when>

	<c:when test="${result == 'addsuccess'}">
		<script>
			alert('방명록을 작성했습니다.'); 
			location.href = '${pageContext.request.contextPath }/guestbook/index.do';
		</script>
	</c:when>
	
	<c:when test="${result == 'editsuccess'}">
		<script>
			alert('방명록이 수정되었습니다.'); 
			location.href = '${pageContext.request.contextPath }/guestbook/index.do';
		</script>
	</c:when>
	
	<c:when test="${result == 'deletesuccess'}">
		<script>
			alert('방명록이 삭제되었습니다.'); 
			location.href = '${pageContext.request.contextPath }/guestbook/index.do';
		</script>
	</c:when>
	
	<c:when test="${result == 'passwordfail'}">
		<script>
			alert('비밀번호가 잘못되었습니다.'); 
			location.href = '${pageContext.request.contextPath }/guestbook/index.do';
		</script>
	</c:when>
	
	<c:otherwise>
		<script>
			alert('잘못된 경로입니다.'); 
			location.href = '${pageContext.request.contextPath }/guestbook/index.do';
		</script>
	</c:otherwise>
</c:choose>

</body>
</html>