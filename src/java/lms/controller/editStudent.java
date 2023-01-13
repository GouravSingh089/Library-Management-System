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
import lms.dao.StudentsDao;
import lms.model.Students;

/**
 *
 * @author Gourav
 */
@WebServlet("/studentEdit")
public class editStudent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        try{
            
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String enrollment = request.getParameter("enrollmentNo");
        String programme = request.getParameter("programme");
        String semester = request.getParameter("semester");
        String batch = request.getParameter("batch");
        
        Students student = new Students(enrollment, firstName, lastName, programme, semester, batch);
        
        StudentsDao studentDao = new StudentsDao();
        boolean update = studentDao.updateStudents(student);
            
//        System.out.println("Edit Student: " + firstName);
//        System.out.println("Edit Student: " + lastName);
//        System.out.println("Edit Student: " + enrollment);
//        System.out.println("Edit Student: " + programme);
//        System.out.println("Edit Student: " + semester);
//        System.out.println("Edit Student: " + batch);
        
        if(update){
            session.setAttribute("editSuccess", "Student details updated successfully...");
            response.sendRedirect("students.jsp");
        }
        else{
            session.setAttribute("editFailed", "Failed to update details of Student...");
            response.sendRedirect("students.jsp");
        }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }

}
