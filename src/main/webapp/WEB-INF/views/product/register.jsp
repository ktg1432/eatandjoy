<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="includesProduct/header.jsp" %>
	
	<style>
		.uploadResult{
			width: 100%;
			background-color: grey;
		}
		
		.uploadResult ul{
			display: flex;
			flex-flow: row;
			justify-content: center;
			align-items: center;
			
		}
		
		.uploadResult ul li{
			list-style:none;
			padding:10px;
		}
		
		.uploadResult ul li img{
			width: 50px;
		}
		
	</style>
	
	​
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Product Register</h1>
		</div>	
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">제품 등록</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<form role="form" action="/product/register" method="post">
						<div class="form-group">
							<label>1차 분류</label> 
							<select class="category1">
								<option value="">전체</option>
							</select>
							
							<label>2차 분류</label> 
							<select class="category2" name="pCateCode">
								<option value="">전체</option>
							</select>
						</div>
						<div class="form-group">
							<label>상품명</label> <input class="form-control" name="pName">
						</div>
						<div class="form-group">
							<label>상품내용</label> 
							<textarea class="form-control" rows="3" name="pDesc"></textarea>
						</div>
						<div class="form-group">
							<label>상품가격</label> <input class="form-control" name="pPrice">
						<button type="submit" class="btn btn-default">제출</button>
						<button type="reset" class="btn btn-default">리셋</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">파일 첨부</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="form-group uploadDiv">
						<input type="file" name="uploadFile" multiple>
					</div>
					
					<div class="uploadResult">
						<ul>
						
						</ul>
					</div>
				</div>
				<!-- end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<script src="/resources/product/js/bootstrap-select.js" ></script>
	
	
	<script>
	
	/* $('.selectpicker').selectpicker(); */
	
		// 카테고리 등록
		// 컨트롤러에서 데이터 받기
		var jsonData = JSON.parse('${category}');
		console.log(jsonData);
		
		var cate1Arr = new Array();
		var cate1Obj = new Object();
		
		// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
		for(var i = 0; i < jsonData.length; i++) {
		 
		 if(jsonData[i].level == "1") {
		  cate1Obj = new Object();  //초기화
		  cate1Obj.PCateCode = jsonData[i].PCateCode;
		  cate1Obj.PCateName = jsonData[i].PCateName;
		  cate1Arr.push(cate1Obj);
		 }
		}
		
		// 1차 분류 셀렉트 박스에 데이터 삽입
		var cate1Select = $("select.category1")
		
		for(var i = 0; i < cate1Arr.length; i++) {
		 cate1Select.append("<option value='" + cate1Arr[i].PCateCode + "'>"
		      + cate1Arr[i].PCateName + "</option>"); 
		}
		
		$(document).on("change", "select.category1", function(){

			 var cate2Arr = new Array();
			 var cate2Obj = new Object();
			 
			 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
			 for(var i = 0; i < jsonData.length; i++) {
			  
			  if(jsonData[i].level == "2") {
			   cate2Obj = new Object();  //초기화
			   cate2Obj.PCateCode = jsonData[i].PCateCode;
			   cate2Obj.PCateName = jsonData[i].PCateName;
			   cate2Obj.parentCode = jsonData[i].parentCode;
			   
			   cate2Arr.push(cate2Obj);
			  }
			 }
			 
			 var cate2Select = $("select.category2");

			 /* for(var i = 0; i < cate2Arr.length; i++) {
			   cate2Select.append("<option value='" + cate2Arr[i].PCateCode + "'>"
			        + cate2Arr[i].PCateName + "</option>");
			 }  */
			 
			 cate2Select.children().remove();
			 
			 $("option:selected", this).each(function(){
				  
				  var selectVal = $(this).val();  
				  cate2Select.append("<option value='"+ selectVal + "'>전체</option>");
				  
				  for(var i = 0; i < cate2Arr.length; i++) {
				   if(selectVal == cate2Arr[i].parentCode) {
				    cate2Select.append("<option value='" + cate2Arr[i].PCateCode + "'>"
				         + cate2Arr[i].PCateName + "</option>");
				   }
				  }
				  
				 });
				 
			});

	</script>
	
	<script>
	//이미지 등록
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	
	var maxSize = 5242880;
	
		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		//파일 이름, 썸네일 출력
		var uploadUL = $(".uploadResult ul");
		
		function showUploadResult(uploadResultArr){
			
			if(!uploadResultArr || uploadResultArr.legth == 0){
				return;
			}
			
			var str = "";
			
			$(uploadResultArr).each(
					function(i, obj){
				
				
				if(!obj.fileType){
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" +obj.
							uuid + "_" + obj.fileName);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					str += "<li data-path='"+obj.uploadPath+"'";
					str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"' ><div>";
					str += "<span>" + obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' " 
					str += "data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/resources/img/attach.png'>";
					str += "</div>";
					str + "</li>";
					
				}else{
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.
							uuid + "_" + obj.fileName);
					str += "<li data-path='"+obj.uploadPath+"'";
					str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"' ><div>";
					str += "<span>" + obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' "
					str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str + "</li>";
				}
				
			});
			
			uploadUL.append(str);
		}
	
	
		$(document).ready(function(e){
			
			var formObj = $("form[role='form']");
			
			//기본동작 막기
			$("button[type='submit']").on("click", function(e){
				
				e.preventDefault;
				
				console.log("submit clicked");
				
				var str = "";
				
				$(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					
					console.dir(jobj);
					
					str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
				});
					formObj.append(str).submit();
			});
			
			//업로드 처리
			
				$("input[type='file']").change(function(e){
					var formData = new FormData();
					
					var inputFile = $("input[name='uploadFile']");
					
					var files = inputFile[0].files;
					
					console.log(files);
					
					for (var i = 0; i<files.length; i++){
						
						if(!checkExtension(files[i].name, files[i].size)){
							return false;
						}
						
						formData.append("uploadFile", files[i]);
					} //end for
					
					$.ajax({
						url: '/uploadAjaxAction',
						processData: false,
						contentType: false,
						data: formData,
						type: 'POST',
						dataType:'json',
							success: function(result){
								console.log(result);
								showUploadResult(result); // 업로드 결과 처리 함수
							}
						
					});//$.ajax
					
					
				});
				
				$(".uploadResult").on("click", "button", function(e){
					console.log("delete file");
					var targetFile = $(this).data("file");
					var type = $(this).data("type");
					
					var targetLi = $(this).closest("li");
					
					$.ajax({
						url: '/deleteFile',
						data: {fileName: targetFile, type:type},
						dataType:'text',
						type: 'POST',
							success: function(result){
								alert(result);
								targetLi.remove();
							}
					}); //$.ajax
					
				});
				
			
			
		}); //function end
	
	</script>
	
<%@include file="includesProduct/footer.jsp" %>