<%@ page import='java.util.*' %>
<%
    
//    String orderId=(String)request.getParameter("orderId");
//    ArrayList<shoppingcatalog.dto.OrderDetailDTO> a4=null;
//         a4=shoppingcatalog.dao.StoreDAO.getDetailByOrderId(orderId);
        
   ArrayList<shoppingcatalog.dto.OrderDetailDTO> a3=(ArrayList<shoppingcatalog.dto.OrderDetailDTO>)request.getAttribute("orderDetails");
  shoppingcatalog.dto.OrderDetailDTO order1=a3.get(0);
  //System.out.println( a3.get(0).getItemName());
  //System.out.println( a3.get(1).getItemName());
   
   
   StringBuffer db =new StringBuffer("<h3>OrderDetails..</h3>");
   db.append("<table border='2px'>");
   db.append("<tr><th>OrderId</th><th>OrderAmount</th><th>OrderDate</th>");
   db.append("<th>ItemName</th><th>ItemPrice</th></tr>");
   db.append("<tr><th>"+order1.getOrderId()+"</th><td>"+order1.getOrderAmount()+"</td><td>"+order1.getOrderDate()+"</td>");                    
   db.append("<th><span>");     
   System.out.println(order1.getItemName());                
   for( shoppingcatalog.dto.OrderDetailDTO order:a3)
     {
           db.append(order.getItemName());
           db.append("<br>");
//System.out.println(order.getItemName());
     //   db.append("<tr><th>"+order.getOrderId()+"</th><th>"+order.getItemName()+"</th></tr>");
     
     }
   db.append("</span></th>"); 
 db.append("<td><span>");     
                   
   for( shoppingcatalog.dto.OrderDetailDTO order:a3)
     {
           db.append(order.getItemPrice()+"<br>");
     }
   db.append("</td></tr></table>");
   out.println(db);
   
%>