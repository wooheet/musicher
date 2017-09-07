<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
th,td{
	text-align: center;
	width: 400px;
}
</style>
<script type="text/javascript">	
	window.onload = function(){
		window.document.table.scroll ="auto";
	}
</script>
</head>
<body style="background-color: #FFF29E">

	<h1>내 음악 리스트</h1>
	<hr />
	
	<table align="center" class="table table-hover" style="width: 1200px;">
		<thead>
			<tr>
				<th>musicNo</th>
				<th>노래제목</th>
				<th>가수</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>

			<c:if test="${mymusiclist != null}">
				<c:forEach var="mymusic" items="${mymusiclist}">
					<tr>
						<td>${mymusic.music_id}</td>
						<td>${mymusic.title}</td>
						<td>${mymusic.singer}</td>	
						<td ><input type="button" style="width: 55px; height: 28px" class="btn btn-warning"
						 onclick="location.href='/Musicher/delmymusic.do?music_id=${mymusic.music_id}&mem_id=${loginUser.mem_id}'" value="삭제"></td>					
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

</body>
</html>