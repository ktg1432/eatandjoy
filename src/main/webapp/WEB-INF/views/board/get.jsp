<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="includesBoard/header.jsp" %>
	
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Read Page</h1>
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
				
					
						<div class="form-group">
							<label>num</label> <input class="form-control" name="nId"
							value='<c:out value="${board.NId}" />' readonly="readonly" >
						</div>
						
						<div class="form-group">
							<label>Title</label> <input class="form-control" name="NTitle"
							value='<c:out value="${board.NTitle}" />' readonly="readonly" >
						</div>
						
						<div class="form-group">
							<label>Content</label> <input class="form-control" name="NContent"
							value='<c:out value="${board.NContent}" />' readonly="readonly" >
						</div>
						
						<div class="form-group">
							<label>Writer</label> <input class="form-control" name="NWriter"
							value='<c:out value="${board.NWriter}" />' readonly="readonly" >
						</div>
						
						<button data-oper='modify' 
						class="btn btn-default">수정</button>
						
						<button data-oper='list' 
						class="btn btn-info">돌아가기</button>
						
						<form id="operForm" action="/board/modify" method="get">
							<input type='hidden' id='nId' name='nId' value='<c:out value="${board.NId}"/>'>
							<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
							<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
							<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
							<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
						</form>
					
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
				$(document).ready(function(){
					var operForm = $("#operForm");
					$("button[data-oper='modify']").on("click", function(e){
						operForm.attr("action","/board/modify").submit();
					});
					
					$("button[data-oper='list']").on("click", function(e){
						operForm.find("#nId").remove();
						operForm.attr("action","/board/list")
						operForm.submit();
					});
			
				});
			</script>
	
<%@include file="includesBoard/footer.jsp" %>