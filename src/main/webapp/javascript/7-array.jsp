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
//java array
var arr = [10]
document.write(arr + '<br>');
arr[arr.length] = 20;
document.write(arr + '<br>');
arr.push(30);
document.write(arr + '<br>');
arr.pop();
document.write(arr + '<br>');
arr.splice(0,1);
document.write(arr + '<br>');
arr.unshift(10);
document.write(arr + '<br>');
arr.shift();
document.write(arr + '<br>');	
</script>
</body>
</html>