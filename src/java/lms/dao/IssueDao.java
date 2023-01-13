/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import lms.connection.mysqlConnection;
import lms.model.Books;
import lms.model.IssuedBooks;
import lms.model.Students;

/**
 *
 * @author Gourav
 */
public class IssueDao {
    
    private Connection con = mysqlConnection.getConnection();
    
    public boolean addIssue(Books book, Students student, String issueDate) {
        boolean status = false;
//        updating book status to unavailable after issue
        String bstatus = "Unavailable";
        String query2 = ("update books set status='"+bstatus+"' where isbn=?");
        
        try {

            String query = "insert into issue(isbn, bookTitle, category, author, publisher, enrollmentNo, firstName, lastName, programme, semester, batch, issueDate) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1,book.getISBN());
            pst.setString(2,book.getBookTitle());
            pst.setString(3,book.getBookCategory());
            pst.setString(4,book.getBookAuthor());
            pst.setString(5,book.getBookPublisher());
            pst.setString(6, student.getEnrollment());
            pst.setString(7, student.getFirstName());
            pst.setString(8, student.getLastName());
            pst.setString(9, student.getProgramme());
            pst.setString(10, student.getSemester());
            pst.setString(11, student.getBatch());
            pst.setString(12,issueDate);

            int result = pst.executeUpdate();

            if (result == 1) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        if(status==true){
            try {
                System.out.println("Book set to unavailable");
                PreparedStatement pst2 = con.prepareStatement(query2);
                pst2.setString(1, book.getISBN());
                
                pst2.executeUpdate();
                
            } catch (SQLException ex) {
                Logger.getLogger(ReturnDao.class.getName()).log(Level.SEVERE, null, ex);
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        
        return status;
    }
    
    public List<IssuedBooks> showIssuedBooks(){
        
        List<IssuedBooks> showissuedbooks = new ArrayList<>();
        IssuedBooks issuedBook = null;
        
        try{
            String query = "select * from issue order by enrollmentNo asc";
            PreparedStatement pst = con.prepareStatement(query);
            
            ResultSet result = pst.executeQuery();
            while(result.next()){
                issuedBook = new IssuedBooks();
                
                issuedBook.setIssueId(result.getString(1));
                issuedBook.setIsbn(result.getString(2));
                issuedBook.setBookTitle(result.getString(3));
                issuedBook.setCategory(result.getString(4));
                issuedBook.setAuthor(result.getString(5));
                issuedBook.setPublisher(result.getString(6));
                issuedBook.setEnrollmentNo(result.getString(7));
                issuedBook.setFirstName(result.getString(8));
                issuedBook.setLastName(result.getString(9));
                issuedBook.setProgramme(result.getString(10));
                issuedBook.setSemester(result.getString(11));
                issuedBook.setBatch(result.getString(12));
                issuedBook.setIssueDate(result.getString(13));
                
                showissuedbooks.add(issuedBook);
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return showissuedbooks;
    }
    
    public IssuedBooks getIssueById(String issueId){
        IssuedBooks issueBooks = new IssuedBooks();
        
        String query = "Select * from issue where issueId = ?";
        
        try{
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, issueId);
            
            ResultSet result = pst.executeQuery();
            
            while(result.next()){
                
                issueBooks.setIssueId(result.getString(1));
                issueBooks.setIsbn(result.getString(2));
                issueBooks.setBookTitle(result.getString(3));
                issueBooks.setCategory(result.getString(4));
                issueBooks.setAuthor(result.getString(5));
                issueBooks.setPublisher(result.getString(6));
                issueBooks.setEnrollmentNo(result.getString(7));
                issueBooks.setFirstName(result.getString(8));
                issueBooks.setLastName(result.getString(9));
                issueBooks.setProgramme(result.getString(10));
                issueBooks.setSemester(result.getString(11));
                issueBooks.setBatch(result.getString(12));
                issueBooks.setIssueDate(result.getString(13));
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return issueBooks;
    }
    
    public boolean deleteIssuedBook(String issue_id){
        
        boolean status = false;
      
        try{
            String query = "delete from issue where issueId=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1,issue_id);
            
            int i = pst.executeUpdate();
            
            if(i==1){
                status = true;
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return status;
    }
    
    public int issueCount(){
        int count = 0;
        try{
        String query = "SELECT COUNT(*) FROM issue;";
        PreparedStatement pst = con.prepareStatement(query);
        ResultSet rs = pst.executeQuery();
        
        while(rs.next()){
            
            count = rs.getInt(1);
        }
        }
        catch(Exception e){
        e.printStackTrace();
        }
        return count;
    }
    
    public boolean returnIssued(IssuedBooks issueBook, String returnDate){
        boolean status = false;
            
        System.out.println("Gourav: " + issueBook.getIsbn());
        
        try {
            String query = "insert into return(isbn, bookTitle, category, author, publisher, enrollmentNo, firstName, lastName, programme, semester, batch, returnDate) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(query);
            System.out.println(issueBook.getIsbn());
            
            pst.setString(1, issueBook.getIsbn());
            pst.setString(2, issueBook.getBookTitle());
            pst.setString(3, issueBook.getCategory());
            pst.setString(4, issueBook.getAuthor());
            pst.setString(5, issueBook.getPublisher());
            pst.setString(6, issueBook.getEnrollmentNo());
            pst.setString(7, issueBook.getFirstName());
            pst.setString(8, issueBook.getLastName());
            pst.setString(9, issueBook.getProgramme());
            pst.setString(10, issueBook.getSemester());
            pst.setString(11, issueBook.getBatch());
            pst.setString(12, returnDate);
            
            pst.executeUpdate();
            status = true;
            

        } catch(Exception e){
            e.printStackTrace();
        }
        
        return status;  
    }
    
}
