<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Bootstrap Theme Company Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/Musicher/resources/genre_assets/css/main.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<style>
h2 {
	font-size: 24px;
	text-transform: uppercase;
	color: #303030;
	font-weight: 600;
	margin-bottom: 30px;
}

h4 {
	font-size: 19px;
	line-height: 1.375em;
	color: #303030;
	font-weight: 400;
	margin-bottom: 30px;
}

.jumbotron {
	background-color: white;
	color: #fff;
	padding: 100px 25px;
	font-family: Montserrat, sans-serif;
}

.container-fluid {
	padding: 60px 50px;
}

.bg-grey {
	background-color: white;
}

.logo-small {
	color: white;
	font-size: 50px;
}

.logo {
	color: white;
	font-size: 200px;
}

.thumbnail {
	padding: 0 0 15px 0;
	border: none;
	border-radius: 0;
}

.thumbnail img {
	width: 100%;
	height: 100%;
	margin-bottom: 10px;
}

.carousel-control.right, .carousel-control.left {
	background-image: none;
}

.carousel-indicators li {
	border-color: white;
}

.carousel-indicators li.active {
	
}

.item h4 {
	font-size: 19px;
	line-height: 1.375em;
	font-weight: 400;
	font-style: italic;
	margin: 70px 0;
}

.item span {
	font-style: normal;
}

.panel {
	border: 1px solid white;
	border-radius: 0 !important;
	transition: box-shadow 0.5s;
}

.panel:hover {
	box-shadow: 5px 0px 40px rgba(0, 0, 0, .2);
}

.panel-footer .btn:hover {
	border: 1px solid white;
	background-color: #fff !important;
	color: white;
}

.panel-heading {
	color: #fff !important;
	background-color: black !important;
	padding: 25px;
	border-bottom: 1px solid transparent;
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-bottom-left-radius: 0px;
	border-bottom-right-radius: 0px;
}

.panel-footer {
	background-color: white !important;
}

.panel-footer h3 {
	font-size: 32px;
}

.panel-footer h4 {
	font-size: 14px;
}

.panel-footer .btn {
	margin: 15px 0;
	background-color: black;
	color: #fff;
}

.navbar {
	margin-bottom: 0;
	background-color: white;
	z-index: 9999;
	border: 0;
	font-size: 12px !important;
	line-height: 1.42857143 !important;
	letter-spacing: 4px;
	border-radius: 0;
	font-family: Montserrat, sans-serif;
}

.navbar li a, .navbar .navbar-brand {
	color: #fff !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
	color: #f4511e !important;
	background-color: #fff !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #fff !important;
}

footer .glyphicon {
	font-size: 20px;
	margin-bottom: 20px;
	color: white;
}

.slideanim {
	visibility: hidden;
}

.slide {
	animation-name: slide;
	-webkit-animation-name: slide;
	animation-duration: 1s;
	-webkit-animation-duration: 1s;
	visibility: visible;
}

@
keyframes slide { 0% {
	opacity: 0;
	transform: translateY(70%);
}

100%
{
opacity
	
:
1;

	
transform
 
:
 
	
translateY
 
(0%);
}
}
@
-webkit-keyframes slide { 0% {
	opacity: 0;
	-webkit-transform: translateY(70%);
}

100%
{
opacity


:

 

1;
-webkit-transform


:

 

translateY


(0%);
}
}
@media screen and (max-width: 768px) {
	.col-sm-4 {
		text-align: center;
		margin: 25px 0;
	}
	.btn-lg {
		width: 100%;
		margin-bottom: 35px;
	}
}

@media screen and (max-width: 480px) {
	.logo {
		font-size: 150px;
	}
}

body {
	background-image:
		url("/Musicher/resources/genre_assets/css/images/overlay.png"),
		-moz-linear-gradient(top, rgba(0, 0, 0, 0) 100%, rgba(0, 0, 0, 0.65)),
		url("/Musicher/resources/genre_images/pic15.jpg");
	background-image:
		url("/Musicher/resources/genre_assets/css/images/overlay.png"),
		-webkit-linear-gradient(top, rgba(0, 0, 0, 0) 100%,
		rgba(0, 0, 0, 0.65)),
		url("/Musicher/resources/genre_images/pic15.jpg");
	background-image:
		url("/Musicher/resources/genre_assets/css/images/overlay.png"),
		-ms-linear-gradient(top, rgba(0, 0, 0, 0) 100%, rgba(0, 0, 0, 0.65)),
		url("../../genre_images/pic15.jpg");
	background-image:
		url("/Musicher/resources/genre_assets/css/images/overlay.png"),
		linear-gradient(top, rgba(0, 0, 0, 0) 100%, rgba(0, 0, 0, 0.65)),
		url("/Musicher/resources/genre_images/pic15.jpg");
	background-position: top left, bottom left, auto;
	background-size: auto, 100% 100%, 100%;
	background-repeat: repeat, no-repeat, auto;
	padding: 0;
	font-size: 12pt;
	line-height: 1.75em;
	height: 100%;
	min-height: 450px;
	min-width: 1000px;
}
</style>
<script>
function nicePay() {
    nicePay = window.open("/Musicher/pay.do" ,"nicePay","width=800,height=700");
   
}

</script>
</head>
<body>
<div id="wrapper" style="overflow: auto;">
		<ul class="contact">
			<li><a href="/Musicher/index.do" class=""><span
					class="label"></span></a></li>
			<li><a href="/Musicher/index.do" class="icon fa-home"><span
					class="label"></span></a></li>		
			<li><a href="/Musicher/index.do" class="icon fa-sign-in"><span
					class="label"></span></a></li>
			<li><a href="#search" class="icon fa-search"><span
					class="label"></span></a></li>
		</ul>
	<div class="container-fluid" style="color: black;">
		<div class="text-center">
			<h1>Pricing</h1>
			<h4>Choose a payment plan that works for you</h4>
		</div>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<h1>Musicher Free</h1>
					</div>
					<div class="panel-body" style="height: 150px">						
						<p >
							<strong style="color: black;">✔ music streaming</strong>
						</p>
						<p >
							<strong style="color: black;">✔ music search</strong>
						</p>
						<p style="color: gray;">
							✔ Recommand music
						</p>
						
					</div>
					<div class="panel-footer">
						<div style="height: 140px">
							<h3>Free</h3>
						</div>
						<!-- 
						<h4>per month</h4>
						<button class="btn btn-lg">Get Free</button> -->
					</div>
				</div>
			</div>
			<div class="col-sm-2"></div>
			<div class="col-sm-4">
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<h1>Musicher Premium</h1>
					</div>
					<div class="panel-body" style="height: 150px; " >						
						<p >
							<strong style="color: black;">✔ music streaming</strong>
						</p>
						<p >
							<strong style="color: black;">✔ music search</strong>
						</p>
						<p >
							<strong style="color: black;">✔ Recommand music</strong>
						</p>
					</div>
					<div class="panel-footer">
						<div style="height: 70px">
							<h3>10,000원</h3>
							<h4>per month</h4>
						</div>
						<c:choose>
							<c:when test="${loginUser.mem_group eq 'premium'}">
								<div style="height: 70px">
									<input type="button" class="btn btn-lg" value="이미 프리미엄 회원입니다." style="background-color: green;">
								</div>								
							</c:when>
							<c:otherwise>
								<div style="height: 70px">
									<a onclick="nicePay()"><input type="button" class="btn btn-lg" value="Get Premium"></a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>

		</div>
	</div>
	</div>
</body>
</html>