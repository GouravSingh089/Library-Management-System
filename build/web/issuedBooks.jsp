<%-- 
    Document   : issuedBooks
    Created on : 22 Mar, 2022, 1:49:41 AM
    Author     : Gourav
--%>
<%@page import="lms.model.IssuedBooks"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lms.dao.IssueDao"%>
<%@page import="lms.connection.mysqlConnection"%>
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
            <div class="grid2" id="grid1"><a href="books.jsp"><i class="fa-solid fa-book-bookmark"></i><h3> ISSUE BOOK</h3></a></div>
        </div>
        
        <c:if test="${not empty succMessage}" >
            <p class="issueSuccess">${succMessage}</p>
            <c:remove var="succMessage" scope="session" />
        </c:if>
        <c:if test="${not empty failMessage}" >
            <p class="issueFail">${failMessage}</p>
            <c:remove var="failMessage" scope="session" />
        </c:if> 
        
  <div class="searchBar">
    <form action="searchIssuedBook.jsp" >
      Search Issued Book
      <input type="text" name="searchIssuedBook" placeholder="Search">
      <button type="submit" ><i id="searchBookButton" class="fa-solid fa-magnifying-glass"></i></button>
    </form>
  </div>

            
            
  <table>
      <thead>
  <tr>
    <th>Issue ID</th>
    <th>ISBN</th>
    <th>Book Title</th>
    <th>Student Enroll. no.</th>
    <th>Student Name</th>
    <th>Programme</th>
    <th>Semester</th>
    <th>Issued Date</th>
    <!--<th>Due Date</th>-->
    <th>Action</th>
  </tr>
  </tbody>
  <tbody>
      <%                    mysqlConnection con;
                    IssueDao issueDao = new IssueDao();
                    List<IssuedBooks> showissuedbooks = new ArrayList<>();
                    showissuedbooks = issueDao.showIssuedBooks();

                    for (IssuedBooks issuedBooks : showissuedbooks) {
                        String studentFullName = (String)issuedBooks.getFirstName() + " " + (String)issuedBooks.getLastName();
                %>
                
                <tr>
                    <td><%=issuedBooks.getIssueId()%></td>
                    <td><%=issuedBooks.getIsbn()%></td>
                    <td><%=issuedBooks.getBookTitle()%></td>
                    <td><%=issuedBooks.getEnrollmentNo() %></td>
                    <td><%=studentFullName%></td>
                    <td><%=issuedBooks.getProgramme()%></td>
                    <td><%=issuedBooks.getSemester()%></td>
                    <td><%=issuedBooks.getIssueDate()%></td>
                    <td>
                        <a id="green" href="bookReturn.jsp?id_issue=<%=issuedBooks.getIssueId()%>">Return</a>
                        <a id="orange" href="viewIssue.jsp?id_issue=<%=issuedBooks.getIssueId()%>">Receipt</a>
                        <!--<a id="red" href="issue_delete?id_issue=<%=issuedBooks.getIssueId()%>">Delete</a>-->
                    </td>
                </tr>
                <%
                    }
                %>
  </tbody>
  
</table>


        
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
