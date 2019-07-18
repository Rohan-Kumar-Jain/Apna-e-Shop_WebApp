<%-- 
    Document   : myorders
    Created on : Jan 10, 2019, 8:48:02 PM
    Author     : Dell
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<html>
    <head>
        <title>Login Page</title>
             <link rel="stylesheet" type="text/css" href="styles/stylesheet.css" >
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <script type="text/javascript" src="scripts/jquery.js">
         </script>
         <script type="text/javascript" src="scripts/showitems.js">
         </script>
        
    </head>
    <body  onclick=erase('#r')>
        <%@ include file="logo.html"%>
        
        <%
                
               if(session.getAttribute("username")==null)
                 {
                      try{
                         session.invalidate();
                         response.sendRedirect("accessdenied.html");
                        }
                     catch(IOException ex){}
                 }
              else
                 {  
                  StringBuffer db =new StringBuffer("<h1>My Store-My order </h1>");
                   ArrayList<shoppingcatalog.dto.OrderDTO> a3=shoppingcatalog.dao.StoreDAO.getOrdersByCustomer((String)session.getAttribute("username"));
                             
                   if(a3.size()==0)
                   {
                      db.append("<p>you have not placed any order yet</p>");
                   }
                   else
                   {
                      java.text.SimpleDateFormat s=new java.text.SimpleDateFormat("dd-MMM-yyyy");
                        db.append("<table border='2px'>");   
                        db.append("<tr><th>OrderId</th><td>OrderAmount</td><td>OrderDate</td></tr>");
                for(shoppingcatalog.dto.OrderDTO e:a3)
                        {
                            String ss=s.format(e.getOrderDate());
                   db.append("<tr><th><a href='#' id='"+e.getOrderId()+"' onclick=details('"+e.getOrderId()+"')>"+ e.getOrderId()+"</a></th><td>"+e.getOrderAmount()+"</td><td>"+ss+"</td></tr>");                       
                        }
                
                   }   
                  db.append("</table>");
                 db.append("<p><a href='StoreControllerServlet'>show Categories</a>&nbsp;&nbsp;&nbsp;&nbsp;<div id='r' style='display:none;position:absolute;left:450px;top:300px';></div>"); 
                 db.append("&nbsp;&nbsp;&nbsp;<h4 id='logout'>&nbsp;&nbsp;&nbsp;<a href = 'LoginControllerServlet?logout=logout'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Logout</a></h4>");
                  out.println(db);                       
                }
            %>
    </body>
</html>
