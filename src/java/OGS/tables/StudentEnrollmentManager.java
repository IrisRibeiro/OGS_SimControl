/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OGS.tables;

import OGS.beans.StudentEnrollment;
import OGS.dbaccess.DBType;
import OGS.dbaccess.DBUtil;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

/**
 *
 * @author Eric
 */
public class StudentEnrollmentManager {
    private static final Logger LOGGER = Logger.getLogger(CourseManager.class.getName());
    

    public static StudentEnrollment getRowwithID(String ID) throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM StudentEnrollment WHERE StudentID = ?";
        ResultSet rs = null;

        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, ID);
            rs = stmt.executeQuery();

            if (rs.next()) {
                StudentEnrollment studentenrollment = new StudentEnrollment();
                studentenrollment.setStudentID(rs.getString("StudentID"));
                studentenrollment.setClassID(rs.getString("ClassID"));
                studentenrollment.setFlag(rs.getString("Flag"));
                return studentenrollment;
            } else {
                return null;
            }

        } catch (SQLException e) {
            System.err.println(e);
            return null;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }

    }
    
    public static StudentEnrollment getRowwithCourseID(String ID) throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM StudentEnrollment WHERE CourseID = ?";
        ResultSet rs = null;

        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
                stmt.setString(1, ID);
            rs = stmt.executeQuery();

            if (rs.next()) {
                StudentEnrollment studentenrollment = new StudentEnrollment();
                studentenrollment.setStudentID(rs.getString("StudentID"));
                studentenrollment.setClassID(rs.getString("ClassID"));
                 studentenrollment.setFlag(rs.getString("Flag"));
                return studentenrollment;
            } else {
                return null;
            }

        } catch (SQLException e) {
            System.err.println(e);
            return null;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }

    }
    
    
     public static StudentEnrollment getRowID(String StudentID, String CourseID) throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM StudentEnrollment WHERE StudentID = ? AND ClassID= ?";
        ResultSet rs = null;

        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
                stmt.setString(1, StudentID);
                stmt.setString(2, CourseID);
            rs = stmt.executeQuery();

            if (rs.next()) {
                StudentEnrollment studentenrollment = new StudentEnrollment();
                studentenrollment.setStudentID(rs.getString("StudentID"));
                studentenrollment.setClassID(rs.getString("ClassID"));
                 studentenrollment.setFlag(rs.getString("Flag"));
                return studentenrollment;
            } else {
                return null;
            }

        } catch (SQLException e) {
            System.err.println(e);
            return null;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }

    }
     public static boolean insert(StudentEnrollment studentEn) throws Exception {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\StudentEnrollment_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method insert()");

        String sql = "INSERT into studentenrollment (ClassID, StudentID, Flag)" 
                + "VALUES (?,?,?)";
        ResultSet keys = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {
            
            stmt.setString(1,studentEn.getClassID() );
            stmt.setString(2, studentEn.getStudentID());
            stmt.setString(3, studentEn.getFlag());
            
            LOGGER.config("Object Student Enrollment is equal to :" + studentEn);
            int affected = stmt.executeUpdate();
            
            if (affected != 1) {
               LOGGER.log(Level.SEVERE, "Exception occur", stmt.getGeneratedKeys());
                if(conn!= null)
                conn.rollback();
                System.err.println("No rows affected");
                return false;
            } 

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Exception occur", e);
            System.err.println(e);            
            return false;
        } finally {
            if (keys != null) {
                keys.close();
            }
        }
        return true;
    }
     
}
