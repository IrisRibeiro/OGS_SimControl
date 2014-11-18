/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OGS.tables;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import OGS.beans.Assignment;
import OGS.dbaccess.DBType;
import OGS.dbaccess.DBUtil;

/**
 *
 * @author Eric
 */
public class AssignmentManager {
    /**
     * 
     * @param takes the ID of the row
     * This method connects to the database and then it gets the row which ID was referenced to and then 
     * it parses the information that was returned from the the row.
     * @returns the Assignment object 
     * @throws SQLException 
     */
    public static Assignment getRow(int ID) throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM Assignment WHERE ID = ?";
        ResultSet rs = null;

        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setInt(1, ID);
            rs = stmt.executeQuery();

            if (rs.next()) {
                Assignment assignmentBean = new Assignment();
                assignmentBean.setName(rs.getString("Name"));
                assignmentBean.setSpecification(rs.getString("Specification"));
                assignmentBean.setDueDate(rs.getString("DueDate"));
                assignmentBean.setInstructions(rs.getString("Instructions"));
                assignmentBean.setPath(rs.getString("Path"));
                assignmentBean.setCourseID(rs.getInt("courseID"));
                assignmentBean.setPointsPossible(rs.getInt("PointsPossible"));
                assignmentBean.setID(ID);
                return assignmentBean;
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
    
    public static String getAssignmentNumber() throws SQLException, ClassNotFoundException {

        String sql = "SELECT MAX(ID) FROM Assignment";
        ResultSet rs = null;

        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
                rs = stmt.executeQuery();
                if (rs.next()){
                    
                }
            
        
    

        } catch (SQLException e) {
            System.err.println(e);
            return null;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }

    return "1";
}
    /**
     * 
     * @param assignmentBean which will be inserted into the database table
     * This Method take assignmentbean and then it parses the information from the 
     * assignmentbean and then it inserts the information into the database
     * @returns true if the information was correctly inserted into the database else it returns false.
     * @throws SqlException 
     */
    public static boolean insert(Assignment assignmentBean) throws Exception {

        String sql = "INSERT into assignment"
                + " (name, specification, dueDate, instructions, path, "
                + "courseID, pointsPossible, ID) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        ResultSet keys = null;
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {

            stmt.setString(1, assignmentBean.getName());
            stmt.setString(2, assignmentBean.getSpecification());
            stmt.setString(3, assignmentBean.getDueDate());
            stmt.setString(4, assignmentBean.getInstructions());
            stmt.setString(5, "TempPath");//assignmentBean.getPath());
            stmt.setInt(6, 1);//assignmentBean.getCourseID());
            stmt.setInt(7, assignmentBean.getPointsPossible());
            stmt.setInt(8, assignmentBean.getID());
            int affected = stmt.executeUpdate();

            if (affected == 1) {
                keys = stmt.getGeneratedKeys();
                keys.next();
                int newKey = keys.getInt(1);
                assignmentBean.setID(newKey);
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
     * 
     * @param assignmentBean assignmentBean will be updated
     * This method takes a assignmentBean and updates the information in the database
     * @return true if the information was updated correctly else it returns false
     * @throws SqlException 
     */
    public static boolean update(Assignment assignmentBean) throws Exception {

        String sql
                = "UPDATE Assignment SET " + "name = ?, specification = ?, "
                + "dueDate = ?, instructions = ?, " + "path = ?, "
                + "courseID = ?, pointsPossible = ? WHERE ID = ?";
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {

            stmt.setString(1, assignmentBean.getName());
            stmt.setString(2, assignmentBean.getSpecification());
            stmt.setString(3, assignmentBean.getDueDate());
            stmt.setString(4, assignmentBean.getInstructions());
            stmt.setString(5, assignmentBean.getPath());
            stmt.setInt(6, assignmentBean.getCourseID());
            stmt.setInt(7, assignmentBean.getPointsPossible());
            stmt.setInt(8, assignmentBean.getID());

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
     * Sent Mail Method
     */
    public void sentMail()
    {
        
    }
    
    /**
     * Mark Assignment method
     */
    public void markAssignment()
    {
        
    }
    
    /**
     * Grade Assignment method
     */
    public void gradeAssignment()
    {
        
    }
    
    /**
     * Create Assignment method
     */
    public void createAssignment()
    {
        
    }
    
    //From Course Assignments
    
    /**
     * Get Points Possible Method
     */
    public void getPointsPossible()
    {
        
    }
    
    /**
     * Get Points Grades method
     */
    public void getPointsGrades()
    {
        
    }
}
