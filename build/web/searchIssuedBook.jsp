<%-- 
    Document   : issuedBooks
    Created on : 22 Mar, 2022, 1:49:41 AM
    Author     : Gourav
--%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LMS | ISSUE BOOK</title>
        <link rel="stylesheet" href="issuedBooks.css">
        <link rel="stylesheet" href="uniFooter.css">
    </head>
    <body>
        <%@include file="dashboardNav.jsp" %>
        
        <!-- issued Books Body -->
  <div class="gridContainer2">

    <div class="grid2" id="grida1"><a href="addIssue.jsp"><i class="fa-solid fa-book-bookmark"></i><h3> ISSUE BOOK  </h3></a></div>
  </div>

  <div class="searchBar">
    <form action="searchIssuedBook.jsp" >
      Search books
      <input type="text" name="searchIssuedBook" placeholder="Search">
      <button type="submit" ><i id="searchBookButton" class="fa-solid fa-magnifying-glass"></i></button>
    </form>
  </div>

  <table>
  <tr>
    <th>Issue ID</th>
    <th>ISBN</th>
    <th>Book Title</th>
    <th>Student Enroll. no.</th>
    <th>Student Name</th>
    <th>Issued Date</th>
    <th>Due Date</th>
    <th>Action</th>
  </tr>
  <tr>
    <td>Alfreds Futterkiste</td>
    <td>Maria Anders</td>
    <td>Germany</td>
    <td>Author</td>
    <td>Publisher</td>
    <td>Publisher</td>
    <td>Publisher</td>
    <td >
      <a id="return" href="#">Return</a>
      <a id="delete" href="#">Delete</a>
    </td>
  </tr>
  
</table>


  <div class="footer" ><i class="fa-solid fa-copyright"></i>all copyrights owned |<a href="#"> contact</a> | <a href="#">
    customer support</a> </div>

        
        
        
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
