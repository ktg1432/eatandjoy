<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 자바스트립트, CSS파일 불러오기</title>
<script src="${path}/resources/js/test.js"></script>
<link href="${path}/resources/css/test.css" rel="stylesheet"/> 	
</head>
<body>	
	<p>자바스트립트,css 파일 불러오기<p> <br> 
	<p id=pp>aaaaaaa</p>
	<p class=ppp>bbbbbb</p>
	${path}
</body>
</html>