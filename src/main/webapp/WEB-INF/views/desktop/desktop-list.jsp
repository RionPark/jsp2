<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>번호</th>
		<th>견적명</th>
		<th>CPU</th>
		<th>RAM</th>
	</tr>
	<c:if test="${empty desktops }">
	<tr>
		<th colspan="4">게시물이 없습니다.</th>
	</tr>
	</c:if>
	<c:forEach items="${desktops}" var="desktop">
	<tr>
		<td>${desktop.diNum}</td>
		<td><a href="/desktop/desktop-view?diNum=${desktop.diNum}">${desktop.diName}</a></td>
		<td>${desktop.ciName}</td>
		<td>${desktop.diRam}</td>>
	</tr>
	</c:forEach>
</table>
</body>
</html>