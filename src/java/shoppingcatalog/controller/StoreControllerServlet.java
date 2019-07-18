/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingcatalog.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import shoppingcatalog.dao.StoreDAO;
import shoppingcatalog.dto.ItemDTO;
import shoppingcatalog.dto.ItemInfoDTO;
import shoppingcatalog.dto.OrderDetailDTO;

/**
 *
 * @author Dell
 */
public class StoreControllerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       RequestDispatcher rd=null;
      
       HttpSession sess= request.getSession();
       if(sess.getAttribute("username")==null)
       {
      try{
        sess.invalidate();
         response.sendRedirect("accessdenied.html");return;
         }
      catch(Exception ex){}
       }
       
       String itemType= request.getParameter("itemType");
       String itemId=request.getParameter("itemId");
       String orderId=request.getParameter("orderId");
       try
       {
       if(itemType==null&&itemId==null&&orderId==null)
       {//System.out.println("rohan");
              ArrayList<String> a1=new ArrayList<>();
              a1=  StoreDAO.getItemTypes();
              request.setAttribute("itemtype", a1);
              rd=request.getRequestDispatcher("seestore.jsp");         
       }
       else if(itemType!=null)
       {System.out.println("dxvv");
           ArrayList<ItemInfoDTO> a2=null;
           a2=StoreDAO.getItemByType(itemType);
           request.setAttribute("itemname", a2);
           rd=request.getRequestDispatcher("showitemsbytype.jsp");         
      
       }
       else if(orderId!=null)
       {  
           ArrayList<OrderDetailDTO> a4=null;
           a4=StoreDAO.getDetailByOrderId(orderId);
           request.setAttribute("orderDetails", a4);
           rd=request.getRequestDispatcher("orderdetails.jsp");         
      }
       else
       { System.out.println("pa");
           ItemDTO a3=new ItemDTO();
           a3=StoreDAO.getItemDetails(Integer.parseInt(itemId));
           request.setAttribute("itemdetail", a3);
           rd=request.getRequestDispatcher("showitemdetails.jsp");         
      
           
       }
       }
          catch(SQLException ex)
        {
            request.setAttribute("exception", ex);
            rd=request.getRequestDispatcher("showexception.jsp");
            System.out.println(ex);
        }
        
        finally
        {
           
             rd.forward(request, response);
                
        }
        
       
       
       
       
       
       
       
       
       
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
