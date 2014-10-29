package simcontrol.ogs.tables;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import simcontrol.ogs.beans.Student;
import simcontrol.ogs.beans.Submission;
import simcontrol.ogs.dbaccess.DBType;
import simcontrol.ogs.dbaccess.DBUtil;

/**
 *
 * @author eloo, Zain
 */
public class StudentManager {

    public static Student getRow(int ID) throws SQLException {

        String sql = "SELECT * FROM students WHERE ID = ?";
        ResultSet rs = null;

        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setInt(1, ID);
            rs = stmt.executeQuery();

            if (rs.next()) {
                Student studentBean = new Student();
                studentBean.setName(rs.getString("name"));
                studentBean.setID(ID);
                studentBean.setUserName(rs.getString("userName"));
                studentBean.setPassword(rs.getString("password"));
                studentBean.setEmailAddress(rs.getString("EmailAddress"));
                studentBean.setAccessLevel(rs.getInt("AccessLevel"));
                return studentBean;
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

    public static boolean insert(Student studentBean) throws Exception {

        String sql = "INSERT into students"
                + " (name, userName, password, EmailAddress, AccessLevel) "
                + "VALUES (?, ?, ?, ?, ?)";
        ResultSet keys = null;
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {

            stmt.setString(1, studentBean.getName());
            stmt.setString(2, studentBean.getUserName());
            stmt.setString(3, studentBean.getPassword());
            stmt.setString(4, studentBean.getEmailAddress());
            stmt.setInt(5, studentBean.getAccessLevel());
            int affected = stmt.executeUpdate();

            if (affected == 1) {
                keys = stmt.getGeneratedKeys();
                keys.next();
                int newKey = keys.getInt(1);
                studentBean.setID(newKey);
            } else {
                System.err.println("No rows affected");
                return false;
            }

        } catch (SQLException e) {
            System.err.println(e);
            return false;
        } finally {
            if (keys != null) {
                keys.close();
            }
        }
        return true;
    }

    public static boolean update(Student studentBean) throws Exception {

        String sql
                = "UPDATE students SET " + "name = ?, "
                + "userName = ?, password = ?, " + "EmailAddress = ?,"
                + "accessLevel = ? WHERE ID = ?";
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {

            stmt.setString(1, studentBean.getName());
            stmt.setString(2, studentBean.getUserName());
            stmt.setString(3, studentBean.getPassword());
            stmt.setString(4, studentBean.getEmailAddress());
            stmt.setInt(5, studentBean.getAccessLevel());
            stmt.setInt(6, studentBean.getID());

            int affected = stmt.executeUpdate();
            if (affected == 1) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException e) {
            System.err.println(e);
            return false;
        }

    }

    /**
     * Check Grade Method allows a student or ta to chekc theri grade for an
     * assinment
     *
     * @returns a grade which is a double
     */
    public static Double checkGrade(int assignmentID, int studentID) {
        try {
            Submission sbean = SubmissionManager.getRow(studentID, assignmentID);
            return sbean.getGrade();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return 0.0;
    }

    /**
     * Submit Assingment
     */
    public void sumbmitAssignment() {
        
    }

    /**
     * check Comments Method
     */
    public void checkComments() {

    }
}
