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
							<li><a href="member/join">JOIN</a><span class="txt_bar"></span></li>
						</c:if>
						<!-- 로그아웃 -->
						<c:if test="${not empty pageContext.request.userPrincipal.name}">
							<li><a href="/logoutProc">LOGOUT</a><span class="txt_bar"></span></li>
						</c:if>
						<li>
						<li><a href="member/mypage/mypage_main?id=${pageContext.request.userPrincipal.name}">MYPAGE</a><span
							class="txt_bar"></span></li>
					</ul>
				</div>
				<!-- //header_top_cont -->
			</div>
			<!-- //header_top -->

			<div class="h1_logo">
				<a href="/"><img src="${path}/resources/images/logo7.png"
					alt="상단 로고" title="상단 로고" /></a>
			</div>

			<div id="gnb">
				<h2 class="screen_out"></h2>
				<div id="gnbMenu" class="gnb_kurly">
					<div class="inner_gnbkurly">
						<div class="gnb_main">
							<ul class="gnb">
								<li class="menu1"><a href="#none"><span class="ico"></span><span
										class="txt">전체 카테고리</span></a></li>

								<li class="menu2"><a class="link new "
									href="/shop/goods/goods_list.php?category=038"><span
										class="txt">신상품</span></a></li>
								<li class="menu3"><a class="link best "
									href="/shop/goods/goods_list.php?category=029"><span
										class="txt">베스트</span></a></li>
								<li class="menu4"><a class="link bargain "
									href="/shop/goods/goods_list.php?list=sale"><span
										class="txt">알뜰쇼핑</span></a></li>
								<li class="lst"><a class="link event "
									href="/shop/goods/event.php?&"><span class="txt">특가/혜택</span></a></li>
							</ul>
							<div id="side_search" class="gnb_search">
							
								<form action="/product/productList/list2"
									onsubmit="return searchTracking(this)">
									<input type=hidden name=searched value="Y"> <input
										type=hidden name=log value="1"> <input type=hidden
										name=skey value="all"> <input type="hidden"
										name="hid_pr_text" value=""> <input type="hidden"
										name="hid_link_url" value=""> <input type="hidden"
										id="edit" name="edit" value=""> <input name="sword"
										type="text" id="" class="inp_search" value="" required
										label="검색어"> <input type=image
										src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png"
										class="btn_search">
									<div class="init">
										<button type="button" class="btn_delete" id="searchInit">검색어
											삭제하기</button>
									</div>
								</form>
								<script>
									// KM-1483 Amplitude 연동
									function searchTracking(form) {
										var _searchTrackingData = {
											selection_type : 'keyword',
											keyword : $(form).find(
													'[name = sword]').val(),
											package_id : null,
											package_name : null,
											position : null,
										}
										KurlyTracker
												.setEventInfo(_searchTrackingData.selection_type);
										KurlyTracker.setAction('select_search',
												_searchTrackingData).sendData();
										return chkForm(form);
									}
								</script>
							</div>
							<div class="cart_count">
								<div class="inner_cartcount">
									<a href="/member/cart" class="btn_cart"> <span
										class="screen_out"></span> <span
										class="num realtime_cartcount" id="cart_item_count"></span>
									</a>
								</div>
								<div id="addMsgCart" class="msg_cart">
									<span class="point"></span>
									<div class="inner_msgcart">
										<img src="https://res.kurly.com/images/common/bg_1_1.gif"
											alt="" class="thumb">
										<p id="msgReaddedItem" class="desc">
											<span class="tit"></span> <span class="txt"> 장바구니에 상품을
												담았습니다. <span class="repeat">이미 담으신 상품이 있어 추가되었습니다.</span>
											</span>
										</p>
									</div>
								</div>
							</div>
							<div class="location_set">
								<button type="button" class="btn_location on">배송지 설정하기</button>
								<div class="layer_location" style="display: none"></div>
							</div>
						</div>
						<!-- <div class="gnb_sub">
									<div class="inner_sub">
										<ul class="gnb_menu" data-default="219" data-min="219"
											data-max="731">
											<gnb-menu-pc v-for="(item, idx) in dataGnb" :main-menu="item"
												:sub-menu="item.categories" :sub-open="item.subOpen"
												:get-category-num="getCategoryNum" :key="'gnb'+idx"
												:idx="idx"></gnb-menu-pc>
										</ul>
									</div>
								</div> -->
					</div>
				</div>
			</div>
			<script src="${path}/resources/js/gnb.js"></script>
			<script type="text/javascript">
				//
				gnbMenu.update();

				// 검색창 클래스 추가/삭제
				var searchInputAction = (function() {
					var $target = {};

					var _searchInputAction = {
						setSeletor : function() {
							$target = {
								$parent : $('#gnb'),
								$search : $('#gnb [name=sword]'),
								$deleteBtn : $('#searchInit'),
								$edit : $('#edit')
							}

							this.setAction();
						},
						setAction : function() {
							var that = this;
							$target.$search.focus(
									function() {
										that.changeClass($target.$search,
												'add', 'focus');
										that.deleteCheck();
									}).blur(
									function() {
										that.changeClass($target.$search,
												'remove', 'focus');
										that.deleteCheck(false);
									}).on('keyup', function() {
								if ($target.$edit.val() !== 'Y') {
									$target.$edit.val('Y');
								}
								that.deleteCheck();
							});

							$target.$deleteBtn.on('click', function() {
								$target.$search.val('');
								that.deleteCheck();
							});
						},
						deleteCheck : function(type) {
							var that = this, count = $.trim($target.$search
									.val()).length;
							if (count === 0
									|| (typeof type !== 'undefined' && !type)) {
								that.changeClass($target.$deleteBtn, 'remove',
										'on');
							} else {
								that.changeClass($target.$deleteBtn, 'add',
										'on');
							}
						},
						changeClass : function(target, type, className) {
							if (type === 'add') {
								target.addClass(className);
							} else {
								target.removeClass(className);
							}
						}
					}

					_searchInputAction.setSeletor();
				})();

				$('#gnb .gnb .link').on(
						'click',
						function(e) {
							e.preventDefault();
							var _event_name, _event_info;
							if ($(this).hasClass('new')) {
								_event_name = 'select_new_product_subtab';
							} else if ($(this).hasClass('best')) {
								_event_name = 'select_popular_product_subtab';
							} else if ($(this).hasClass('bargain')) {
								_event_name = 'select_bargain_subtab';
							} else if ($(this).hasClass('event')) {
								_event_name = 'select_event_list_subtab';
							}
							_event_info = $(this).attr('href');

							KurlyTracker.setEventInfo(_event_info).setAction(
									_event_name).sendData();
							location.href = _event_info;
						});

				// 장바구니 아이콘 클릭이벤트
				$('#gnbMenu .btn_cart').on('click', function(e) {
					e.preventDefault();
					KurlyTracker.setAction('select_cart').sendData();
					location.href = $(this).attr('href');
				});
			</script>
		</div>
	</div>
</body>
</html>