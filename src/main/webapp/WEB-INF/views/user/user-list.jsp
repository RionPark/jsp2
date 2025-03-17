<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<th>이름</th>
		<th>나이</th>
		<th>전화번호</th>
	</tr>
	<c:if test="${empty users}">
	<tr>
		<th colspan="4">유저목록이 없습니다.</th>
	</tr>
	</c:if>
	<c:forEach items="#{users}" var="user">
		<tr>
			<td>${user.uiNum}</td>
			<td><a href="/user/user-view?uiNum=${user.uiNum}">${user.uiName}</a></td>
			<td>${user.uiAge}</td>
			<td>${user.uiPhone}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>