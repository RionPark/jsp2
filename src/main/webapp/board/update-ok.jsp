<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String biNum = request.getParameter("biNum");
String biTitle = request.getParameter("biTitle");
String biContent = request.getParameter("biContent");
String biWriter = request.getParameter("biWriter");

Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/ezen";
Connection con = DriverManager.getConnection(url, "root", "r1r2r3");
String sql = "UPDATE BOARD_INFO ";
sql += " SET BI_TITLE=?,";
sql += " BI_WRITER=?,";
sql += " BI_CONTENT=?";
sql += " WHERE BI_NUM=?";

PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,biTitle);
ps.setString(2,biWriter);
ps.setString(3,biContent);
ps.setString(4,biNum);
int result = ps.executeUpdate();
if(result==1){
%>
<script>
	alert('수정 완료!!');
	location.href='/board/view.jsp?biNum=<%=biNum%>';
</script>
<%
}else{
%>
<script>
	alert('이미 삭제된 게시물 입니다.');
	location.href='/board/list.jsp';
</script>
<%
}
%>