<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
<style>
.table{
	margin-top : 10px;
}
</style>
</head>
<body class="text-center">
	<main class="w-75 m-auto">
		<form id="frm" action="/user/delete" method="POST" onsubmit="return checkDelete()">
		<table class="table table-bordered w-80">
			<tr>
				<th>번호</th>
				<td>${user.uiNum}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${user.uiName}</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${user.uiId}</td>
			</tr>
			<tr>
				<th>등급</th>
				<td>${user.uiGrade}</td>
			</tr>
			<tr>
				<th colspan="2">
					<button class="btn btn-info" type="button" onclick="location.href='/user/update'">정보수정</button>
					<button class="btn btn-danger">탈퇴</button>
				</th>
			</tr>
		</table>
		</form>
	</main>
<script>
function checkDelete(){
	return confirm('탈퇴하시겠습니까?');
}
</script>
</body>
</html>