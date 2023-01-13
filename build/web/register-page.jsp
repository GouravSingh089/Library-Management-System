<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
    <head>
        <title>Sign Up</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="registerstyle.css">
        <link rel="stylesheet" href="uniFooter.css">
    </head>
    <body>
        <div class="registerConfirm">
            <c:if test="${not empty registerSucceed}" >
                            <p class="formGroupTitle">${registerSucceed}</p>
                            <c:remove var="registerSucceed" scope="session" />
                        </c:if>
                        <c:if test="${not empty registerFailed}" >
                            <p class="formGroupTitle">${registerFailed}</p>
                            <c:remove var="registerFailed" scope="session" />
                        </c:if> 
        </div>
        <section id="signup-form">

            <div class="signup-form" id="left-box">
                <!-- image here -->
            </div>

            <div class="signup-form" id="right-box">
                <form action="user-register" method="post">
                    <div class="form-group">
                        <div>First Name</div>
                        <input type="text" name="firstName" placeholder="Enter your first name" required="required"/>
                    </div>
                    <div class="form-group">
                        <div>Last Name</div>
                        <input type="text" name="lastName" placeholder="Enter your last name" required="required"/>
                    </div>
                    <div class="form-group">
                        <div>Username</div>
                        <input type="text" name="username" placeholder="Enter your username" required="required"/>
                    </div>
                    <div class="form-group">
                        <div>Email</div>
                        <input type="email" name="email" placeholder="Enter your email" required="required"/>
                    </div>
                    <div class="form-group">
                        <div>Password</div>
                        <input type="password" name="password" placeholder="Enter your password" required="required"/>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Sign up" id="signup-button" >
                    </div>
                    <div><a href="login.jsp#login-section" id="signin" >already a user? sign in here.</a></div>
                </form>
            </div>
        </section>
        
        
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
