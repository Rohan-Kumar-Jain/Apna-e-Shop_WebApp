<%-- 
    Document   : showitemsbytype
    Created on : Jan 5, 2019, 8:41:35 PM
    Author     : Dell
--%>

<%@page import="java.sql.*,java.util.*,java.io.*" %>

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
                     StringBuffer db=new StringBuffer("<ul>");
                //  System.out.println("rohanjain");
                  ArrayList<shoppingcatalog.dto.ItemInfoDTO> itemList=null;
                  itemList= ( ArrayList<shoppingcatalog.dto.ItemInfoDTO>)request.getAttribute("itemname");
                  for( shoppingcatalog.dto.ItemInfoDTO itemName:itemList)
                  {
                  db.append("<li id='"+itemName.getItemId()+"'><a href='StoreControllerServlet?itemId="+itemName.getItemId()+"'>"+itemName.getItemName()+"</a></li>");   
          
             }db.append("</ul>");
             out.println(db);
                            //db.append("<p id='"+itemType+"'><strong><a href='#' onclick=getitemNames('"+itemType+"')><span>+"+itemType+"</span></strong></a></p>");   
          
                  //db.append("<h4 id='logout'><a href= 'myorders.jsp'>My Orders</a>&nbsp;&nbsp;&nbsp;<a href = 'LoginControllerServlet?logout=logout'>Logout</a></h4>");
                  //out.println(db);
                  }
            %>
        