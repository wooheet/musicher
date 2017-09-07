<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

<link rel="stylesheet" href="/Musicher/resources/pay_css/style.css">

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
		
		<div class="container">
			<form id="signupForm" method="post">
				<div class="row">
					<h4>Sign Up</h4>
					<div class="input-group input-group-icon">
						<input type="email" name="mem_id" placeholder="Email Adress" />
						<div class="input-icon">
							<i class="fa fa-envelope"></i>
						</div>
					</div>
					<div class="input-group input-group-icon">
						<input type="text" name="name" placeholder="Name" />
						<div class="input-icon">
							<i class="fa fa-user"></i>
						</div>
					</div>					
					<div class="input-group input-group-icon">
						<input type="password" name="pass" placeholder="Password" />
						<div class="input-icon">
							<i class="fa fa-key"></i>
						</div>
					</div>					
				</div>
				<div class="row">
					<div class="col-half">
						<h4>Age</h4>
						<div class="input-group">
							<input type="text" name="age" id="age"/>
							<!-- <div class="col-third">
								<input type="text" placeholder="DD" />
							</div>
							<div class="col-third">
								<input type="text" placeholder="MM" />
							</div>
							<div class="col-third">
								<input type="text" placeholder="YYYY" />
							</div> -->
						</div>
					</div>
					<div class="col-half">
						<h4>Gender</h4>
						<div class="input-group">
							<input type="radio" name="gender" value="male" id="gender-male" />
							<label for="gender-male">Male</label> <input type="radio"
								name="gender" value="female" id="gender-female" /> <label
								for="gender-female">Female</label>
						</div>
						<input type="hidden" name="mem_group" value="Free">
					</div>
				</div>
				<!-- <div class="row">
					<h4>Payment Details</h4>
					<div class="input-group">
						<input type="radio" name="payment-method" value="card"
							id="payment-method-card" checked="true" /> <label
							for="payment-method-card"><span><i
								class="fa fa-cc-visa"></i>Credit Card</span></label> <input type="radio"
							name="payment-method" value="paypal" id="payment-method-paypal" />
						<label for="payment-method-paypal"> <span><i
								class="fa fa-cc-paypal"></i>Paypal</span></label>
					</div>
					<div class="input-group input-group-icon">
						<input type="text" placeholder="Card Number" />
						<div class="input-icon">
							<i class="fa fa-credit-card"></i>
						</div>
					</div>
					<div class="col-half">
						<div class="input-group input-group-icon">
							<input type="text" placeholder="Card CVC" />
							<div class="input-icon">
								<i class="fa fa-user"></i>
							</div>
						</div>
					</div>
					<div class="col-half">
						<div class="input-group">
							<select>
								<option>01 Jan</option>
								<option>02 Jan</option>
							</select> <select>
								<option>2015</option>
								<option>2016</option>
							</select>
						</div>
					</div>
				</div> -->
				<div class="row">
					<h4>Terms and Conditions</h4>
					<div class="input-group">
						<input type="checkbox" id="terms" /> <label for="terms">I
							accept the terms and conditions for signing up to this service,
							and hereby confirm I have read the privacy policy.</label>
					</div>
				</div>
				<input type="submit" value="join">
			</form>
		</div>
		<script
			src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

		<script src="/Musicher/resources/pay_js/index.js"></script>


	</div>

	<!-- Scripts -->
	<script src="/Musicher/resources/genre_assets/js/jquery.min.js"></script>
	<script src="/Musicher/resources/genre_assets/js/jquery.poptrox.min.js"></script>
	<script src="/Musicher/resources/genre_assets/js/skel.min.js"></script>
	<script src="/Musicher/resources/genre_assets/js/skel-viewport.min.js"></script>
	<script src="/Musicher/resources/genre_assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/Musicher/resources/genre_assets/js/main.js"></script>

	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="/Musicher/resources/pay_js/index.js"></script>

</body>
</html>