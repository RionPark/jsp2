<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String fiName = request.getParameter("fiName");
String fiPrice = request.getParameter("fiPrice");
Connection con = DBCon.getCon();
String sql = "insert into FOOD_INFO(FI_NAME, FI_PRICE)VALUES(?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, fiName);
ps.setString(2, fiPrice);
int result = ps.executeUpdate();
if(result==1){
	out.println("정상적으로 메뉴가 추가되었습니다.<br>");
	out.println("<a href='/food/list.jsp'>메뉴판</a>");
}
%>
