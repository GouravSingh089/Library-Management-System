package lms.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lms.dao.LoginDao;
import lms.model.User;


/**
 *
 * @author Gourav
 */
@WebServlet("/LoginChecker")
public class loginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        try {
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            
            LoginDao validate = new LoginDao();
            
            User user = validate.checkLogin(username, password);
            if(user!=null){
                session.setAttribute("sessionUser", user);
                session.setAttribute("loginSucceed", "");
                response.sendRedirect("dashboard.jsp");
                
            }
            else{
                session.setAttribute("loginFailed", "Wrong username/password, check again.");
                response.sendRedirect("login.jsp#login-section");
            }

//            boolean legit = validate.checkLogin(user);

            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

}