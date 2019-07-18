
<%@ page import="java.io.*,java.util.*" %>
<html>
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
    <body >
    <%@ include file="logo.html"%>
            
            <%
                
                 if(session.getAttribute("username")==null)
                 {
                   //  System.out.println("rohanjain");
                     try{
                         session.invalidate();
                         response.sendRedirect("accessdenied.html");
                        }
                     catch(IOException ex){}
                 }
              else
                 {

                  StringBuffer db =new StringBuffer(" <h1><b>My Categories</b></h1><p>Select an Category to see its items.</p>");
                  ArrayList<String> itemList=null;
                  itemList= (ArrayList<String>)request.getAttribute("itemtype");
                  for(String itemType:itemList)
                  {
                   db.append("<p id='"+itemType+"'><strong><a href='#' onclick=getItemNames('"+itemType+"')><span>+"+itemType+"</span></strong></a></p>");   
                  }
                  db.append("<h4 id='logout'><a href= 'myorders.jsp'>My Orders</a>&nbsp;&nbsp;&nbsp;<a href = 'LoginControllerServlet?logout=logout'>Logout</a></h4>");
                  out.println(db);
                  }
            %>
                
    </body>
</html>
