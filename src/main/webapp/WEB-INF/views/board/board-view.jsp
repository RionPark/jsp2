<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
</head>
<body class="text-center">
	<div class="container">
		<form method="POST" action="/board/delete" onsubmit="return validation()">
		<table class="table table-bordred w-75">
			<tr>
				<th>제목</th>
				<td>${board.biNum}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${board.uiName}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td> 
					<pre>${board.biContent}</pre>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<c:if test="${user.uiNum == board.uiNum}">
						<button class="btn btn-primary" type="button" onclick="location.href='/board/board-update?biNum=${board.biNum}'">수정</button>
						<button class="btn btn-danger">삭제</button>
						<input type="hidden" name="biNum" value="${board.biNum}">
					</c:if>
					<button class="btn btn-secondary" type="button" onclick="location.href='/board/board-list'">돌아가기</button>
				</th>
			</tr>
		</table>
		</form>
	</div>
<script>
function validation(){
	return confirm('삭제 하시겠습니까?');
}
</script>
</body>
</html>