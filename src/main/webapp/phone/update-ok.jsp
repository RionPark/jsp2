<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String piNum = request.getParameter("piNum");
String piName = request.getParameter("piName");
String piPrice = request.getParameter("piPrice");
String piRelease = request.getParameter("piRelease");
String piVendor = request.getParameter("piVendor");

Connection con = DBCon.getCon();
String sql ="update PHONE_INFO\r\n"
		+ "set PI_NAME=?,\r\n"
		+ "PI_PRICE=?,\r\n"
		+ "PI_RELEASE=?,\r\n"
		+ "PI_VENDOR=?\r\n"
		+ "where PI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, piName);
ps.setString(2, piPrice);
piRelease = piRelease.replace("-","");
ps.setString(3, piRelease);
ps.setString(4, piVendor);
ps.setString(5, piNum);
int result = ps.executeUpdate();
if(result==1){
%>
<script>
	alert('정상적으로 수정되었습니다.');
	location.href='/phone/view.jsp?piNum=<%=piNum%>';
</script>
<%
}else{
%>
<script>
	alert('이미 삭제된 상품입니다.');
	location.href='/phone/list.jsp?piNum=<%=piNum%>';
</script>
<%
}
%>