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
import lms.dao.StudentsDao;
import lms.model.Books;
import lms.model.Students;

/**
 *
 * @author Gourav
 */
@WebServlet("/searchForIssue")
public class searchIssueBook extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter web = new PrintWriter(System.out);
        
        try{
        String isbn = request.getParameter("BookISBN");
        String enroll = request.getParameter("enrollment");
        
        Books books = new Books();
        BooksDao booksDao = new BooksDao(); 
        books = booksDao.getBookByIsbn(isbn);
        
        Students students = new Students();
        StudentsDao studentDao = new StudentsDao();
        students = studentDao.getStudentsByEnroll(enroll);
        boolean status = students.getEnrollment().equalsIgnoreCase(enroll);
        
        
        HttpSession session = request.getSession();
        
        if(status){
            session.setAttribute("studentFound", "");
            session.setAttribute("issueSessionBook", books);
            session.setAttribute("issueSessionStudent", students);
            response.sendRedirect("addIssue.jsp");
        }
        else{
            session.setAttribute("studentNotAdded", "No such Student is added..");
            session.setAttribute("issueSessionBook", books);
            students = null;
            response.sendRedirect("issueByBookPage.jsp");
        }
        }
        catch(Exception e){
            e.printStackTrace();
            web.println("Student not Found!!");
        }
        web.println("Student not Found!!");
    }


}
