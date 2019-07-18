<%-- 
    Document   : registrationresponse
    Created on : Jan 5, 2019, 3:33:31 AM
    Author     : Dell
--%>

<%
boolean result=(boolean) request.getAttribute("result");
boolean userFound=(boolean) request.getAttribute("userFound");

if(result==true&&userFound==false)
{
    out.println("success");
    
}
else if(result==false&&userFound==false)
{
    out.println("failure");
}
else
{
    out.println("uap");
}
%>