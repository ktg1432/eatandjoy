<!-- 프로젝트 실행시 메인 jsp -->
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
	href="${path}/resources/css/footer.css">

<link type="text/css" rel="stylesheet"
	href="${path}/resources/css/layer.css">

<link type="text/css" rel="stylesheet"
	href="${path}/resources/css/header.css">

<link type="text/css" rel="stylesheet"
	href="${path}/resources/css/chosen.css">

<link type="text/css" rel="stylesheet"
	href="${path}/resources/css//goods/list.css">

<link type="text/css" rel="stylesheet"
	href="${path}/resources/css/layout.css">

<link type="text/css" rel="stylesheet"
	href="${path}/resources/css/reset.css">

<link type="text/css" rel="stylesheet"
	href="${path}/resources/css/common .css">

<link href="resources/css/main.css" rel="stylesheet" />

<link href="resources/css/slide.css" rel="stylesheet" />

<link rel="stylesheet"
	href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">

<script src="${path}/resources/js/main.js"></script>
<%-- <script src="${path}/resources/js/slide.js"></script> --%>

<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body class="body-main body-index pc">
	<div class="top_area"></div>

	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="main_visual">
		<div class="slideshow-container">

			<div class="mySlides fade">
				<div class="numbertext">1 / 3</div>
				<img src="resources/images/slidebanner1.jpg" style="width: 100%">
				<div class="text">Caption Text</div>
			</div>

			<div class="mySlides fade">
				<div class="numbertext">2 / 3</div>
				<img src="resources/images/slidebanner2.jpg" style="width: 100%">
				<div class="text">Caption Two</div>
			</div>

			<div class="mySlides fade">
				<div class="numbertext">3 / 3</div>
				<img src="resources/images/slidebanner3.jpg" style="width: 100%">
				<div class="text">Caption Three</div>
			</div>

			<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
				onclick="plusSlides(1)">&#10095;</a>

		</div>
		<br>

		<div style="text-align: center">
			<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
				onclick="currentSlide(2)"></span> <span class="dot"
				onclick="currentSlide(3)"></span>
		</div>
		<script>
			var slideIndex = 1;
			showSlides(slideIndex);

			function plusSlides(n) {
				showSlides(slideIndex += n);
			}

			function currentSlide(n) {
				showSlides(slideIndex = n);
			}

			function showSlides(n) {
				var i;
				var slides = document.getElementsByClassName("mySlides");
				var dots = document.getElementsByClassName("dot");
				if (n > slides.length) {
					slideIndex = 1
				}
				if (n < 1) {
					slideIndex = slides.length
				}
				for (i = 0; i < slides.length; i++) {
					slides[i].style.display = "none";
				}
				for (i = 0; i < dots.length; i++) {
					dots[i].className = dots[i].className
							.replace(" active", "");
				}
				slides[slideIndex - 1].style.display = "block";
				dots[slideIndex - 1].className += " active";
				setTimeout(showSlides, 2000);
			}
		</script>
	</div>


	<div class="main_content">

		<div class="main_goods_cont prdSlide">
			<div class="goods_list main_wrap_36">
				<div class="goods_list_tit">
					<h3>
						신상품<span>새롭게 입고된 신상품</span>
					</h3>

				</div>
				<div class="goods_list_cont goods_content_36">
					<div class="item_basket_type">
						<ul>
							<li style="width: 25%;">
								<div class="item_cont">
									<div class="item_photo_box"
										data-image-add1="/data/goods/21/03/10/1000001667/1000001667_add1_031.jpg"
										data-image-add2="/data/goods/21/03/10/1000001667/1000001667_add2_031.jpg"
										data-image-list="/data/goods/21/03/10/1000001667/1000001667_list_033.jpg"
										data-image-main="/data/goods/21/03/10/1000001667/1000001667_main_034.jpg"
										data-image-detail="/data/goods/21/03/10/1000001667/1000001667_detail_014.jpg"
										data-image-magnify="/data/goods/21/03/10/1000001667/1000001667_magnify_079.jpg">
										<a
											href="../goods/goods_view.php?goodsNo=1000001667&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
											<img
											src="/data/goods/21/03/10/1000001667/1000001667_main_034.jpg"
											width="280" alt="[마이셰프] 더블치즈인헬(2인)" title="[마이셰프] 더블치즈인헬(2인)"
											class="middle" />
										</a>
										<div class="item_link">
											<button type="button" class="btn_basket_get btn_add_wish_36"
												data-goods-no="1000001667" data-goods-nm="[마이셰프] 더블치즈인헬(2인)"
												data-goods-price="9900.00"
												data-goods-image-src="/data/goods/21/03/10/1000001667/1000001667_main_034.jpg"
												data-optionfl="n" data-min-order-cnt="1" data-option-sno=""
												data-goods-image="" data-sales-unit="" data-fixed-sales=""
												data-fixed-order-cnt="">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_get.png"
													alt=""><span>찜하기</span>
											</button>
											<button type="button" href="#optionViewLayer"
												class="btn_basket_cart btn_add_cart_36 btn_open_layer"
												data-mode="cartIn" data-goods-no="1000001667">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_cart.png"
													alt=""><span>장바구니</span>
											</button>
										</div>
										<!-- //item_link -->
									</div>
									<!-- //item_photo_box -->
									<div class="item_info_cont">
										<div class="item_tit_box">
											<a
												href="../goods/goods_view.php?goodsNo=1000001667&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
												<strong class="item_name">[마이셰프] 더블치즈인헬(2인)</strong>
											</a>
										</div>
										<!-- //item_tit_box -->
										<div class="item_money_box">
											<span class="item_price_rate">SAVE<br />23%
											</span> <strong class="item_price"> <span style="">9,900원
											</span>
											</strong> <span
												style="text-decoration: line-through; color: #CECECE; color: #CECECE; font-size: 12px; text-decoration: line-through;">12,900원
											</span>
										</div>
										<!-- //item_money_box -->
										<!-- //item_number_box -->
										<!-- //item_icon_box -->
									</div>
									<!-- //item_info_cont -->
								</div> <!-- //item_cont -->
							</li>
							<li style="width: 25%;">
								<div class="item_cont">
									<div class="item_photo_box"
										data-image-add1="/data/goods/21/03/10/1000001668/1000001668_add1_027.jpg"
										data-image-add2="/data/goods/21/03/10/1000001668/1000001668_add2_041.jpg"
										data-image-list="/data/goods/21/03/10/1000001668/1000001668_list_065.jpg"
										data-image-main="/data/goods/21/03/10/1000001668/1000001668_main_021.jpg"
										data-image-detail="/data/goods/21/03/10/1000001668/1000001668_detail_046.jpg"
										data-image-magnify="/data/goods/21/03/10/1000001668/1000001668_magnify_079.jpg">
										<a
											href="../goods/goods_view.php?goodsNo=1000001668&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
											<img
											src="/data/goods/21/03/10/1000001668/1000001668_main_021.jpg"
											width="280" alt="[마이셰프] 햄부자부대찌개(2인)"
											title="[마이셰프] 햄부자부대찌개(2인)" class="middle" />
										</a>
										<div class="item_link">
											<button type="button" class="btn_basket_get btn_add_wish_36"
												data-goods-no="1000001668"
												data-goods-nm="[마이셰프] 햄부자부대찌개(2인)"
												data-goods-price="9900.00"
												data-goods-image-src="/data/goods/21/03/10/1000001668/1000001668_main_021.jpg"
												data-optionfl="n" data-min-order-cnt="1" data-option-sno=""
												data-goods-image="" data-sales-unit="" data-fixed-sales=""
												data-fixed-order-cnt="">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_get.png"
													alt=""><span>찜하기</span>
											</button>
											<button type="button" href="#optionViewLayer"
												class="btn_basket_cart btn_add_cart_36 btn_open_layer"
												data-mode="cartIn" data-goods-no="1000001668">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_cart.png"
													alt=""><span>장바구니</span>
											</button>
										</div>
										<!-- //item_link -->
									</div>
									<!-- //item_photo_box -->
									<div class="item_info_cont">
										<div class="item_tit_box">
											<a
												href="../goods/goods_view.php?goodsNo=1000001668&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
												<strong class="item_name">[마이셰프] 햄부자부대찌개(2인)</strong>
											</a>
										</div>
										<!-- //item_tit_box -->
										<div class="item_money_box">
											<span class="item_price_rate">SAVE<br />41%
											</span> <strong class="item_price"> <span style="">9,900원
											</span>
											</strong> <span
												style="text-decoration: line-through; color: #CECECE; color: #CECECE; font-size: 12px; text-decoration: line-through;">16,900원
											</span>
										</div>
										<!-- //item_money_box -->
										<!-- //item_number_box -->
										<!-- //item_icon_box -->
									</div>
									<!-- //item_info_cont -->
								</div> <!-- //item_cont -->
							</li>
							<li style="width: 25%;">
								<div class="item_cont">
									<div class="item_photo_box"
										data-image-add1="/data/goods/21/04/15/1000001680/1000001680_add1_060.jpg"
										data-image-add2="/data/goods/21/04/15/1000001680/1000001680_add2_063.jpg"
										data-image-list="/data/goods/21/04/15/1000001680/1000001680_list_068.jpg"
										data-image-main="/data/goods/21/04/15/1000001680/1000001680_main_037.jpg"
										data-image-detail="/data/goods/21/04/15/1000001680/1000001680_detail_067.jpg"
										data-image-magnify="/data/goods/21/04/15/1000001680/1000001680_magnify_089.jpg">
										<a
											href="../goods/goods_view.php?goodsNo=1000001680&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
											<img
											src="/data/goods/21/04/15/1000001680/1000001680_main_037.jpg"
											width="280" alt="[마이셰프] 새우 듬뿍 쿵 팟 퐁커리(2인)"
											title="[마이셰프] 새우 듬뿍 쿵 팟 퐁커리(2인)" class="middle" />
										</a>
										<div class="item_link">
											<button type="button" class="btn_basket_get btn_add_wish_36"
												data-goods-no="1000001680"
												data-goods-nm="[마이셰프] 새우 듬뿍 쿵 팟 퐁커리(2인)"
												data-goods-price="14900.00"
												data-goods-image-src="/data/goods/21/04/15/1000001680/1000001680_main_037.jpg"
												data-optionfl="n" data-min-order-cnt="1" data-option-sno=""
												data-goods-image="" data-sales-unit="" data-fixed-sales=""
												data-fixed-order-cnt="">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_get.png"
													alt=""><span>찜하기</span>
											</button>
											<button type="button" href="#optionViewLayer"
												class="btn_basket_cart btn_add_cart_36 btn_open_layer"
												data-mode="cartIn" data-goods-no="1000001680">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_cart.png"
													alt=""><span>장바구니</span>
											</button>
										</div>
										<!-- //item_link -->
									</div>
									<!-- //item_photo_box -->
									<div class="item_info_cont">
										<div class="item_tit_box">
											<a
												href="../goods/goods_view.php?goodsNo=1000001680&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
												<strong class="item_name">[마이셰프] 새우 듬뿍 쿵 팟 퐁커리(2인)</strong>
											</a>
										</div>
										<!-- //item_tit_box -->
										<div class="item_money_box">
											<span class="item_price_rate">SAVE<br />25%
											</span> <strong class="item_price"> <span style="">14,900원
											</span>
											</strong> <span
												style="text-decoration: line-through; color: #CECECE; color: #CECECE; font-size: 12px; text-decoration: line-through;">19,900원
											</span>
										</div>
										<!-- //item_money_box -->
										<!-- //item_number_box -->
										<!-- //item_icon_box -->
									</div>
									<!-- //item_info_cont -->
								</div> <!-- //item_cont -->
							</li>
							<li style="width: 25%;">
								<div class="item_cont">
									<div class="item_photo_box"
										data-image-add1="/data/goods/21/04/15/1000001681/1000001681_add1_053.jpg"
										data-image-add2="/data/goods/21/04/15/1000001681/1000001681_add2_078.jpg"
										data-image-list="/data/goods/21/04/15/1000001681/1000001681_list_075.jpg"
										data-image-main="/data/goods/21/04/15/1000001681/1000001681_main_085.jpg"
										data-image-detail="/data/goods/21/04/15/1000001681/1000001681_detail_014.jpg"
										data-image-magnify="/data/goods/21/04/15/1000001681/1000001681_magnify_085.jpg">
										<a
											href="../goods/goods_view.php?goodsNo=1000001681&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
											<img
											src="/data/goods/21/04/15/1000001681/1000001681_main_085.jpg"
											width="280" alt="[마이셰프] 소고기 중화덮밥 키트(2인)"
											title="[마이셰프] 소고기 중화덮밥 키트(2인)" class="middle" />
										</a>
										<div class="item_link">
											<button type="button" class="btn_basket_get btn_add_wish_36"
												data-goods-no="1000001681"
												data-goods-nm="[마이셰프] 소고기 중화덮밥 키트(2인)"
												data-goods-price="11900.00"
												data-goods-image-src="/data/goods/21/04/15/1000001681/1000001681_main_085.jpg"
												data-optionfl="n" data-min-order-cnt="1" data-option-sno=""
												data-goods-image="" data-sales-unit="" data-fixed-sales=""
												data-fixed-order-cnt="">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_get.png"
													alt=""><span>찜하기</span>
											</button>
											<button type="button" href="#optionViewLayer"
												class="btn_basket_cart btn_add_cart_36 btn_open_layer"
												data-mode="cartIn" data-goods-no="1000001681">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_cart.png"
													alt=""><span>장바구니</span>
											</button>
										</div>
										<!-- //item_link -->
									</div>
									<!-- //item_photo_box -->
									<div class="item_info_cont">
										<div class="item_tit_box">
											<a
												href="../goods/goods_view.php?goodsNo=1000001681&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
												<strong class="item_name">[마이셰프] 소고기 중화덮밥 키트(2인)</strong>
											</a>
										</div>
										<!-- //item_tit_box -->
										<div class="item_money_box">
											<span class="item_price_rate">SAVE<br />25%
											</span> <strong class="item_price"> <span style="">11,900원
											</span>
											</strong> <span
												style="text-decoration: line-through; color: #CECECE; color: #CECECE; font-size: 12px; text-decoration: line-through;">15,900원
											</span>
										</div>
										<!-- //item_money_box -->
										<!-- //item_number_box -->
										<!-- //item_icon_box -->
									</div>
									<!-- //item_info_cont -->
								</div> <!-- //item_cont -->
							</li>
							<li style="width: 25%;">
								<div class="item_cont">
									<div class="item_photo_box"
										data-image-magnify="/data/goods/21/02/07/1000001661/1000001661_magnify_078.jpg"
										data-image-detail="/data/goods/21/02/07/1000001661/1000001661_detail_083.jpg"
										data-image-main="/data/goods/21/02/07/1000001661/1000001661_main_081.jpg"
										data-image-list="/data/goods/21/02/07/1000001661/1000001661_list_076.jpg"
										data-image-add1="/data/goods/21/02/07/1000001661/1000001661_add1_072.jpg"
										data-image-add2="/data/goods/21/02/07/1000001661/1000001661_add2_066.jpg">
										<a
											href="../goods/goods_view.php?goodsNo=1000001661&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
											<img
											src="/data/goods/21/02/07/1000001661/1000001661_main_081.jpg"
											width="280" alt="[마이셰프] 나혼자 밀푀유 샤브전골(1인)"
											title="[마이셰프] 나혼자 밀푀유 샤브전골(1인)" class="middle" />
										</a>
										<div class="item_link">
											<button type="button" class="btn_basket_get btn_add_wish_36"
												data-goods-no="1000001661"
												data-goods-nm="[마이셰프] 나혼자 밀푀유 샤브전골(1인)"
												data-goods-price="7900.00"
												data-goods-image-src="/data/goods/21/02/07/1000001661/1000001661_main_081.jpg"
												data-optionfl="n" data-min-order-cnt="1" data-option-sno=""
												data-goods-image="" data-sales-unit="" data-fixed-sales=""
												data-fixed-order-cnt="">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_get.png"
													alt=""><span>찜하기</span>
											</button>
											<button type="button" href="#optionViewLayer"
												class="btn_basket_cart btn_add_cart_36 btn_open_layer"
												data-mode="cartIn" data-goods-no="1000001661">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_cart.png"
													alt=""><span>장바구니</span>
											</button>
										</div>
										<!-- //item_link -->
									</div>
									<!-- //item_photo_box -->
									<div class="item_info_cont">
										<div class="item_tit_box">
											<a
												href="../goods/goods_view.php?goodsNo=1000001661&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
												<strong class="item_name">[마이셰프] 나혼자 밀푀유 샤브전골(1인)</strong>
											</a>
										</div>
										<!-- //item_tit_box -->
										<div class="item_money_box">
											<span class="item_price_rate">SAVE<br />43%
											</span> <strong class="item_price"> <span style="">7,900원
											</span>
											</strong> <span
												style="text-decoration: line-through; color: #CECECE; color: #CECECE; font-size: 12px; text-decoration: line-through;">13,900원
											</span>
										</div>
										<!-- //item_money_box -->
										<!-- //item_number_box -->
										<!-- //item_icon_box -->
									</div>
									<!-- //item_info_cont -->
								</div> <!-- //item_cont -->
							</li>
							<li style="width: 25%;">
								<div class="item_cont">
									<div class="item_photo_box"
										data-image-add1="/data/goods/21/01/03/1000001632/1000001632_add1_054.jpg"
										data-image-add2="/data/goods/21/01/03/1000001632/1000001632_add2_055.jpg"
										data-image-list="/data/goods/21/01/03/1000001632/1000001632_list_06.jpg"
										data-image-main="/data/goods/21/01/03/1000001632/1000001632_main_042.jpg"
										data-image-detail="/data/goods/21/01/03/1000001632/1000001632_detail_029.jpg"
										data-image-magnify="/data/goods/21/01/03/1000001632/1000001632_magnify_060.jpg">
										<a
											href="../goods/goods_view.php?goodsNo=1000001632&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
											<img
											src="/data/goods/21/01/03/1000001632/1000001632_main_042.jpg"
											width="280" alt="[마이셰프] 트러플 불고기 솥밥 키트(3인)"
											title="[마이셰프] 트러플 불고기 솥밥 키트(3인)" class="middle" />
										</a>
										<div class="item_link">
											<button type="button" class="btn_basket_get btn_add_wish_36"
												data-goods-no="1000001632"
												data-goods-nm="[마이셰프] 트러플 불고기 솥밥 키트(3인)"
												data-goods-price="10900.00"
												data-goods-image-src="/data/goods/21/01/03/1000001632/1000001632_main_042.jpg"
												data-optionfl="n" data-min-order-cnt="1" data-option-sno=""
												data-goods-image="" data-sales-unit="" data-fixed-sales=""
												data-fixed-order-cnt="">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_get.png"
													alt=""><span>찜하기</span>
											</button>
											<button type="button" href="#optionViewLayer"
												class="btn_basket_cart btn_add_cart_36 btn_open_layer"
												data-mode="cartIn" data-goods-no="1000001632">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_cart.png"
													alt=""><span>장바구니</span>
											</button>
										</div>
										<!-- //item_link -->
									</div>
									<!-- //item_photo_box -->
									<div class="item_info_cont">
										<div class="item_tit_box">
											<a
												href="../goods/goods_view.php?goodsNo=1000001632&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
												<strong class="item_name">[마이셰프] 트러플 불고기 솥밥 키트(3인)</strong>
											</a>
										</div>
										<!-- //item_tit_box -->
										<div class="item_money_box">
											<span class="item_price_rate">SAVE<br />31%
											</span> <strong class="item_price"> <span style="">10,900원
											</span>
											</strong> <span
												style="text-decoration: line-through; color: #CECECE; color: #CECECE; font-size: 12px; text-decoration: line-through;">15,900원
											</span>
										</div>
										<!-- //item_money_box -->
										<!-- //item_number_box -->
										<!-- //item_icon_box -->
									</div>
									<!-- //item_info_cont -->
								</div> <!-- //item_cont -->
							</li>
							<li style="width: 25%;">
								<div class="item_cont">
									<div class="item_photo_box"
										data-image-add1="/data/goods/21/01/03/1000001631/1000001631_add1_041.jpg"
										data-image-add2="/data/goods/21/01/03/1000001631/1000001631_add2_022.jpg"
										data-image-list="/data/goods/21/01/03/1000001631/1000001631_list_037.jpg"
										data-image-main="/data/goods/21/01/03/1000001631/1000001631_main_032.jpg"
										data-image-detail="/data/goods/21/01/03/1000001631/1000001631_detail_066.jpg"
										data-image-magnify="/data/goods/21/01/03/1000001631/1000001631_magnify_035.jpg">
										<a
											href="../goods/goods_view.php?goodsNo=1000001631&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
											<img
											src="/data/goods/21/01/03/1000001631/1000001631_main_032.jpg"
											width="280" alt="[마이셰프] 장어 한마리 솥밥 키트(3인)"
											title="[마이셰프] 장어 한마리 솥밥 키트(3인)" class="middle" />
										</a>
										<div class="item_link">
											<button type="button" class="btn_basket_get btn_add_wish_36"
												data-goods-no="1000001631"
												data-goods-nm="[마이셰프] 장어 한마리 솥밥 키트(3인)"
												data-goods-price="11900.00"
												data-goods-image-src="/data/goods/21/01/03/1000001631/1000001631_main_032.jpg"
												data-optionfl="n" data-min-order-cnt="1" data-option-sno=""
												data-goods-image="" data-sales-unit="" data-fixed-sales=""
												data-fixed-order-cnt="">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_get.png"
													alt=""><span>찜하기</span>
											</button>
											<button type="button" href="#optionViewLayer"
												class="btn_basket_cart btn_add_cart_36 btn_open_layer"
												data-mode="cartIn" data-goods-no="1000001631">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_cart.png"
													alt=""><span>장바구니</span>
											</button>
										</div>
										<!-- //item_link -->
									</div>
									<!-- //item_photo_box -->
									<div class="item_info_cont">
										<div class="item_tit_box">
											<a
												href="../goods/goods_view.php?goodsNo=1000001631&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
												<strong class="item_name">[마이셰프] 장어 한마리 솥밥 키트(3인)</strong>
											</a>
										</div>
										<!-- //item_tit_box -->
										<div class="item_money_box">
											<span class="item_price_rate">SAVE<br />33%
											</span> <strong class="item_price"> <span style="">11,900원
											</span>
											</strong> <span
												style="text-decoration: line-through; color: #CECECE; color: #CECECE; font-size: 12px; text-decoration: line-through;">17,900원
											</span>
										</div>
										<!-- //item_money_box -->
										<!-- //item_number_box -->
										<!-- //item_icon_box -->
									</div>
									<!-- //item_info_cont -->
								</div> <!-- //item_cont -->
							</li>
							<li style="width: 25%;">
								<div class="item_cont">
									<div class="item_photo_box"
										data-image-add1="/data/goods/21/01/03/1000001633/1000001633_add1_073.jpg"
										data-image-add2="/data/goods/21/01/03/1000001633/1000001633_add2_059.jpg"
										data-image-list="/data/goods/21/01/03/1000001633/1000001633_list_032.jpg"
										data-image-main="/data/goods/21/01/03/1000001633/1000001633_main_018.jpg"
										data-image-detail="/data/goods/21/01/03/1000001633/1000001633_detail_055.jpg"
										data-image-magnify="/data/goods/21/01/03/1000001633/1000001633_magnify_029.jpg">
										<a
											href="../goods/goods_view.php?goodsNo=1000001633&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
											<img
											src="/data/goods/21/01/03/1000001633/1000001633_main_018.jpg"
											width="280" alt="[마이셰프] 듬뿍 스테이크 솥밥 키트(3인)"
											title="[마이셰프] 듬뿍 스테이크 솥밥 키트(3인)" class="middle" />
										</a>
										<div class="item_link">
											<button type="button" class="btn_basket_get btn_add_wish_36"
												data-goods-no="1000001633"
												data-goods-nm="[마이셰프] 듬뿍 스테이크 솥밥 키트(3인)"
												data-goods-price="10900.00"
												data-goods-image-src="/data/goods/21/01/03/1000001633/1000001633_main_018.jpg"
												data-optionfl="n" data-min-order-cnt="1" data-option-sno=""
												data-goods-image="" data-sales-unit="" data-fixed-sales=""
												data-fixed-order-cnt="">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_get.png"
													alt=""><span>찜하기</span>
											</button>
											<button type="button" href="#optionViewLayer"
												class="btn_basket_cart btn_add_cart_36 btn_open_layer"
												data-mode="cartIn" data-goods-no="1000001633">
												<img
													src="/data/skin/front/udweb_pc_20200903/img/icon/goods_icon/icon_basket_cart.png"
													alt=""><span>장바구니</span>
											</button>
										</div>
										<!-- //item_link -->
									</div>
									<!-- //item_photo_box -->
									<div class="item_info_cont">
										<div class="item_tit_box">
											<a
												href="../goods/goods_view.php?goodsNo=1000001633&mtn=36%5E%7C%5E%EC%8B%A0%EC%83%81%ED%92%88%5E%7C%5En">
												<strong class="item_name">[마이셰프] 듬뿍 스테이크 솥밥 키트(3인)</strong>
											</a>
										</div>
										<!-- //item_tit_box -->
										<div class="item_money_box">
											<span class="item_price_rate">SAVE<br />35%
											</span> <strong class="item_price"> <span style="">10,900원
											</span>
											</strong> <span
												style="text-decoration: line-through; color: #CECECE; color: #CECECE; font-size: 12px; text-decoration: line-through;">16,900원
											</span>
										</div>
										<!-- //item_money_box -->
										<!-- //item_number_box -->
										<!-- //item_icon_box -->
									</div>
									<!-- //item_info_cont -->
								</div> <!-- //item_cont -->
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>


	<!-- footer -->
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	<!-- 우측네비게이션 -->
	<jsp:include page="/WEB-INF/views/snb.jsp" />
</body>
</html>
