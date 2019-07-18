/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingcatalog.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import shoppingcatalog.dao.AdminDAO;
import shoppingcatalog.dao.StoreDAO;
import shoppingcatalog.dto.ItemDTO;
//import shoppingcatalog.dto.product;

/**
 *
 * @author Dell
 */
public class AdminControllerServlet extends HttpServlet {

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
      String pname=request.getParameter("pname");
      //product.setPname(pname);
      String ptype=request.getParameter("ptype");
      //product.setPtype(ptype);
      String pprice=request.getParameter("pprice");
      //product.setPprice(Double.parseDouble(pprice));
      String pdesc =request.getParameter("pdesc");
      //product.setPdesc(pdesc);
      String pimage =request.getParameter("pimage");
      //product.setPimage(pimage);
      String image =request.getParameter("image");
      String memberusername=request.getParameter("memberusername");
      String memberusertype=request.getParameter("memberusertype");
        
       HttpSession sess= request.getSession();
       if(sess.getAttribute("username")==null)
       {
      try{
        sess.invalidate();
         response.sendRedirect("accessdenied.html");return;
         }
      catch(Exception ex){}
       }
       
     if(sess.getAttribute("username")!=null&&request.getParameter("pimage")==null)
     {
          response.sendRedirect("seeoption.jsp");
     }
      try{
      if(memberusername!=null )
                {
                   System.out.println("Memberusername is: "+memberusername);
                   System.out.println("Memberusertype is: "+memberusertype);
                   System.out.println("admin user name is : "+sess.getAttribute("username"));
                    
                   if(sess.getAttribute("username").equals(memberusername) && memberusertype.equals("ADMIN"))
                    {
                         boolean remove=AdminDAO.removeUser(memberusername, memberusertype);
                         sess.invalidate();
                    }
                boolean remove=AdminDAO.removeUser(memberusername, memberusertype);
                    System.out.println("is user is removed? : "+remove);
                    
                }
      }
      catch(Exception ex){}
      
      
     if(request.getParameter("pimage")!=null)
     {  
        ItemDTO item =null;
        item=new ItemDTO();
        item.setItemName(pname);
        item.setItemType(ptype);
        item.setItemDesc(pdesc);
        item.setItemImage(pimage);
        item.setItemPrice(Double.parseDouble(pprice));
        try{
        boolean result=StoreDAO.addNewProduct(item);
        request.setAttribute("result", result);
        response.sendRedirect("ShowOptions.jsp");
        }
        catch(Exception ex)
        {System.out.println(ex);}
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
