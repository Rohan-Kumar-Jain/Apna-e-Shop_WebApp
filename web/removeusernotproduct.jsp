<%-- 
    Document   : alteruserdetails
    Created on : Jan 17, 2019, 10:45:50 AM
    Author     : win8.1
--%>

<%@page import="shoppingcatalog.dto.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shoppingcatalog.dao.AdminDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alter User Details</title>
         <link rel="stylesheet" type="text/css" href="styles/stylesheet.css">
        <script src="scripts/jquery.js"></script>
        <script src="scripts/controlitems.js"></script>
    </head>
    <body>
           <link rel="stylesheet" type="text/css" href="styles/stylesheet.css">
      <%
   
    String username = (String)session.getAttribute("username");
     if(username==null)
            {
                session.invalidate();
               response.sendRedirect("accessdenied.html");
               
            }
     else
     {
         
         ArrayList<UserDTO> order=AdminDAO.alterUserDetails();
         if(order.size()==0)
         {
             System.out.println("ArrayList recievd in alter user details is empty");
             return;
         }
         
         StringBuffer displayBlock=new StringBuffer("<h2>Welcome : <font color='white'>"+username+"</font></h2><h3><font color='green'>Complete User Details of <font color='blue'>Apna-E-Shop</font> are as follows :</font></h3></p>");
         displayBlock.append("<center>");
         displayBlock.append("<br><table border='1'>");
         displayBlock.append("<tr><th>User_Name</th><th>User_Type</th><th>Remove_User</th></tr>");
      
         for(UserDTO obj:order)
        {
         
            displayBlock.append("<tr><td><center>"+obj.getUserName()+"</center></td><td><center>"+obj.getUserType()+"</center></td><td><center><input type='button' value='Remove' onclick=removeUser('"+obj.getUserName()+"','"+obj.getUserType()+"')></center></td></tr>");
        }//","+obj.getUsertype()+
      displayBlock.append("</table>");
      displayBlock.append("</center>"); 
      displayBlock.append("<span id='alterusermsg'></span>");
    //   displayBlock.append("<h3><p><center><a href='seeoption.jsp'><strong> <--Back</strong></a></center></p></h3>");
      displayBlock.append("<h2 id='logout'><a href='LoginControllerServlet?logout=logout'>Logout</a></h2>");
    
         out.println(displayBlock);
     }


%>    
    </body>
</html>
