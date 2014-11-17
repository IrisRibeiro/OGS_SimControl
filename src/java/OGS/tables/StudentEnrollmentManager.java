/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OGS.tables;

import OGS.beans.StudentEnrollment;
import OGS.dbaccess.DBType;
import OGS.dbaccess.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Eric
 */
public class StudentEnrollmentManager {
    public static StudentEnrollment getRowwithID(String ID) throws SQLException {

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
                studentenrollment.setCourseID(rs.getString("CourseID"));
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
    
    public static StudentEnrollment getRowwithCourseID(String ID) throws SQLException {

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
                studentenrollment.setCourseID(rs.getString("CourseID"));
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
    
    
     public static StudentEnrollment getRowID(String StudentID, String CourseID) throws SQLException {

        String sql = "SELECT * FROM StudentEnrollment WHERE StudentID = ? AND CourseID= ?";
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
                studentenrollment.setCourseID(rs.getString("CourseID"));
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
}
