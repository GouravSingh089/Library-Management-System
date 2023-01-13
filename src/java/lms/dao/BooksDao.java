/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import lms.connection.mysqlConnection;
import lms.model.Books;

/**
 *
 * @author Gourav
 */
public class BooksDao {
    
    private Connection con=mysqlConnection.getConnection();
    
    
    public boolean addBooks(Books book) {
        boolean status = false;

        try {
            
            
            
            String query = "insert into books(isbn, bookTitle, category, author, publisher, status) values(?,?,?,?,?,?)" ;
            PreparedStatement pst = con.prepareStatement(query);
            
            pst.setString(1,book.getISBN());
            pst.setString(2,book.getBookTitle());
            pst.setString(3,book.getBookCategory());
            pst.setString(4,book.getBookAuthor());
            pst.setString(5,book.getBookPublisher());
            pst.setString(6,book.getBookStatus());
      
            int result = pst.executeUpdate();
               
            if(result==1)
            {
                status = true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
        
    }
    
    
    public List<Books> showAllBooks(){
        
        List<Books> showBooks = new ArrayList<>();
        Books books = null;
        
        try{
            String query = "select * from books order by bookTitle asc";
            PreparedStatement pst = con.prepareStatement(query);
            
            ResultSet result = pst.executeQuery();
            while(result.next()){
                books = new Books();
                
                books.setISBN(result.getString(1));
                books.setBookTitle(result.getString(2));
                books.setBookCategory(result.getString(3));
                books.setBookAuthor(result.getString(4));
                books.setBookPublisher(result.getString(5));
                books.setBookStatus(result.getString(6));
                
                showBooks.add(books);
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return showBooks;
    }
    
    
    public Books getBookByIsbn(String isbn){
        Books books = new Books();
        
        try{
            String query = "select * from books where isbn=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, isbn);
            
            ResultSet result = pst.executeQuery();
            while(result.next()){
                books = new Books();
                
                books.setISBN(result.getString(1));
                books.setBookTitle(result.getString(2));
                books.setBookCategory(result.getString(3));
                books.setBookAuthor(result.getString(4));
                books.setBookPublisher(result.getString(5));
                books.setBookStatus(result.getString(6));
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return books;
    }
    
    
    public boolean updateEditBooks(Books books){
        
        boolean update = false;
        
        try{
            
            String query = "update books set bookTitle=?, category=?, author=?, publisher=?, status=? where isbn=? ";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1,books.getBookTitle());
            pst.setString(2,books.getBookCategory());
            pst.setString(3,books.getBookAuthor());
            pst.setString(4,books.getBookPublisher());
            pst.setString(5,books.getBookStatus());
            pst.setString(6,books.getISBN());
            
            int i = pst.executeUpdate();
            
            if(i==1){
                update = true;
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return update;
    }
    
    public boolean deleteBooks(String isbn){
        
        boolean status = false;
      
        try{
            String query = "delete from books where isbn=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1,isbn);
            
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
    
    
    public List<Books> bookSearch(String search){
        
        List<Books> showBooks = new ArrayList<Books>();
        Books books = null;
        String available = "Available";
        
        try{
            String query = "select * from books where isbn like ? or bookTitle like ? or category like ? or author like ? or publisher like ? and status like ? order by bookTitle asc";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, "%"+search+"%");
            pst.setString(2, "%"+search+"%");
            pst.setString(3, "%"+search+"%");
            pst.setString(4, "%"+search+"%");
            pst.setString(5, "%"+search+"%");
            pst.setString(6, "%"+available+"%");
            
            ResultSet result = pst.executeQuery();
            while(result.next()){
                books = new Books();
                
                books.setISBN(result.getString(1));
                books.setBookTitle(result.getString(2));
                books.setBookCategory(result.getString(3));
                books.setBookAuthor(result.getString(4));
                books.setBookPublisher(result.getString(5));
                books.setBookStatus(result.getString(6));
                
                showBooks.add(books);
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return showBooks;
    }
    
    public int booksCount(){
        int count = 0;
        try{
        String query = "SELECT COUNT(*) FROM books;";
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
    
    public void bookIssued(String isbn){
        boolean status = false;
        
        String query = "update issue set status=? where isbn=?";
        try{
            
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, "Unavailable");
            pst.setString(2, isbn);
            
            int i = pst.executeUpdate();
            
            while(i==1){
                status = true;
            }
        
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
    }
    
    public void bookReturned(String isbn){
        boolean status = false;
        
        String query = "update issue set status=? where isbn=?";
        try{
            
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, "Available");
            pst.setString(2, isbn);
            
            int i = pst.executeUpdate();
            
            while(i==1){
                status = true;
            }
        
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
    }
    
}
