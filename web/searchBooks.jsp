<%-- 
    Document   : books
    Created on : 22 Mar, 2022, 1:48:49 AM
    Author     : Gourav
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lms.model.Books"%>
<%@page import="lms.connection.mysqlConnection"%>
<%@page import="lms.dao.BooksDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LMS | BOOKS</title>

        <link rel="stylesheet" href="books.css">
        <link rel="stylesheet" href="uniFooter.css">
        <script src="https://kit.fontawesome.com/bbbf36e78d.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="dashboardNav.jsp" %>

        <div class="gridContainer2">
            <div class="grid2" id="grida1"><a href="addBooks.jsp"><i class="fa-solid fa-book-bookmark"></i><h3> ADD BOOKS  </h3></a></div>
        </div>

        <div class="searchBar">
            <form action="searchBooks.jsp" >
                Search books
                <input type="text" name="bookSearch" placeholder="Search">
                <button type="submit" ><i id="searchBookButton" class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>

        <c:if test="${not empty editSuccess}" >
            <p class="bookAdded">${editSuccess}</p>
            <c:remove var="editSuccess" scope="session" />
        </c:if>
        <c:if test="${not empty editFail}" >
            <p class="bookFailed">${editFail}</p>
            <c:remove var="editFail" scope="session" />
        </c:if> 

        <table>
            <thead>
                <tr>
                    <th>Book ISBN</th>
                    <th>Book Title</th>
                    <th>Category</th>
                    <th>Author</th>
                    <th>Publisher</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <%                    String search = request.getParameter("bookSearch");
                    BooksDao booksDao = new BooksDao();
                    List<Books> showBooks = new ArrayList<>();
                    showBooks = booksDao.bookSearch(search);

                    for (Books books : showBooks) {
                %>
                <tr>
                    <td><%=books.getISBN()%></td>
                    <td><%=books.getBookTitle()%></td>
                    <td><%=books.getBookCategory()%></td>
                    <td><%=books.getBookAuthor()%></td>
                    <td><%=books.getBookPublisher()%></td>
                    <td><%=books.getBookStatus()%></td>
                    <td>
                        <a id="green" href="issueByBookPage.jsp?isbn=<%=books.getISBN()%>">Issue</a>
                        <a id="red" href="bookDelete?isbn=<%=books.getISBN()%>">Delete</a>
                        <a id="green" href="editBooks.jsp?isbn=<%=books.getISBN()%>">Edit</a>

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
