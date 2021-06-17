<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyAS1gYiDSfAP3cV-qKPHM6jG9rDcX9soAc"></script>

<link type="text/css" rel="stylesheet"
	href="${path}/resources/css/header.css">

<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/snb.css">

<link type="text/css" rel="stylesheet"
	href="${path}/resources/css/footer.css">

<link type="text/css" rel="stylesheet"
	href="${path}/resources/css/layer.css">

<link type="text/css" rel="stylesheet"
	href="${path}/resources/css/reset.css">

<link type="text/css" rel="stylesheet"
	href="${path}/resources/css/common .css">

<style>
#map_ma {
	position: absolute;
	width: calc(100% - 40%);
	height: /* calc(80% - 10px); */ 50%;
	left: 20%;
	clear: both;
	border: solid 1px black;
}

#header_name {
	text-align: center;
	padding-bottom: 5px;
	padding-top: 5px;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div id="header_name">배송 지역 및 배송 불가 지역 페이지</div>

	<div id="map_ma"></div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var myLatlng = new google.maps.LatLng(35.837143,
									128.558612); // 위치값 위도 경도
							var Y_point = 35.837143; // Y 좌표
							var X_point = 128.558612; // X 좌표
							var zoomLevel = 18; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
							var markerTitle = "대구광역시"; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
							var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기

							// 말풍선 내용
							var contentString = '<div>' + '<h2>대구남구</h2>'
									+ '<p>안녕하세요. 구글지도입니다.</p>' +

									'</div>';
							var myLatlng = new google.maps.LatLng(Y_point,
									X_point);
							var mapOptions = {
								zoom : zoomLevel,
								center : myLatlng,
								mapTypeId : google.maps.MapTypeId.ROADMAP
							}
							var map = new google.maps.Map(document
									.getElementById('map_ma'), mapOptions);
							var marker = new google.maps.Marker({
								position : myLatlng,
								map : map,
								title : markerTitle
							});
							var infowindow = new google.maps.InfoWindow({
								content : contentString,
								maxWizzzdth : markerMaxWidth
							});
							google.maps.event.addListener(marker, 'click',
									function() {
										infowindow.open(map, marker);
									});
						});
	</script>

</body>

</html>