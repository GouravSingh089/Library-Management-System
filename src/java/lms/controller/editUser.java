/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lms.dao.StudentsDao;
import lms.dao.UserDao;
import lms.model.User;

/**
 *
 * @author Gourav
 */
@WebServlet("/userEdit")
public class editUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        try{
            
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        User user = new User(firstName, lastName, username, email, password);
        
        UserDao userDao = new UserDao();
        boolean update = userDao.updateEditUser(username,user);
            

        if(update){
            session.setAttribute("editSuccess", "Profile updated successfully...");
            response.sendRedirect("userProfile.jsp");
        }
        else{
            session.setAttribute("editFailed", "Failed to update Profile...");
            response.sendRedirect("userProfile.jsp");
        }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
    
}
