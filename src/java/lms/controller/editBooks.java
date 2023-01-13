/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lms.dao.BooksDao;
import lms.model.Books;

/**
 *
 * @author Gourav
 */
@WebServlet("/booksEdit")
public class editBooks extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        try{
            
        String bookTitle = request.getParameter("bookTitle");
        String bookCategory = request.getParameter("bookCategory");
        String bookISBN = request.getParameter("bookISBN");
        String bookAuthor = request.getParameter("bookAuthor");
        String bookPublisher = request.getParameter("bookPublisher");
        String bookStatus = request.getParameter("bookStatus");
        
        Books books = new Books(bookISBN, bookTitle, bookCategory, bookAuthor, bookPublisher, bookStatus);
        session.setAttribute("sessionBook", books);
        BooksDao booksDao = new BooksDao();
        boolean update = booksDao.updateEditBooks(books);
            
        if(update){
            session.setAttribute("editSuccess", "Book updated successfully...");
            response.sendRedirect("books.jsp");
        }
        else{
            session.setAttribute("editFailed", "Failed to update the Book...");
            response.sendRedirect("books.jsp");
        }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }

}
