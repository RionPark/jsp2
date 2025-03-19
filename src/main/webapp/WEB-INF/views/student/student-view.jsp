<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/common/head.jsp"></c:import>
<style>

.left{
	width:400px;
	float:left;
}
.right{
	width:400px;
	float:right;
}
.bottom{
	clear:both;
	padding-top:20px;
	margin: 0 auto;
	text-align:center; 
}
</style>
<body>
<div class="container">
	<div class="left">
		<table border="1">
			<tr>
				<th>번호</th>
				<td>${student.siNum}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${student.siName}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${student.siAddress}</td>
			</tr>
			<tr>
				<th>수강갯수</th>
				<td>${student.cnt}</td>
			</tr>
		</table>
	</div>
	<div class="right">
		<table border="1">
			<tr>
				<th><input type="checkbox" id="allSiNum"></th>
				<th>수강번호</th>
				<th>수강명</th>
				<th>수강최대인원</th>
			</tr>
			<c:forEach items="${courses}" var="course">
			<tr>
				<td><input type="checkbox" name="siNum" value="${student.siNum}" ${course.siNum==0?"":"checked"}></td>
				<td>${course.ciNum}</td>
				<td>${course.ciName}</td>
				<td>${course.ciMax}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>
<div class="bottom">
	<button type="button" onclick="history.back()">돌아가기</button>
	<button>수강변경</button>
</div>
</body>
</html>