package lms.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lms.dao.RegisterDao;
import lms.model.User;


/**
 *
 * @author Gourav
 */
@WebServlet("/user-register")
public class registerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
         User user = new User(firstName, lastName, username, email, password);
        
        try{
           
       
  
        RegisterDao registerdao = new RegisterDao();
        boolean result = registerdao.registerUser(user);
        
        if(result){
            session.setAttribute("registerSucceed", "Successfully registered.");
            response.sendRedirect("register-page.jsp");
        }else{
           session.setAttribute("registerFailed", "Username/Email already taken..");
           response.sendRedirect("register-page.jsp");
        }
        
        
        }
        catch(Exception e){
            e.printStackTrace();
        }
//        response.sendRedirect("login.jsp");
        
    }

}