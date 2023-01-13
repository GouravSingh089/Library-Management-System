<%-- 
    Document   : home
    Created on : 2 Mar, 2022, 7:26:44 PM
    Author     : Gourav
--%>

<%@page import="lms.dao.IssueDao"%>
<%@page import="lms.dao.StudentsDao"%>
<%@page import="lms.dao.BooksDao"%>
<%@page import="lms.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LMS | DASHBOARD</title>
        <link rel="stylesheet" href="dashboard.css">
        <link rel="stylesheet" href="uniFooter.css">
        <script src="https://kit.fontawesome.com/bbbf36e78d.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="dashboardNav.jsp" %>
        
        <%
            int booksCount;
            BooksDao booksDao = new BooksDao();
            booksCount=booksDao.booksCount();
            
            int studentsCount;
            StudentsDao studentsDao = new StudentsDao();
            studentsCount = studentsDao.studentsCount();
            
            int issueCount;
            IssueDao issueDao = new IssueDao();
            issueCount = issueDao.issueCount();
        %>
        
        <div class="gridContainer1">

    <div class="grid1"><i class="fa-solid fa-book"></i>
        <h3> TOTAL BOOKS  </h3> <h2><%=booksCount%></h2>
    </div>
    <div class="grid1"><i class="fa-solid fa-people-line"></i>
        <h3> TOTAL STUDENTS </h3> <h2><%=studentsCount%></h2>
    </div>
    <div class="grid1"><i class="fa-solid fa-book-open-reader"></i></i>
      <h3> ISSUED BOOKS : </h3> <h2><%=issueCount%></h2>
    </div>

  </div>

  <hr>
  <div class="quicklinks">Some quick links below</div>
  <hr>
  <div class="gridContainer2">

    <div class="grid2" id="grida1"><a href="addBooks.jsp"><i class="fa-solid fa-book-bookmark"></i>
        <h3> ADD BOOKS </h3>
      </a></div>
    <div class="grid2" id="grida2"><a href="addStudents.jsp"><i class="fa-solid fa-address-card"></i>
        <h3> ADD STUDENTS </h3>
      </a></div>
      <div class="grid2" id="grida2"><a href="books.jsp"><i class="fa-solid fa-book"></i>
        <h3> ISSUE BOOK </h3>
      </a></div>

  </div>

  <footer class="footer">
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
</footer>
        
    </body>
</html>
