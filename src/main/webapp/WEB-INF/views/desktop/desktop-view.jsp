<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST" action="/desktop/insert">
	<table border="1">
		<tr>
			<th>견적번호</th>
			<td>${desktop.diNum}</td>
		</tr>
		<tr>
			<th>견적명</th>
			<td>${desktop.diName}</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>${desktop.ciName}</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>${desktop.diRam}</td>
		</tr>
		<tr>
			<th>SSD</th>
			<td>${desktop.diSsd}</td>
		</tr>
		<tr>
			<th>견적설명</th>
			<td>${desktop.diDesc}</td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="button" onclick="location.href='/desktop/desktop-update?diNum=${desktop.diNum}'">수정</button>
				<button>삭제</button>
			</th>
		</tr>
	</table>
</form>
</body>
</html>