<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>login</title>
<style>
.error 
{
	padding: 10px;
	color: red;
}

.msg 
{
	padding:10px;
	color:red;
}

#login-box 
{
	width: 250px;
	padding: 30px;
	margin: 0px auto;
	background: #fff;
	border: 1px solid #333;
}
			
td 
{ 
	height: 30px; 
}			
</style>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>
	$(document).ready(function() {
		
		 // 필드 공백 제거
		 $("#username").val().replace(/\s/g, "");
		 $("#password").val().replace(/\s/g, "");
		 
		 $("#login").click(function() {
			
			// 공백 여부 점검
			if ($.trim($("#username").val()) == "" || 
				$.trim($("#password").val()) == "")   {
				
				alert("공백이 입력되었습니다. 다시 입력하십시오.");
				$("#username").val("");
				$("#password").val("");
				
			} else {
				
				
				$.ajax({
		    		url : "${pageContext.request.contextPath}/login/idCheck",
		    	    type: "get",
		    	    dataType: "text",
		        	data : {
		        		username : $("#username").val()
		        	},
		        	success : function(data) {
		        		
		        		if (data.trim() == "true") {
			           		 alert("아이디가 존재합니다.");
			       			 document.loginForm.submit();
			           	} else 
			       			 alert("아이디가 존재하지 않습니다."); 
		        			 $("#username").focus();
			        	}
		        	
		    	}); // $.ajax
		    	
		    	
			} // if
	    	
	    }) // login
	    
	}) //
</script>
</head>
<body>

	<div id="login-box">

		<h3>Login</h3>
		
	<%-- 		
		<c:if test="${error eq 'true'}">
			<div class="msg">${msg}</div>
		</c:if> 
	--%>

		<c:if test="${error eq 'true'}">
			<div class="msg">${msg}</div>
			메시지 :${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}<br>
			메시지 :${msg.message}<br>
		</c:if>
﻿

		<form id="loginForm" 
			  name="loginForm" 
			  action="<c:url value='/member/login?${_csrf.parameterName}=${_csrf.token}' />"
			  method="POST">
			  <!-- action="<c:url value='j_spring_security_check' />" -->
	 
			<table>
				<tr>
					<td>ID : </td>
					<td><input type="text" 
							   id = "username"	
							   name="username" />
					</td>
				</tr>
				<tr>
					<td>PW : </td>
					<td><input type="password" 
							   id="password"
							   name="password" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						
						<input id="login"
							   name="login" 
							   type="button"
							   value="login" />
						&nbsp;
						<input name="reset" 
							   type="reset" 
							   value="reset" />
					    &nbsp;
						<input id="joinbtn"
					    	   name="joinbtn" 	
					    	   type="button"
							   value="join"
							   onclick="location.href='${pageContext.request.contextPath}/member/join'" />	   
					</td>
				</tr>
			</table>
			
			<!-- csrf -->
			 <input type="hidden"                        
				   name="${_csrf.parameterName}"
				   value="${_csrf.token}"/>  
		</form>
	
 	</div> <!-- login box -->	
</body>
</html>