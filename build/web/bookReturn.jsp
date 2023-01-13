<%-- 
    Document   : addIssue
    Created on : 26 Mar, 2022, 12:33:45 AM
    Author     : Gourav
--%>

<%@page import="lms.model.IssuedBooks"%>
<%@page import="lms.dao.IssueDao"%>
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
           String issueId = request.getParameter("id_issue");
           IssueDao issueDao = new IssueDao();
           IssuedBooks issuedBook = issueDao.getIssueById(issueId);
        %>
        
        
        <!-- issue form  -->
  <form action="bookReturn" method="post">
    <div class="issueTitle">RETURN BOOK</div>

    <div class="bookStudentContainer">
      <div class="bookDetails">
        <div class="formGroup">
            <div class="formGroupText">ISBN </div> <input id="form-search-book" type="text" name="BookISBN" value="<%=issuedBook.getIsbn() %>" readonly>
          <input type="hidden" name="idIssue" value="<%=issuedBook.getIssueId() %>" >
        </div>
        <div class="formGroup">
          <div class="formGroupText"> Book Title</div> <input type="text" name="bookTitle" value="<%=issuedBook.getBookTitle() %>" readonly>
        </div>
        <div class="formGroup">
          <div class="formGroupText">Category</div> <input type="text" name="bookCategory" value="<%=issuedBook.getCategory() %>" readonly>
        </div>
        <div class="formGroup">
          <div class="formGroupText">Author</div> <input type="text" name="bookAuthor" value="<%=issuedBook.getAuthor() %>" readonly>
        </div>
        <div class="formGroup">
          <div class="formGroupText">Publisher</div> <input type="text" name="bookPublisher" value="<%=issuedBook.getPublisher() %>" readonly>
        </div>
        <div class="formGroupdates">
          <div class="formGroupdatesText">Issued Date</div><input type="date" id="datePicker" name="issuedDate" value="<%=issuedBook.getIssueDate() %>" readonly>
        </div>
      </div>

        <!--getting book details-->
        
      <div class="studentDetails">
        <div class="formGroup">
            <div class="formGroupText">Enrollment no. </div> <input id="form-search-book" type="text" name="enrollment" value="<%=issuedBook.getEnrollmentNo() %>" readonly>
           
        </div>
        <div class="formGroup">
          <div class="formGroupText">First Name</div> <input type="text" name="firstName" value="<%=issuedBook.getFirstName() %>" readonly>
        </div>
        <div class="formGroup">
          <div class="formGroupText">Last Name</div> <input type="text" name="lastName" value="<%=issuedBook.getLastName() %>" readonly>
        </div>

        <div class="formGroup">
          <div class="formGroupText">Programme</div> <input type="text" name="programme" value="<%=issuedBook.getProgramme() %>" readonly>
        </div>
        <div class="formGroupSmall">
          <div class="formGroupText">Semester</div> <input type="text" name="semester" value="<%=issuedBook.getSemester() %>" readonly>
          <div class="formGroupTextBatch">
            <div>Batch</div><input type="text" name="batch" value="<%=issuedBook.getBatch() %>" readonly>
          </div>
        </div>
          <div class="formGroupdates">
              <div class="formGroupdatesText">Returned Date</div><input type="date" name="returnDate" required>
        </div>
      </div>
    </div>

    <div class="issueContainer">
      <div class="issueDate">
          
        
      </div>
      <div class="formButton">
        <div><input type="submit" value="RETURN"></div>
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
