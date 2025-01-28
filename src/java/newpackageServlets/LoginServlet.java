/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package newpackageServlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import newpackageDao.UserDao;
import newpackageEntities.Message;
import newpackageEntities.UserInfo;
import newpackageHelper.ConnectionProvider;

/**
 *
 * @author harsh
 */
public class LoginServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            String userEmail=request.getParameter("email");
            String userPassword=request.getParameter("password");
            
            UserDao userDao=new UserDao(ConnectionProvider.getConnection());
            UserInfo user=userDao.getUserbyEmailandPassword(userEmail, userPassword);
            if(user==null){
                //that means user has registeted//MATLB USER KA DATA NAHI HAI DATABASE ME
                //login error msg
                Message msg=new Message("Invalid details! Try Again","error","alert-danger");
                HttpSession s=request.getSession();
                s.setAttribute("msg",msg);
                response.sendRedirect("login_page.jsp");
                //out.println("invalid details try again");
            }
            else{
            //keep the user logged in untill session expires that means
            //that means user login rhega jab tak session hai
            //JAB TAK USER LOGOUT NAHI KARTA TAB TAK LOGIN REHNE DO USER KO
            //login successfull
            
               //creating session object
               HttpSession s=request.getSession();
               s.setAttribute("CurrentUser", user);
               
               //redurect to profile page
               response.sendRedirect("profile.jsp");
               
            }
            
           
            out.println("</body>");
            out.println("</html>");
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
