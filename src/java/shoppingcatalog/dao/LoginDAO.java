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
import static org.apache.tomcat.jni.User.uid;
import shoppingcatalog.dbutil.DBConnection;
import shoppingcatalog.dto.UserDTO;

/**
 *
 * @author Dell
 */
public class LoginDAO {
    
      private static PreparedStatement ps;
      static
      {
          try
          {
              Connection conn=DBConnection.getConnection();
      
            ps=conn.prepareStatement("select username from members where username=? and password=? and upper(membertype)=?");
       
          }catch(SQLException ex){
          
              System.out.println("error");}
      }
      
    public static boolean validateUser(UserDTO user) throws SQLException 
    {
       
       
        String userName=user.getUserName();
        String userType=user.getUserType();
        String password=user.getPassword();
        ps.setString(1,userName);
        ps.setString(2 , password);
        ps.setString(3, userType);
        ResultSet rs=ps.executeQuery();
        return rs.next();
        
    }
}
