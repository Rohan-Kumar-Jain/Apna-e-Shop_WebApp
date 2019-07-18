/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingcatalog.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import shoppingcatalog.dbutil.DBConnection;
import shoppingcatalog.dto.ItemInfoDTO;

/**
 *
 * @author Dell
 */
public class OptionDAO {
       private static Statement ps;
      static
      {
          try
          {
              Connection conn=DBConnection.getConnection();
      
            ps=conn.createStatement();
       
          }catch(SQLException ex){
          
              System.out.println("error");}
      }
      
    public static ArrayList<ItemInfoDTO> getId() throws SQLException 
    {
       
        ResultSet rs=ps.executeQuery("select * from store_items");
        ArrayList <ItemInfoDTO > aarray=new ArrayList<>();
       
        while( rs.next())
        {
            int ss=rs.getInt(1);
            String sss=rs.getString(3);
            ItemInfoDTO s=new ItemInfoDTO();
            s.setItemId(ss);s.setItemName(sss);
            aarray.add(s);
        }
        return aarray;
        
    }
}
