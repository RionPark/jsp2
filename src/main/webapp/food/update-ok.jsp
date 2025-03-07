<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String fiNum = request.getParameter("fiNum");
String fiName = request.getParameter("fiName");
String fiPrice = request.getParameter("fiPrice");
Connection con = DBCon.getCon();
String sql ="update FOOD_INFO\r\n"
		+ "set FI_NAME=?,\r\n"
		+ "FI_PRICE=?\r\n"
		+ "where FI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, fiName);
ps.setString(2, fiPrice);
ps.setString(3, fiNum);
int result = ps.executeUpdate();
if(result==1){
	out.println("정상적으로 메뉴가 수정되었습니다.<br>");
}else{
	out.println("이미 삭제된 메뉴입니다.<br>");
}
%>
<a href='/food/list.jsp'>메뉴판</a>