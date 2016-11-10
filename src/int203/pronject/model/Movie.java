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
public class Movie {

    public static ResultSet searchMovieById(int movieId) {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT mo.movieId AS \"ID\", mo.movieName AS \"Name\", mo.boxOffice AS \"Box Office\", mo.duration AS \"Duration\", \n"
                    + "mo.rating AS \"Rating\", so.name AS \"Soundtrack Name\", di.firstname|| ' ' ||di.lastname AS \"Director Name\",\n"
                    + "aw.awardName AS \"Award\", stu.name AS \"Studio\", tmo.type AS \"Type\", star.firstname|| ' ' ||star.lastname AS \"Starring Name\" FROM Movie mo\n"
                    + "LEFT JOIN Soundtrack so ON so.soundtrackId = mo.soundtrackId\n"
                    + "LEFT JOIN Director di ON di.directorId = mo.directorId\n"
                    + "LEFT JOIN Award aw ON aw.awardId = mo.awardId\n"
                    + "LEFT JOIN Studio stu ON stu.studioId = mo.studioId\n"
                    + "LEFT JOIN TypeMovie tmo ON tmo.typeMovieId = mo.typeMovie\n"
                    + "LEFT JOIN MovieActor ma ON ma.movieId = mo.movieId\n"
                    + "LEFT JOIN Starring star ON star.starringId = ma.starringId WHERE mo.movieId = ?;");
            pstm.setInt(1, movieId);
            rs = pstm.executeQuery();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return rs;
    }

    public static ResultSet searchMovieByName(String movieName) {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT mo.movieId AS \"ID\", mo.movieName AS \"Name\", mo.boxOffice AS \"Box Office\", mo.duration AS \"Duration\", \n"
                    + "mo.rating AS \"Rating\", so.name AS \"Soundtrack Name\", di.firstname|| ' ' ||di.lastname AS \"Director Name\",\n"
                    + "aw.awardName AS \"Award\", stu.name AS \"Studio\", tmo.type AS \"Type\", star.firstname|| ' ' ||star.lastname AS \"Starring Name\" FROM Movie mo\n"
                    + "LEFT JOIN Soundtrack so ON so.soundtrackId = mo.soundtrackId\n"
                    + "LEFT JOIN Director di ON di.directorId = mo.directorId\n"
                    + "LEFT JOIN Award aw ON aw.awardId = mo.awardId\n"
                    + "LEFT JOIN Studio stu ON stu.studioId = mo.studioId\n"
                    + "LEFT JOIN TypeMovie tmo ON tmo.typeMovieId = mo.typeMovie\n"
                    + "LEFT JOIN MovieActor ma ON ma.movieId = mo.movieId\n"
                    + "LEFT JOIN Starring star ON star.starringId = ma.starringId WHERE mo.movieName LIKE ?;");
            pstm.setString(1, '%' + movieName + '%');
            rs = pstm.executeQuery();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return rs;
    }

    public static ResultSet searchMovie() {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT mo.movieId AS \"ID\", mo.movieName AS \"Name\", mo.boxOffice AS \"Box Office\", mo.duration AS \"Duration\", mo.rating AS \"Rating\", so.name AS \"Soundtrack Name\", di.firstname|| ' ' ||di.lastname AS \"Director Name\", \n"
                    + "aw.awardName AS \"Award\", stu.`name` AS \"Studio\", tmo.`type` AS \"Type\", star.firstname|| ' ' ||star.lastname AS \"Starring Name\"  FROM Movie mo \n"
                    + "LEFT JOIN Soundtrack so ON so.soundtrackId = mo.soundtrackId\n"
                    + "LEFT JOIN Director di ON di.directorId = mo.directorId\n"
                    + "LEFT JOIN Award aw ON aw.awardId = mo.awardId\n"
                    + "LEFT JOIN Studio stu ON stu.studioId = mo.studioId\n"
                    + "LEFT JOIN TypeMovie tmo ON tmo.typeMovieId = mo.typeMovie\n"
                    + "LEFT JOIN MovieActor ma ON ma.movieId = mo.movieId\n"
                    + "LEFT JOIN Starring star ON star.starringId = ma.starringId ;");
            rs = pstm.executeQuery();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return rs;
    }
}
