
<%@ page import="java.io.*,java.util.*,java.sql.*" %>

<html>
    <head>
        <title>Login Page</title>
        <link rel="stylesheet" type="text/css" href="styles/stylesheet.css" >
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <script type="text/javascript" src="scripts/jquery.js">
        </script>
        <script type="text/javascript" src="scripts/registration.js">
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
           StringBuffer db =new StringBuffer(" <h1><b>My Store-Shopping cart</b></h1><h3><b>Item added Successfully!!</b></h3><br>");
           String ss=(String)request.getParameter("itemId");
           db.append("<p><b>ItemId:</b>"+ss+"</p>");   
           shoppingcatalog.dto.ItemDTO a3=null;
           a3=shoppingcatalog.dao.StoreDAO.getItemDetails(Integer.parseInt(ss));
           session.setAttribute(String.valueOf(a3.getItemId()),a3);
           db.append("<p><b>ItemName:</b>"+a3.getItemName()+"</p>");   
           Enumeration en=session.getAttributeNames();
           int count=0;
           while(en.hasMoreElements())
           {
            count++;
            en.nextElement();
           }
            db.append("<p><b>Total items in cart:</b>"+(count-1)+"</p>");
            db.append("<p><a href='StoreControllerServlet'>continue Shopping</a>&nbsp;&nbsp;&nbsp;&nbsp;"); 
            db.append("<a href='placeorder.jsp'>place orders</a></p>&nbsp;&nbsp;&nbsp;&nbsp;");
            db.append("<h4 id='logout'><a href= 'myorders.jsp'>My Orders</a>&nbsp;&nbsp;&nbsp;<a href = 'LoginControllerServlet?logout=logout'>Logout</a></h4>");
            out.println(db);
             }
          %>
    </body>
</html>
