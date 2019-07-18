/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingcatalog.dao;

/**
 *
 * @author Dell
 */import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import shoppingcatalog.dbutil.DBConnection;
import shoppingcatalog.dto.ItemDTO;
import shoppingcatalog.dto.ItemInfoDTO;
import shoppingcatalog.dto.OrderDTO;
import shoppingcatalog.dto.OrderDetailDTO;
import shoppingcatalog.dto.VieworderDTO;

/**
 *
 * @author Dell
 */
public class StoreDAO {
    
      private static Statement ps1;
      private static PreparedStatement ps2;
      private static PreparedStatement ps3;
      private static Statement ps4;
      private static PreparedStatement ps5;
      private static PreparedStatement ps6;
      private static PreparedStatement ps7;
      private static PreparedStatement ps8;
       private static PreparedStatement ps11;
      private static PreparedStatement ps9;
       private static PreparedStatement ps12;
      
      
      static
      {
          try
          {
              Connection conn=DBConnection.getConnection();
      
         ps1=conn.createStatement();
         ps2=conn.prepareStatement("select id,item_name from store_items where item_type=? ");
         ps3=conn.prepareStatement("select * from store_items where id=?");
         ps4=conn.createStatement();
         ps5=conn.prepareStatement("insert into order_master values(?,?,?,?) ");
         ps6=conn.prepareStatement("insert into order_details values(?,?,?)");
         ps7=conn.prepareStatement("select*from order_master where cust_name=?");
         ps8=conn.prepareStatement(" select*from order_master,order_details where order_master.order_id=order_details.order_id and order_details.order_id=?");
     ps11=DBConnection.getConnection().prepareStatement("Select max(id) as count from store_items");
            ps9=DBConnection.getConnection().prepareStatement("Insert into store_items values(?,?,?,?,?,?)");
         ps12=conn.prepareStatement("select*from order_master");
          }catch(SQLException ex){
          
              System.out.println("error");}
      }
      
    public static ArrayList<String> getItemTypes() throws SQLException 
    {
       
       String s="select distinct item_type from store_items ";
       ResultSet rs=ps1.executeQuery(s);
       ArrayList <String > array=new ArrayList<>();
       
        while( rs.next())
        {
            String ss=rs.getString(1);
         array.add(ss);
        }
        return array;
    }
     public static ArrayList<ItemInfoDTO> getItemByType(String itemType) throws SQLException 
    {
       
       
        ps2.setString(1,itemType);
        //ps.setString(2 , password);
       // ps.setString(3, userType);
        ResultSet rs=ps2.executeQuery();
        //return rs.next();
         ArrayList <ItemInfoDTO > aarray=new ArrayList<>();
       
        while( rs.next())
        {
            int ss=rs.getInt(1);
            String sss=rs.getString(2);System.out.println(sss);
            ItemInfoDTO s=new ItemInfoDTO();
            s.setItemId(ss);s.setItemName(sss);
            aarray.add(s);
        }
        return aarray;
        
      
    }
       public static ItemDTO getItemDetails(int id) throws SQLException 
    {
       
       
        ps3.setInt(1,id);
        ResultSet rs=ps3.executeQuery();
        ItemDTO s=new ItemDTO();
       
       if( rs.next())
        {
            int s1=rs.getInt(1);
            String s2=rs.getString(2);
            String s3=rs.getString(3);
            double s4=rs.getDouble(4);
            String s5=rs.getString(5);
            String s6=rs.getString(6);
            s.setItemId(s1);s.setItemName(s3);s.setItemType(s2);s.setItemPrice(s4);s.setItemDesc(s5);s.setItemImage(s6);
        }
        return s;
        
      
    }
       
