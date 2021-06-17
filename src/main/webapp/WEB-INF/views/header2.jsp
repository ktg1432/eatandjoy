<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="header_warp">
		<script>
			$(document).ready(function() {
				$(".header_slideBanner").css("display", "inline-block");
			});
		</script>
		<div id="header">
			<div class="header_top">
				<!-- 멀티상점 선택 -->

				<!-- 멀티상점 선택 -->

				<div class="header_top_cont">
					<div style="float: left;"></div>

					<ul class="top_member_box" style="float: right;">
					 	<!-- 로그인 -->
						<c:if test="${empty pageContext.request.userPrincipal.name}">
							<li><a href="/member/login">LOGIN</a><span class="txt_bar"></span></li>
						</c:if>
						<!-- 로그아웃 -->
						<c:if test="${not empty pageContext.request.userPrincipal.name}">
							<li><a href="/logoutProc">LOGOUT</a><span class="txt_bar"></span></li>
						</c:if>
						<li><a href="member/join">JOIN</a><span class="txt_bar"></span></li>
						<li>
							<div class="top_mypage_cont">
								<span class="top_mypage_tit"><a
									href="member/mypage/mypage_main">MYPAGE</a></span>
							</div> <span class="txt_bar"></span>
						</li>
						<li><a href="member/cart">CART 0</a></li>
					</ul>
				</div>
				<!-- //header_top_cont -->
			</div>
			<!-- //header_top -->


			<div class="header_search">
				<div class="header_search_cont">

					<div class="h1_logo">
						<a href="/"><img
							src="${path}/resources/images/logo7.png" alt="상단 로고"
							title="상단 로고" /></a>
					</div>

					<div class="header_gnb">
						<div class="sub_menu_box_all">
							<div class="sub_menu_box_all_btn">
								<a href=""><i class="xi-bars"></i> 전체카테고리</a>
							</div>
							<!-- 사이드 카테고리 출력 시작 -->
							<div class="sub_menu_box side_type">
								<!-- N : 레이어 타입 : layer_type 추가, 트리형 타입 tree_type 추가 -->
								<ul class="sub_depth0 sub_menu0">
									<li><a href="goods/goods_list">전체상품</a></li>

									<li><a href="goods/goods_list?id=mealkit">밀키트</a></li>

									<li><a href="goods/goods_list?id=frozen_mealkit">냉동밀키트</a></li>

									<li><a href="../goods/goods_list.php?cateCd=014">신선·간편식</a></li>

									<li><a href="../goods/goods_list.php?cateCd=021">교육체험용키트</a></li>

									<li><a href="../goods/goods_list.php?cateCd=009">기획전/특가</a></li>
								</ul>
							</div>
							<!-- //sub_menu_box -->
							<!-- 사이드 카테고리 출력 끝 -->
						</div>
						<div class="gnb">
							<div class="gnb_menu_box">
								<ul class="depth0 gnb_menu0">
									<li><a href="../goods/goods_list.php?cateCd=009004">신상품</a></li>
									<li><a href="../goods/goods_list.php?cateCd=020">베스트</a></li>
									<li><a href="../goods/goods_list.php?cateCd=009001">오늘의
											특가</a></li>
									<li><a href="../service/event.php">이벤트</a></li>
								</ul>
							</div>
						</div>
						<!-- //gnb -->
					</div>
					<!-- //header_gnb -->
				</div>
				<!-- //header_search_cont -->
			</div>
			<!-- //header_search -->

		</div>
		<!-- //header -->
	</div>
</body>
</html>