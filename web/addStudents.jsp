<%-- 
    Document   : addStudents
    Created on : 25 Mar, 2022, 1:28:02 PM
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
        <link rel="stylesheet" href="addStudents.css">
        <link rel="stylesheet" href="uniFooter.css">
    </head>
    <body>

        <%@include file="dashboardNav.jsp" %>

        <!-- add books form  -->
        <form action="studentsAdd" method="post">

            <div class="formContainer">

                <div class="formGroupTitle">ADD STUDENTS</div>
                <div class="formGroup"><div class="formGroupText">First Name</div> <input type="text" name="firstName"></div>
                <div class="formGroup"><div class="formGroupText">Last Name</div>  <input type="text" name="lastName"></div>
                <div class="formGroup"><div class="formGroupText">Enrollment no. </div> <input type="text" name="enrollment" ></div>
                <div class="formGroup"><div class="formGroupText">Programme</div>  <input type="text" name="programme" ></div>
                <div class="formGroup"><div class="formGroupText">Semester</div>  <select name="semester" >
                        <option value="Choose">------</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                    </select>
                    <div class="studentBatch">Batch</div><div class="formDate"><input type="text" name="batch" ></div></div>

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
