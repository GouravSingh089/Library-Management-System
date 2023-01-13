<%-- 
    Document   : viewIssue
    Created on : 27 Mar, 2022, 6:23:28 AM
    Author     : Gourav
--%>

<%@page import="lms.model.IssuedBooks"%>
<%@page import="lms.dao.IssueDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LMS | ISSUE BOOK</title>
        <link rel="stylesheet" href="viewIssue.css">
        <link rel="stylesheet" href="uniFooter.css">
        <script src="https://kit.fontawesome.com/bbbf36e78d.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="dashboardNav.jsp" %>
        
        <% 
            String issueId = request.getParameter("id_issue");
//            IssuedBooks issueBook = new IssuedBooks();
            IssueDao issueDao = new IssueDao();
            IssuedBooks issueBook = issueDao.getIssueById(issueId);
        %>
        
        <!-- view form -->
  <form action="" method="post">
    <div class="issueTitle">ISSUE RECEIPT : <%=issueBook.getIssueId()%> </div>

    <div class="bookStudentContainer">
      <div class="bookDetails">
        <div class="formGroup">
            <div class="formGroupText">ISBN </div> <input id="form-search" type="text" name="BookISBN" value="<%=issueBook.getIsbn()%>" readonly >
          
        </div>
        <div class="formGroup">
          <div class="formGroupText"> Book Title</div> <input type="text" name="bookTitle" value="<%=issueBook.getBookTitle()%>" readonly >
        </div>
        <div class="formGroup">
          <div class="formGroupText">Category</div> <input type="text" name="bookCategory" value="<%=issueBook.getCategory()%>" readonly>
        </div>
        <div class="formGroup">
          <div class="formGroupText">Author</div> <input type="text" name="bookAuthor"  value="<%=issueBook.getAuthor()%>" readonly>
        </div>
        <div class="formGroup">
          <div class="formGroupText">Publisher</div> <input type="text" name="bookPublisher"  value="<%=issueBook.getPublisher()%>" readonly>
        </div>
        <div class="formGroup">
            <div class="formGroupText">Issue Date</div> <input type="" name="issueDate" value="<%=issueBook.getIssueDate()%>" readonly>
          </div>
      </div>

      <div class="studentDetails">
        <div class="formGroup">
          <div class="formGroupText">Enrollment no. </div> <input id="form-search" type="text" name="enrollment" value="<%=issueBook.getEnrollmentNo()%>" readonly>
        </div>
        <div class="formGroup">
          <div class="formGroupText">First Name</div> <input type="text" name="firstName" value="<%=issueBook.getFirstName()%>" readonly>
        </div>
        <div class="formGroup">
          <div class="formGroupText">Last Name</div> <input type="text" name="lastName" value="<%=issueBook.getLastName()%>" readonly>
        </div>

        <div class="formGroup">
          <div class="formGroupText">Programme</div> <input type="text" name="programme" value="<%=issueBook.getProgramme()%>" readonly>
        </div>
        <div class="formGroupSmall">
          <div class="formGroupText">Semester</div> <input type="text" name="semester" id="seminput" value="<%=issueBook.getSemester()%>" readonly>
          <div class="formGroupTextBatch">
            <div>Batch</div><input type="text" name="batch" value="<%=issueBook.getBatch()%>" readonly>
          </div>
        </div>
        
      </div>
    </div>
  </form>
        <button id="printButton" onclick="window.print()" >Print</button>
   
        
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

