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
<c:if test="${user == null}">
	<a href="/user/login">로그인</a>
</c:if>
<c:if test="${user != null}">
	${user.uiName}님 안녕하세요.<br>
	<a href="/board/board-list">게시판</a>
</c:if>
</body>
</html>