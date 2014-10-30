package OGS.tables;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import OGS.beans.Student;
import OGS.beans.Submission;
import OGS.dbaccess.DBType;
import OGS.dbaccess.DBUtil;

/**
 *
 * @author eloo, Zain
 */
public class StudentManager {

    /**
     @param takes the ID of the row
     * This method connects to the database and then it gets the row which ID was referenced to and then 
     * it parses the information that was returned from the the row.
     * @returns the Professor object 
     * @throws SQLException  
     */
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
    /**
     * 
     * @param studentBean which will be inserted into the database table
     * This Method take studentBean and then it parses the information from the 
     * studentBean and then it inserts the information into the database
     * @returns true if the information was correctly inserted into the database else it returns false.
     * @throws SqlException  
     */
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
    /**
     * @param studentBean  will be updated
     * This method takes a studentBean and updates the information in the database
     * @return true if the information was updated correctly else it returns false
     * @throws SqlException 
     */
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
    /**
     * 
     * @param assignmentID 
     * @param studentID
     * This method checks the assignment grade for the student
     * @return returns the grade that matches the studentID and the assignmentID
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