        public static boolean addOrders(String custName,ArrayList<ItemDTO> itemList,double totalAmount) throws SQLException 
    {
        System.out.println(totalAmount);
       
         String s="select count(*) from order_master";
         ResultSet rs=ps4.executeQuery(s);
         rs.next();
         int s1=rs.getInt(1);
         String nextId="ORD-00"+(s1+1);
            
         ps5.setString(1, nextId);
         ps5.setString(2, custName);
         ps5.setDouble(3, totalAmount);
         java.util.Date today=new java.util.Date();
         long ms=today.getTime();
         java.sql.Date currDate=new java.sql.Date(ms);
         ps5.setDate(4, currDate);
         int ans1=ps5.executeUpdate();
         
         int count=0;
         System.out.println("record inserted in order master:"+ans1);
         for(ItemDTO item:itemList)
         {
         ps6.setString(1, nextId);
         ps6.setString(2,item.getItemName() );
         ps6.setDouble(3, item.getItemPrice());
       //  ps5.setString(1, nextId);
        int ans2=ps6.executeUpdate();
         if(ans2==1)
         {
             ++count;
             System.out.println("record inserted in order details:"+ans2);
         }
         
         }
         return (ans1==1&&count==itemList.size());
    }
        
        public static  ArrayList<OrderDTO> getOrdersByCustomer(String custName) throws SQLException 
    { 
         ArrayList <OrderDTO > orderList=new ArrayList<>();
          ps7.setString(1, custName);
          ResultSet rs=ps7.executeQuery();
             while( rs.next())
        {
            OrderDTO obj=new OrderDTO();
            String s1=rs.getString(1);
            double s2=rs.getDouble(3);
            Date s3=rs.getDate(4);
           // obj.getOrderId(s1);
            obj.setOrderId(s1);
            obj.setOrderDate(s3);
            obj.setOrderAmount(s2);
            orderList.add(obj);
           
        }
        return orderList;
        
        
        
    }
       
              public static  ArrayList<VieworderDTO> getOrders() throws SQLException 
    { 
         ArrayList <VieworderDTO > orderList=new ArrayList<>();
       //   ps12.setString(1, custName);
          ResultSet rs=ps12.executeQuery();
             while( rs.next())
        {
            VieworderDTO obj=new VieworderDTO();
            String s1=rs.getString(1);
            double s2=rs.getDouble(3);
            
            String s4=rs.getString(2);
            Date s3=rs.getDate(4);
            
           // obj.getOrderId(s1);
            obj.setOrderId(s1);
            obj.setOrderDate(s3);
            obj.setOrderAmount(s2);
            obj.setCustname(s4);
            orderList.add(obj);
           
        }
        return orderList;
        
        
        
    }
        
    public static  ArrayList<OrderDetailDTO> getDetailByOrderId(String orderId) throws SQLException 
    { 
         ArrayList<OrderDetailDTO> orderDe=new ArrayList<>();
         ps8.setString(1, orderId);
         ResultSet rs=ps8.executeQuery();
   
        while( rs.next())
        {     OrderDetailDTO sos=new OrderDetailDTO();
            String s1=rs.getString(1);
            double s2=rs.getDouble(3);
            Date s3=rs.getDate(4);
            double s4=rs.getDouble(7);
            String s5=rs.getString(6);
            sos.setOrderId(s1);sos.setOrderAmount(s2);sos.setOrderDate(s3);sos.setItemPrice(s4);sos.setItemName(s5);
            orderDe.add(sos); 
        }
      return orderDe;
        
    }
        
       public static boolean addNewProduct(ItemDTO obj)throws SQLException
{System.out.println("fdbsvsdvsvssssssssssssssssssss");
    ResultSet rs=ps11.executeQuery();
    rs.next();
    int lastId=rs.getInt(1);
    int nextId=lastId+1;
    ps9.setInt(1, nextId);
    ps9.setString(2, obj.getItemType());
    ps9.setString(3, obj.getItemName());
    ps9.setDouble(4, obj.getItemPrice());
    ps9.setString(5, obj.getItemDesc());
    ps9.setString(6, obj.getItemImage());System.out.println(obj.getItemName());
    int ans=ps9.executeUpdate();System.out.println("qqqqqqqqqqqqqqqq");
    return ans==1;
} 
}


