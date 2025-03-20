<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>
</head>
<body>
<h3>게시물 등록</h3>
<form method="POST" action="/board/update">
	<input type="hidden" name="uiNum" value="${user.uiNum}">
	<input type="hidden" name="biNum" value="${board.biNum}">
	<table border="1">
		<tr>
			<th>제목</th>
			<td><input type="text" name="biTitle" value="${board.biTitle}"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${user.uiName}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="biContent">${board.biContent}</textarea></td>
		</tr>
		<tr>
			<th colspan="2">
				<button>수정</button>
			</th>
		</tr>
	</table>
</form>
</body>
</html>