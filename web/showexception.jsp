<%-- 
    Document   : showexception
    Created on : Jan 4, 2019, 12:04:51 AM
    Author     : Dell
--%>

<%
Exception  e=(Exception )request.getAttribute("exception");
String msg="exception";
System.out.println("Exception is"+e);
out.println(msg);
%>