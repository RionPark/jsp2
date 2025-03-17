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
<form method="POST" action="/food/insert">
	메뉴명 : <input type="text" name="fiName"><br>
	가격 : <input type="text" name="fiPrice"><br>
	<input type="hidden" name="uiNum" value="${user.uiNum}"><br>
	작성자 : ${user.uiName}<br>
	<button>메뉴등록</button>
</form>
</body>
</html>