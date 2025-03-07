<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="GET" action="/phone/insert-ok.jsp">
	<table border="1">
		<tr>
			<th>제품명</th>
			<td><input type="text" name="piName"></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="text" name="piPrice"></td>
		</tr>
		<tr>
			<th>출시일</th>
			<td><input type="date" name="piRelease"></td>
		</tr>
		<tr>
			<th>회사</th>
			<td><input type="text" name="piVendor"></td>
		</tr>
		<tr>
			<th colspan="2">
				<button>폰등록</button>
			</th>
		</tr>
	</table>
</form>
</body>
</html>