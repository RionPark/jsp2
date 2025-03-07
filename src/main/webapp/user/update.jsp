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
<h3>유저수정</h3>

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
<form method="GET" action="/user/insert-ok.jsp">
	<input type="text" name="uiName" placeholder="이름" value="<%=user.get("uiNum")%>"><br>
	<input type="text" name="uiAge" placeholder="나이" value="<%=user.get("uiAge")%>"><br>
	<input type="text" name="uiId" placeholder="아이디" value="<%=user.get("uiId")%>"><br>
	<input type="text" name="uiPhone" placeholder="전번" value="<%=user.get("uiPhone")%>"><br>
	<input type="text" name="uiAddress" placeholder="주소" value="<%=user.get("uiAddress")%>"><br>
	<input type="radio" name="uiTrans" value="1" 
	 <%="1".equals(user.get("uiTrans"))?"checked":""%> id="men"><label for="men">남</label>
	<input type="radio" name="uiTrans" value="2"
	 <%="2".equals(user.get("uiTrans"))?"checked":""%> id="women"><label for="women">여</label><br>
	<button>등록</button>
</form>
<%
}
%>
</body>
</html>