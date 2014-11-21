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
import OGS.beans.Professor;
import OGS.dbaccess.DBType;
import OGS.dbaccess.DBUtil;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Eric
 */
public class ProfessorManager {
    private static final Logger LOGGER = Logger.getLogger(ProfessorManager.class.getName());
    /**
     @param takes the ID of the row
     * This method connects to the database and then it gets the row which ID was referenced to and then 
     * it parses the information that was returned from the the row.
     * @returns the Professor object 
     * @throws SQLException 
     */
    public static Professor getRow(int ID) throws SQLException, ClassNotFoundException {
         LOGGER.info("Logger Name: "+LOGGER.getName());
        LOGGER.info("Method getRow()" + ID);

        String sql = "SELECT * FROM Professor WHERE ID = ?";
        ResultSet rs = null;
         LOGGER.warning("Creating the connection to the database");
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setInt(1, ID);
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            if (rs.next()) {
                Professor professorBean = new Professor();
                professorBean.setName(rs.getString("name"));
                professorBean.setID(ID);
                professorBean.setUserName(rs.getString("userName"));
                professorBean.setPassword(rs.getString("password"));
                professorBean.setEmailAddress(rs.getString("EmailAddress"));
                professorBean.setAccessLevel(rs.getInt("AccessLevel"));
                LOGGER.config("Object Professor bean is equal to :"+professorBean);
                return professorBean;
            } else {
                return null;
            }

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Exception occur", e);
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
     * @param professorBean which will be inserted into the database table
     * This Method take professorBean and then it parses the information from the 
     * professorBean and then it inserts the information into the database
     * @returns true if the information was correctly inserted into the database else it returns false.
     * @throws SqlException  
     */
    public static boolean insert(Professor professorBean) throws Exception {
        LOGGER.info("Logger Name: "+LOGGER.getName());
        LOGGER.info("Method insert()" + professorBean);
        String sql = "INSERT into Professor"
                + " (name, userName, password, EmailAddress, AccessLevel) "
                + "VALUES (?, ?, ?, ?, ?)";
        ResultSet keys = null;
        LOGGER.warning("Creating the connection to the database");
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {
             LOGGER.warning("Finish executing query");
            stmt.setString(1, professorBean.getName());
            stmt.setString(2, professorBean.getUserName());
            stmt.setString(3, professorBean.getPassword());
            stmt.setString(4, professorBean.getEmailAddress());
            stmt.setInt(5, professorBean.getAccessLevel());
            LOGGER.config("Object Professor bean is equal to :"+ stmt);
            int affected = stmt.executeUpdate();

            if (affected == 1) {
                keys = stmt.getGeneratedKeys();
                keys.next();
                int newKey = keys.getInt(1);
                professorBean.setID(newKey);
            } else {
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
    /**
     * 
     * @param professorBean  will be updated
     * This method takes a professorBean and updates the information in the database
     * @return true if the information was updated correctly else it returns false
     * @throws SqlException 
     */
    public static boolean update(Professor professorBean) throws Exception {
        LOGGER.info("Logger Name: "+LOGGER.getName());
        LOGGER.info("Method update()" + professorBean);
        
        String sql
                = "UPDATE Professor SET " + "name = ?, "
                + "userName = ?, password = ?, " + "EmailAddress = ?,"
                + "accessLevel = ? WHERE ID = ?";
        LOGGER.warning("Creating the connection to the database");
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            LOGGER.warning("Finish executing query");
            stmt.setString(1, professorBean.getName());
            stmt.setString(2, professorBean.getUserName());
            stmt.setString(3, professorBean.getPassword());
            stmt.setString(4, professorBean.getEmailAddress());
            stmt.setInt(5, professorBean.getAccessLevel());
            stmt.setInt(6, professorBean.getID());
            LOGGER.config("Object Professor bean is equal to :"+ stmt);
            int affected = stmt.executeUpdate();
            if (affected == 1) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Exception occur", e);
            System.err.println(e);
            return false;
        }

    }
    /**
     * Appoint TA method
     */
    public void appointTA()
    {
        
    }
    
    /**
     * Create Assignment method
     */
    
    /**
     * View Grade Statistic method
     */
    public void viewGradeStatistic()
    {
        
    }
    
    /**
     * View Report method
     */
    public void viewReport()
    {
        
    }
}
