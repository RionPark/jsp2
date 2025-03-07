<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 등록</title>
</head>
<body>
<h3>메뉴 등록</h3>
<form method="GET" action="/food/insert-ok.jsp">
	<table border="1">
		<tr>
			<th>메뉴명</th>
			<td><input type="text" name="fiName"></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="text" name="fiPrice"></td>
		</tr>
		<tr>
			<th colspan="2"><button>등록</button></th>
		</tr>
	</table>
</form>
</body>
</html>