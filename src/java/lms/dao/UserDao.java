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
public class UserDao {
    
    private Connection con=mysqlConnection.getConnection();
    
    public boolean updateEditUser(String username, User user){
        
        boolean update = false;
        
        try{
            
            String query = "update users set firstName=?, lastName=?, email=?, password=? where username=? ";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1,user.getFirstName());
            pst.setString(2,user.getLastName());
            pst.setString(3,user.getEmail());
            pst.setString(4,user.getPassword());
            pst.setString(5, username);
            
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
    
}
