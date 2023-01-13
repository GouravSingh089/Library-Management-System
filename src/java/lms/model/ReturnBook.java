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
public class ReturnBook {
    private int returnId ;
    private String isbn;
    private String bookTitle;
    private String category;
    private String author;
    private String publisher;
    private String enrollmentNo;
    private String firstName;
    private String lastName;
    private String programme;
    private String semester;
    private String batch;
    private String issuedDate;
    private String returnDate;

    public String getIssuedDate() {
        return issuedDate;
    }

    public void setIssuedDate(String issuedDate) {
        this.issuedDate = issuedDate;
    }

    public ReturnBook(int returnId, String isbn, String bookTitle, String category, String author, String publisher, String enrollmentNo, String firstName, String lastName, String programme, String semester, String batch, String returnDate, String issuedDate) {
        this.returnId = returnId;
        this.isbn = isbn;
        this.bookTitle = bookTitle;
        this.category = category;
        this.author = author;
        this.publisher = publisher;
        this.enrollmentNo = enrollmentNo;
        this.firstName = firstName;
        this.lastName = lastName;
        this.programme = programme;
        this.semester = semester;
        this.batch = batch;
        this.issuedDate = issuedDate;
        this.returnDate = returnDate;
    }

    public ReturnBook() {
        super();
    }
    
    
    public int getReturnId() {
        return returnId;
    }

    public void setReturnId(int returnId) {
        this.returnId = returnId;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getEnrollmentNo() {
        return enrollmentNo;
    }

    public void setEnrollmentNo(String enrollmentNo) {
        this.enrollmentNo = enrollmentNo;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getProgramme() {
        return programme;
    }

    public void setProgramme(String programme) {
        this.programme = programme;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(String returnDate) {
        this.returnDate = returnDate;
    }
    
    
    
    
}
