<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">	
        <title>회원가입</title>
        <!-- Bootstrap -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="http://code.jquery.com/jquery.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
		
		<script>
		  function fn_cancle(){
		    window.location.href='/';
		  }
		  function fn_update(){
			window.location.href='/member/update?id=${pageContext.request.userPrincipal.name}';
		  }
		</script>
		<style>
		.form-group{
width : 800px;
heigth: auto;
padding : 5px;

}
</style>
</head>
<body>
	<form class="form-horizontal" role="form" method="post" action="/member/getMember.do" style="margin-left: auto; margin-right: auto; padding:20px;"> 
		<div class="form-group form-inline" id="divId" style="margin-left : auto; margin-right:auto;">
			<label for="updateId" class="col-lg-2 control-label" > 아이디 </label>
			<div class="col-lg-10">
				<input type="text" class="col-lg-10" id="id" name="uId" value="<c:out value='${memvo.uId}' />" readonly="readonly">
			</div>
		</div>
		
		<div class="form-group form-inline" id="divName" style="margin-left: auto; margin-right:auto;">
			<label for="updateName" class="col-lg-2 control-label"> 이름 </label>
				<div class="col-lg-10">
					<input type="text" class="col-lg-10" id="Name" name="uName" date-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15" pattern=[가-힣]{2,4} value="<c:out value='${memvo.uName}' />" readonly>
				</div>
		</div>
		
		<div class="form-inline form-group" id="divEmail"  style="margin-left: auto; margin-right: auto;">
                    <label for="updateEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <input type="email" class="col-lg-10" id="Email" name="uEmail" data-rule-required="true" placeholder="이메일" maxlength="40" pattern=[a-zA-Z0-9_+.-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4} value="<c:out value='${memvo.uEmail}' />" readonly>
                    </div>
         </div>
         
                  <div class="form-inline form-group" id="divPhone"  style="margin-left: auto; margin-right: auto;">
                    <label for="updatePhone" class="col-lg-2 control-label">전화번호</label>
                    <div class="col-lg-10">
                        <input type="text" class="col-lg-10" id="Phone" name="uPhon" data-rule-required="true" value="<c:out value='${memvo.uPhon}' />" readonly>
                    </div>
         </div>
         
        
         
         <div class="form-inline form-group">
                    <div class="col-lg-offset-2 col-lg-12 text-center" style="margin-left:60%; margin-right:auto;">
                        <button type="button" id="update" class="btn btn-primary btn-lg" onclick="fn_update()">회원정보수정</button>
                        <button type="button" id="cancle" class="btn btn-warning btn-lg" onclick="fn_cancle()">돌아가기</button>       
                    </div>  
           </div>

	</form>
</body>
</html>