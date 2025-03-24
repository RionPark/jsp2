<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 프로그램</title>
<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
</head>
<body>
안녕하세요<br>
이젠게시판에 오신것을 환영합니다.<br>
<c:if test="${empty user}">
	<a href="/views/user/login">로그인</a>
</c:if>
<c:if test="${!empty user}">
	<b>${user.uiName}</b>님 반갑습니다.<br>
	<a href="/user/view">My Page</a>
	<form method="POST" action="/user/logout">
		<button>로그아웃</button>
		<button type="button">회원탈퇴</button>
	</form>
</c:if>
</body>
</html>