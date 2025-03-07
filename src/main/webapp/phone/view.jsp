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
String piNum = request.getParameter("piNum");
Connection con = DBCon.getCon();
String sql = "select PI_NUM, PI_NAME, PI_PRICE, PI_RELEASE, PI_VENDOR, CREDAT";
sql += " from PHONE_INFO";
sql += " where PI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,piNum);
ResultSet rs = ps.executeQuery();
Map<String,String> phone = new HashMap<>();
if(rs.next()){
	phone.put("piNum", rs.getString("PI_NUM"));
	phone.put("piName", rs.getString("PI_NAME"));
	phone.put("piPrice", rs.getString("PI_PRICE"));
	phone.put("piRelease", rs.getString("PI_RELEASE"));
	phone.put("piVendor", rs.getString("PI_VENDOR"));
	phone.put("credat", rs.getString("CREDAT"));
}

if(phone.isEmpty()){
%>
<script>
	alert('해당 제품은 이미 삭제되었습니다.');
	location.href='/phone/list.jsp';
</script>
<%
}else{
%>
<form method="GET" action="/phone/delete.jsp">
	<input type="hidden" name="piNum" value="<%=phone.get("piNum")%>">
	<table border="1">
		<tr>
			<th>제품명</th>
			<td><%=phone.get("piName") %></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><%=phone.get("piPrice") %></td>
		</tr>
		<tr>
			<th>출시일</th>
			<td><%=phone.get("piRelease") %></td>
		</tr>
		<tr>
			<th>회사</th>
			<td><%=phone.get("piVendor") %></td>
		</tr>
		<tr>
			<th colspan="2">
				<a href="/phone/update.jsp?piNum=<%=phone.get("piNum")%>"><button type="button">수정</button></a>
				<button>삭제</button>
			</th>
		</tr>
	</table>
</form>
<%
}
%>
</body>
</html>