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
import lms.model.Students;

/**
 *
 * @author Gourav
 */
public class StudentsDao {

    private Connection con = mysqlConnection.getConnection();

    public boolean addStudent(Students student) {
        boolean status = false;

        try {

            String query = "insert into lms.students(enrollmentNo, firstName, lastName, programme, semester, batch) values(?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, student.getEnrollment());
            pst.setString(2, student.getFirstName());
            pst.setString(3, student.getLastName());
            pst.setString(4, student.getProgramme());
            pst.setString(5, student.getSemester());
            pst.setString(6, student.getBatch());

            int result = pst.executeUpdate();

            if (result == 1) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;

    }

    public List<Students> showAllStudents() {

        List<Students> showStudents = new ArrayList<>();
        Students students = null;

        try {
            String query = "select * from students order by firstName asc";
            PreparedStatement pst = con.prepareStatement(query);

            ResultSet result = pst.executeQuery();
            while (result.next()) {
                students = new Students();

                students.setEnrollment(result.getString(1));
                students.setFirstName(result.getString(2));
                students.setLastName(result.getString(3));
                students.setProgramme(result.getString(4));
                students.setSemester(result.getString(5));
                students.setBatch(result.getString(6));

                showStudents.add(students);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return showStudents;
    }

    public boolean deleteStudents(String enroll) {

        boolean status = false;

        try {
            String query = "delete from students where enrollmentNo=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, enroll);

            int i = pst.executeUpdate();

            if (i == 1) {
                status = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Students> studentsSearch(String search) {

        List<Students> showStudents = new ArrayList<Students>();
        Students students = null;

        try {
            String query = "select * from students where enrollmentNo like ? or firstName like ? or lastName like ? or programme like ? or semester like ? and batch like ? order by firstName asc";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, "%" + search + "%");
            pst.setString(2, "%" + search + "%");
            pst.setString(3, "%" + search + "%");
            pst.setString(4, "%" + search + "%");
            pst.setString(5, "%" + search + "%");
            pst.setString(6, "%" + search + "%");

            ResultSet result = pst.executeQuery();
            while (result.next()) {
                students = new Students();

                students.setEnrollment(result.getString(1));
                students.setFirstName(result.getString(2));
                students.setLastName(result.getString(3));
                students.setProgramme(result.getString(4));
                students.setSemester(result.getString(5));
                students.setBatch(result.getString(6));

                showStudents.add(students);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return showStudents;
    }

    public Students getStudentsByEnroll(String enroll) {
        Students students = new Students();

        try {
            String query = "select * from students where enrollmentNo=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, enroll);

            ResultSet result = pst.executeQuery();
            while (result.next()) {
                students = new Students();

                students.setEnrollment(result.getString(1));
                students.setFirstName(result.getString(2));
                students.setLastName(result.getString(3));
                students.setProgramme(result.getString(4));
                students.setSemester(result.getString(5));
                students.setBatch(result.getString(6));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return students;
    }
    
    public boolean updateStudents(Students student){
        
        boolean update = false;
        
        try{
            
            String query = "update students set firstName=?, lastName=?, programme=?, semester=?, batch=? where enrollmentNo=? ";
            PreparedStatement pst = con.prepareStatement(query);
            
            pst.setString(1,student.getFirstName());
            pst.setString(2,student.getLastName());
            pst.setString(3,student.getProgramme());
            pst.setString(4,student.getSemester());
            pst.setString(5,student.getBatch());
            pst.setString(6,student.getEnrollment());
            
            int i = pst.executeUpdate();
            
            if(i==1){
                update = true;
            }
            pst.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
       
        return update;
    }
    
    
    public int studentsCount(){
        int count = 0;
        try{
        String query = "SELECT COUNT(*) FROM students;";
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

}
