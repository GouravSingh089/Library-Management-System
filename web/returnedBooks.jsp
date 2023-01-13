<%-- 
    Document   : returnedBooks
    Created on : 22 Mar, 2022, 1:49:56 AM
    Author     : Gourav
--%>

<%@page import="lms.model.ReturnBook"%>
<%@page import="lms.dao.ReturnDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lms.connection.mysqlConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="returnedBooks.css">
        <link rel="stylesheet" href="uniFooter.css">
    </head>
    <body>

        <%@include file="dashboardNav.jsp" %>

        <!--search Bar-->
        <div class="searchBar">
            <form action="searchBooks.html" >
                Search Returned Books
                <input type="text" name="bookSearch" placeholder="Search">
                <button type="submit" ><i id="searchBookButton" class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
<!--book returned confirmation-->
        <c:if test="${not empty succMessage}" >
            <p class="issueSuccess">${succMessage}</p>
            <c:remove var="succMessage" scope="session" />
        </c:if>
        <c:if test="${not empty failMessage}" >
            <p class="issueFail">${failMessage}</p>
            <c:remove var="failMessage" scope="session" />
        </c:if> 
    
        
        <table>
            <thead>
                <tr>
                    <th>Return id</th>
                    <th>ISBN</th>
                    <th>Book Title</th>
                    <th>Enrollment</th>
                    <th>Student Name</th>
                    <th>Programme</th>
                    <th>Semester</th>
                    <th>Issued Date</th>
                    <th>Returned Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%                    mysqlConnection con;
                    ReturnDao returnDao = new ReturnDao();
                    List<ReturnBook> showreturnedbooks = new ArrayList<>();
                    showreturnedbooks = returnDao.showReturnedBooks();

                    for (ReturnBook returnBook : showreturnedbooks) {
                        String studentFullName = (String)returnBook.getFirstName() + " " + (String)returnBook.getLastName();
                %>

                <tr>
                    <td><%=returnBook.getReturnId()%></td>
                    <td><%=returnBook.getIsbn()%></td>
                    <td><%=returnBook.getBookTitle()%></td>
                    <td><%=returnBook.getEnrollmentNo()%></td>
                    <td><%=studentFullName%></td>
                    <td><%=returnBook.getProgramme()%></td>
                    <td><%=returnBook.getSemester()%></td>
                    <td><%=returnBook.getIssuedDate()%></td>
                    <td><%=returnBook.getReturnDate()%></td>
                    <td>
                        <a id="red" href="returnDelete?returnId=<%=returnBook.getReturnId()%>">Delete</a>
                        <a id="green" href="viewReturn.jsp?returnId=<%=returnBook.getReturnId()%>">Receipt</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>


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
