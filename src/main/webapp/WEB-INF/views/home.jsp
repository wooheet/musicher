
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
   Aerial by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Musicher</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/Musicher/resources/assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<script src="<c:url value='resources/js/popup.js' />" type="text/javascript" charset="utf-8"></script> 



<!--  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

<link rel="stylesheet" href="/Musicher/resources/pay_css/style.css">
<!--  -->
</head>

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
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover, .offcanvas a:focus {
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

<!--
-->
.sidenav2 {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0;
	background-color: #111;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav2 a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav2 a:hover, .offcanvas a:focus {
	color: #f1f1f1;
}

.sidenav2 .closebtn {
	position: absolute;
	top: 0;
	left: 25px;
	font-size: 36px;
	margin-right: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav2 {
		padding-top: 15px;
	}
	.sidenav2 a {
		font-size: 18px;
	}
}
</style>

<script>
	function openNav() {
		document.getElementById("mySidenav").style.width = "40%";
	}

	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
	}

	function openNav2() {
		document.getElementById("mySidenav2").style.width = "40%";
	}

	function closeNav2() {
		document.getElementById("mySidenav2").style.width = "0";
	}
	
	
	function ChatbotOpen() {
	    seatphoto1 = window.open("http://192.168.9.100:5000" ,"seatphoto1","width=500,height=600");
	   
	}

	$( document ).ready(function() {
	    if("${loginmsg}"){
	    	alert("${loginmsg}")
	    }
	});
</script>

</head>

<body class="loading" onload="test()">
<!-- login modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="background-color: #5fa4c2">
				<div class="modal-header">
					<h1 align="center" style="color: white;">Login</h1>
				</div>
				<form method="post" action="/Musicher/login.do">
					<div class="modal-body">						
							<div class="row" align="center">
								<div class="input-group input-group-icon">
									<input type="email" name="mem_id" placeholder="Email Adress" style="color: black; width: 600px" />
									<div class="input-icon">
										<i class="fa fa-envelope"></i>
									</div>
								</div>
								<div class="input-group input-group-icon">
									<input type="password" name="pass" placeholder="Password" style="color: black; width: 600px" />
									<div class="input-icon">
										<i class="fa fa-key"></i>
									</div>
								</div>
							</div>
						
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-default" value="login"
								style="width: 100px;">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<!--  -->
	<div class="modal fade" id="searchModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="background-color: #5fa4c2">
				<div class="modal-header">
					<h1 align="center" style="color: white;">Search</h1>
				</div>
				<div class="modal-body">
					<form method="post" action="/Musicher/search.do">
						<div class="container-fluid" align="center">
							<div class="col-sm-3">
								<div class="input_group" >
									<select style="width: 100px; color: black;" name="input_group">
										<option value="genre_id">장르</option>
										<option value="singer_id">가수</option>
										<option value="title">제목</option>
									</select> 
								</div>
							</div>
							<div class="col-sm-7">
								<div class="input-group input-group-icon">
									<input type="text" name="search" min="1" placeholder="Search" style="color: black; width: 400px"/> 
									<div class="input-icon">
										<i class="icon fa-search"></i>
									</div>
								</div>
							</div>
							<div class="col-sm-2">
								<input type="submit" class="btn btn-default" value="검색" style="height: 50px"/>
							</div>
							
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- main content -->
   <div id="wrapper">
      <div id="bg"></div><!-- 
      <div id="overlay"></div> -->
      <div id="main">
      
      <!-- left menu -->
         <div id="mySidenav" class="sidenav" style="background-color: white; overflow: auto;">
            <div>
               <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
               <a href="/Musicher/index.do">HOME</a> 
               <a href="/Musicher/test.do?high=0&pageno=0">Genre Search</a>
              
               <c:if test="${loginUser.mem_group eq 'premium'}">
               		<a href="/Musicher/recommand.do">Recommand Music</a>
               </c:if>
               <c:if test="${loginUser.mem_id !=null }">
              		<a href="/Musicher/payment.do">Payment <span class="icon fa-credit-card-alt"></span></a>
				</c:if>
            </div>
            <div style="padding-top: 40%; ">
               <a href="#"  data-toggle="modal" data-target="#searchModal">Search <span class="icon fa-search"></span></a> 
                
               <a href="#" onclick="ChatbotOpen()">ChatBot <span class="fa fa-wechat"></span></a>
            </div>
         </div>

	<!-- Header -->
         <header id="header">
            <div class="container-fluid">
            
                  <h1 style="color: white;">Musicher</h1>
                  <div></div>
                  <nav>
                     <ul>
                     	<li><a href="#"  onclick="openNav()" class="icon fa-bars" data-toggle="modal"
                                 ></a></li>
                        <c:choose>
                           <c:when test="${loginUser.mem_id ==null }">
                              <li><a href="#" class="icon fa-sign-in" data-toggle="modal"
                                 data-target="#myModal"><span class="label">login</span></a></li>
                              <li><a href="/Musicher/signup.do" class="icon fa-user-plus"><span
                                 class="label">signup</span></a></li>
                           </c:when>
                           <c:when test="${loginUser.mem_id eq 'admin@admin.com' }">
                              <li><a href="/Musicher/logout.do" class="icon fa-arrow-circle-left"><span class="label">logout</span></a></li>
                              <li><a href="/Musicher/manager.do" class="glyphicon glyphicon-user"><span
                                 class="label">myPage</span></a></li>                              
                           </c:when>
                           <c:otherwise>
                              <li><a href="/Musicher/logout.do" class="icon fa-arrow-circle-left"><span class="label">logout</span></a></li>
                              <li><a href="/Musicher/read.do?mem_id=${loginUser.mem_id}" class="glyphicon glyphicon-user"><span
                                 class="label">myPage</span></a></li>                              
                           </c:otherwise>                     
                        </c:choose>   
                        <li><a href="https://github.com/wooheet/musicher" class="icon fa-github"><span
                              class="label">Github</span></a></li>                              
                        <li><a onclick="fcOpen('${loginUser.mem_id}')" class="icon fa-music"><span
                              class="label">Github</span></a></li>                           
                     </ul>
                  </nav>              
            </div>
         </header>

			<!-- Footer -->
			<footer id="footer"> </footer>

		</div>
	</div>
<script>
		window.onload = function() {
			document.body.className = '';
		}
		window.ontouchmove = function() {
			return false;
		}
		window.onorientationchange = function() {
			document.body.scrollTop = 0;
		}
	</script>
</body>
</html>