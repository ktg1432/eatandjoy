<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="includesBoard/header.jsp" %>
	
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Modify Page</h1>
		</div>	
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
			
			
				<div class="panel-heading">Board Read Page</div>
				<!-- /.panel-heading -->
				
				<div class="panel-body">
				<form role="form" action="/board/modify" method="post">
					<input type='hidden' name='nId' value='<c:out value="${board.NId}"/> '> 
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/> '>
					<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/> '>
					<input type='hidden' name='type' value='<c:out value="${cri.type}"/> '>
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/> '>
					
						<div class="form-group">
							<label>num</label> <input class="form-control" name="NId"
							value='<c:out value="${board.NId}" />' readonly="readonly" >
						</div>
						
						<div class="form-group">
							<label>Title</label> <input class="form-control" name="NTitle"
							value='<c:out value="${board.NTitle}" />' >
						</div>
						
						<div class="form-group">
							<label>Content</label> <input class="form-control" name="NContent"
							value='<c:out value="${board.NContent}" />' >
						</div>
						
						<div class="form-group">
							<label>Writer</label> <input class="form-control" name="NWriter"
							value='<c:out value="${board.NWriter}" />'  >
						</div>
						
						<div class="form-group">
							<!-- <label>RegDate</label>  -->
							<input type="hidden" class="form-control" name="NRegDate"
							value='<fmt:formatDate pattern ="yyyy/MM/dd" 
							value="${board.NRegDate}" />' readonly="readonly"   >
						</div>
						
						<div class="form-group">
							<!-- <label>UpdateDate</label>  -->
							<input  type="hidden" class="form-control" name="NUpdateDate"
							value='<fmt:formatDate pattern ="yyyy/MM/dd" 
							value="${board.NUpdateDate}" />' readonly="readonly"   >
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
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form");
			
			$('button').on("click", function(e){
				e.preventDefault();
				var operation = $(this).data("oper");
				console.log(operation);
				
				if(operation === 'remove'){
					formObj.attr("action", "/board/remove");
				}else if(operation === 'list'){
					//move to list
					formObj.attr("action", "/board/list").attr("method","get");
					var nIdTag = $("input[name='nId']").clone();
					var pageNumTag = $("input[name='pageNum']").clone();
					var amountTag = $("input[name='amount']").clone();
					var keywordTag = $("input[name='keyword']").clone();
					var typeTag = $("input[name='type']").clone();
					
					formObj.empty();
					formObj.append(nIdTag);
					formObj.append(pageNumTag);
					formObj.append(amountTag);
					formObj.append(keywordTag);
					formObj.append(typeTag);
				}
				
				formObj.submit();
				
			});
		});
	</script>
	
<%@include file="includesBoard/footer.jsp" %>