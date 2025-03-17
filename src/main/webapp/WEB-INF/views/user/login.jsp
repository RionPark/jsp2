<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h3>로그인</h3>
<form method="POST" action="/user/login">
	<input type="text" name="uiId" placeholder="아이디"><br>
	<input type="password" name="uiPwd" placeholder="비밀번호"><br>
	<button>로그인</button>
</form>
</body>
</html>