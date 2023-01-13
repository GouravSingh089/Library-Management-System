<%-- 
    Document   : userProfile
    Created on : 10 Apr, 2022, 10:42:02 PM
    Author     : Gourav
--%>
<%@page import="lms.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="uniFooter.css">
        <link rel="stylesheet" href="userProfile.css">
    </head>
    <body>
        <%@include file="dashboardNav.jsp" %>
        
        
        <form action="userEdit" method="post">
      <div class="formContainer">
        <!-- <div class="formGroupTitle">PROFILE</div> -->
        <div><i class="fa-solid fa-user-tie"></i></div>
        <div class="formGroup"><div class="formGroupText">Username </div> <input type="text" name="username" readonly value="<%=user.getUsername() %>"></div>
        <div class="formGroup"><div class="formGroupText"> First Name</div> <input type="text" name="firstName"  value="<%=user.getFirstName() %>"></div>
    <div class="formGroup"><div class="formGroupText">Last Name</div>  <input type="text" name="lastName"  value="<%=user.getLastName() %>"></div>
    
    <div class="formGroup"><div class="formGroupText">Email</div>  <input type="text" name="email"  value="<%=user.getEmail() %>"></div>
    <div class="formGroup"><div class="formGroupText">password</div>  <input type="text" name="password"  value="<%=user.getPassword() %>"></div>
    <div class="formButton"> <div><input type="submit" value="UPDATE"></div></div>
    </div>
   
</div>
  </form>
        
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
