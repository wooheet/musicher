<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Parallelism by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" 	href="/Musicher/resources/genre_assets/css/main.css" />
<link rel="stylesheet" 	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="/Musicher/resources/pay_css/style.css">
<script>
/* $(document).ready(function() {
	var DBgender = "${loginUser.gender}"
	var genderSize = signupForm.gender.length;
	for(i=0; i<genderSize; i++){
		if(signupForm.gender[i].value == DBgender){
			signupForm.gender[i].checked=true;
			break;
		}
	} */
function btnsubmit(){	
	var con_test = confirm("회원정보를 수정하시겠습니까?");
	if(con_test == true){
		document.getElementById("signupForm").submit();
	}
}

function guestDel(){
	var con_test = confirm("탈퇴를 진행하시겠습니까?");
	if(con_test == true){
		location.href="/Musicher/delete.do?mem_id=${user.mem_id}"
	}
		
}
</script>
</head>
<body>
<div style="padding-bottom: 5%;">
</div>
	<div class="container" style="overflow: auto;">
		<form id="signupForm" method="post" action="/Musicher/update.do">
			<div >
				<h4 style="padding-bottom: 10px">Sign Up</h4>
				<div class="input-group input-group-icon" style="width: 100%">
					<input type="email" name="mem_id" placeholder="Email Adress"
						value="${user.mem_id}" readonly />
					<div class="input-icon">
						<i class="fa fa-envelope"></i>
					</div>
				</div>
				<div class="input-group input-group-icon" style="width: 100%">
					<input type="text" name="name" placeholder="Name"
						value="${user.name}" />
					<div class="input-icon">
						<i class="fa fa-user"></i>
					</div>
				</div>
				<div class="input-group input-group-icon" style="width: 100%">
					<input type="password" name="pass" placeholder="Password"
						value="${user.pass}" />
					<div class="input-icon">
						<i class="fa fa-key"></i>
					</div>
				</div>
			</div>
			<div>
				<div class="col-sm-6">
					<h4 style="padding-bottom: 10px">Age</h4>
					<div class="input-group" style="width: 100%">
						<input type="text" name="age" id="age" value="${user.age}" />
					</div>
				</div>
				<div class="col-sm-6">
					<h4 style="padding-bottom: 10px">Gender</h4>
					<div class="input-group" style="width: 100%">
						<c:choose>
							<c:when test="${loginUser.gender eq 'Female'}">
								<input type="radio" name="gender" value="male" id="gender-male"
									readonly />
								<label for="gender-male">Male</label>
								<input type="radio" name="gender" value="female"
									id="gender-female" checked="checked" readonly />
								<label for="gender-female">Female</label>
							</c:when>
							<c:otherwise>
								<input type="radio" name="gender" value="male" id="gender-male"
									checked="checked" readonly />
								<label for="gender-male">Male</label>
								<input type="radio" name="gender" value="female"
									id="gender-female" readonly />
								<label for="gender-female">Female</label>
							</c:otherwise>
						</c:choose>
					</div>
					<input type="hidden" name="mem_group" value="Free">
				</div>
			</div>
			
			<div>
				<div class="col-sm-6" >
					<input type="button" onclick="btnsubmit()" value="수정">
				</div>
				<div class="col-sm-6">
					<input type="button" onclick="guestDel()" value="탈퇴">
				</div>
			</div>
		</form>

	</div>
<div style="padding-bottom: 5%;">
</div>	


</body>
</html>

