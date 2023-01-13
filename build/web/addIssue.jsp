<%-- 
    Document   : addIssue
    Created on : 26 Mar, 2022, 12:33:45 AM
    Author     : Gourav
--%>

<%@page import="lms.dao.StudentsDao"%>
<%@page import="lms.model.Students"%>
<%@page import="lms.model.Books"%>
<%@page import="lms.dao.BooksDao"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LMS | ISSUE BOOK</title>
        <link rel="stylesheet" href="addIssue.css">
        <link rel="stylesheet" href="uniFooter.css">
    </head>
    <body>
        <%@include file="dashboardNav.jsp" %>
        
        <%
           Books book = null;
           Students student = null;
           book = (Books)session.getAttribute("issueSessionBook");
           student = (Students)session.getAttribute("issueSessionStudent");
        %>
        
        
        <!-- issue form  -->
  <form action="issueAdd" method="post">
    <div class="issueTitle">ISSUE BOOK</div>

    <div class="bookStudentContainer">
      <div class="bookDetails">
        <div class="formGroup">
            <div class="formGroupText">ISBN </div> <input id="form-search-book" type="text" name="BookISBN" value="<%=book.getISBN() %>" >
          
        </div>
        <div class="formGroup">
          <div class="formGroupText"> Book Title</div> <input type="text" name="bookTitle" value="<%=book.getBookTitle() %>" >
        </div>
        <div class="formGroup">
          <div class="formGroupText">Category</div> <input type="text" name="bookCategory" value="<%=book.getBookCategory() %>" >
        </div>
        <div class="formGroup">
          <div class="formGroupText">Author</div> <input type="text" name="bookAuthor" value="<%=book.getBookAuthor() %>" >
        </div>
        <div class="formGroup">
          <div class="formGroupText">Publisher</div> <input type="text" name="bookPublisher" value="<%=book.getBookPublisher() %>" >
        </div>
      </div>

        <!--getting book details-->
        
      <div class="studentDetails">
        <div class="formGroup">
            <div class="formGroupText">Enrollment no. </div> <input id="form-search-book" type="text" name="enrollment" value="<%=student.getEnrollment() %>" >
           
        </div>
        <div class="formGroup">
          <div class="formGroupText">First Name</div> <input type="text" name="firstName" value="<%=student.getFirstName() %>" >
        </div>
        <div class="formGroup">
          <div class="formGroupText">Last Name</div> <input type="text" name="lastName" value="<%=student.getLastName() %>" >
        </div>

        <div class="formGroup">
          <div class="formGroupText">Programme</div> <input type="text" name="programme" value="<%=student.getProgramme() %>" >
        </div>
        <div class="formGroupSmall">
          <div class="formGroupText">Semester</div> <input type="text" name="semester" value="<%=student.getSemester() %>" >
          <div class="formGroupTextBatch">
            <div>Batch</div><input type="text" name="batch" value="<%=student.getBatch() %>" >
          </div>
        </div>
      </div>
    </div>

    <div class="issueContainer">
      <div class="issueDate">
        <div >Date</div><input type="date" id="datePicker" name="issueDate" required>
      </div>
      <div class="formButton">
        <div><input type="submit" value="ISSUE"></div>
      </div>
  
    </div>
  </form>
        
       <section class="footer">
  <div class="footer-container">
      <div  id="footer1">
          <i class="fa-solid fa-copyright"></i>Copyright 2022 | All rights reserved
      </div>
      <div class="portfolio">
          <a  href="gourav-portfolio.html">curious about developer?</a>
      </div>
      <div class="footer-items" >
          <i class="fa-brands fa-instagram" id="instagram"></i>
          <i class="fa-brands fa-linkedin-in" id="linkedin"></i>
          <i class="fa-brands fa-github" id="github"></i>
          <i class="fa-brands fa-discord" id="discord"></i>
      </div>
  </div>
</section>
        
    </body>
</html>
