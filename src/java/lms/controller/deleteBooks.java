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
import lms.dao.BooksDao;

/**
 *
 * @author Gourav
 */
@WebServlet("/bookDelete")
public class deleteBooks extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String isbn = request.getParameter("isbn");
        
        BooksDao booksDao = new BooksDao();
        boolean delete = booksDao.deleteBooks(isbn);
        
        HttpSession session = request.getSession();
        if(delete){
            session.setAttribute("Success", "Book deleted successfully...");
            response.sendRedirect("books.jsp");
        }
        else{
            session.setAttribute("editFailed", "Failed to delete the Book...");
            response.sendRedirect("books.jsp");
        }
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
