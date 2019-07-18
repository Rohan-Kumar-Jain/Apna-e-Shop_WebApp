<%-- 
    Document   : loginresponse
    Created on : Jan 3, 2019, 11:57:38 PM
    Author     : Dell
--%>

<%
    
boolean result=(boolean) request.getAttribute("result");
String userName=(String)request.getAttribute("username");
String userType=(String )request.getAttribute("usertype");
if(result==true&&userType.equalsIgnoreCase("customer"))
{
    
    String url="StoreControllerServlet;jsessionid="+session.getId();
    out.println(url);
    HttpSession sess=request.getSession();
    sess.setAttribute("username",userName);
    
}
else if(result==true&&userType.equalsIgnoreCase("admin"))
        {
    String url="AdminControllerServlet;jsessionid="+session.getId();
    out.println(url);
    HttpSession sess=request.getSession();
    sess.setAttribute("username",userName);
    
        }
else
{
    //System.out.println("czc sa");
    out.println("error");
    
}
%>