<%-- 
    Document   : orderproduct
    Created on : Jun 20, 2019, 7:18:49 AM
    Author     : Dell
--%>

<%@page import="shoppingcatalog.dao.StoreDAO"%>
<%@ page import='java.util.*' %>
<%
    
//    String orderId=(String)request.getParameter("orderId");
//    ArrayList<shoppingcatalog.dto.OrderDetailDTO> a4=null;
//         a4=shoppingcatalog.dao.StoreDAO.getDetailByOrderId(orderId);
        
   ArrayList<shoppingcatalog.dto.VieworderDTO> a3=(ArrayList<shoppingcatalog.dto.VieworderDTO>)StoreDAO.getOrders();
 //shoppingcatalog.dto.VieworderDTO order1=a3.get(0);
  //System.out.println( a3.get(0).getItemName());
  //System.out.println( a3.get(1).getItemName());
   
   
   StringBuffer db =new StringBuffer("<h3>OrderDetails..</h3>");
   db.append("<table border='2px'>");
   db.append("<tr><th>OrderId</th><th>OrderAmount</th><th>OrderDate</th>");
   db.append("<th>CustomerName</th></tr>");
  // db.append("<tr><th>"+order1.getOrderId()+"</th><td>"+order1.getOrderAmount()+"</td><td>"+order1.getOrderDate()+"</td><th>"+order1.getCustname()+"</th></tr>");                    
    
   //System.out.println(order1.getItemName());                
   for( shoppingcatalog.dto.VieworderDTO order:a3)
     {
           db.append("<tr><th>"+order.getOrderId()+"</th><td>"+order.getOrderAmount()+"</td><td>"+order.getOrderDate()+"</td><th>"+order.getCustname()+"</th></tr>");
           db.append("<br>");
//System.out.println(order.getItemName());
     //   db.append("<tr><th>"+order.getOrderId()+"</th><th>"+order.getItemName()+"</th></tr>");
     
     }
   db.append("</span></th>"); 
 db.append("<td><span>");     
                   
   
   db.append("</td></tr></table>");
   out.println(db);
   
%>