<%-- 
    Document   : logout
    Created on : 2 Mar, 2022, 7:59:32 PM
    Author     : Gourav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("login.jsp");
        %>
    </body>
</html>
