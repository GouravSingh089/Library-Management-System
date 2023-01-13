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
import lms.dao.IssueDao;

/**
 *
 * @author Gourav
 */
@WebServlet("/issue_delete")
public class deleteIssue extends HttpServlet {

  

    
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String issueid = request.getParameter("id_issue");
        
        IssueDao issueDao = new IssueDao();
        boolean delete = issueDao.deleteIssuedBook(issueid);
        
        HttpSession session = request.getSession();
        if(delete){
            session.setAttribute("Success", "Issued Book deleted successfully...");
            response.sendRedirect("issuedBooks.jsp");
        }
        else{
            session.setAttribute("editFailed", "Failed to delete the Issued Book...");
            response.sendRedirect("issueBooks.jsp");
        }
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
}
