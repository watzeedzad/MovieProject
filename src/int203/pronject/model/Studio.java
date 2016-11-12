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
public class Studio {

    public static ResultSet searchStudio() {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT su.studioId AS \"ID\", su.`name` AS \"Name\", su.street AS \"Street\", su.`state` AS \"State\", su.zip AS \"Zip\", su.city AS \"City\"\n"
                    + "FROM Studio su ;");
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }

    public static ResultSet searchStudioByName(String name) {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT su.studioId AS \"ID\", su.`name` AS \"Name\", su.street AS \"Street\", su.`state` AS \"State\", su.zip AS \"Zip\", su.city AS \"City\"\n"
                    + "FROM Studio su WHERE su.`name` LIKE ?;");
            pstm.setString(1, '%' + name + '%');
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }

    public static ResultSet searchStudioById(int id) {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT su.studioId AS \"ID\", su.`name` AS \"Name\", su.street AS \"Street\", su.`state` AS \"State\", su.zip AS \"Zip\", su.city AS \"City\"\n"
                    + "FROM Studio su WHERE studioId = ?;");
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }
}
