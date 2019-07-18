/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingcatalog.dbutil;

/**
 *
 * @author Dell
 */
import java.sql.Connection;           //Explicit import
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Dell
 */
public class DBConnection {                  //donn't want to make an object of this class.
    
    
    private static Connection conn;           //that's why this is static.
 
    static
    {
        try
        {
         
            Class.forName("oracle.jdbc.OracleDriver");
            conn=DriverManager.getConnection("jdbc:Oracle:thin:@//DESKTOP-84TVMJT:1521/XE", "onlineshopping", "shopping");
         }
        catch(ClassNotFoundException ex)
        {
            System.out.println("ERROR LOADIING DRIVER CLASS"+ex);
          
        }
        catch(SQLException ex)
        {
            System.out.println("SQLError"+ex);
        }
    }
    public static Connection getConnection()
    {
        return conn;
    }
    public static void closeConnection()
    {
          try
          {
              conn.close();
          }
          catch(SQLException ex)
          {
              System.out.println("Exception in closing connection");
          }
    }   
}

