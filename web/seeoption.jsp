<%-- 
    Document   : seeoption
    Created on : Jan 10, 2019, 10:28:05 PM
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
         <script type="text/javascript" src="scripts/curditems.js">
         </script>
        
    </head>
    <body >
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
                  StringBuffer db =new StringBuffer("<h1>Admin Option</h1>");
                  db.append("<h3>Select an catagory to take an action!</h3>");
                  db.append("<p><a href='#' id='Products' onclick=getItemNames('Products')>+Products</a>");
                  db.append("<ul style='display:none;' id='sProducts'><li><a href='#' id='Add' onclick=aud('add')>Add</a></li>"); 
                  db.append("<li><a href='#' id='update' onclick=aud('update')>Update</a></li>"); 
                  db.append("<li><a href='#' id='delete' onclick=aud('delete')>Delete</a></li></ul></p>"); 
                  
                  db.append("<p><a href='#' id='Users'onclick=getItemNames('Users')>+Users</a>"); 
                  db.append("<ul style='display:none;' id='sUsers'><li><a href='#'id='removeusernot' onclick=aud('removeusernot')>RemoveUsers</a></li></ul></p>"); 
                  
                  db.append("<p><a href='#' id='View' onclick=getItemNames('View')>+View</a>"); 
                  db.append("<ul style='display:none;' id='sView'><li><a href='#'  id='order' onclick=aud('order')>Orders</a></li></ul></p>");
                
                  db.append("<div style='display:none;position:absolute;bottom:40px;right:480px' id='div1' >");
                  db.append("</div>");
                
                  
                  out.println(db);                       
                }
            %>
    </body>
</html>
