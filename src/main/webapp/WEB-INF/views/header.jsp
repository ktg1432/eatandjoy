<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
	<html>
	<head>
	
	<title>eat & joy main page</title>
		
		<!-- css -->
		<link rel="stylesheet" type="text/css"
			href="${path}/resources/css/snb.css">
		
		<link type="text/css" rel="stylesheet"
			href="${path}/resources/css/layer.css">
		
		<link type="text/css" rel="stylesheet"
			href="${path}/resources/css/header.css">
		
		<link type="text/css" rel="stylesheet"
			href="${path}/resources/css/chosen.css">
		
		<link type="text/css" rel="stylesheet"
			href="${path}/resources/css/layout.css">
		
		<link type="text/css" rel="stylesheet"
			href="${path}/resources/css/reset.css">
		
		<link type="text/css" rel="stylesheet"
			href="${path}/resources/css/common.css">
			
		<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/productAll/css/styles.css" rel="stylesheet" />
         <!-- Page CSS -->
        <link href="/resources/productAll/css/styles2.css" rel="stylesheet" />
		
		<link href="/resources/css/main.css" rel="stylesheet" />
		
		<link href="/resources/css/footer.css" rel="stylesheet" />
		
		<link href="resources/css/slide.css" rel="stylesheet" />
		
		<link rel="stylesheet"
			href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
		<!-- Font Awesome CDN -->
		<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

		<!-- jquery library  -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        
        <script src="/resources/main/js/scripts.js"/></script>
		
	</head>
	
	<body class="body-main">

	<div class="top_area"></div>
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
							<li><a href="/member/login">로그인</a><span class="txt_bar"></span></li>
							<li><a href="member/join">회원가입</a><span class="txt_bar"></span></li>
						</c:if>
						<!-- 로그아웃 -->
						<c:if test="${not empty pageContext.request.userPrincipal.name}">
							<li><a href="/logoutProc">로그아웃</a><span class="txt_bar"></span></li>
						</c:if>
						<li>
						<li><a href="member/mypage/mypage_main?id=${pageContext.request.userPrincipal.name}">MYPAGE</a><span
							class="txt_bar"></span></li>
					</ul>
				</div>
				<!-- //header_top_cont -->
			</div>
			
								
		</div>
	</div>
	
	<!-- Main Logo -->
	<div class = "mainLogoBox">
		<a href="/"><img class = "mainLogo" src="/resources/img/eatnjoyLogo2.png" alt="main logo"></a>
	</div>
	
	<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light sticky-top" style="background-color: #fff;">
            <div class="container px-4 px-xs-5">
                <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li class="nav-item mainSelect"><a class="nav-link" href="/product_list/all">전체상품</a></li>
                        <li class="nav-item mainSelect"><a class="nav-link" href="/product_list/best">베스트</a></li>
                        <li class="nav-item mainSelect"><a class="nav-link" href="/product_list/new">신상품</a></li>
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
