<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<style>
table {
	border-collapse: separate;
}

th, td {
	text-align: left;
}

tr:nth-child(even) {
	background-color: white;
}

tr:nth-child(odd) {
	background-color: white;
}
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Musicher</title>
<script type="text/javascript">
	table = document.getElementById("tablelist");
	function createAddRow() {
		var num = window.prompt("업로드할 숫자를 입력하세요");
		for (var int = 1; int <= num; int++) {

			//1. 테이블에 row가 추가될때 삽입될 폼객체를 생성
			var title = document.createElement("input")
			title.setAttribute("type", "text")
			title.setAttribute("name", "title")
			
			var save = document.createElement("input")
			save.setAttribute("type", "text")
			save.setAttribute("name", "save")
			
			var gerne_id = document.createElement("input")
			gerne_id.setAttribute("type", "text")
			gerne_id.setAttribute("name", "gerne_id")
			
			var singer_id = document.createElement("input")
			singer_id.setAttribute("type", "text")
			singer_id.setAttribute("name", "singer_id")
			
			
			
			
			var upFile = document.createElement("input")
			upFile.setAttribute("type", "file")
			upFile.setAttribute("name", "upFile")
			var btnDel = document.createElement("input")
			btnDel.setAttribute("type", "button")
			btnDel.setAttribute("class", "btn btn-info")
			btnDel.setAttribute("value", "삭제")

			//2. 행이 추가될 테이블을 찾아오기
			var mytable = document.getElementById("tablelist");
			btnDel.setAttribute("onclick", "deleteRow(this)")
			

			//3. 테이블에 행<tr>을 추가하기

			var row = mytable.insertRow(mytable.rows.length);

			//4. 행에 각 셀을 추가하기
			var mycell01 = row.insertCell(0);
			var mycell02 = row.insertCell(1);
			var mycell03 = row.insertCell(2);
			var mycell04 = row.insertCell(3);
			var mycell05 = row.insertCell(4);
			var mycell06 = row.insertCell(5);

			//5. 셀에 양식태그를 추가
			mycell01.appendChild(title);
			mycell02.appendChild(save);
			mycell03.appendChild(gerne_id);
			mycell04.appendChild(singer_id);
			mycell05.appendChild(upFile);
			mycell06.appendChild(btnDel);
		}

	}
	

	function deleteRow(obj) {
		$(obj).parent().parent().remove();

	}
</script>
<body  style="background-color: #5CD1E5;">
<h1 style="padding-top: 10px"> Music Uplaod</h1>
<hr/>
	<div class="cd-full-width" style="padding-top: 10px">
		<div class="container-fluid js-tm-page-content" data-page-no="1"
			data-page-type="gallery">
			<div>
				
				<!-- Page 1 Gallery One -->
				<div style="padding-bottom: 10px; padding-left: 100px" align="left">
					<input type="button" value="업로드 추가" class="btn btn-primary"
						onclick="createAddRow()">
				</div>
				<hr/>
				<form method="post" enctype="multipart/form-data"
					action="/Musicher/upload.do">
					<table align="center" class="table table-hover" style="width: 1000px;" id="tablelist" border="1">

						<tr>
							<th>Title</th>
							<th>Save</th>
							<th>Gerne_id</th>
							<th>Singer_id</th>
							<th>File</th>
							<th>Delete</th>
						</tr>
						<tr>
							<td><input type="text" name="title" /></td>
							<td><input type="text" name="save" /></td>
							<td><input type="text" name="gerne_id" /></td>
							<td><input type="text" name="singer_id" /></td>
							<td><input type="file" name="upFile" /></td>
							<td><input type="button" class="btn btn-info"
								onclick="deleteRow(this)" value="삭제" /></td>

						</tr>


					</table>
					<hr/>
					<input type="submit" class="btn btn-primary" value="File upload" />
				</form>

			</div>
		</div>
	</div>

</body>
</html>