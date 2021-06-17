<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>
	function fn_login(){
		if(confirm("변경하시겠습니까?") == true){
			alert("변경되었습니다");
			window.location.hrdf="/member/login";
		} else {
			return;
		}
	}
	function fn_cancle(){
		window.location.href="/";
	}
</script>
<title>비밀번호찾기</title>
</head>
<body>
	<form class="form-horizontal" role="form" method="post" action="/member/findpwd.do" style="margin-left: auto; margin-right: auto; padding:20px;"> 
		<div class="form-group form-inline" id="divId" style="margin-left : auto; margin-right:auto;">
			<label for="findId" class="col-lg-2 control-label" > 아이디 </label>
			<div class="col-lg-10">
				<input type="text" class="col-lg-10" id="id" name="uId">
			</div>
		</div>
	<div class="form-inline form-group" id="divEmail"  style="margin-left: auto; margin-right: auto;">
        <label for="findEmail" class="col-lg-2 control-label">이메일</label>
             <div class="col-lg-10">
                        <input type="email" class="col-lg-8" id="Email" name="uEmail" data-rule-required="true" placeholder="이메일" maxlength="40" pattern=[a-zA-Z0-9_+.-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}">
             </div>
         </div>
		
		 <div class="form-inline form-group">
                    <div class="col-lg-offset-2 col-lg-12 text-center" style="margin-left:240px; margin-right:auto;">
                        <button type="submit" id="findpwd" class="btn btn-primary btn-lg" onclick="fn_login()">비밀번호 변경</button>
                        <button type="button" id="cancle" class="btn btn-warning btn-lg" onclick="fn_cancle()">돌아가기</button>       
                    </div>  
           </div>
		
	</form>
</body>
</html>