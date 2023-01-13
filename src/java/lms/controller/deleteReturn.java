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
import lms.dao.ReturnDao;

/**
 *
 * @author Gourav
 */
@WebServlet("/returnDelete")
public class deleteReturn extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String returnId = request.getParameter("returnId");
        
        ReturnDao returnDao = new ReturnDao();
        boolean delete = returnDao.deleteReturnedBook(returnId);
        
        HttpSession session = request.getSession();
        if(delete){
            session.setAttribute("deleted", "Returned Book deleted successfully...");
            response.sendRedirect("returnedBooks.jsp");
        }
        else{
            session.setAttribute("deleteFailed", "Failed to delete the Returned Book...");
            response.sendRedirect("returnedBooks.jsp");
        }
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
}

