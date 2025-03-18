<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="id1" name="id" value="id1"><br>
<input type="text" id="id2" name="id" value="id2"><br>
<script>
//고전방식 
var id = document.getElementById('id1');
var ids = document.getElementsByName('id');
var tags = document.getElementsByTagName('input');
//es5부터
var id = document.querySelector('#id1');
var ids = document.querySelectorAll('[name=id]');
var tags = document.querySelectorAll('input');
</script>
</body>
</html>