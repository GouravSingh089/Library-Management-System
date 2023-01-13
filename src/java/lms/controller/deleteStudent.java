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

/**
 *
 * @author Gourav
 */
@WebServlet("/StudentDelete")
public class deleteStudent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String enroll = request.getParameter("enroll");
        
        StudentsDao studentsDao = new StudentsDao();
        boolean delete = studentsDao.deleteStudents(enroll);
        
        HttpSession session = request.getSession();
        if(delete){
            session.setAttribute("Success", "Student deleted successfully...");
            response.sendRedirect("students.jsp");
        }
        else{
            session.setAttribute("editFailed", "Failed to delete the Student...");
            response.sendRedirect("students.jsp");
        }
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
