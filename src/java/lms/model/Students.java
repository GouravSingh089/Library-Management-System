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
public class Students {
    
    private String enrollment;
    private String firstName;
    private String lastName;
    private String programme;
    private String semester;
    private String batch;

    public Students(String enrollment, String firstName, String lastName, String programme, String semester, String batch) {
        this.enrollment = enrollment;
        this.firstName = firstName;
        this.lastName = lastName;
        this.programme = programme;
        this.semester = semester;
        this.batch = batch;
    }

    public Students() {
        super();
    }
    
    public String getEnrollment() {
        return enrollment;
    }

    public void setEnrollment(String enrollment) {
        this.enrollment = enrollment;
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
    
    
    
}
