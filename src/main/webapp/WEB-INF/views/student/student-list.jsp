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
<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>수강갯수</th>
	</tr>
	<c:if test="${empty students }">
	<tr>
		<th colspan="3">학생이 없습니다.</th>
	</tr>
	</c:if>
	<c:forEach items="${students}" var="student">
	<tr>
		<td>${student.siNum}</td>
		<td><a href="/student/student-view?siNum=${student.siNum}">${student.siName}</a></td>
		<td>${student.cnt}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>