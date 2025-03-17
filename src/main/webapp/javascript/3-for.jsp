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
		/*
		 * 1부터 100까지 출력하되 짝수만 출력하는 반복문
		 홀수만 출력하는 반복문
		 3의 배수만 출력하는 반복문
		 총 3개의 반복문을 완성해주세요.
		 */
		for (var i = 1; i <= 100; i++) {
			if (i % 2 == 0) {
				document.write(i + '<br>');
			}
		}
		for (var i = 1; i <= 100; i++) {
			if (i % 2 == 1) {
				document.write(i + '<br>');
			}
		}
		for (var i = 1; i <= 100; i++) {
			if (i % 3 == 0) {
				document.write(i + '<br>');
			}
		}
		/*
		해당 for문을 while문으로 변경해서 완성해주세요.
		*/
		var i=1;
		while(i<=100){
			if(i%2==0){
				document.write((i++) + '<br>');
			}
		}
	</script>
</body>
</html>