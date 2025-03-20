<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST" action="/test-ok.jsp" id="frm">
	<input type="text" name="siNum" value="1"><br>
	<input type="checkbox" name="ciNum" value="1"><br>
	<input type="checkbox" name="ciNum" value="2"><br>
	<input type="checkbox" name="ciNum" value="3" checked><br>
	<input type="checkbox" name="ciNum" value="4" checked><br>
	<button type="button" onclick="doSubmit()">등록</button>
</form>
<script>
function doSubmit(){
	const frm = document.querySelector('#frm');
	frm.action = '/test-update.jsp';
	frm.submit();
}
</script>
</body>
</html>