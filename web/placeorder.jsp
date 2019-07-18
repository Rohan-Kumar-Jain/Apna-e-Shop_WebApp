<%-- 
    Document   : placeorder
    Created on : Jan 8, 2019, 8:03:58 PM
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
                  StringBuffer db =new StringBuffer("<h1>My Store-order details</h1><br><table border='2px'>");
                  Enumeration en=session.getAttributeNames();
                  int count=0;  
                  db.append("<tr><th>ItemName</th><td>ItemPrice</td><td>RemoveItem</td></tr>");
                   double aa=0;
                            
                       while(en.hasMoreElements())
                        {
                             String ss=(String)en.nextElement();
                             //double aa=0;
                             if(ss.equalsIgnoreCase("username")==false)
                             {
                              shoppingcatalog.dto.ItemDTO a3=(shoppingcatalog.dto.ItemDTO)session.getAttribute(ss.toString());
                              db.append("<tr id="+a3.getItemId()+"><th>"+a3.getItemName()+"</th><td>"+a3.getItemPrice()+"</td><td><a href='#' onclick='remove("+a3.getItemId()+","+a3.getItemPrice()+")'>Remove</a></td></tr>");
                              aa=aa+a3.getItemPrice();
                            
                             }
                        }
                   //    request.setAttribute("totalAmount",aa);
                  db.append("</table>");
                  db.append("<p ><b>Total price of your order:</b><span id='price'>"+aa+"</span></p>"); 
                  db.append("<p><a href='StoreControllerServlet'>continue Shopping</a>&nbsp;&nbsp;&nbsp;&nbsp;"); 
                  db.append("<a href='checkout.jsp?totalAmount=" + aa + "'>checkout</a></p>");
              //    db.append("<a href='checkout.jsp?totalAmount="+aa+"'>checkout</a></p>");
                  db.append("<h4 id='logout'><a href= 'myorders.jsp'>My Orders</a>&nbsp;&nbsp;&nbsp;<a href = 'LoginControllerServlet?logout=logout'>Logout</a></h4>");
                  out.println(db);                       
                }
            %>
    </body>
</html>
