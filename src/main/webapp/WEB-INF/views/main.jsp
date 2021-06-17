<!-- 프로젝트 실행시 메인 jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />


	<jsp:include page="/WEB-INF/views/header.jsp" />

	<!-- Product List starts-->
        <section class="py-5">

            <div class="container mt-5">
            	
            <!-- 이미지 호출  -->
            <script type="text/javascript">
            	function showImage(id_prefix, uploadPath, uuid, fileName, num){
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
           				
      					$(".thumbImg img[id = "+ id_prefix+ num +"]").attr("src", "/display?fileName="+realfileCallPath);
               				
                       }); 
            	}
            </script>
            
            	<div class = "productArray mt3">
                
                	<h3>
                		<span>가장 많이 팔린 상품</span>
                	</h3>
                
                </div>
            
                <div id="productList" class="row justify-content-center pt-3" style="width : 1200px;">
                
                   <c:forEach items="${listBest}" var="product" varStatus="st">
                 
                   
           			<script type="text/javascript">
           				showImage("best_product_image_", "${product.uploadPath}", "${product.uuid}", "${product.fileName}", "${st.index}");
           			</script>
           
                   
                    <div class = "p-box" data-pid = "${product.PId}" data-price = "${product.PPrice}" data-hit = "${product.hit}" 
                    	style="width : 230px; padding : 0; margin: 20px 20px;">
                        <div class="h-100" style="border : 1px solid #E6E6E6">
                            <!-- Product image-->
                            <a class="view thumbImg"  href='<c:out value="${product.PId}"/>'>
	                           <img src = "" id = "best_product_image_${st.index}" class = "ml-2 mr-2" style="width : 230px; height : 230px" />
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
                
                <div class = "productArray2 mt3">
                
                	<h3>
                		<span>최신 상품</span>
                	</h3>
                
                </div>
                
                <div id="productList" class="row justify-content-center pt-3" style="width : 1200px;">
                
                   <c:forEach items="${listNew}" var="product" varStatus="st">
                 
                   
           			<script type="text/javascript">
           				showImage("new_product_image_", "${product.uploadPath}", "${product.uuid}", "${product.fileName}", "${st.index}");
           			</script>
           
                   
                    <div class = "p-box" data-pid = "${product.PId}" data-price = "${product.PPrice}" data-hit = "${product.hit}" 
                    	style="width : 230px; padding : 0; margin: 20px 20px;">
                        <div class="h-100" style="border : 1px solid #E6E6E6">
                            <!-- Product image-->
                            <a class="view thumbImg"  href='<c:out value="${product.PId}"/>'>
	                           <img src = "" id = "new_product_image_${st.index}" class = "ml-2 mr-2" style="width : 230px; height : 230px" />
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

	<!-- footer -->
        
     <div class="footer_wrap">
		<div class="footer">
			<div class="inner_footer">

				<div class="footer_third logo_container">
					<img src="/resources/img/eatnjoyLogo2.png" alt="EatNJoy logo" style = "width : 250px;">
				</div>

				<div class="footer_third footer-1">
					<a class="link" href="">회사소개</a> <a class="link" href="">이용약관</a> <a
						class="link" href="">개인정보처리방침</a> <a class="link" href="">고객센터</a>
				</div>

				<div class="footer_third footer-2">
					<h1>Follow Us</h1>
					<ul>
						<li><a href="https://www.instagram.com/"><i
								class="fab fa-instagram"></i></a></li>
						<li><a href="https://www.facebook.com/"><i
								class="fab fa-facebook-f"></i></a></li>
						<li><a href="https://www.youtube.com/"><i
								class="fab fa-youtube"></i></a></li>
					</ul>
					<span> 잇앤조이(주) | 대표이사 :<br> 주소 : 서울시 구로구 가산디지털단지<br>
						사업자 등록번호 :<br> 팩스 : | 이메일:
					</span>
				</div>
			</div>
		</div>
	</div> 
	
	<!-- 우측네비게이션 -->
	<jsp:include page="/WEB-INF/views/snb.jsp" />
</body>
</html>
