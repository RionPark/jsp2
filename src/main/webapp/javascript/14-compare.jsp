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
var n1 = 1;
var n2 = '1';
document.write((n1==n2) + '<br>'); //true 값만비교
document.write((n1===n2) + '<br>'); // false 값과 데이터타입까지 비교

document.write((n1!=n2) + '<br>'); // false 값만비교
document.write((n1!==n2) + '<br>'); // true 값과 데이터타입까지 비교

n1 = 2;
n2 = '11';

n2 = window.parseInt(n2);
document.write((n1<n2) + '<br>');//true
document.write((n1<=n2) + '<br>');//true

</script>
</body>
</html>