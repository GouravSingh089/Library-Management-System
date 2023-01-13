<%-- 
    Document   : login
    Created on : 17 Mar, 2022, 8:07:48 PM
    Author     : Gourav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="homestyle.css">
        <script src="https://kit.fontawesome.com/bbbf36e78d.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <!-- making navigation bar -->
        <nav id="navbar">
            <div id="logo">
                <img src="img/logo.png" alt="LMS logo here">
            </div>
            <ul>
                <li class="item"><a href="#home">Home</a></li>
                <li class="item"><a href="#login-section">Log In</a></li>
                <li class="item"><a href="#services-container">Services</a></li>
                <li class="item"><a href="#client-section">Our Clients</a></li>
            </ul>
        </nav>

        <!--home section-->
        <section id="home">
            <h1 class="h-primary">Welcome to my Library Management System web app</h1>
            <p> library management system is software that is designed to manage all the functions of a library. It helps
                librarian to maintain the database of new books and the books that are borrowed by members along with their
                due dates.</p>

            <p>This system completely automates all your library activities. The best way to maintain, organize, and handle
                countless books systematically is to implement a library management system software.</p>

            <p> A library management system is used to maintain library records. It tracks the records of the number of
                books in the library, how many books are issued, or how many books have been returned or renewed or late
                fine charges, etc.</p>

            <p> You can find books in an instant, issue/reissue books quickly, and manage all the data efficiently and
                orderly using this system. The purpose of a library management system is to provide instant and accurate
                data regarding any type of book, thereby saving a lot of time and effort. </p>
        </section>

        <!-- making login form layout -->
        <div id="login-section">
            <section id="login-form">

                <div class="box" id="left-box">
                    <!-- image here -->
                </div>

                <div class="box" id="right-box">
                    <form action="LoginChecker" method="post">
                        LOG IN
                        <div class="form-group">
                            <i id="icon" class="fa-solid fa-user"></i>
                            <input class="loginInput" type="text" name="username" placeholder="username" required="required"/>
                        </div>
                        <div class="form-group">
                            <i id="icon" class="fa-solid fa-key"></i>
                            <input class="loginInput" type="password" name="password" placeholder="password" required="required"/>
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Log In" >
                        </div>
                        <c:if test="${not empty loginSucceed}" >
                            <p class="formGroupTitle">${loginSucceed}</p>
                            <c:remove var="loginSucceed" scope="session" />
                        </c:if>
                        <c:if test="${not empty loginFailed}" >
                            <p class="formGroupTitle">${loginFailed}</p>
                            <c:remove var="loginFailed" scope="session" />
                        </c:if> 
                        <div><a href="register-page.jsp" id="register-link" target="_blank">not a user? sign up here.</a></div>
                    </form>
                </div>
            </section>
        </div>

        <!--services section-->
        <section id="services-container">
            <div class="grid-container">
                <aside id="grid-aside">
                    <div>
                        <h1>why consider us ??</h1>
                    </div>
                </aside>
                <article id="grid-article">
                    <div class="grid-box" id="grid-box1"><i class="fa-solid fa-feather-pointed"></i> 1 <p>
                        <h6>our product's user interface
                            is very easy to adapt.</h6>
                        </p>
                    </div>
                    <div class="grid-box" id="grid-box2"><i class="fa-solid fa-feather-pointed"></i> 2 <p>
                        <h6>Our product helps in maintaining the records in a very systematical order.</h6>
                        </p>
                    </div>
                    <div class="grid-box" id="grid-box3"><i class="fa-solid fa-feather-pointed"></i> 3 <p>
                        <h6>Our product greatly increases the efficiency of the user.</h6>
                        </p>
                    </div>
                    <div class="grid-box" id="grid-box4"><i class="fa-solid fa-feather-pointed"></i> 4 <p>
                        <h6>Our product saves lot of human effort and time.</h6>
                        </p>
                    </div>
                    <div class="grid-box" id="grid-box5"><i class="fa-solid fa-feather-pointed"></i> 5 <p>
                        <h6>Our product greatly reduces wastage of resources (example: maintaining records on notebook).
                        </h6>
                        </p>
                    </div>
                    <div class="grid-box" id="grid-box6"><i class="fa-solid fa-feather-pointed"></i> 6 <p>
                        <h6>Our product is built in such a way that it reduces the chance of error.</h6>
                        </p>
                    </div>
                </article>
            </div>
        </section>

        <!--client section-->
        <section id="client-section">
            <h1 id="client-h">Some of our clients:</h1>
            <hr>
            <div id="clients">
                <div class="client-item">
                    <a href="https://www.amity.edu/ranchi/" target="_blank"><img src="img/amity.png" alt="Our Client"></a>
                </div>
                <div class="client-item">
                    <a href="http://davpsalkusa.com/HOME" target="_blank"><img src="img/dav.png" alt="Our Client"></a>
                </div>
                <div class="client-item">
                    <a href="http://www.iitkgp.ac.in/" target="_blank"><img src="img/iit.png" alt="Our Client"></a>
                </div>
                <div class="client-item">
                    <a href="https://www.mitindia.edu/en/" target="_blank"><img src="img/mit.png" alt="Our Client"></a>
                </div>
                <div class="client-item">
                    <a href="https://stxaviersschool.com/" target="_blank"><img src="img/stxavier.png" alt="Our Client"></a>
                </div>
                <div class="client-item">
                    <a href="http://www.dpsjhakri.com/index.html" target="_blank"><img src="img/dpu.png"
                                                                                       alt="Our Client"></a>
                </div>
            </div>
            
            <!--footer section-->
            <section class="footer">
            <div class="footer-container">
                <div  id="footer1">
                    <i class="fa-solid fa-copyright"></i>Copyright 2022 | All rights reserved
                </div>
                <div class="footer-items" >
                    <i class="fa-brands fa-instagram" id="instagram"></i>
                    <i class="fa-brands fa-linkedin-in" id="linkedin"></i>
                    <i class="fa-brands fa-github" id="github"></i>
                    <i class="fa-brands fa-discord" id="discord"></i>
                </div>
            </div>
            
            <div class="portfolio">
                <a href="gourav-portfolio.html">curious about developer?</a>
            </div>
        
    </section>
    </body>
</html>

