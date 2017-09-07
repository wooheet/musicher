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
	width:100px;
}
.wide{
	text-align: center;
	width:250px;
}
</style>
</head>
<body style="background-color: #FFF29E">
	<h1>회원</h1>
	<hr />

	<table align="center" class="table table-hover" style="width: 1000px;">
		<thead>
			<tr>
				<th class="wide">아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>그룹</th>
				<th>회원삭제</th>
			</tr>
		</thead>
		<tbody>

			<c:if test="${memlist != null}">
				<c:forEach var="mem" items="${memlist}">
					<tr>
						<td class="wide">${mem.mem_id}</td>
						<td>${mem.name}</td>
						<td>${mem.gender}</td>
						<td>${mem.age}</td>
						<td>${mem.mem_group}</td>
						<td><input type="button" class="btn btn-warning"
							onclick="location.href='/Musicher/memdelete.do?mem_id=${mem.mem_id}'" value="삭제"> 
							<%-- <a href="/Musicher/memdelete.do?mem_id=${mem.mem_id}">삭제</a> --%></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	
	<div>
		<ul class="pagination">
			<li class="page-item disabled"><a class="page-link"
				href="/Musicher/memberlist.do?pageno=${startpage}&ck=previous">Previous</a></li>

			<c:forEach var="pagenum" begin="${startpage}" end="${endpage}" step="1">
				<li class="page-item"><a class="page-link"
					href="/Musicher/memberlist.do?pageno=${pagenum-1}">${pagenum}</a></li>
			</c:forEach>
			
			<li class="page-item"><a class="page-link"
				href="/Musicher/memberlist.do?pageno=${startpage}&ck=next">Next</a>
			</li>
		</ul>
	</div>

</body>
</html>