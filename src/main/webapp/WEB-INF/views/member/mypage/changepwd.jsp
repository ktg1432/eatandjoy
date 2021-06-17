<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
		
		<style>
		.form-group{
		width : 800px;
		heigth: auto;
		padding : 5px;
		}
		</style>
		
		<script>
	    function fn_cancle(){
	    	if(confirm("취소하시겠습니까?") == true){
	    		window.location.href='/member/update?id=${pageContext.request.userPrincipal.name}';
	    	} else {
	    		return;
	    	}
	    }
		</script>
</head>
<body>
	<form class="form-horizontal" role="form" method="post" action="/member/mypage/modifypwd" style="margin-left: auto; margin-right: auto;">
			<label for="updateId" class="col-lg-2 control-label" ></label>
			<div class="col-lg-10" style="margin-left: auto; margin-right: auto;">
				<input type="hidden" class="col-lg-10" id="uid" name="uId" value="${pageContext.request.userPrincipal.name}" readonly="readonly">
			</div>
		   <div class="form-inline form-group" id="divPassword"  style="margin-left: auto; margin-right: auto;">
                    <label for="changePassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="col-lg-10" id="Pwd"  name="uPwd" data-rule-required="true" value="${memvo.uPwd}" placeholder="8~30자이내의 알파벳, 숫자, 특수문자만 입력가능합니다." maxlength="30" pattern=(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,30}>
                    </div>
                </div>
                  <div class="form-inline form-group" id="divPasswordCheck"  style="margin-left: auto; margin-right: auto;">
                    <label for="changePasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
                    <div class="col-lg-10">
                        <input type="password" class="col-lg-10" id="PwdCk" name="passowrdCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
                    </div>
                </div>
                
                <div class="col-lg-offset-2 col-lg-12 text-center" style="margin-left:auto;">
                        <button type="submit" class="btn btn-primary btn-lg">비밀번호변경</button>
                        <button type="button" id="cancle" class="btn btn-warning btn-lg" onclick="fn_cancle()">취소</button>
                </div>
	</form>
	<script>
	 $(function(){
                //모달을 전역변수로 선언
                var modalContents = $(".modal-contents");
                var modal = $("#defaultModal");
   
                //------- 검사하여 상태를 class에 적용
                
                $('#Pwd').keyup(function(event){
                    
                    var divPassword = $('#divPassword');
                    
                    if($('#Pwd').val()==""){
                        divPassword.removeClass("has-success");
                        divPassword.addClass("has-error");
                    }else{
                        divPassword.removeClass("has-error");
                        divPassword.addClass("has-success");
                    }
                });
                
                $('#PwdCk').keyup(function(event){
                    
                    var passwordCheck = $('#PwdCk').val();
                    var password = $('#Pwd').val();
                    var divPasswordCheck = $('#divPasswordCheck');
                    
                    if((passwordCheck=="") || (password!=passwordCheck)){
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                });
                             
                //------- validation 검사
                $( "form" ).submit(function( event ) {
                    
                    var divId = $('#divId');
                    var divPassword = $('#divPassword');
                    var divPasswordCheck = $('#divPasswordCheck');

                    
                    //패스워드 검사
                    if($('#Pwd').val()==""){
                        modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divPassword.removeClass("has-success");
                        divPassword.addClass("has-error");
                        $('#Pwd').focus();
                        return false;
                    }else{
                        divPassword.removeClass("has-error");
                        divPassword.addClass("has-success");
                    }
                    
                    //패스워드 확인
                    if($('#PwdCk').val()==""){
                        modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                        $('#PwdCk').focus();
                        return false;
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                    
                    //패스워드 비교
                    if($('#Pwd').val()!=$('#PwdCk').val() || $('#PwdCk').val()==""){
                        modalContents.text("패스워드가 일치하지 않습니다.");
                        modal.modal('show');
                        
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                        $('#PwdCk').focus();
                        return false;
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                
            });
            
        </script>
</body>
</html>