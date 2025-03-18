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
	function test(){
		alert(1);
	}
	
	var i = test(); //undfined
	alert(i); //undifned

	test1(); // alert(2);
	function test1(){
		alert(2);
	}
	// javascript overloading이 없음!!
	function add(a){
		alert(a);
	}
	//javascript의 function의 parameter는 option!
	function add(a,b){
		alert(a); //undefined
		alert(1);
	}
	add();
	add(1);
	add(10,1);
	add(10,1,3);
</script>
</body>
</html>