<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/login.css">
</head>

<body>
	<div>
		name :
		<sec:authentication property="name" />
		<br> username :
		<sec:authentication property="principal.username" />
		<br> principal : ${pageContext.request.userPrincipal}<br>
	</div>
	<hr>
	<div class="wrapper fadeInDown zero-raduis">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first">
				<a href="/"><img src="${path}/resources/images/logo7.png" id=""
					alt="logo" /></a>
			</div>

			<!-- Login Form -->
			<form id="loginForm" name="loginForm"
				action="<c:url value='/member/login?${_csrf.parameterName}=${_csrf.token}' />"
				method="POST">
				<input type="text" id="username" class="fadeIn second zero-raduis"
					name="username" placeholder="username"> 
				<input type="text"
					id="password" class="fadeIn third zero-raduis" name="password"
					placeholder="password">
				<div id="formFooter">
					<a class="underlineHover" href="#">Forgot Password?</a>
				</div>
				<input type="submit" class="fadeIn fourth zero-raduis" value="login">
				<h2>You don't have a account ?</h2>
				<input type="button" class="fadeIn fourth zero-raduis pc"
					value="join"
					onclick="location.href='${pageContext.request.contextPath}/member/join'">
				<!-- csrf -->
			 <input type="hidden"                        
				   name="${_csrf.parameterName}"
				   value="${_csrf.token}"/>  
			</form>


		</div>
	</div>



</body>


</html>