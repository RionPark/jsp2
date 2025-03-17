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
		<th>메뉴</th>
		<th>가격</th>
		<th>작성자</th>
	</tr>
	<c:if test="${empty foods }">
	<tr>
		<th colspan="4">게시물이 없습니다.</th>
	</tr>
	</c:if>
	<c:forEach items="${foods}" var="food">
	<tr>
		<td>${food.fiNum}</td>
		<td><a href="/food/food-view?biNum=${food.fiNum}">${food.fiName}</a></td>
		<td>${food.fiPrice}</td>
		<td>${food.uiName}</td>
	</tr>
	</c:forEach>
</table>
<a href="/food/food-insert">메뉴등록</a>
</body>
</html>