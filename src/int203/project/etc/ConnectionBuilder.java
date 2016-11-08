/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int203.project.etc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author jiraw
 */
public class ConnectionBuilder {

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://54.169.9.10:3306/int203_project?zeroDateTimeBehavior=convertToNull", "int203-project", "int203-project");
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex);
        }
        return conn;
    }
}
