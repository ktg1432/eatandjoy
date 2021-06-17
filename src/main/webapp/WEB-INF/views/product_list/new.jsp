<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<jsp:include page="/WEB-INF/views/header.jsp" />
		
        <!-- Product List starts-->
        <section class="py-2">

            <div class="container mt-5">
            	<div class = "showItems">
       	 			<span>신상품</span>
       	 		</div>
            	<!-- SearchForm starts -->
		       <div class="border-top" style="width : 1200px;">
		  
		       	 	<form id='searchForm' action="/product_list/new" method='get' >
		       	 	
		       	 	<div class="d-flex justify-content-between border-bottom mt-2 mb-4">
		       	 	
		       	 		<div class="orderCate">
				       	 	<ul class="list-inline sort-list pt-1 mb-2" style = "margin : 0;">
				       	 		<li class="list-inline-item" style = "padding : 0 20px 0 0"><a href = "/product_list/new?cate=101">한식</a></li>
				       	 		<li class="list-inline-item" style = "padding : 0 20px 0 0"><a href = "/product_list/new?cate=201">양식</a></li>
				       	 		<li class="list-inline-item" style = "padding : 0 20px 0 0"><a href = "/product_list/new?cate=301">아시안</a></li>
				       	 		<li class="list-inline-item" style = "padding : 0 20px 0 0"><a href = "/product_list/new?cate=401">샐러드</a></li>
				       	 	</ul>
			       	 	</div>
		       	 		
		       	 		<div class = "mb-2">
		       	 			<select class="pickOrder">
		       	 				<option>인기순</option>
		       	 				<option>최신순</option>
		       	 				<option>높은가격순</option>
		       	 				<option>낮은가격순</option>
		       	 			</select>
		       	 		</div>
		       	 		
			       	  </div>		
		       	 	</form>
		      </div>
	       
       <!-- SearchForm ends -->
       
            <!-- 이미지 호출  -->
            <script type="text/javascript">
            	function showImage(uploadPath, uuid, fileName, num){
            		$(document).ready(function(){
                 	   
               			console.log("----------- 이미지 call-----------" );
               			
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
                <div id="productList" class="row justify-content-center pt-3" style="width : 1200px;">
                
                   <c:forEach items="${list}" var="product" varStatus="st">
                 
                   
           			<script type="text/javascript">
           				showImage("${product.uploadPath}", "${product.uuid}", "${product.fileName}", "${st.index}");
           			</script>
           
                   
                    <div class = "p-box" data-pid = "${product.PId}" data-price = "${product.PPrice}" data-hit = "${product.hit}" 
                    	style="width : 230px; padding : 0; margin: 20px 20px;">
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
       
       <form id='actionForm' action="/product_list/new" method="get">
           <input type='hidden' name='pageNum' value= '${pageMaker.cri.pageNum}'>
           <input type='hidden' name='amount' value= '${pageMaker.cri.amount}'>
           <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}" />' >
           <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}" />' >
           
     	</form>
     	
     	</body>
	
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
        
    
    