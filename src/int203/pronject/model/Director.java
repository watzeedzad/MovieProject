/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int203.pronject.model;

import int203.project.etc.ConnectionBuilder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author jiraw
 */
public class Director {

    public static ResultSet searchDirector() {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT directorId AS \"ID\", CONCAT(firstname, \" \", lastname) AS \"Name\", age AS \"Age\", street AS \"Street\", `state` AS \"State\",\n"
                    + "city AS \"City\", bio AS \"Bio\", dob AS \"Date of brith\", nationality AS \"Nationality\", sex AS \"Sex\"\n"
                    + "FROM Director di ;");
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }

    public static ResultSet searchDirectorByName(String name) {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT directorId AS \"ID\", CONCAT(firstname, \" \", lastname) AS \"Name\", age AS \"Age\", street AS \"Street\", `state` AS \"State\",\n"
                    + "city AS \"City\", bio AS \"Bio\", dob AS \"Date of brith\", nationality AS \"Nationality\", sex AS \"Sex\"\n"
                    + "FROM Director di WHERE CONCAT(firstname, \" \" , lastname) LIKE ?;");
            pstm.setString(1, '%' + name + '%');
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }

    public static ResultSet searchDirectorById(int id) {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT directorId AS \"ID\", CONCAT(firstname, \" \", lastname) AS \"Name\", age AS \"Age\", street AS \"Street\", `state` AS \"State\",\n"
                    + "city AS \"City\", bio AS \"Bio\", dob AS \"Date of brith\", nationality AS \"Nationality\", sex AS \"Sex\"\n"
                    + "FROM Director di WHERE directorId = ?;");
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }
}
