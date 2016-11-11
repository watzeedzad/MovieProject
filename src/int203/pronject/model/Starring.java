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
            PreparedStatement pstm = conn.prepareStatement("SELECT star.starringId AS \"ID\", star.firstname|| ' ' ||star.lastname AS \"Starring Name\", star.age AS \"Age\", star.street \n"
                    + "AS \"Street\", star.`state` AS \"State\", star.city AS \"City\", star.bio AS \"BIO\", star.dob AS \"Date of brith\", star.nationality AS \"Nationality\", star.sex AS \"Sex\"\n"
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
            PreparedStatement pstm = conn.prepareStatement("SELECT star.starringId AS \"ID\", star.firstname|| ' ' ||star.lastname AS \"Starring Name\", star.age AS \"Age\", star.street \n"
                    + "AS \"Street\", star.`state` AS \"State\", star.city AS \"City\", star.bio AS \"BIO\", star.dob AS \"Date of brith\", star.nationality AS \"Nationality\", star.sex AS \"Sex\"\n"
                    + "FROM Starring star WHERE \"Starring Name\" LIKE ? ;");
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
            PreparedStatement pstm = conn.prepareStatement("SELECT star.starringId AS \"ID\", star.firstname|| ' ' ||star.lastname AS \"Starring Name\", star.age AS \"Age\", star.street \n"
                    + "AS \"Street\", star.`state` AS \"State\", star.city AS \"City\", star.bio AS \"BIO\", star.dob AS \"Date of brith\", star.nationality AS \"Nationality\", star.sex AS \"Sex\"\n"
                    + "FROM Starring star WHERE star.starringId = ? ;");
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }
}
