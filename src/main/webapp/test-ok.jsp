<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String siNum = request.getParameter("siNum");
String[] ciNums = request.getParameterValues("ciNum");
%>

siNum : <%=siNum%><br>
ciNum : <%
if(ciNums!=null){
	for(String ciNum:ciNums){
		out.print(ciNum + ",");
	}
}
%><br>