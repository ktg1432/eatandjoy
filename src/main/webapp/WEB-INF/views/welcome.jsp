<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>welcome</title>
</head>
<body>

	name : <sec:authentication property="name"/><br>
    username : <sec:authentication property="principal.username"/><br>
    principal : ${pageContext.request.userPrincipal}<br>
	<hr>
	
	<c:if test="${empty pageContext.request.userPrincipal.name}">
		<script>
			alert("이미 로그아웃되었습니다. 로그인 페이지로 이동합니다.");
			location.href="${pageContext.request.contextPath}/member/login";
		</script>
	</c:if>
	
	<c:if test="${not empty pageContext.request.userPrincipal.name}">
		${pageContext.request.userPrincipal.name} 님 환영합니다.<br>
		<input type="button" 
			   value="로그아웃"
			   onclick="location.href='${pageContext.request.contextPath}/logoutProc'" />	
	</c:if>
	

</body>
</html>