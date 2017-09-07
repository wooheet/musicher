<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
th,td{
	text-align: center;
	width:60px;
}
.wideTD{
	text-align: center;
	width: 250px;
}
li, .pagination{
	height: 5px
}
.page-link{
	height: 5px
}
</style>
</head>
<body style="background-color: #BCE9B7">

	<div class="container">
		<h1>음악리스트</h1>
		<hr />

		<table  align="center" class="table table-hover" style="width: 1000px;">
			<thead>
				<tr>
					<td>musicId</td>
					<td class="wideTD">title</td>
					<td class="wideTD">save</td>
					<td>genre</td>
					<td class="wideTD">singer</td>
					<td>추가</td>
					<td>삭제</td>
				</tr>
			</thead>
			<tbody>

				<c:if test="${musiclist != null}">
					<c:forEach var="m" items="${musiclist}">
						<tr>
							<td>${m.music_id}</td>
							<td class="wideTD">${m.title}</td>
							<td class="wideTD">${m.save}</td>
							<td>${m.genre_id}</td>
							<td class="wideTD">${m.singer_id}</td>
							<td> <input type="button" class="btn btn-success" value="듣기"> 
							<!-- <a href="#" onclick="fcOpen()">듣기</a> --></td>
							<td><input type="button" class="btn btn-success" value="삭제"> </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<div>
		<ul class="pagination">
			<li class="page-item disabled"><a class="page-link"
				href="/Musicher/musiclist.do?pageno=${startpage}&ck=previous">Previous</a></li>

			<c:forEach var="pagenum" begin="${startpage}" end="${endpage}" step="1">
				<li class="page-item"><a class="page-link"
					href="/Musicher/musiclist.do?pageno=${pagenum}">${pagenum+1}</a></li>
			</c:forEach>
			
			<li class="page-item"><a class="page-link"
				href="/Musicher/musiclist.do?pageno=${startpage}&ck=next">Next</a>
			</li>
		</ul>
	</div>
</body>
</html>