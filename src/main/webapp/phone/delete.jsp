<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String piNum = request.getParameter("piNum");
Connection con = DBCon.getCon();
String sql = "delete from PHONE_INFO where PI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, piNum);
int result = ps.executeUpdate();
if(result==1){
%>
<script>
	alert('정상적으로 제품이 삭제되었습니다.');
	location.href='/phone/list.jsp';
</script>
<%
}else{
%>
<script>
	alert('이미지 삭제된 제품입니다.');
	location.href='/phone/list.jsp';
</script>
<%
}
%>