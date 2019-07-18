<%-- 
    Document   : addproduct
    Created on : Jan 12, 2019, 3:12:05 AM
    Author     : Dell
--%>
 <script type="text/javascript" src="scripts/curditems.js">
         </script>
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
                  db.append("Add New Product</h2><form action='AdminControllerServlet' method='get'>");
                  db.append("<table border='2px'><tr><th>ProductName:</th><td><input  size='30' type='text' id='pname' name='pname'></td></tr>");
                  db.append("<tr><th>ProductType:</th><td><input  size='30' type='text' id='ptype' name='ptype'></td></tr>");
                  db.append("<tr><th>ProductPrice:</th><td><input  size='30' type='text' id='pprice' name='pprice'></td></tr>");
                  db.append("<tr><th>Product Desc:</th><td><input  size='30' type='text' id='pdesc' name='pdesc'></td></tr>");
                  db.append("<tr><th colspan='2'><form action='Images' method='post' enctype='multitype/data-form' ><input type='file' value='choose file' id='pimage' name='pimage'></form></th></tr>");
                  db.append("<tr><th><input type='submit' value='Add Product'></th><td align='center'><input type='button' value='clear'></td></tr>");
                  db.append("</table><span></span>");
                
                  
                  out.println(db);                       
                }
            %>