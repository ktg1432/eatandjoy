<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="includesProduct/header.jsp" %>

	<style>
		.uploadResult {
			width: 100%;
			background-color: #D0DEFA;
		}
		
		.uploadResult ul{
			display: flex;
			flex-flow: row;
			justify-content: center;
			align-items: center;
		}
		
		.uploadResult ul li{
			list-style: none;
			padding: 10px;
			align-content: center;
			text-align: center;
		}
		
		.uploadResult ul li img{
			width: 100px;
		}
		
		.uploadResult ul li span{
			color: white;
		}
		
		.bigPictureWrapper{
			position: absolute;
			display: none;
			justify-content: center;
			align-items: center;
			top:0%;
			width: 100%;
			height: 100%;
			background-color: grey;
			z-index: 100;
			background: rgba(255,255,255,0.5);
		}
		
		.bigPicture {
			position: relative;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		.bigPicture img{
			width: 600px;
		}
	</style>
	
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Product Read Page</h1>
		</div>	
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
			
				<div class="panel-heading">Product Read Page</div>
				
				<!-- /.panel-heading -->
				<div class="panel-body">
				
					
						<div class="form-group">
							<label>상품ID</label> <input class="form-control" name="pId"
							value='<c:out value="${product.PId}" />' readonly="readonly" >
						</div>
						
						<div class="form-group">
							<label>상품명</label> <input class="form-control" name="pName"
							value='<c:out value="${product.PName}" />' readonly="readonly" >
						</div>
						
						<div class="form-group">
							<label>상품내용</label> <input class="form-control" name="pDesc"
							value='<c:out value="${product.PDesc}" />' readonly="readonly" >
						</div>
						
						<div class="form-group">
							<label>상품가격</label> <input class="form-control" name="pPrice"
							value='<c:out value="${product.PPrice}" />' readonly="readonly" >
						</div>
						
						<button data-oper='modify' 
						class="btn btn-default">수정</button>
						
						<button data-oper='list' 
						class="btn btn-info">돌아가기</button>
						
						<form id="operForm" action="/product/modify" method="get">
							<input type='hidden' id='pId' name='pId' value='<c:out value="${product.PId}"/>'>
							<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
							<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
							<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
							<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
						</form>
					
				</div>
			</div>
		</div>
	</div>
	
	<div class='bigPictureWrapper'>
		<div class='bigPicture'>
		</div>
	</div>
	
	
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
			
				<div class="panel-heading">Files</div>
				
				<div class="panel-body">
				
					<div class="uploadResult">
						<ul>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>				
	<script type="text/javascript">
				$(document).ready(function(){
					
					(function(){
						var pId = '<c:out value="${product.PId}" />';
						
						$.getJSON("/product/getAttachList", {pId:pId}, function(arr){
							
							console.log("arr : " + arr);
							
							var str ="";
							
							$(arr).each(function(i, attach){
								
								if(!attach.fileType){

									str += "<li data-path='"+attach.uploadPath+"'";
									str += " data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
									str += "<span>" + attach.fileName+"</span>";
									str += "<img src='/resources/img/attach.png'>";
									str += "</div>";
									str + "</li>";
									
								}else{
									var originalPath = attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName;
									console.log("originalPath : " + originalPath);
									
									var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.
											uuid + "_" + attach.fileName);
									str += "<li data-path='"+attach.uploadPath+"'";
									str += " data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
									console.log("fileCallPath : " +fileCallPath);
									str += "<img src='/display?fileName="+fileCallPath+"'>";
									str += "</div>";
									str + "</li>";
								}
								
							});
							
							$(".uploadResult ul").html(str);
							
							}); //end getjson
							
						})();//end function
						
						
						$(".uploadResult").on("click", "li", function(e){
							
							console.log("view image");
							
							var liObj = $(this);
							
							var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+ "_" + liObj.data("filename"));
							console.log(path);
							if(liObj.data("type")){
								
								showImage(path.replace(new RegExp(/\\/g), "/"));
								
							} 
							
							
						});
						
						$(".bigPictureWrapper").on("click", function(e){
							$(".bigPicture").animate({width: '0%', height: '0%'}, 500);
							setTimeout(function(){
								$('.bigPictureWrapper').hide();
							}, 500);
						});
						
						function showImage(fileCallPath){
							
							alert("원본 이미지를 불러옵니다.");
							
							$(".bigPictureWrapper").css("display", "flex").show();
							
							$(".bigPicture")
							.html("<img src='/display?fileName="+fileCallPath+"'>").animate({width:'100%', height:'100%',}, 500);
							
						}
					
					
					var operForm = $("#operForm");
					$("button[data-oper='modify']").on("click", function(e){
						operForm.attr("action","/product/modify").submit();
					});
					
					$("button[data-oper='list']").on("click", function(e){
						operForm.find("#pId").remove();
						operForm.attr("action","/product/list")
						operForm.submit();
					});
			
				});
			</script>
	
<%@include file="includesProduct/footer.jsp" %>