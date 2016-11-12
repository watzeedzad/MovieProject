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
public class Award {

    public static ResultSet searchMovieAward() {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT maw.movieId AS \"Movie ID\", mo.movieName AS \"Movie Name\", aw.awardName AS \"Award\", awt.`type` AS \"Award Type\" FROM Award aw\n"
                    + "LEFT JOIN MovieAward maw ON maw.awardId = aw.awardId\n"
                    + "LEFT JOIN Movie mo ON maw.movieId = mo.movieId\n"
                    + "LEFT JOIN AwardType awt ON aw.awardType = awt.awardTypeId WHERE mo.movieId IS NOT NULL ;");
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }

    public static ResultSet searchStarringAward() {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT saw.starringId AS \"Actor ID\", CONCAT(st.firstname, \" \", st.lastname) AS \"Actor Name\", aw.awardName AS \"Award\", awt.`type` AS \"Award Type\" FROM Award aw\n"
                    + "LEFT JOIN StarringAward saw ON aw.awardId = saw.awardId\n"
                    + "LEFT JOIN Starring st ON saw.starringId = st.starringId\n"
                    + "LEFT JOIN AwardType awt ON aw.awardType = awt.awardTypeId WHERE st.starringId IS NOT NULL ;");
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }

    public static ResultSet searchDirectorAward() {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT daw.directorId AS \"Director ID\", CONCAT(di.firstname, \" \", di.lastname) AS \"Director Name\", aw.awardName AS \"Award\", awt.`type` AS \"Award Type\" FROM Award aw\n"
                    + "LEFT JOIN DirectorAward daw ON daw.awardId = aw.awardId\n"
                    + "LEFT JOIN Director di ON di.directorId = daw.directorId\n"
                    + "LEFT JOIN AwardType awt ON aw.awardType = awt.awardTypeId WHERE di.directorId IS NOT NULL ;");
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }
}
