<%-- 
    Document   : addBooks
    Created on : 22 Mar, 2022, 3:16:42 AM
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
        <title>LMS | BOOKS</title>
        <link rel="stylesheet" href="addBooks.css">
        <link rel="stylesheet" href="uniFooter.css">
    </head>
    <body>

        <%@include file="dashboardNav.jsp" %>

        
        <% 
            String isbn = request.getParameter("isbn");
            BooksDao booksDao = new BooksDao();
            Books books = booksDao.getBookByIsbn(isbn);
        %>
        
        <!-- add books form  -->
        <form action="booksEdit" method="post">

            <div class="formContainer">
                <input type="hidden" name="bookISBN" value="<%=books.getISBN()%>">
                
                <div class="formGroupTitle">Edit BOOKS</div>
                <div class="formGroup"><div class="formGroupText"> Book Title</div> <input type="text" name="bookTitle" value="<%=books.getBookTitle()%>"></div>
                <div class="formGroup"><div class="formGroupText">Category</div>  <input type="text" name="bookCategory" value="<%=books.getBookCategory()%>"></div>
                <div class="formGroup"><div class="formGroupText">Author</div>  <input type="text" name="bookAuthor" value="<%=books.getBookAuthor()%>"></div>
                <div class="formGroup"><div class="formGroupText">Publisher</div>  <input type="text" name="bookPublisher" value="<%=books.getBookPublisher()%>"></div>
                <div class="formGroup"><div class="formGroupText">Book Status</div> <select name="bookStatus" id="status">
                        <%
                        if("Available".equals(books.getBookStatus())){
                        %>
                        <option value="Available">Available</option>
                        <option value="Unavailable">Unavailable</option>
                        <%
                        }else{
                        %>
                        <option value="Unavailable">Unavailable</option>
                        <option value="Available">Available</option>
                        <%
                        }
                        %>
                        
                        
                    </select></div>
                <div class="formButton"> <div><input type="submit" value="Update"></div></div>
                        
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
