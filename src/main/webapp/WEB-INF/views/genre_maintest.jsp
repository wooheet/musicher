<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
   Parallelism by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Parallelism by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet"
	href="/Musicher/resources/genre_assets/css/main.css" />
<noscript>
	<link rel="stylesheet"
		href="/Musicher/resources/genre_assets/css/noscript.css" />
</noscript>
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->

</head>
<body>

	<div id="wrapper">
		<ul class="contact">
			<li><a href="index.do" class="icon fa-home"><span
					class="label"></span></a></li>
			<li><a href="#contact" class="icon fa-sign-in"><span
					class="label"></span></a></li>
			<li><a href="#search" class="icon fa-search"><span
					class="label"></span></a></li>
		</ul>
		<div id="main">
			<div id="reel">


				<!-- Header Item -->
				<c:choose>
					<c:when test="${gr.grname !=null}">
						<div id="header" class="item" data-width="400">
							<div class="inner">
								<h1>${gr.grname}</h1>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div id="header" class="item" data-width="400">
							<div class="inner">
								<h1>Genre Search</h1>
							</div>
						</div>
					</c:otherwise>

				</c:choose>
				<!-- Thumb Items -->
				<c:choose>
					<c:when test="${grlist!=null}">
						<c:forEach var="gr" items="${ grlist}">
							<article class="item thumb" data-width="282">
								
								<a href="/Musicher/test.do?high=${gr.genre_id}&pageno=1"
									onclick="/Musicher/test.do?high=${gr.genre_id}">
									<h2 >${gr.grname}</h2>
									<img src="/Musicher/resources/genre_images/thumbs/01.jpg" alt=""></a>
							</article>
						</c:forEach>
					</c:when>

				</c:choose>










			</div>
		</div>

		<div id="footer">
			<div class="left">
				<p>
					This is <strong>Parallelism</strong>, a responsive portfolio site
					template by <a href="http://html5up.net">HTML5 UP</a>. Free for
					personal<br /> and commercial use under the <a
						href="http://html5up.net/license">Creative Commons Attribution</a>
					license.
				</p>
			</div>

		</div>

	</div>

	<!-- Scripts -->
	<script src="/Musicher/resources/genre_assets/js/jquery.min.js"></script>
	<script src="/Musicher/resources/genre_assets/js/jquery.poptrox.min.js"></script>
	<script src="/Musicher/resources/genre_assets/js/skel.min.js"></script>
	<script src="/Musicher/resources/genre_assets/js/skel-viewport.min.js"></script>
	<script src="/Musicher/resources/genre_assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/Musicher/resources/genre_assets/js/main.js"></script>

</body>
</html>
