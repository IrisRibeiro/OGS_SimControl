package OGS.tables;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import OGS.beans.Submission;
import OGS.dbaccess.DBType;
import OGS.dbaccess.DBUtil;

/**
 *
 * @author Eric
 */
public class SubmissionManager {
    /**
     @param takes the ID of the row
     * This method connects to the database and then it gets the row which ID was referenced to and then 
     * it parses the information that was returned from the the row.
     * @returns the Professor object 
     * @throws SQLException  
     */
    public static Submission getRow(String studentID, String assignmentID) throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM Submissions WHERE studentID = ? AND "
                + "assignmentID = ?";
        ResultSet rs = null;

        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            
            stmt.setString(1, studentID);
            stmt.setString(2, assignmentID);
            rs = stmt.executeQuery();

            if (rs.next()) {
                Submission submissionBean = new Submission();
                submissionBean.setStudentID(studentID);
                submissionBean.setAssignmentID(assignmentID);
                submissionBean.setGraderID(rs.getString("graderID"));
                submissionBean.setSubmissionID(rs.getString("submissionID"));
                submissionBean.setGrade(rs.getDouble("grade"));
                submissionBean.setComments(rs.getString("comments"));
                submissionBean.setPath(rs.getString("path"));
                submissionBean.setDateFlag(rs.getString("dateFlag"));
                submissionBean.setSubmissionTime(rs.getString("submissionTime"));
                return submissionBean;
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
     * @param submissiontBean which will be inserted into the database table
     * This Method take submissionBean and then it parses the information from the 
     * submissionBean and then it inserts the information into the database
     * @returns true if the information was correctly inserted into the database else it returns false.
     * @throws SqlException  
     */
    public static boolean insert(Submission submissionBean) throws Exception {

        String sql = "INSERT into Submission"
                + " (studentID, assignmentID, graderID"
                + ", grade, comments, path, dateFlag, submissionTime) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        ResultSet keys = null;
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {

            stmt.setString(1, submissionBean.getStudentID());
            stmt.setString(2, submissionBean.getAssignmentID());
            stmt.setString(3, submissionBean.getGraderID());
            stmt.setDouble(4, submissionBean.getGrade());
            stmt.setString(5, submissionBean.getComments());
            stmt.setString(6, submissionBean.getPath());
            stmt.setString(7, submissionBean.getPath());
            stmt.setString(8, submissionBean.getSubmissionTime());
            int affected = stmt.executeUpdate();

            if (affected != 1) {
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
     * @param submissionBean  will be updated
     * This method takes a submissionBean and updates the information in the database
     * @return true if the information was updated correctly else it returns false
     * @throws SqlException 
     */
    public static boolean update(Submission submissionBean) throws Exception {

        String sql
                = "UPDATE Submission SET graderID = ?, "
                + "submissionID = ?, grade = ?, comments = ?, "
                + "path = ?, dateFlag = ?, submissionTime = ? WHERE studentID = ? "
                + "and assignmentID = ?";
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {

            stmt.setString(8, submissionBean.getStudentID());
            stmt.setString(9, submissionBean.getAssignmentID());
            stmt.setString(1, submissionBean.getGraderID());
            stmt.setString(2, submissionBean.getSubmissionID());
            stmt.setDouble(3, submissionBean.getGrade());
            stmt.setString(4, submissionBean.getComments());
            stmt.setString(5, submissionBean.getPath());
            stmt.setString(6, submissionBean.getPath());
            stmt.setString(7, submissionBean.getSubmissionTime());

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

}
