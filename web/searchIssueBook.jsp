<%-- 
    Document   : searchIssueBook
    Created on : 26 Mar, 2022, 10:09:16 PM
    Author     : Gourav
--%>

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
        
        <!--getting book details-->
         <% 
            String isbn = request.getParameter("isbn");
            BooksDao booksDao = new BooksDao();
            Books books = booksDao.getBookByIsbn(isbn);
        %>
        
        <!-- issue form  -->
  <form action="" method="post">
    <div class="issueTitle">ISSUE BOOK</div>

    <div class="bookStudentContainer">
      <div class="bookDetails">
        <div class="formGroup">
            <div class="formGroupText">ISBN </div> <input id="form-search" type="text" name="BookISBN" value="<%=books.getISBN()%>">
          <a href="searchIssueBook.jsp " class="searchIssueButtons"><i id="searchBookButton" class="fa-solid fa-magnifying-glass"></i></a>
        </div>
        <div class="formGroup">
          <div class="formGroupText"> Book Title</div> <input type="text" name="bookTitle" value="<%=books.getBookTitle()%>" >
        </div>
        <div class="formGroup">
          <div class="formGroupText">Category</div> <input type="text" name="bookCategory" value="<%=books.getBookCategory()%>" >
        </div>
        <div class="formGroup">
          <div class="formGroupText">Author</div> <input type="text" name="bookAuthor" value="<%=books.getBookAuthor()%>" >
        </div>
        <div class="formGroup">
          <div class="formGroupText">Publisher</div> <input type="text" name="bookPublisher" value="<%=books.getBookPublisher()%>" >
        </div>
      </div>

      <div class="studentDetails">
        <div class="formGroup">
          <div class="formGroupText">Enrollment no. </div> <input id="form-search" type="text" name="enrollment">
         <a href="searchIssueStudent.jsp " class="searchIssueButtons"><i id="searchBookButton" class="fa-solid fa-magnifying-glass"></i></a>
        </div>
        <div class="formGroup">
          <div class="formGroupText">First Name</div> <input type="text" name="firstName"   >
        </div>
        <div class="formGroup">
          <div class="formGroupText">Last Name</div> <input type="text" name="lastName"   >
        </div>

        <div class="formGroup">
          <div class="formGroupText">Programme</div> <input type="text" name="programme"   >
        </div>
        <div class="formGroupSmall">
          <div class="formGroupText">Semester</div> <input type="text" name="semester"   >
          <div class="formGroupTextBatch">
            <div>Batch</div><input type="text" name="batch"   >
          </div>
        </div>
      </div>
    </div>

    <div class="issueContainer">
      <div class="issueDate">
        <div >Date</div><input type="date" id="datePicker" name="issueDate">
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