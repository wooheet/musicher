<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Musicher</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
<link rel="stylesheet"
	href="/Musicher/resources/recommand_font-awesome-4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/Musicher/resources/recommand_css/bootstrap.min.css">
<link rel="stylesheet"
	href="/Musicher/resources/recommand_css/hero-slider-style.css">
<link rel="stylesheet"
	href="/Musicher/resources/recommand_css/magnific-popup.css">
<link rel="stylesheet"
	href="/Musicher/resources/recommand_css/tooplate-style.css">



<script src="/Musicher/resources/pay_js/index.js"></script>
<script src="/Musicher/resources/pay_js/index.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

<link rel="stylesheet" href="/Musicher/resources/pay_css/style.css">

</head>

<body>

	<!-- Content -->
	<div>
		<!-- Navigation -->
		<div class="cd-slider-nav">
			<div class="tm-navbar-bg">

				<a class="navbar-brand text-uppercase" href="/Musicher/index.do"><i
					class="fa fa-home tm-brand-icon"></i>My Page</a>

				<div class="container-fluid text-right">

					<div class=" text-xs-center text-uppercase tm-navbar" id="tmNavbar">
						<ul class="nav navbar-nav">
							<li class="nav-item active selected"><a class="nav-link"
								href="/Musicher/read.do?mem_id=${loginUser.mem_id}" data-no="0">수정/탈퇴 </a></li>
							<li class="nav-item active selected"><a class="nav-link"
								href="/Musicher/memberpay.do?mem_id=${loginUser.mem_id}" data-no="0">결제관리</a></li>
							<li class="nav-item active selected"><a class="nav-link"
								href="/Musicher/mymusiclist.do?mem_id=${loginUser.mem_id}" data-no="0">MyList</a></li>
						</ul>
					</div>
				</div>
			</div>


			<br />
			<div class="inspage">

				<jsp:include page="${insertpage}"></jsp:include>

			</div>
		</div>
	</div>
	<!-- .cd-full-width -->

	<div id="loader-wrapper">

		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>

	</div>

	<!-- load JS files -->
	<script src="/Musicher/resources/recommand_js/jquery-1.11.3.min.js"></script>
	<script
		src="https://www.atlasestateagents.co.uk/javascript/tether.min.js"></script>
	<script src="/Musicher/resources/recommand_js/bootstrap.min.js"></script>
	<script src="/Musicher/resources/recommand_js/hero-slider-main.js"></script>

	<script>
	
		function adjustHeightOfPage(pageNo) {

			var offset = 80;
			var pageContentHeight = 0;

			var pageType = $('div[data-page-no="' + pageNo + '"]').data(
					"page-type");

			if ($(window).width() >= 992) {
				offset = 120;
			} else if ($(window).width() < 480) {
				offset = 40;
			}

			// Get the page height
			var totalPageHeight = $('.cd-slider-nav').height()
					+ pageContentHeight + offset + $('.tm-footer').height();

			// Adjust layout based on page height and window height
			if (totalPageHeight > $(window).height()) {
				$('.cd-hero-slider li:nth-of-type(' + pageNo + ')').css(
						"min-height", totalPageHeight + "px");
			} else {
				$('.cd-hero-slider li:nth-of-type(' + pageNo + ')').css(
						"min-height", "100%");
			}
		}
		
		function insPage(pageNo) {

			var offset = 80;
			var pageContentHeight = 0;

			var pageType = $('div[data-page-no="' + pageNo + '"]').data(
					"page-type");

			if ($(window).width() >= 992) {
				offset = 120;
			} else if ($(window).width() < 480) {
				offset = 40;
			}

			// Get the page height
			var totalPageHeight = $('.cd-slider-nav').height()
					+ pageContentHeight + offset + $('.tm-footer').height();

			// Adjust layout based on page height and window height
			if (totalPageHeight > $(window).height()) {
				$('.inspage li:nth-of-type(' + pageNo + ')').css(
						"min-height", totalPageHeight + "px");
			} else {
				$('.inspage li:nth-of-type(' + pageNo + ')').css(
						"min-height", "100%");
			}
		}

		$(window).load(function() {
			/* Collapse menu after click 
			-----------------------------------------*/
			
			insPage(0);
			$('body').addClass('loaded');
		});
	</script>

</body>
</html>