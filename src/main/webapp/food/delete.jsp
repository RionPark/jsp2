<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

String fiNum = request.getParameter("fiNum");
String fiPrice = request.getParameter("fiPrice");
Connection con = DBCon.getCon();
String sql = "delete from FOOD_INFO where FI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, fiNum);
int result = ps.executeUpdate();
if(result==1){
	out.println("정상적으로 메뉴가 삭제되었습니다.<br>");
}else{
	out.println("이미 삭제된 메뉴입니다.<br>");
}
%>
<a href='/food/list.jsp'>메뉴판</a>