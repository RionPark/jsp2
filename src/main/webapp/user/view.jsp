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
String uiNum = request.getParameter("uiNum");
Connection con = DBCon.getCon();
String sql ="select UI_NUM, UI_NAME, UI_AGE, UI_ID, \r\n"
		+ "UI_PWD, UI_PHONE, UI_ADDRESS, UI_TRANS\r\n"
		+ "from USER_INFO WHERE UI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,uiNum);
ResultSet rs = ps.executeQuery();
if(!rs.next()){
%>
	이미 삭제된 회원입니다.<br>
	<a href="/user/list.jsp">유저목록 돌아가기</a>
<%
}else{
	Map<String,String> user = new HashMap<>();
	user.put("uiNum", rs.getString("UI_NUM"));
	user.put("uiName", rs.getString("UI_NAME"));
	user.put("uiAge", rs.getString("UI_AGE"));
	user.put("uiId", rs.getString("UI_ID"));
	user.put("uiPwd", rs.getString("UI_PWD"));
	user.put("uiPhone", rs.getString("UI_PHONE"));
	user.put("uiAddress", rs.getString("UI_ADDRESS"));
	user.put("uiTrans", rs.getString("UI_TRANS"));
%>
	<table border="1">
		<tr>
			<th>유저번호</th>
			<td><%=user.get("uiNum") %></td>
		</tr>
		<tr>
			<th>유저이름</th>
			<td><%=user.get("uiName") %></td>
		</tr>
		<tr>
			<th>유저아이디</th>
			<td><%=user.get("uiId") %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%="1".equals(user.get("uiTrans"))?"남":"여"%></td>
		</tr>
		<tr>
			<th colspan="2">
				<a href="/user/update.jsp?uiNum=<%=user.get("uiNum") %>"><button>수정</button></a>
				<button>삭제</button>
			</th>
		</tr>
	</table>
<%
}
%>
</body>
</html>