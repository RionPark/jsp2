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
<form method="GET" action="/game/game-list">
	<select name="search">
		<option value="giName" ${param.search=="giName"?"selected":""}>게임명</option>
		<option value="giPrice" ${param.search=="giPrice"?"selected":""}>가격</option>
		<option value="giGenre" ${param.search=="giGenre"?"selected":""}>장르</option>
		<option value="giDesc" ${param.search=="giDesc"?"selected":""}>설명</option>
	</select>
	<input type="text" name="searchStr" value="${param.searchStr}"><button>검색</button>
</form>
<table border="1">
	<tr>
		<th>번호</th>
		<th>게임</th>
		<th>가격</th>
	</tr>
	<c:if test="${empty games}">
	<tr>
		<th colspan="3">게임 목록이 없습니다.</th>
	</tr>
	</c:if>
	<c:forEach items="${games}" var="game">
	<tr>
		<td>${game.giNum}</td>
		<td><a href="/game/game-view?giNum=${game.giNum}">${game.giName}</a></td>
		<td>${game.giPrice}</td>
	</tr>
	</c:forEach>
	<tr>
		<th colspan="3"><button onclick="location.href='/game/game-insert'">등록</button></th>
	</tr>
</table>
</body>
</html>