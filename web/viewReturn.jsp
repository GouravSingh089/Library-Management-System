<%-- 
    Document   : viewIssue
    Created on : 27 Mar, 2022, 6:23:28 AM
    Author     : Gourav
--%>
<%@page import="lms.model.ReturnBook"%>
<%@page import="lms.dao.ReturnDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LMS | RETURNED BOOK</title>
        <link rel="stylesheet" href="viewIssue.css">
        <link rel="stylesheet" href="uniFooter.css">
        <script src="https://kit.fontawesome.com/bbbf36e78d.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="dashboardNav.jsp" %>
        
        
            <%
                String returnId = request.getParameter("returnId");
                ReturnDao returnDao = new ReturnDao();
                ReturnBook returnBook = returnDao.getReturnById(returnId);
            %>
        
        <!-- view form -->
  <form action="" method="post">
    <div class="issueTitle">RETURN RECEIPT : <%=returnBook.getReturnId()%> </div>

    <div class="bookStudentContainer">
      <div class="bookDetails">
        <div class="formGroup">
            <div class="formGroupText">ISBN </div> <input id="form-search" type="text" name="BookISBN" value="<%=returnBook.getIsbn()%>" readonly >
          
        </div>
        <div class="formGroup">
          <div class="formGroupText"> Book Title</div> <input type="text" name="bookTitle" value="<%=returnBook.getBookTitle()%>" readonly >
        </div>
        <div class="formGroup">
          <div class="formGroupText">Category</div> <input type="text" name="bookCategory" value="<%=returnBook.getCategory()%>" readonly>
        </div>
        <div class="formGroup">
          <div class="formGroupText">Author</div> <input type="text" name="bookAuthor"  value="<%=returnBook.getAuthor()%>" readonly>
        </div>
        <div class="formGroup">
          <div class="formGroupText">Publisher</div> <input type="text" name="bookPublisher"  value="<%=returnBook.getPublisher()%>" readonly>
        </div>
        <div class="formGroup">
            <div class="formGroupText">Return Date</div> <input type="" name="returnDate" value="<%=returnBook.getReturnDate()%>" readonly>
          </div>
      </div>

      <div class="studentDetails">
        <div class="formGroup">
          <div class="formGroupText">Enrollment no. </div> <input id="form-search" type="text" name="enrollment" value="<%=returnBook.getEnrollmentNo()%>" readonly>
        </div>
        <div class="formGroup">
          <div class="formGroupText">First Name</div> <input type="text" name="firstName" value="<%=returnBook.getFirstName()%>" readonly>
        </div>
        <div class="formGroup">
          <div class="formGroupText">Last Name</div> <input type="text" name="lastName" value="<%=returnBook.getLastName()%>" readonly>
        </div>

        <div class="formGroup">
          <div class="formGroupText">Programme</div> <input type="text" name="programme" value="<%=returnBook.getProgramme()%>" readonly>
        </div>
        <div class="formGroupSmall">
          <div class="formGroupText">Semester</div> <input type="text" name="semester" id="seminput" value="<%=returnBook.getSemester()%>" readonly>
          <div class="formGroupTextBatch">
            <div>Batch</div><input type="text" name="batch" value="<%=returnBook.getBatch()%>" readonly>
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

