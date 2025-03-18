<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="gugu"></div>
<script>
// id가 gugu인 div안에 1단부터 9단까지의 table html을 만들어서
// innerHTML을 활용하여 테이블을 출력해주세요.
// 다중 for문을 사용
var guguDiv = document.getElementById('gugu');
var html ='<table border="1">';
for(var i=1;i<=9;i++){
	html += '<tr>';
	for(var j=1;j<=9;j++){
		html += '<td>' + i + ' X ' + j + ' = ' + (i*j) + '</td>';
	}
	html += '</tr>';
}
html += '</table>';
guguDiv.innerHTML = html;
</script>
</body>
</html>