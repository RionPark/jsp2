<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="dan">
<button onclick="make()">생성</button>
<div id="gugudan"></div>
<script>
function make(){
	var dan = document.getElementById('dan');
	alert(dan.value);
	//dan.value가 5라면 55단 table을 생성하여 gugudan div에 출력하고
	// 9라면 99단, 7이라면 77단 table을 생성하여 gugudan div에 출력하면 됩니다.
	var html = '<table border="1">';
	for(var i=1;i<=dan.value;i++){
		html += '<tr>';
		for(var j=1;j<=dan.value;j++){
			html += '<td>' + i + ' X ' + j + ' = ' + (i*j) +'</td>';
		}
		html += '</tr>';
	}
	html += '</table>';
	document.getElementById('gugudan').innerHTML = html;
}
</script>
</body>
</html>