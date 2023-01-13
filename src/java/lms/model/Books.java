/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lms.model;

/**
 *
 * @author Gourav
 */
public class Books {
    
    private String ISBN;
    private String bookTitle;
    private String bookCategory;
    private String bookAuthor;
    private String bookPublisher;
    private String bookStatus;

    public String getBookStatus() {
        return bookStatus;
    }

    public void setBookStatus(String bookStatus) {
        this.bookStatus = bookStatus;
    }

    public Books(String ISBN, String bookTitle, String bookCategory, String bookAuthor, String bookPublisher, String bookStatus) {
        this.ISBN = ISBN;
        this.bookTitle = bookTitle;
        this.bookCategory = bookCategory;
        this.bookAuthor = bookAuthor;
        this.bookPublisher = bookPublisher;
        this.bookStatus = bookStatus;
    }

    public Books() {
        super();
    }
    
    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookPublisher() {
        return bookPublisher;
    }

    public void setBookPublisher(String bookPublisher) {
        this.bookPublisher = bookPublisher;
    }
    
    
    
}
