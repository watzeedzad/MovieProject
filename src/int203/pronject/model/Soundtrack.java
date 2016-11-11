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
public class Soundtrack {

    public static ResultSet searchSoundtrack() {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT so.soundtrackId AS \"ID\", so.`name` AS \"Name\", sog.genreType AS \"Gerne\" FROM Soundtrack so\n"
                    + "LEFT JOIN SoundtrackGenre sog ON so.genreId = sog.genreId\n"
                    + "LEFT JOIN SoundtrackCompressor soc ON so.compressorId = soc.compressorId ;");
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }

    public static ResultSet searchSoundtrackByName(String name) {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT so.soundtrackId AS \"ID\", so.`name` AS \"Name\", sog.genreType AS \"Gerne\" FROM Soundtrack so\n"
                    + "LEFT JOIN SoundtrackGenre sog ON so.genreId = sog.genreId\n"
                    + "LEFT JOIN SoundtrackCompressor soc ON so.compressorId = soc.compressorId WHERE so.`name` LIKE ?;");
            pstm.setString(1, '%' + name + '%');
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }

    public static ResultSet searchSoundtrackByGenre(String genre) {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT so.soundtrackId AS \"ID\", so.`name` AS \"Name\", sog.genreType AS \"Gerne\" FROM Soundtrack so\n"
                    + "LEFT JOIN SoundtrackGenre sog ON so.genreId = sog.genreId\n"
                    + "LEFT JOIN SoundtrackCompressor soc ON so.compressorId = soc.compressorId WHERE sog.genreType LIKE ? ;");
            pstm.setString(1, '%' + genre + '%');
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }

    public static ResultSet searchSoundtrackByCompressor(String compressor) {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT so.soundtrackId AS \"ID\", so.`name` AS \"Name\", sog.genreType AS \"Gerne\" FROM Soundtrack so\n"
                    + "LEFT JOIN SoundtrackGenre sog ON so.genreId = sog.genreId\n"
                    + "LEFT JOIN SoundtrackCompressor soc ON so.compressorId = soc.compressorId WHERE soc.compressorName LIKE ? ;");
            pstm.setString(1, '%' + compressor + '%');
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }

    public static ResultSet searchSoundtrackById(int id) {
        ResultSet rs = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT so.soundtrackId AS \"ID\", so.`name` AS \"Name\", sog.genreType AS \"Gerne\" FROM Soundtrack so\n"
                    + "LEFT JOIN SoundtrackGenre sog ON so.genreId = sog.genreId\n"
                    + "LEFT JOIN SoundtrackCompressor soc ON so.compressorId = soc.compressorId WHERE so.soundtrackId = ? ;");
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return rs;
    }
}
