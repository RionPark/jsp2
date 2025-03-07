<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String piName = request.getParameter("piName");
String piPrice = request.getParameter("piPrice");
String piRelease = request.getParameter("piRelease");
String piVendor = request.getParameter("piVendor");

out.print(piName + ", " + piPrice + ", " + piRelease + ", " + piVendor);
Connection con = DBCon.getCon();
String sql = "insert into PHONE_INFO(PI_NAME, PI_PRICE, PI_RELEASE, PI_VENDOR)";
sql += " VALUES(?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, piName);
ps.setString(2, piPrice);
piRelease = piRelease.replace("-","");
ps.setString(3, piRelease);
ps.setString(4, piVendor);
int result = ps.executeUpdate();
if(result==1){
%>
<script>
	alert('정상적으로 입력되었습니다.');
	location.href='/phone/list.jsp';
</script>
<%
}
%>