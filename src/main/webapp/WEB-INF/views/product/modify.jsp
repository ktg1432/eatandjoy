<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="includesProduct/header.jsp" %>
	
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Product Modify Page</h1>
		</div>	
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
			
			
				<div class="panel-heading">Product Modify Page</div>
				<!-- /.panel-heading -->
				
				<div class="panel-body">
				<form role="form" action="/product/modify" method="post">
					<input type='hidden' name='nId' value='<c:out value="${product.PId}"/> '> 
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/> '>
					<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/> '>
					<input type='hidden' name='type' value='<c:out value="${cri.type}"/> '>
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/> '>
					
					
					
						<div class="form-group">
							<label>상품ID</label> <input class="form-control" name="pId"
							value='<c:out value="${product.PId}" />' readonly="readonly" >
						</div>
						
						<div class="form-group">
							<label>상품명</label> <input class="form-control" name="pName"
							value='<c:out value="${product.PName}" />' >
						</div>
						
						<div class="form-group">
							<label>상품내용</label> <input class="form-control" name="pDesc"
							value='<c:out value="${product.PDesc}" />' >
						</div>
						
						<div class="form-group">
							<label>상품가격</label> <input class="form-control" name="pPrice"
							value='<c:out value="${product.PPrice}" />'  >
						</div>
						
						<div class="form-group">
							<!-- <label>RegDate</label>  -->
							<input type="hidden" class="form-control" name="pRegDate"
							value='<fmt:formatDate pattern ="yyyy/MM/dd" 
							value="${product.PRegDate}" />' readonly="readonly"   >
						</div>
						
						<div class="form-group">
							<!-- <label>UpdateDate</label>  -->
							<input  type="hidden" class="form-control" name="pUpdateDate"
							value='<fmt:formatDate pattern ="yyyy/MM/dd" 
							value="${product.PUpdateDate}" />' readonly="readonly"   >
						</div>
						
						
						
						
						<button type="submit" data-oper='modify' 
						class="btn btn-default">
						수정</button>
						<button type="submit" data-oper='remove' 
						class="btn btn-danger">
						삭제</button>
						<button type="submit" data-oper='list' 
						class="btn btn-info">
						목록으로</button>
						
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
					<div>
						<input type="file" name="uploadFile" multiple="multiple">
					</div>
					
					<div class="uploadResult">
						<ul>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>	
	
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
	
	<script type="text/javascript">
	
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
	
		$(document).ready(function(){
			
			// 첨부파일 불러오기
			(function(){
				var pId = '<c:out value="${product.PId}" />';
				
				$.getJSON("/product/getAttachList", {pId:pId}, function(arr){
					
					console.log(arr);
					
					var str ="";
					
					$(arr).each(function(i, attach){
						
						if(!attach.fileType){
							var fileCallPath = encodeURIComponent(attach.uploadPath + "/" +attach.
									uuid + "_" + attach.fileName);
							var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
							str += "<li data-path='"+attach.uploadPath+"'";
							str += " data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
							str += "<span>" + attach.fileName+"</span>";
							str += "<button type='button' data-file=\'"+fileCallPath+"\' " 
							str += "data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str += "<img src='/resources/img/attach.png'>";
							str += "</div>";
							str + "</li>";
							
						}else{
							var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.
									uuid + "_" + attach.fileName);
							str += "<li data-path='"+attach.uploadPath+"'";
							str += " data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
							str += "<span>" + attach.fileName+"</span>";
							str += "<button type='button' data-file=\'"+fileCallPath+"\' "
							str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str += "<img src='/display?fileName="+fileCallPath+"'>";
							str += "</div>";
							str + "</li>";
						}
						
					});
					
					$(".uploadResult ul").html(str);
					
					}); //end getjson
					
				})();//end function
				
			//삭제 버튼 클릭 시 화면에서만 사라짐
			$(".uploadResult").on("click", "button", function(e){
				
				console.log("delete file");
				
				if(confirm("해당 파일을 삭제하겠습니까?")){
					var targetLi = $(this).closest("li");
					targetLi.remove();
				}
				
			})
			
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
			
			
			//수정, 삭제, 목록으로 버튼 클릭
			var formObj = $("form");
			
			$('button').on("click", function(e){
				e.preventDefault();
				
				var operation = $(this).data("oper");
				console.log(operation);
				
				if(operation === 'remove'){
					formObj.attr("action", "/product/remove");
				}else if(operation === 'list'){
					//move to list
					formObj.attr("action", "/product/list").attr("method","get");
					var pageNumTag = $("input[name='pageNum']").clone();
					var amountTag = $("input[name='amount']").clone();
					var keywordTag = $("input[name='keyword']").clone();
					var typeTag = $("input[name='type']").clone();
					
					formObj.empty();
					
					formObj.append(pageNumTag);
					formObj.append(amountTag);
					formObj.append(keywordTag);
					formObj.append(typeTag);
					
				}else if(operation === 'modify'){
					
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
				}
				
				formObj.submit();
				
			});
		});
	</script>
	
<%@include file="includesProduct/footer.jsp" %>