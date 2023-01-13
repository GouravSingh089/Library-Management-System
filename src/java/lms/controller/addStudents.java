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
import lms.dao.StudentsDao;
import lms.model.Students;

/**
 *
 * @author Gourav
 */
@WebServlet("/studentsAdd")
public class addStudents extends HttpServlet {

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
        String enrollment = request.getParameter("enrollment");
        String programme = request.getParameter("programme");
        String semester = request.getParameter("semester");
        String batch = request.getParameter("batch");
        
        
        
         Students student = new Students(enrollment, firstName, lastName, programme, semester, batch);
        
        try{
           
        StudentsDao studentsDao = new StudentsDao();
        boolean result = studentsDao.addStudent(student);
        
        if(result){
            session.setAttribute("succMessage", "Student added successfully.");
            response.sendRedirect("addStudents.jsp");
        }else{
           session.setAttribute("failMessage", "Failed to add student, try again.");
            response.sendRedirect("addStudents.jsp");
        }
        
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
    }

}
