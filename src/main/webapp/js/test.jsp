<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uiTrans = "2";
%> 

	<input type="radio" name="uiTrans" value="1" id="men" 
		<%="1".equals(uiTrans)?"checked":""%>><label for="men">남</label>
	<input type="radio" name="uiTrans" value="2" 
		<%="2".equals(uiTrans)?"checked":""%> id="women"><label for="women">여</label><br>
</body>
</html>