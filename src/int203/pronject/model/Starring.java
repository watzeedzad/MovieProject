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
public class Starring {

    public static ResultSet searchActor() {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT starringId AS \"ID\", CONCAT(firstname, \" \" , lastname) AS \"Starring Name\", age AS \"Age\", street AS \"Street\",\n"
                    + "`state` AS \"State\", city AS \"City\", bio AS \"BIO\", dob AS \"Date of brith\", nationality AS \"Nationality\", sex AS \"Sex\"\n"
                    + "FROM Starring star ;");
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }

    public static ResultSet searchActorByName(String name) {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT starringId AS \"ID\", CONCAT(firstname, \" \" , lastname) AS \"Starring Name\", age AS \"Age\", street AS \"Street\",\n"
                    + "`state` AS \"State\", city AS \"City\", bio AS \"BIO\", dob AS \"Date of brith\", nationality AS \"Nationality\", sex AS \"Sex\"\n"
                    + "FROM Starring star WHERE CONCAT(firstname, \" \" , lastname) LIKE ? ;");
            pstm.setString(1, '%' + name + '%');
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }

    public static ResultSet searchActorById(int id) {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT starringId AS \"ID\", CONCAT(firstname, \" \" , lastname) AS \"Starring Name\", age AS \"Age\", street AS \"Street\",\n"
                    + "`state` AS \"State\", city AS \"City\", bio AS \"BIO\", dob AS \"Date of brith\", nationality AS \"Nationality\", sex AS \"Sex\"\n"
                    + "FROM Starring star WHERE starringId = ?;");
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }
}
