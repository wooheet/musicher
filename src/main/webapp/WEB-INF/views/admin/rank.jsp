<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>순위</h1>
	<hr />

	<table class="table">
		<thead>
			<tr>
				<th>순위</th>
				<th>이름</th>
			</tr>
		</thead>
		<tbody>

			<c:if test="${ranklist != null}">
				<c:forEach var="com" items="${ranklist}">
					<tr>
						<td>${com.ranking}</td>
						<td>${com.name}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

</body>
</html>