<%-- 
    Document   : updateproduct
    Created on : Jan 12, 2019, 3:38:00 AM
    Author     : Dell
--%>

<%@page import="shoppingcatalog.dao.OptionDAO"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
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
                  StringBuffer db =new StringBuffer("<h2>");
                  db.append("Update Product</h2><form enctype='multipart/form-data' action='AdminControllerServlet'>");                   
                  db.append("<table border='2px'><tr><th>Product Id:</th><td>");
                  db.append(" <select>");
                  ArrayList<shoppingcatalog.dto.ItemInfoDTO> a3=null;
                  a3=OptionDAO.getId();
                  for(shoppingcatalog.dto.ItemInfoDTO e:a3)
                  {
                      db.append("<option>"+e.getItemId()+"</option>");       
                  }
                  db.append("<select></td></tr>");
                  db.append("<tr><th>Product Name:</th><td><input  size='30' type='text' name='itemName'></td></tr>");
                  db.append("<tr><th>ProductType:</th><td><input  size='30' type='text' name='itemType'></td></tr>");
                  db.append("<tr><th>ProductPrice:</th><td><input  size='30' type='text' name='itemPrice'></td></tr>");
                  db.append("<tr><th>Product Desc:</th><td><input  size='30' type='text' name='itemDesc'></td></tr>");
                  db.append("<tr><th colspan='2'><input type='file' value='choose file' name=itemImage></th></tr>");
                  db.append("<tr><th><input type='submit' value='update Product'></th><td align='center'><input type='button' value='clear'></td></tr>");
                  db.append("</table><span></span>");
                
                  
                  out.println(db);                       
                }
            %>
