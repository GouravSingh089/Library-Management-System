/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lms.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lms.dao.BooksDao;
import lms.dao.IssueDao;
import lms.dao.StudentsDao;
import lms.model.Books;
import lms.model.IssuedBooks;
import lms.model.Students;

/**
 *
 * @author Gourav
 */
@WebServlet("/issueAdd")
public class addIssue extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
       
        String isbn = request.getParameter("BookISBN");
        String enroll = request.getParameter("enrollment");
        String issueDate = request.getParameter("issueDate");
        
        Books book = new Books();
        BooksDao booksDao = new BooksDao();
        book = booksDao.getBookByIsbn(isbn);
        
        Students student = new Students();
        StudentsDao studentsDao = new StudentsDao();
        student = studentsDao.getStudentsByEnroll(enroll);
        
//        IssuedBooks issueBook = new IssuedBooks( isbn, bookTitle, category, author, publisher, enroll, firstName, lastName, programme, semester, batch, issueDate);
        
//        testing due date code
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
//        Calendar cal = Calendar.getInstance();
        
        try{
           
        IssueDao issueDao = new IssueDao();
        boolean result = issueDao.addIssue(book,student,issueDate);
        
        if(result){
            session.setAttribute("succMessage", "Book Issued.");
            booksDao.bookIssued(isbn);
            response.sendRedirect("issuedBooks.jsp");
        }else{
           session.setAttribute("failMessage", "Failed to issue book.");
            response.sendRedirect("issuedBooks.jsp");
        }
        
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
    }

}
