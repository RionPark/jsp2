<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>번호</th>
		<th>CPU명</th>
		<th>가격</th>
	</tr>
	<tbody id="tBody">
	</tbody>
</table>
<script>
var cpu1 = {
		ciNum : 1,
		ciName : 'I5-1세대',
		ciPrice: 100000,
		ciDesc : null
}

var cpu2 = {
		ciNum : 2,
		ciName : 'I7-2세대',
		ciPrice: 120000,
		ciDesc : null
}

var cpu3 = {
		ciNum : 3,
		ciName : 'I3-3세대',
		ciPrice: 70000,
		ciDesc : null
}

var cpu4 = {
		ciNum : 4,
		ciName : 'R3-3세대',
		ciPrice: 100000,
		ciDesc : null
}
var cpu5 = {
		ciNum : 5,
		ciName : 'R7-5세대',
		ciPrice: 300000,
		ciDesc : null
}

var cpus = [cpu1, cpu2, cpu3, cpu4, cpu5];
var html = '';
for(var i=0;i<cpus.length;i++){
	const cpu = cpus[i];
	html += '<tr>';
	html += '<td>' + cpu.ciNum + '</td>';
	html += '<td>' + cpu.ciName + '</td>';
	html += '<td>' + cpu.ciPrice + '</td>';
	html += '</tr>';
}
document.getElementById('tBody').innerHTML = html;
</script>
</body>
</html>