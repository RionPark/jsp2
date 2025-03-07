<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
<table border="1">
	<tr>
		<th>번호</th>
		<th>제품명</th>
		<th>가격</th>
		<th>출시일</th>
		<th>회사</th>
	</tr>
<%
Connection con = DBCon.getCon();
String sql = "select PI_NUM, PI_NAME, PI_PRICE, PI_RELEASE, PI_VENDOR, CREDAT";
sql += " from PHONE_INFO";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
List<Map<String,String>> phones = new ArrayList<>();
while(rs.next()){
	Map<String,String> phone = new HashMap<>();
	phone.put("piNum", rs.getString("PI_NUM"));
	phone.put("piName", rs.getString("PI_NAME"));
	phone.put("piPrice", rs.getString("PI_PRICE"));
	phone.put("piRelease", rs.getString("PI_RELEASE"));
	phone.put("piVendor", rs.getString("PI_VENDOR"));
	phone.put("credat", rs.getString("CREDAT"));
	phones.add(phone);
}
if(phones.isEmpty()){
%>
	<tr>
		<th colspan="5">등록된 휴대폰 데이터가 없습니다.</th>
	</tr>
<%
}else{
	for(Map<String,String> phone : phones){
%>
	<tr>
		<td><%=phone.get("piNum") %></td>
		<td><a href="/phone/view.jsp?piNum=<%=phone.get("piNum") %>"><%=phone.get("piName") %></a></td>
		<td><%=phone.get("piPrice") %></td>
		<td><%=phone.get("piRelease") %></td>
		<td><%=phone.get("piVendor") %></td>
	</tr>
<%
	}
}
%>
	<tr>
		<th colspan="5" style="text-align:right">
			<a href="/phone/insert.jsp">휴대폰 등록</a>
		</th>
	</tr>
</table>
</body>
</html>