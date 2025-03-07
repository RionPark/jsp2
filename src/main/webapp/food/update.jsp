<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>메뉴 수정</h3>
<%
String fiNum = request.getParameter("fiNum");
Connection con = DBCon.getCon();
String sql = "select FI_NUM, FI_NAME, FI_PRICE from FOOD_INFO where FI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, fiNum);
ResultSet rs = ps.executeQuery();
Map<String,String> food = new HashMap<>();
if(rs.next()){
	food.put("fiNum", rs.getString("FI_NUM"));
	food.put("fiName", rs.getString("FI_NAME"));
	food.put("fiPrice", rs.getString("FI_PRICE"));
}
if(food.isEmpty()){
%>
	이미 삭제된 메뉴입니다.<br>
	<a href="/food/list.jsp">메뉴판 돌아가기</a>
<%
}else{
%>
<form method="GET" action="/food/update-ok.jsp">
	<input type="hidden" name="fiNum" value="<%=food.get("fiNum")%>">
	<table border="1">
		<tr>
			<th>메뉴명</th>
			<td><input type="text" name="fiName" value="<%=food.get("fiName")%>"></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="text" name="fiPrice" value="<%=food.get("fiPrice")%>"></td>
		</tr>
		<tr>
			<th colspan="2"><button>메뉴수정</button></th>
		</tr>
	</table>
</form>
<%
}
%>

</body>
</html>