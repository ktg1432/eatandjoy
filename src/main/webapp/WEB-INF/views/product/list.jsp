<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="includesProduct/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <a href="/product/list?pageNum=1"><h1 class="page-header">상품관리</h1></a>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            product List Page
                           <button id="regBtn" type="button" class="btn btn-xs pull-right">상품 등록</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                             <table  class="table table-striped table-bordered table-hover" >
                                <thead>
                                    <tr>
                                        <th>#상품ID</th>
                                        <th>상품명</th>
                                        <th>상품가격</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${list}" var="product">
                                <tr>
                                	<td><c:out value="${product.PId}" /></td>
                                	
                                	<td><a class='move' href='<c:out value="${product.PId}"/>'>
                                	<c:out value="${product.PName}" /></a></td>
                                	
                                	<td><span class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.PPrice}" />원</span></td>
                                	<td><fmt:formatDate value="${product.PRegDate}" pattern="yyyy년 MM월 dd일"/></td>
                                	<td><fmt:formatDate value="${product.PUpdateDate}" pattern="yyyy년 MM월 dd일 " /></td>
                                </tr>
                                </c:forEach>
                               </table>
                               
                               <!-- start searchForm -->
                               <div class="row">
                               	<div class="col-lg-12">
                               		
                               	 	<form id='searchForm' action="/product/list" method='get'>
                               	 		<select name='type'>
                               	 			<option value=""
                               	 			<c:out value="${pageMaker.cri.type == null? 'selected' :''}"/> >
                               	 			=== 선택 ===</option>
                               	 			
                          	 				<option value="T"
                          	 				<c:out value="${pageMaker.cri.type eq 'T'? 'selected':''}"/> >
                          	 				상품명만</option>
                          	 				
                          	 				<option value="C"
                          	 				<c:out value="${pageMaker.cri.type eq 'C'? 'selected':''}"/> >
                          	 				내용만</option>
                          	 				
                          	 				
                          	 				<option value="TC"
                          	 				<c:out value="${pageMaker.cri.type eq 'TC'? 'selected':''}"/> >
                          	 				상품명+내용</option>
                               	 				
                               	 		</select>
                               	 		
                               	 		<input type='text' name='keyword'
                               	 		value='<c:out value="${pageMaker.cri.keyword}" />' />
                               	 		
                               	 		<input type='hidden' name='pageNum' 
                               	 		value='<c:out value="${pageMaker.cri.pageNum}" />' />
                               	 		
                               	 		<input type='hidden' name='amount' 
                               	 		value='<c:out value="${pageMaker.cri.amount}" />' />
                               	 		<button class='btn btn-default'>검색</button>
                               	 	</form>
                               	</div>
                               </div>
                               
                               <!-- end searchForm -->
                               
                               <!-- start pagination -->
                               <div	class="pull-right">
                               		<ul class="pagination">
                               			<c:if test="${pageMaker.prev}">
                               				<li class="paginate_button previous">
                               				<a href="${pageMaker.startPage -1}" >이전</a>
                               				</li>
                               			</c:if>
                               			
                               			<c:forEach var="num" 
                               			begin="${pageMaker.startPage}" 
                               			end="${pageMaker.endPage}">
                               			<li class="paginate_button">
                               			<a href="${num}" >${num}</a>
                               			</li>
                               			</c:forEach>
                               			
                               			<c:if test="${pageMaker.next}">
                               				<li class="paginate_button next">
                               				<a href="${pageMaker.endPage +1}" >다음</a>
                               				</li>
                               			</c:if>
                               		
                               		</ul>
                               
                               </div>
                               
                               <!-- end pagination -->
                               
                              <form id='actionForm' action="/product/list" method="get">
	                              <input type='hidden' name='pageNum' value= '${pageMaker.cri.pageNum}'>
	                              <input type='hidden' name='amount' value= '${pageMaker.cri.amount}'>
	                              <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}" />' >
	                              <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}" />' >
                              </form>
                               
               <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                        </div>
                        <div class="modal-body">
                            	처리가 완료됐습니다.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">완료</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
                              </div>
                              	<!-- end panel body --> 
                              </div> 
                              <!-- end panel -->
                              </div> 
                             </div> 
                                
            <!-- /.row -->
            
            
            <script type="text/javascript">
				$(document).ready(function(){
					//모달박스
					var result = '<c:out value="${result}"/>';
					checkModal(result);
					
					history.replaceState({}, null,null);
					
					function checkModal(result){
						if(result === '' || history.state ){
							return;
						}
						if(parseInt(result) > 0){
							$(".modal-body").html("상품" + parseInt(result) +
									"번이 등록됐습니다.");
						}
						$("#myModal").modal("show");
					}
					
					//상품 등록
					$("#regBtn").on("click", function(){
						self.location ="/product/register";
					});
					
					var actionForm = $("#actionForm");
					
					//페이지 버튼 인자 전송 처리
					$(".paginate_button a").on("click", function(e){
						e.preventDefault();
						console.log('click');
						actionForm.find("input[name='pageNum']").val($(this).attr("href"));
						actionForm.submit();
					});
					
					// 제목 조회 이벤트 처리
					$(".move").on("click", function(e){
						
						e.preventDefault();
					actionForm.append("<input type='hidden' name='pId' value='"+ 
							$(this).attr("href")+"'>");
					actionForm.attr("action", "/product/get");
						actionForm.submit();
					});
					
					//검색 버튼 이벤트 처리
					var searchForm = $("#searchForm");
					$("#searchForm button").on("click", function(e){
						
						if(!searchForm.find("option:selected").val()){
							alert("검색종류를 선택하세요");
							return false;
						}
						
						if(!searchForm.find("input[name='keyword']").val()){
							alert("키워드를 입력하세요");
							return false;
						}
						
						searchForm.find("input[name='pageNum']").val("1");
						
						e.preventDefault();
						
						searchForm.submit();
						
					});
			
				});
			</script>
			
   <%@include file="includesProduct/footer.jsp" %>
