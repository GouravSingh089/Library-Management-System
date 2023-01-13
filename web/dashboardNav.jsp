<%-- 
    Document   : dashboardNav
    Created on : 22 Mar, 2022, 1:35:59 AM
    Author     : Gourav
--%>

<%@page import="lms.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

    <link rel="stylesheet" href="dashboardNav.css">
    <script src="https://kit.fontawesome.com/bbbf36e78d.js" crossorigin="anonymous"></script>
</head>
<body>
    <%
            User user = (User)session.getAttribute("sessionUser");
            if(user==null)
            {
                response.sendRedirect("login.jsp");
            }
            
            String fullName = (String)user.getFirstName() + " " + (String)user.getLastName();
        %>
    
    <!-- making navigation bar -->
  <nav class="navbar">
    <div class="logo">
      <div class="logo" id="logoPic"><img src="img/logo.png" alt="lms logo" width="50px" height="50px"></div>
      <div id="logoName">
          <a href="dashboard.jsp"><h3>Library Management System</h3></a> 
      </div>
    </div>

    <div class="navContent">
      <div ><a href="userProfile.jsp">
          <h3 class="profileName">Welcome <%=fullName%></h3>
        </a></div>
      <div><a href="userProfile.jsp"><i class="fa-solid fa-user-tie"></i></a>
      </div>

    </div>
  </nav>


  <div class="menuNav">
    <div class="menuNavContent">
      <ul>
        <li><a href="dashboard.jsp">DASHBOARD</a> </li>
        <li><a href="books.jsp">BOOKS</a> </li>
        <li><a href="students.jsp">STUDENTS</a> </li>
        <li><a href="issuedBooks.jsp">ISSUED BOOKS</a> </li>
        <li><a href="returnedBooks.jsp">RETURNED BOOKS</a> </li>
      </ul>
    </div>

    <div class="logout">
      <div><a href="logout.jsp"><i class="fa-solid fa-arrow-right-from-bracket"></i></a></div>
    </div>
  </div>

</body>
</html>
