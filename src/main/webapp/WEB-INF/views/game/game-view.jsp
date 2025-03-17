<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST" action="/game/delete">
	<input type="hidden" name="giNum" value="${game.giNum }">
	<table border="1">
		<tr>
			<th>번호</th>
			<td>${game.giNum}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${game.giName}</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${game.giPrice}</td>
		</tr>
		<tr>
			<th>장르</th>
			<td>${game.giGenre}</td>
		</tr>
		<tr>
			<th>설명</th>
			<td>${game.giDesc}</td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="button" onclick="location.href='/game/game-update?giNum=${game.giNum}'">수정</button>
				<button>삭제</button>
			</th>
		</tr>
	</table>
</form>
<a href="/game/game-list">게시판</a>
</body>
</html>