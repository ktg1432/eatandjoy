<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%@include file="includesProduct/header.jsp" %>
    
    <body>

        <!-- Product List starts-->
        <section class="py-5">

            <div class="container mt-5">
            	
            	<!-- SearchForm starts -->
		       <div class="pull-right border-top w-100">
		  
		       	 	<form id='searchForm' action="/product_list/all" method='get' >
		       	 	
		       	 	<div class="d-flex justify-content-between border-bottom mt-2 mb-4">
		       	 	
			       	 	<ul class="list-inline pt-1 mb-2 sort-list">
			       	 		<li class="list-inline-item"><a href="">인기순</a></li>
			       	 		<li class="list-inline-item"><a href="/product_list/all">신상품순</a></li>
			       	 		<li class="list-inline-item"><a href="/product_list/price_asc">낮은가격순</a></li>
			       	 		<li class="list-inline-item"><a href="/product_list/price_desc">높은가격순</a></li>
			       	 	</ul>
			       	 	
			       	 	<div>
			       	 		<select name='type' class="ml-3 mr-2 pt-1 pb-1">
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
			       	 		
			       	 		<input type='text' name='keyword' class = "mr-1 pt-1" 
			       	 		value='<c:out value="${pageMaker.cri.keyword}" />' />
			       	 		
			       	 		<input type='hidden' name='pageNum' 
			       	 		value='<c:out value="${pageMaker.cri.pageNum}" />' />
			       	 		
			       	 		<input type='hidden' name='amount' 
			       	 		value='<c:out value="${pageMaker.cri.amount}" />' />
			       	 		<button class='btn btn-default mb-2 pt-2 pb-2' >검색</button>
		       	 		</div>
		       	 		
			       	  </div>		
		       	 	</form>
		      </div>
	       
       <!-- SearchForm ends -->
            
            <script type="text/javascript">
            	function showImage(uploadPath, uuid, fileName, num){
            		$(document).ready(function(){
                 	   
               			console.log("----------- 이미지 call-----------" );
               			//이미지 불러오기 
         				console.log("folder : " + uploadPath);
           				console.log("originalPath : " + uploadPath + uuid + fileName);
           				var fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
           				console.log("encodedPath : " + fileCallPath);
           				var fileCallFirstPath = fileCallPath.split("s_")[0].replaceAll("%", "%5C");
           				console.log("first : " + fileCallFirstPath.substring(0, fileCallFirstPath.length-5));
           				var realfileCallPath = fileCallFirstPath.substring(0, fileCallFirstPath.length-5) + "%2Fs_" +fileCallPath.split("s_")[1];
           				
           				console.log("realfileCallPath : " + realfileCallPath);
           				console.log("-----------------------------");
           				
      					$(".thumbImg img[id = product_image_"+ num +"]").attr("src", "/display?fileName="+realfileCallPath);
               				
                       }); 
            	}
            </script>
            
                <!-- <div class="row gx-4 gx-lg-5 row-cols-xl-4 justify-content-center"> -->
                <div class="row justify-content-center pt-3 " style="width : 1200px;">
                
                   <c:forEach items="${list}" var="product" varStatus="st">
                 
                   
           			<script type="text/javascript">
           				showImage("${product.uploadPath}", "${product.uuid}", "${product.fileName}", "${st.index}");
           			</script>
           
                   
                    <div class = "p-box" style="width : 230px; padding : 0; margin: 20px 20px;">
                        <div class="h-100" style="border : 1px solid #E6E6E6">
                            <!-- Product image-->
                            <a class="view thumbImg"  href='<c:out value="${product.PId}"/>'>
	                           <img src = "" id = "product_image_${st.index}" class = "ml-2 mr-2" style="width : 230px; height : 230px" />
							</a>
							
                            <!-- Product details-->
                            <div class="pt-3 pl-0 pr-0 pb-3">
                                <div class="text-center">
                                	<a class="view"  href='<c:out value="${product.PId}"/>'>
                                    <!-- Product name-->
                                    <span class="name"><c:out value="${product.PName}" /></span><br>
                                    <!-- Product price-->
                                    <span class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.PPrice}" />원</span>
                                    </a>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="pt-0 pl-0 pr-0 pb-3 border-top-0 bg-transparent">
                                <div class="text-center">
                                <a class="btn btn-outline-dark mt-auto" href="#">카트에 넣기</a>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                   <%-- 
                    <c:set var = "uploadPath" value = "${product.uploadPath}" />
                    <c:set var = "uuid" value = "${product.uuid}" />
                    <c:set var = "fileName" value = "${product.fileName}" /> --%>
                    </c:forEach>
                       
                </div>
            </div>
        </section>
        
        <!-- Product List ends-->
        
        <!-- Pagination starts -->
        
            <div class="paging-outer">
            	
	         		<ul class="paging">
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
           
       <!-- Pagination ends -->
       
       <form id='actionForm' action="/product_list/all" method="get">
           <input type='hidden' name='pageNum' value= '${pageMaker.cri.pageNum}'>
           <input type='hidden' name='amount' value= '${pageMaker.cri.amount}'>
           <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}" />' >
           <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}" />' >
           
     	</form>
	
		<script type="text/javascript">
		
		
		
		$(document).ready(function (){
			
			//조회 이벤트 처리
			var actionForm = $("#actionForm");
			$(".view").on("click", function(e){
				
				e.preventDefault();
			actionForm.append("<input type='hidden' name='pId' value='"+ 
					$(this).attr("href")+"'>");
			actionForm.attr("action", "/product_list/view");
				actionForm.submit();
			});	
				
					
			//페이지 버튼 인자 전송 처리
			$(".paginate_button a").on("click", function(e){
				e.preventDefault();
				console.log('click');
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
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
        
    
    