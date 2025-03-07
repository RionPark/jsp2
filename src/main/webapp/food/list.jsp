<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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
<%
Connection con = DBCon.getCon();
String sql = "select FI_NUM, FI_NAME, FI_PRICE from FOOD_INFO";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
List<Map<String,String>> foods = new ArrayList<>();
while(rs.next()){
	Map<String,String> food = new HashMap<>();
	food.put("fiNum", rs.getString("FI_NUM"));
	food.put("fiName", rs.getString("FI_NAME"));
	food.put("fiPrice", rs.getString("FI_PRICE"));
	foods.add(food);
}
%>
<table border="1">
	<tr>
		<th>번호</th>
		<th>메뉴</th>
		<th>가격</th>
	</tr>
<%
if(foods.isEmpty()){
%>
	<tr>
		<th colspan="3">메뉴가 없습니다.</th>
	</tr>
<%
}else{
	for(Map<String,String> food : foods){
%>
	<tr>
		<td><%=food.get("fiNum")%></td>
		<td><a href="/food/views.jsp?fiNum=<%=food.get("fiNum")%>"><%=food.get("fiName")%></a></td>
		<td><%=food.get("fiPrice")%></td>
	</tr>
<%
	}	
}
%>
	<tr>
		<td colspan="3" style="text-align:right"><a href="/food/insert.jsp">글쓰기</a></td>
	</tr>
</table>
</body>
</html>