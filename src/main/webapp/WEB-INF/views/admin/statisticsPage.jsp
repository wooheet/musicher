<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

</head>
<body style="background-color: pink">
	<!-- Page 1 Gallery One -->
	<div class="cd-full-width">
		<div class="container-fluid js-tm-page-content" data-page-no="1"
			data-page-type="gallery">
			<div class="col-sm-3">
				<h2>
					<span class="tm-white">통계</span>
				</h2>

				<h3>
					<a href="/Musicher/stat.do?group=m" style="color: white;"> 노래 </a>
				</h3>
				<h3>
					<a href="/Musicher/stat.do?group=s" style="color: white;"> 가수 </a>
				</h3>
				<h3>
					<a href="/Musicher/stat.do?group=g" style="color: white;"> 장르 </a>
				</h3>

			</div>

			<!-- 리스트 -->
			<div class="col-sm-7">
				<jsp:include page="${statpage}"></jsp:include>
			</div>
		</div>
	</div>

</body>
</html>