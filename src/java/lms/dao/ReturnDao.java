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
import lms.model.ReturnBook;
import lms.model.Students;

/**
 *
 * @author Gourav
 */
public class ReturnDao {
    
    private Connection con = mysqlConnection.getConnection();
    
    public boolean addReturn(Books book, Students student, String issuedDate, String returnDate) {
        boolean status = false;
        
        String query = ("insert into returnbooks(isbn, bookTitle, category, author, publisher, enrollmentNo, firstName, lastName, programme, semester, batch, issuedDate, returnDate) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
//        updating book status to Available after issue
        String bstatus = "Available";
        String query2 = ("update books set status='"+bstatus+"' where isbn=?");
//        delete book from issue table after returning
        String query3 = ("delete from issue where isbn=?");
        try{
        PreparedStatement pst = con.prepareStatement(query);
        
        pst.setString(1, book.getISBN());
        pst.setString(2, book.getBookTitle());
        pst.setString(3, book.getBookCategory());
        pst.setString(4, book.getBookAuthor());
        pst.setString(5, book.getBookPublisher());
        pst.setString(6, student.getEnrollment());
        pst.setString(7, student.getFirstName());
        pst.setString(8, student.getLastName());
        pst.setString(9, student.getProgramme());
        pst.setString(10, student.getSemester());
        pst.setString(11, student.getBatch());
        pst.setString(12, issuedDate);
        pst.setString(13, returnDate);
        
        int i = pst.executeUpdate();
        if(i==1)
        {
            status = true;
        }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        //set Book status Available
        if(status){
            try {
                PreparedStatement pst2 = con.prepareStatement(query2);
                pst2.setString(1, book.getISBN());
                
                pst2.executeUpdate();
                
            } catch (SQLException ex) {
                Logger.getLogger(ReturnDao.class.getName()).log(Level.SEVERE, null, ex);
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        
        if(status){
            try {
                PreparedStatement pst3 = con.prepareStatement(query3);
                pst3.setString(1, book.getISBN());
                
                pst3.executeUpdate();
                
            } catch (SQLException ex) {
                Logger.getLogger(ReturnDao.class.getName()).log(Level.SEVERE, null, ex);
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        
        return status;
    }
    
    public List<ReturnBook> showReturnedBooks(){
        
        List<ReturnBook> showreturnedbooks = new ArrayList<>();
        ReturnBook returnBook = null;
        
        try{
            String query = "select * from returnbooks order by returnDate desc";
            PreparedStatement pst = con.prepareStatement(query);
            System.out.println(con.toString());
            ResultSet result = pst.executeQuery();
            while(result.next()){
                returnBook = new ReturnBook();
                
                returnBook.setReturnId(result.getInt(1));
                returnBook.setIsbn(result.getString(2));
                returnBook.setBookTitle(result.getString(3));
                returnBook.setCategory(result.getString(4));
                returnBook.setAuthor(result.getString(5));
                returnBook.setPublisher(result.getString(6));
                returnBook.setEnrollmentNo(result.getString(7));
                returnBook.setFirstName(result.getString(8));
                returnBook.setLastName(result.getString(9));
                returnBook.setProgramme(result.getString(10));
                returnBook.setSemester(result.getString(11));
                returnBook.setBatch(result.getString(12));
                returnBook.setIssuedDate(result.getString(13));
                returnBook.setReturnDate(result.getString(14));
                
                showreturnedbooks.add(returnBook);
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return showreturnedbooks;
    }
    
    public ReturnBook getReturnById(String returnId){
        ReturnBook returnBook = new ReturnBook();
        
        String query = "Select * from returnbooks where returnId = ?";
        
        try{
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, returnId);
            
            ResultSet result = pst.executeQuery();
            
            while(result.next()){
                
                returnBook.setReturnId(result.getInt(1));
                returnBook.setIsbn(result.getString(2));
                returnBook.setBookTitle(result.getString(3));
                returnBook.setCategory(result.getString(4));
                returnBook.setAuthor(result.getString(5));
                returnBook.setPublisher(result.getString(6));
                returnBook.setEnrollmentNo(result.getString(7));
                returnBook.setFirstName(result.getString(8));
                returnBook.setLastName(result.getString(9));
                returnBook.setProgramme(result.getString(10));
                returnBook.setSemester(result.getString(11));
                returnBook.setBatch(result.getString(12));
                returnBook.setIssuedDate(result.getString(13));
                returnBook.setReturnDate(result.getString(14));
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return returnBook;
    }
    
    public boolean deleteReturnedBook(String return_id){
        
        boolean status = false;
      
        try{
            String query = "delete from returnbooks where returnId=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1,return_id);
            
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
    
}
