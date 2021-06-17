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
		
		<style>
		.form-group{
		width : 800px;
		heigth: auto;
		padding : 5px;
		}
		</style>
		
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('uZip').value = data.zonecode;
                document.getElementById("uAddr").value = roadAddr;
                
                

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    // 아이디 중복 검사
    function fn_idChk(){
        $.ajax({
           url : "/member/idCheck.do",
           type : "post",
           dataType : "json",
           data : {"uId" : $("#Id").val()},
           success : function(data){
              if(data == 1){
                 alert("사용 불가능한 아이디입니다.");
              }else if(data == 0){
                 $("#idChk").attr("value", "Y");
                 alert("사용가능한 아이디입니다.");
              }
           }
        })
     }
    // 이메일 중복 검사
    function fn_EmailChk(){
        $.ajax({
           url : "/member/EmailCheck.do",
           type : "post",
           dataType : "json",
           data : {"uEmail" : $("#Email").val()},
           success : function(data){
              if(data == 1){
                 alert("사용 불가능한 이메일입니다.");
              }else if(data == 0){
                 $("#EmailChk").attr("value", "Y");
                 alert("사용가능한 이메일입니다.");
              }
           }
        })
     }
    // 핸드폰번호 중복 검사
    function fn_PhoneChk(){
        $.ajax({
           url : "/member/PhoneCheck.do",
           type : "post",
           dataType : "json",
           data : {"uPhon" : $("#Phone").val()},
           success : function(data){
              if(data == 1){
                 alert("사용 불가능한 번호입니다.");
              }else if(data == 0){
                 $("#Phone").attr("value", "Y");
                 alert("사용가능한 번호입니다.");
              }
           }
        })
     }
    function fn_cancle(){
    	if(confirm("취소하시겠습니까?") == true){
    		window.location.href='/member/mypage/mypage_main';
    	} else {
    		return;
    	}
    }
    function fn_changepwd(){
    	window.location.href='/member/mypage/changepwd?id=${pageContext.request.userPrincipal.name}';
    }
    	  
    </script>
    	<style>
		.form-group{
width : 800px;
heigth: auto;
padding : 5px;

}
</style>
    
<title>회원정보 수정</title>
</head>
<body>
	
	<form class="form-horizontal" role="form" method="post" action="/member/updateMember.do" style="margin-left: auto; margin-right: auto; padding:20px;">
		<div class="form-group form-inline" id="divId" style="margin-left : auto; margin-right:auto;">
			<label for="updateId" class="col-lg-2 control-label" > 아이디 </label>
			<div class="col-lg-10">
				<input type="text" class="col-lg-10" id="id" name="uId" value="<c:out value='${memvo.uId}' />" readonly="readonly">
			</div>
		</div>
		
		<div class="form-group form-inline" id="divName" style="margin-left: auto; margin-right:auto;">
			<label for="updateName" class="col-lg-2 control-label"> 이름 </label>
				<div class="col-lg-10">
					<input type="text" class="col-lg-10" id="Name" name="uName" date-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15" pattern=[가-힣]{2,4} value="${memvo.uName}">
				</div>
		</div>
		
		<div class="form-group form-inline" id="divZip" style="margin-left:auto; margin-right:auto;">
			<label for="updateAddr" class="col-lg-2 control-label">주소</label>
                    <div class="col-lg-10">
                  		<input type="text" id="uZip" name="uZip" placeholder="우편번호" class="col-lg-6" readonly value="${memvo.uZip}">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"  ><br>
						<input type="text" id="uAddr" name="uAddr" placeholder="도로명주소" class="col-lg-10" readonly value="${memvo.uAddr}"><br>
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="uAddrs" name="uAddrs" placeholder="상세주소" class="col-lg-10" value="${memvo.uAddrs}">
                    </div>
         </div>
         
         <div class="form-inline form-group" id="divEmail"  style="margin-left: auto; margin-right: auto;">
                    <label for="updateEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <input type="email" class="col-lg-8" id="Email" name="uEmail" data-rule-required="true" placeholder="이메일" maxlength="40" pattern=[a-zA-Z0-9_+.-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4} value="${memvo.uEmail}">
                        <button class="EmailChk btn-primary col-lg-2" type="button" id="Email" name="uEmail" onclick="fn_EmailChk();" value="N">중복확인</button>
                    </div>
         </div>
         
                  <div class="form-inline form-group" id="divPhone"  style="margin-left: auto; margin-right: auto;">
                    <label for="updatePhone" class="col-lg-2 control-label">전화번호</label>
                    <div class="col-lg-10">
                        <input type="text" class="col-lg-8" id="Phone" name="uPhon" data-rule-required="true" value="${memvo.uPhon}">
                        <button class="EmailChk btn-primary col-lg-2" type="button" id="Phone" name="uPhon" onclick="fn_PhoneChk();" value="N">중복확인</button>
                    </div>
         </div>
         
           <div class="form-inline form-group">
                    <div class="col-lg-offset-2 col-lg-12 text-center" style="margin-left:60%; margin-right:auto;">
                    	<button type="button" id="changepwd" class="btn btn-primary btn-lg" onclick="fn_changepwd();">비밀번호변경</button>
                        <button type="submit" class="btn btn-primary btn-lg">정보수정</button>
                        <button type="button" id="cancle" class="btn btn-warning btn-lg" onclick="fn_cancle()">취소</button>
                    </div>  
           </div>
	</form>
      

</body>
</html>