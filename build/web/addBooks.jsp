<%-- 
    Document   : addBooks
    Created on : 22 Mar, 2022, 3:16:42 AM
    Author     : Gourav
--%>

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

        <!-- add books form  -->
        <form action="booksAdd" method="post">

            <div class="formContainer">

                <div class="formGroupTitle">ADD BOOKS</div>
                <div class="formGroup"><div class="formGroupText"> Book Title</div> <input type="text" name="bookTitle"></div>
                <div class="formGroup"><div class="formGroupText">Category</div>  <input type="text" name="bookCategory"></div>
                <div class="formGroup"><div class="formGroupText">ISBN </div> <input type="text" name="bookISBN"></div>
                <div class="formGroup"><div class="formGroupText">Author</div>  <input type="text" name="bookAuthor"></div>
                <div class="formGroup"><div class="formGroupText">Publisher</div>  <input type="text" name="bookPublisher"></div>
                <div class="formGroup"><div class="formGroupText">Book Status</div> <select name="bookStatus" id="status">
                        <option value="Available">Available</option>
                        <option value="Unavailable">Unavailable</option>
                    </select></div>
                <div class="formButton"> <div><input type="submit" value="ADD"></div></div>
                        <c:if test="${not empty succMessage}" >
                    <p class="bookAdded">${succMessage}</p>
                    <c:remove var="succMessage" scope="session" />
                </c:if>
                <c:if test="${not empty failMessage}" >
                    <p class="bookFailed">${failMessage}</p>
                    <c:remove var="failMessage" scope="session" />
                </c:if> 
            </div>

        </form>

        <!--        <div class="footer"><i class="fa-solid fa-copyright"></i>all copyrights owned |<a href="#"> contact</a> | <a href="#">
                        customer support</a> </div>-->

        
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
