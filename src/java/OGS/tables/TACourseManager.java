/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OGS.tables;

import OGS.beans.Course;
import OGS.beans.StudentEnrollment;
import OGS.beans.TACourse;
import OGS.dbaccess.DBType;
import OGS.dbaccess.DBUtil;
import java.io.File;
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
public class TACourseManager {
    private static final Logger LOGGER = Logger.getLogger(CourseManager.class.getName());
    
    public static boolean insert(TACourse TACourseBean) throws Exception {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\TACourseManager_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method insert()");

        String sql = "INSERT into TACourse (TAID, CLASSID)"                
                + "VALUES (?, ?)";
        ResultSet keys = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {

            stmt.setString(1, TACourseBean.getTAID());
            stmt.setString(2, TACourseBean.getClassID());            
            
            LOGGER.config("Object TACourseBean is equal to :" + TACourseBean);
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
    
    public static TACourse getRowwithID(String TAID, String ClassID) throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM TACOURSE WHERE TACOURSE.TAID = ? AND TACOURSE.CLASSID = ?";
        ResultSet rs = null;

        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, TAID);
            stmt.setString(2, ClassID);
            
            rs = stmt.executeQuery();

            if (rs.next()) {
                TACourse TA = new TACourse();
                TA.setTAID(rs.getString("TAID"));
                TA.setClassID(rs.getString("ClassID"));
               
                return TA;
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
