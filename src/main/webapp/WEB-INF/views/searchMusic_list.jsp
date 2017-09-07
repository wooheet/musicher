<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Parallelism by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="/Musicher/resources/genre_assets/css/main.css" />
<noscript>
	<link rel="stylesheet"
		href="/Musicher/resources/genre_assets/css/noscript.css" />
</noscript>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
td {
	width: 70px;
	color: #2f2f2f;
}
#wideTd {
	width: 200px;
}
#haederTd {
	border-style: solid;
	border: 1px;
}
</style>
<script type="text/javascript">	
	function multicheckOn(){
		$('.multicheck').attr("style", "display:''");
		document.getElementById("multibtn").style.display ="none";	
	}
	window.onload = function(){
		window.document.body.scroll ="auto";
	}
</script>

</head>
<body >

	<div id="wrapper" style="overflow:auto;">
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

		<!-- Header Item -->
		
			<div align="center" class="container" style= " height:80% ; padding-top: 15px ">
				<h1>음악리스트</h1>
				<hr />
				<form name="checkForm" action="/Musicher/multiInsert.do" method="post">
				<table class="table table-hover">
					<thead>
						<tr id="haederTd">
							
							<td>musicId</td>
							<td id="wideTd">title</td>
							<td id="wideTd">save</td>
							<td>genre</td>
							<td id="wideTd">singer</td>
							<c:if test="${loginUser.mem_id !=null }">
								<td class="onecheck" style="display:'';">담기</td>
								<td align="center" class="multicheck" style="display: none;">선택</td>
							</c:if>
						</tr>
					</thead>
					<tbody>

						<c:if test="${musiclist != null}">
							<c:forEach var="m" items="${musiclist}">
								<tr>
									
									<td>${m.music_id}</td>
									<td id="wideTd">${m.title}</td>
									<td id="wideTd">${m.save}</td>
									<td>${m.genre_id}</td>
									<td id="wideTd">${m.singer_id}</td>
									<c:if test="${loginUser.mem_id !=null }">
										<td class="onecheck" style="display:'';">
											<a href="/Musicher/insertmymusic.do?music_id=${m.music_id}&mem_id=${loginUser.mem_id}" 
												style="color: black;">담기</a>
										</td>
										<td align="center" class="multicheck" style="display: none;">
												<input type="checkbox" class="box" name="chkbox" value="${m.music_id}" ></td>
									</c:if>			
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${loginUser.mem_id !=null }">
							<tr class="multicheck" style="display:none;">
								<td colspan="8" align="right"><input type="submit" value="mylist에담기"
									></td>
							</tr>
							<tr class="onecheck" id="multibtn" style="display:'';">
								<td colspan="8" ><input type="button" value="다중선택하기"
									onclick="multicheckOn()"></td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<!-- <input type="hidden" id="checkVals" name="checkVals" value=""/> -->
				<input type="hidden" name="mem_id" value="${loginUser.mem_id}"/>
				</form>
			</div>


			<div align="center">
				<ul class="pagination">
					<li class="page-item disabled"><a class="page-link"
						href="/Musicher/genrelist.do?high=${high}&pageno=${startpage}&ck=previous">Previous</a></li>

					<c:forEach var="pagenum" begin="${startpage}" end="${endpage}"
						step="1">
						<li class="page-item"><a class="page-link"
							href="/Musicher/genrelist.do?high=${high}&pageno=${pagenum-1}">${pagenum}</a></li>
					</c:forEach>

					<li class="page-item"><a class="page-link"
						href="/Musicher/genrelist.do?high=${high}&pageno=${startpage}&ck=next">Next</a>
					</li>
				</ul>
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
