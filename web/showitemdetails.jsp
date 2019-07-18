<%-- 
    Document   : showitemdetails
    Created on : Jan 5, 2019, 8:41:53 PM
    Author     : Dell
--%>
<%@page import="java.sql.*,java.util.*,java.io.*" %>

<head>
        <title>store page</title>
             <link rel="stylesheet" type="text/css" href="styles/stylesheet.css" >
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <script type="text/javascript" src="scripts/jquery.js">
         </script>
        <script type="text/javascript" src="scripts/showitems.js">
         </script>
         
</head>
 <%
             //   System.out.println("rohanjainjian");
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
                 shoppingcatalog.dto.ItemDTO itemList=null;
                  itemList= ( shoppingcatalog.dto.ItemDTO)request.getAttribute("itemdetail");
                  StringBuffer db=new StringBuffer("<h1>My Store-item details</h1><p><em>You are viewing: </em></br>");
                  db.append("<strong><a href='StoreControllerServlet'>"+itemList.getItemType()+"&gt;</a>"+itemList.getItemName()+"</strong></p>");
                db.append("<div style='float:left;'>");
                db.append("<img src=\'images/"+itemList.getItemImage()+"'></div>");
                System.out.println("<img src='images/"+itemList.getItemImage()+"'>");
                db.append("<div style='float:left;padding-left:12px'>");
                db.append("<p><strong>Description:</strong><br/>"+itemList.getItemDesc()+"</p>");
                db.append("<p><strong>Price:</strong>Rs "+itemList.getItemPrice()+"</p>");
                db.append("<p><a href='addtocart.jsp?itemId="+itemList.getItemId()+"'>Add to Cart</a></p></div>");
                db.append("<h4 id='logout'><a href='myorders.jsp'>My Orders</a>&nbsp;&nbsp;&nbsp;<a href='LoginControllerServlet?logout=logout'>Logout</a></h4>");
                db.append("<ul/>");
                out.println(db);
                  }
            %>
