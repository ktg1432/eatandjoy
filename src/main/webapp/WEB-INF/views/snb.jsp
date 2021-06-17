<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
<style>
body {
	font-family: "Lato", sans-serif;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0px;
	background-color:white;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
	/* border:0.5px solid black;
	border-right:none; */
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
	
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
</style>

</head>
<body>
	<div id="mySidenav" class="sidenav">
		<!-- <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a> -->
		<a href="#">About</a> <a href="#">Services</a> <a href="#">Clients</a>
		<a href="#">Contact</a>
	</div>
	<div id="snb" style="right: 0px; top: 0px;">
		<div class="right_snb_btn">
			<ul>
				<li class="right_snb_btn_open"><a> <i
						class="xi-angle-left" style="font-size: 30px; cursor: pointer"
						onclick="openNav()"></i>
				</a></li>
				
				<!-- <li class="right_snb_btn_open"><a> <i
						class="xi-angle-right" style="font-size: 30px; cursor: pointer"
						onclick="closeNav()"></i>
				</a></li> -->
			</ul>
		</div>
	</div>
	<script>

		function openNav() {
			var quick_btn = $('#snb .right_snb_btn_open');
			$(quick_btn).on('click',function(){
				var quick_right = $('#mySidenav').css('width');
				if(quick_right == '0px'){
					document.getElementById("mySidenav").style.width = "200px";
					 /* $('#snb').stop(true,true).animate({'right':'-187px'}); */
					$('#snb .right_snb_btn_open').find('i').attr('class','xi-angle-right');
					/* Cookies.set('checks', 'ucks',{ expires: 1, path: '/' }); */
				}else if(quick_right == '200px'){
					document.getElementById("mySidenav").style.width = "0";
				/* 	$('#snb').stop(true,true).animate({'right':'0px'}); */
					$('#snb .right_snb_btn_open').find('i').attr('class','xi-angle-left');
					/* Cookies.remove('checks',{ path: '/' }); */
				}
				
			});
			/*
			document.getElementById("mySidenav").style.width = "200px";
			$('#snb .right_snb_btn_open').find('i').attr('class','xi-angle-right'); */
		}

		/* function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			$('#snb .right_snb_btn_open').find('i').attr('class','xi-angle-left');
		} */

	</script>
</body>
</html>