<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/common/head.jsp"></c:import>
<style>
.click:hover{
	cursor:pointer;
	font-weight:bold;
}
</style>
<body>
<div class="container">
	<table class="table table-bordered table-hover">
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
		<tr class="click" onclick="goPage(${student.siNum})">
			<td>${student.siNum}</td>
			<td>${student.siName}</td>
			<td>${student.cnt}</td>
		</tr>
		</c:forEach>
	</table>
</div>
<script>
function goPage(siNum){
	location.href='/student/student-view?siNum=' + siNum;
}
</script>
</body>
</html>