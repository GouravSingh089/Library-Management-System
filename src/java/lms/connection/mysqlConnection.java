/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lms.connection;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Gourav
 */
public class mysqlConnection {

    private static Connection con;

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "password");
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return con;
    }
}
