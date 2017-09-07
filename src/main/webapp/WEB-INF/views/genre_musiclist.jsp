<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #BCE9B7">

	<div class="container">
		<h1>음악리스트</h1>
		<hr />

		<table class="table">
			<thead>
				<tr>
					<td>musicId</td>
					<td>title</td>
					<td>save</td>
					<td>genre</td>
					<td>singer</td>
					<td>추가</td>
				</tr>
			</thead>
			<tbody>

				<c:if test="${musiclist != null}">
					<c:forEach var="m" items="${musiclist}">
						<tr>
							<td>${m.music_id}</td>
							<td>${m.title}</td>
							<td>${m.save}</td>
							<td>${m.genre_id}</td>
							<td>${m.singer_id}</td>
							<td><a href="#" onclick="fcOpen()">듣기</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<div>
		<ul class="pagination">
			<li class="page-item disabled"><a class="page-link"
				href="/Musicher/genrelist.do?high=${high}&pageno=${startpage}&ck=previous">Previous</a></li>

			<c:forEach var="pagenum" begin="${startpage}" end="${endpage}" step="1">
				<li class="page-item"><a class="page-link"
					href="/Musicher/genrelist.do?high=${high}&pageno=${pagenum}">${pagenum+1}</a></li>
			</c:forEach>
			
			<li class="page-item"><a class="page-link"
				href="/Musicher/genrelist.do?high=${high}&pageno=${startpage}&ck=next">Next</a>
			</li>
		</ul>
	</div>
</body>
</html>