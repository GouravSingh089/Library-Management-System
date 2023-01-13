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
//import lms.dao.BooksDao;
import lms.dao.IssueDao;
import lms.dao.ReturnDao;
import lms.dao.StudentsDao;
import lms.model.Books;
//import lms.dao.ReturnDao;
//import lms.dao.StudentsDao;
//import lms.model.Books;
import lms.model.IssuedBooks;
import lms.model.Students;
//import lms.model.Students;

/**
 *
 * @author Gourav
 */
@WebServlet("/bookReturn")
public class returnBook extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
       
        String issue_id = request.getParameter("idIssue");
        String isbn = request.getParameter("BookISBN");
        String enroll = request.getParameter("enrollment");
        String issue_Date = request.getParameter("issuedDate");
        String return_Date = request.getParameter("returnDate");
        
        try{
            
        Books book = new Books();
//        book = null;
        BooksDao booksDao = new BooksDao();
        book = booksDao.getBookByIsbn(isbn);
        
        Students student = new Students();
//        student = null;
        StudentsDao studentsDao = new StudentsDao();
        student = studentsDao.getStudentsByEnroll(enroll);
        
        ReturnDao returnDao = new ReturnDao();
        boolean result = returnDao.addReturn(book, student,issue_Date, return_Date);
        
//        IssuedBooks issueBook = new IssuedBooks( isbn, bookTitle, category, author, publisher, enroll, firstName, lastName, programme, semester, batch, issueDate);
               
//            IssuedBooks issueBook = null;
//            IssueDao issueDao = new IssueDao();
//            issueBook = issueDao.getIssueById(issue_id);
//            boolean result = issueDao.returnIssued(issueBook, return_Date);
            
//            System.out.println(result);
//            System.out.println(issueBook.getEnrollmentNo());
//            System.out.println(return_Date);
//            System.out.println(issue_id);
            
        if(result){
            session.setAttribute("succMessage", "Book Returned.");
            response.sendRedirect("returnedBooks.jsp");
        }else{
           session.setAttribute("failMessage", "Failed to return book.");
            response.sendRedirect("returnedBooks.jsp");
        }
        
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
    }

}
