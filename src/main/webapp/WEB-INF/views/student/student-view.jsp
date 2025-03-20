<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/common/head.jsp"></c:import>
<style>
.container { 
	margin-top:20px;
}
.container table{
	width:100%;
}
.left{
	width:350px;
	float:left;
}
.right{
	width:350px;
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
<form method="POST" action="/course/si-ci-update" onsubmit="return validation()" id="frm">
<input type="hidden" name="siNum" value="${student.siNum}">
<div class="container">
	<div class="left">
		<table class="table table-bordered">
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
		<table class="table table-bordered">
			<tr>
				<th><input type="checkbox" id="allSiNum" onchange="allCheck(this)"></th>
				<th>수강번호</th>
				<th>수강명</th>
				<th>수강최대인원</th>
			</tr>
			<c:forEach items="${courses}" var="course">
			<tr>
				<td><input type="checkbox" name="ciNum" value="${course.ciNum}" ${course.siNum==0?"":"checked"}></td>
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
	<button type="button" onclick="doSubmit()">탈퇴하기</button>
</div>
</form>
<script>
function doSubmit(){
	const frm = document.querySelector('#frm');
	frm.action='/student/delete';
	frm.submit();
}
function allCheck(obj){
	const ciNums = document.querySelectorAll('[name=ciNum]');
	for(var i=0;i<ciNums.length;i++){
		ciNums[i].checked = obj.checked;
	}
}

function validation(){
	const ciNums = document.querySelectorAll('[name=ciNum]:checked');
	if(ciNums.length===0){
		alert('수강과목은 1개 이상 선택해야 합니다.');
		return false;
	}
	return true;
}
</script>
</body>
</html>