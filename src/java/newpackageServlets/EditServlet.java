/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package newpackageServlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import newpackageDao.UserDao;
import newpackageEntities.Message;
import newpackageEntities.UserInfo;
import newpackageHelper.ConnectionProvider;
import newpackageHelper.Helper;

@MultipartConfig
public class EditServlet extends HttpServlet {

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
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            //fetech all data
            String name=request.getParameter("user_name");
             String email=request.getParameter("user_email");
              String password=request.getParameter("user_password");
              String about=request.getParameter("user_about");
             
              
              //created class called to fetch the data of profile picture
              //HERE HUM JO NEW PHOTO SAVE KRRHE HAI USKA NAAM AAYEGA
              //ISLIYE WE WERE NOT ABLE TO REMOVE PREVIOUS PHOTO
              Part part=request.getPart("user_profile");
               String imageName = part.getSubmittedFileName();
               
               //get the user from the session
               //with the session hum USER KI PURANI DETAILS KO FETCH KREGE AND WILL UPDATE THEM
               HttpSession s=request.getSession();
               UserInfo user=(UserInfo)s.getAttribute("CurrentUser");
               user.setName(name);
               user.setEmail(email);
               user.setPassword(password);
               user.setAbout(about);
               // OR IDHAR HUMNE NEW PHOTO DATABASE ME BHI DAAL DI HAI
               String oldProfile=user.getProfile();
               user.setProfile(imageName);
               
               //HUMNE DATA SET KRDIYA HAI USERINFO WALI CLASS ME AND 
               //AB DATABASE ME BHI DATA KO UPDATE KRNA HAI
               //update Databse
               //here since UserDao is non static that why make its object
               
               UserDao userDao = new UserDao(ConnectionProvider.getConnection());
               boolean ans=userDao.updateUser(user);
               if(ans==true){
                   //that means your data has been updated successfully
                   String pathOfpreviosPhoto = request.getRealPath("/")+"pics"+File.separator+oldProfile;
                   String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
                  
                   Helper.deleteFile(pathOfpreviosPhoto);
                   if(Helper.saveFile(part.getInputStream(), path)){
                     //if it is true that means your photo has been updated
                      Message msg=new Message("Edited Successfully!!","success","alert-success");
               
                s.setAttribute("msg",msg);
                response.sendRedirect("profile.jsp");
                   }
                   else{
                   ///profile photo is not updated
                    Message msg=new Message("Something went wrong please try again!!","error","alert-error");
               
                s.setAttribute("msg",msg);
                response.sendRedirect("profile.jsp");
                   }
               }
               else{
                  Message msg=new Message("Something went wrong please try again!!","error","alert-error");
               
                s.setAttribute("msg",msg);
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
