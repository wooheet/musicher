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
	width: 300px;
}
</style>
</head>
<body style="background-color: pink">

	<h1>결제내역</h1>
	<hr />
	
	<table align="center" class="table table-hover" style="width: 900px;">
		<thead>
			<tr>
				<th>결제고유번호</th>
				<th>결제일</th>
				<th>결제금액</th>
			</tr>
		</thead>
		<tbody>

			<c:if test="${paylist != null}">
				<c:forEach var="pay" items="${paylist}">
					<tr>
						<td>${pay.pay_id}</td>
						<td>${pay.pay_date}</td>
						<td>${pay.price}원</td>						
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

</body>
</html>