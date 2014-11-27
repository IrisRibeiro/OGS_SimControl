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
import OGS.beans.Person;
import OGS.dbaccess.DBType;
import OGS.dbaccess.DBUtil;
import OGS.beans.Student;
import OGS.beans.Manager;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;



/** 
 *
 * @author Iris
 */
public class PersonManager {
    private static final Logger LOGGER = Logger.getLogger(PersonManager.class.getName());
    
    public static Person getRowfromID(String ID) throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Person_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: "+LOGGER.getName());
        LOGGER.info("Method getRowfromID()" + ID);
        String sql = "SELECT * FROM PERSON WHERE ID = ?";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, ID);
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            if (rs.next()) {
                Person PersonBean = new Person();
                PersonBean.setName(rs.getString("Name"));
                PersonBean.setID(ID);
                PersonBean.setUserName(rs.getString("UserName"));
                PersonBean.setPassword(rs.getString("Password"));
                PersonBean.setEmailAddress(rs.getString("EmailAddress"));
                PersonBean.setAccessLevel(rs.getInt("AcessLevel"));
                PersonBean.setType(rs.getString("Type"));
                LOGGER.config("Object PersonBean is equal to :"+PersonBean);
                return PersonBean;
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
    
    public static Person getRowfromUserName(String UserName) throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Person_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: "+LOGGER.getName());
        LOGGER.info("Method getRowfromUserName()" + UserName);
        String sql = "SELECT * FROM PERSON WHERE UserName = ?";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, UserName);
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            if (rs.next()) {
                Person PersonBean = new Person();
                PersonBean.setName(rs.getString("Name"));
                PersonBean.setID(rs.getString("ID"));
                PersonBean.setUserName(UserName);
                PersonBean.setPassword(rs.getString("Password"));
                PersonBean.setEmailAddress(rs.getString("EmailAddress"));
                PersonBean.setAccessLevel(rs.getInt("AcessLevel"));
                PersonBean.setType(rs.getString("Type"));
               LOGGER.config("Object PersonBean is equal to :"+PersonBean);
                return PersonBean;
            } else {
                return null;
            }

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Exception occur", e);
            System.err.println(e);
            return null;
        }/* finally {
            if (rs != null) {
                rs.close();
            }
        }*/

    }
    
    public static List<Person> getAllProfessor() throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Course_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getRow()");
        
        List<Person> Professor = new ArrayList<Person>();
        String sql = "SELECT * FROM Person where AcessLevel = 3";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
           
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            while (rs.next()) {
                Person PersonBean = new Person();                
                PersonBean.setName(rs.getString("Name"));
                PersonBean.setID(rs.getString("ID"));
                PersonBean.setUserName(rs.getString("UserName"));
                PersonBean.setPassword(rs.getString("Password"));
                PersonBean.setEmailAddress(rs.getString("EmailAddress"));
                PersonBean.setAccessLevel(rs.getInt("AcessLevel"));
                PersonBean.setType(rs.getString("Type"));
                Professor.add(PersonBean);
                LOGGER.config("Object CourseBean is equal to :" + Professor);
               
            } 

        } catch (SQLException e) {
            System.err.println(e);
            LOGGER.log(Level.SEVERE, "Exception occur", e);
            return null;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        return Professor;
    }
  
}
