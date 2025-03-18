<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
var arr = ['홍길동','김길동','이길동'];

document.write('for문<br>')
for(var i=0;i<arr.length;i++){
	var name = arr[i];
	document.write(name + '<br>');
}

document.write('for-in<br>')
for(var idx in arr){
	var name = arr[idx];
	document.write(name + '<br>');
}

document.write('for-of<br>');
for(var name of arr){
	document.write(name + '<br>');
}
</script>
</body>
</html>