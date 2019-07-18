<%-- 
    Document   : checkout
    Created on : Jan 9, 2019, 4:00:30 AM
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
                  StringBuffer db =new StringBuffer("<h1>My Store-CheckOut Page</h1><br>");
                  db.append("<h3>Thank you for shopping with us!!</h3>");
                  db.append("<h3>Your Payment of Rs "+request.getParameter("totalAmount")+" is under processing!</h3>");
                 
                  Enumeration en=session.getAttributeNames();
                  int count=0;  
                  ArrayList<shoppingcatalog.dto.ItemDTO> aaa=new ArrayList<shoppingcatalog.dto.ItemDTO>(); 
                    while(en.hasMoreElements())
                        {
                             String ss=(String)en.nextElement();
                             if(ss.equalsIgnoreCase("username")==false)
                             {
                              shoppingcatalog.dto.ItemDTO a3=(shoppingcatalog.dto.ItemDTO)session.getAttribute(ss.toString());
                              aaa.add(a3);
                             }
                        }
                    try{
                     boolean t=shoppingcatalog.dao.StoreDAO.addOrders((String)session.getAttribute("username"), aaa, Double.parseDouble(request.getParameter("totalAmount")));
                    if(t==true)
                     {
                        System.out.println("papajain");
                     }
                    }
                    catch(Exception ex){}
                   
                  db.append("<p><a href='StoreControllerServlet'>shop again</a>&nbsp;&nbsp;&nbsp;&nbsp;</p>"); 
                //  db.append("<a href='myorders.jsp'>my orders</a></p>");
                  db.append("<h4 id='logout'><a href= 'myorders.jsp'>My Orders</a>&nbsp;&nbsp;&nbsp;<a href = 'LoginControllerServlet?logout=logout'>Logout</a></h4>");
                  out.println(db);                       
                }
            %>
    </body>
</html>
