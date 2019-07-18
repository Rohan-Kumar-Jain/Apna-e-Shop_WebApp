/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingcatalog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import shoppingcatalog.dbutil.DBConnection;
import shoppingcatalog.dto.UserDTO;

/**
 *
 * @author Dell
 */
public class RegistrationDAO {
     private static PreparedStatement ps;
     private static PreparedStatement ps1; 
     static
      {
          try
          {
              Connection conn=DBConnection.getConnection();
      
            ps=conn.prepareStatement("select username from members where username=? and upper(membertype)='CUSTOMER'");
            ps1=conn.prepareStatement("insert into members values(?,?,?)");
      
          }catch(SQLException ex){
          
              System.out.println("error");}
      }
     
    public static boolean searchUser(String username)throws SQLException
    {
    //     String userName=user.getUserName();
       ps.setString(1,username);
      ResultSet rs=ps.executeQuery();
        return rs.next();
       
    }
    public static boolean registerUser(UserDTO user) throws SQLException
    {
         String userName=user.getUserName();
        String userType=user.getUserType();
        String password=user.getPassword();
        ps1.setString(1,userName);
        ps1.setString(2 , password);
        ps1.setString(3, userType);
        int x=ps1.executeUpdate();
        if(x>0)
        {return true;}
        else
        {return false;}
    }
}
