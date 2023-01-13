/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import lms.connection.mysqlConnection;
import lms.model.User;

/**
 *
 * @author Gourav
 */
public class LoginDao {

    public LoginDao() {
        super();

    }

    public User checkLogin(String username, String password) {
        User user = null;
        try {
            
            Connection con=mysqlConnection.getConnection();
            
            String query = "Select * from lms.users where username = ? and password = ?";
            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, username);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                user = new User();
                user.setFirstName(rs.getString(1));
                user.setLastName(rs.getString(2));
                user.setUsername(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setPassword(rs.getString(5));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}
