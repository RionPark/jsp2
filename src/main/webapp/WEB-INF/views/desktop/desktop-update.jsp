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
<form method="POST" action="/desktop/update">
	<input type="hidden" name="diNum" value="${desktop.diNum}">
	<input type="text" name="diName" placeholder="견적이름" value="${desktop.diName}"><br>
	<select name="ciNum">
		<option>CPU</option>
		<c:forEach items="${cpus}" var="cpu">
			<option value="${cpu.ciNum}" ${desktop.ciNum==cpu.ciNum?"selected":""}>${cpu.ciName}</option>
		</c:forEach>
	</select><br>
	<input type="text" name="diRam" placeholder="메모리" value="${desktop.diRam}"><br>
	<input type="text" name="diSsd" placeholder="SSD" value="${desktop.diSsd}"><br>
	<input type="text" name="diDesc" placeholder="견적설명" value="${desktop.diDesc}"><br>
	<button>견적수정</button>
</form>
</body>
</html>