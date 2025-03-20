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
<form method="POST" action="/board/insert" enctype="multipart/form-data">
	<input type="hidden" name="uiNum" value="${user.uiNum}">
	<table border="1">
		<tr>
			<th>제목</th>
			<td><input type="text" name="biTitle"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${user.uiName}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="biContent"></textarea></td>
		</tr>
		<tr>
			<th>파일</th>
			<td><input type="file" name="biFile"></td>
		</tr>
		<tr>
			<th colspan="2">
				<button>등록</button>
			</th>
		</tr>
	</table>
</form>
</body>
</html>