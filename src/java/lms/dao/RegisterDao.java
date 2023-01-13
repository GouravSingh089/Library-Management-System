/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import lms.connection.mysqlConnection;
import lms.model.User;

/**
 *
 * @author Gourav
 */
public class RegisterDao {

    public boolean registerUser(User user) {
        boolean status = false;

        try {
            
            Connection con=mysqlConnection.getConnection();
            
            String query = "insert into lms.users(firstName, lastName, username, email, password) values(?,?,?,?,?)" ;
            PreparedStatement pst = con.prepareStatement(query);
            
            pst.setString(1,user.getFirstName());
            pst.setString(2,user.getLastName());
            pst.setString(3,user.getUsername());
            pst.setString(4,user.getEmail());
            pst.setString(5,user.getPassword());
      
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

}

