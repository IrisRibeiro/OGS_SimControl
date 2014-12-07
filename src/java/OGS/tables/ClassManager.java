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
import java.util.ArrayList;
import java.util.List;

import OGS.beans.Classes;
import OGS.dbaccess.DBType;
import OGS.dbaccess.DBUtil;
import java.io.File;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

/**
 *
 * @author Iris
 */
public class ClassManager {
    private static final Logger LOGGER = Logger.getLogger(CourseManager.class.getName());
    
    public static boolean UpdateClass(Classes _class) throws Exception {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Class_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method UpdateClass()");
        String sql
                = "UPDATE Class SET Days = ? , Time= ?, Building = ?, Room = ?, Section = ?, NumberOfAssignments = ?"
                + "Where ID = ? AND InstructorID = ?";
        LOGGER.warning("Creating the connection to the database");
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            
            stmt.setString(1, _class.getDays());
            stmt.setString(2,_class.getTime());
            stmt.setString(3, _class.getRoom());
            stmt.setString(4, _class.getSection());
            stmt.setInt(5, _class.getNumberOfAssignments());
            stmt.setString(6, _class.getClassID());
            stmt.setString(7, _class.getInstructorID());
            LOGGER.config("Object _class equals to :" + _class);
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
    
    
    public static Classes getRowbyID(String ID) throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Class_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getRowbyID()");

        String sql = "SELECT * FROM Class WHERE ID = ?";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, ID);
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            if (rs.next()) {
                Classes ClassBean = new Classes();
                
                ClassBean.setClassID(ID);                
                ClassBean.setSection(rs.getString("Section"));
                ClassBean.setDays(rs.getString("Days"));                
                ClassBean.setBuilding(rs.getString("Building"));
                ClassBean.setRoom(rs.getString("Room"));                
                ClassBean.setNumberOfAssignments(rs.getInt("NumberOfAssignments"));                
                ClassBean.setInstructorID(rs.getString("InstructorID"));
                ClassBean.setTime(rs.getString("Time"));
                ClassBean.setCourseID(rs.getString("CourseID"));
                LOGGER.config("Object CourseBean is equal to :" + ClassBean);
                return ClassBean;
            } else {
                return null;
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
    }    
    
    
     public static boolean insert(Classes ClassBean) throws Exception {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Class_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method insert()");

        String sql = "INSERT into Class" + " (ID,Days, Time, Building,Room, "
                + "CourseID, Section,NumberOfAssignments,InstructorID )" 
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
        ResultSet keys = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {
            
            stmt.setString(1, ClassBean.getClassID());
            stmt.setString(2, ClassBean.getDays());
            stmt.setString(3, ClassBean.getTime());
            stmt.setString(4, ClassBean.getBuilding());
            stmt.setString(5, ClassBean.getRoom());
            stmt.setString(6, ClassBean.getCourseID());
            stmt.setString(7, ClassBean.getSection());
            stmt.setInt(8, ClassBean.getNumberOfAssignments());
            stmt.setString(9, ClassBean.getInstructorID());           
            
            LOGGER.config("Object CourseBean is equal to :" + ClassBean);
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
     
     public static List<Classes> getClassByProfessor(String ProfessorID) throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Class_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getRow()");
        
        List<Classes> classes = new ArrayList<Classes>();
        String sql = "SELECT * FROM Class WHERE InstructorID = ?";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
                stmt.setString(1, ProfessorID);
                rs = stmt.executeQuery();
                LOGGER.warning("Finish executing query");
            while (rs.next()) {
                Classes ClassBean = new Classes();
                
                ClassBean.setClassID(rs.getString("ID"));
                ClassBean.setSection(rs.getString("Section"));
                ClassBean.setDays(rs.getString("Days"));
                ClassBean.setTime(rs.getString("Time"));
                ClassBean.setBuilding(rs.getString("Building"));
                ClassBean.setRoom(rs.getString("Room"));                
                ClassBean.setNumberOfAssignments(rs.getInt("NumberOfAssignments"));               
                ClassBean.setInstructorID(rs.getString("InstructorID"));
                ClassBean.setCourseID(rs.getString("CourseID"));
               
                classes.add(ClassBean);
                LOGGER.config("Object CourseBean is equal to :" + classes);
               
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
        return classes;
    }
     
     public static List<Classes> getClassesForPerson(int accessLevel, String PersonID) throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Class_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getCoursesForPerson()");
        List<Classes> Classes = new ArrayList<Classes>();
        String sql = null;
        switch (accessLevel) {
            case 1:
                sql = "SELECT CLASS.* \n" +
                        "FROM CLASS, STUDENTENROLLMENT\n" +
                        "WHERE CLASS.ID = STUDENTENROLLMENT.CLASSID\n" +
                        "AND STUDENTENROLLMENT.STUDENTID = ?";
                break;
            case 2:
                sql = "SELECT CLASS.* \n" +
                      "FROM CLASS, TACOURSE\n" +
                      "WHERE CLASS.ID = TACOURSE.CLASSID\n" +
                      "AND TACOURSE.TAID = ?";
                break;
            case 3:
                sql ="SELECT * \n" +
                    "FROM CLASS\n" +
                    "WHERE CLASS.INSTRUCTORID = ?";
                break;
            case 4:
                sql = "SELECT * \n" +
                      "FROM CLASS";
                break;            
        }
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
                if (accessLevel != 4){
                    stmt.setString(1, PersonID);
                }
                rs = stmt.executeQuery();
            while (rs.next()) {
                Classes classBean = new Classes();             
                
                classBean.setClassID(rs.getString("ID"));
                classBean.setSection(rs.getString("Section"));
                classBean.setDays(rs.getString("Days"));
                classBean.setTime(rs.getString("Time"));
                classBean.setBuilding(rs.getString("Building"));
                classBean.setRoom(rs.getString("Room"));               
                classBean.setNumberOfAssignments(rs.getInt("NumberOfAssignments"));                
                classBean.setInstructorID(rs.getString("InstructorID"));
                classBean.setCourseID(rs.getString("CourseID"));
                
                Classes.add(classBean);
                LOGGER.config("List of courses is euqal to :" + Classes);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Exception occur", e);
            System.err.println(e);

        }
        return Classes;
    }
     
     public static boolean UpdateNumofAssignments(String ID, int numberofassignments) throws Exception {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Class_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method UpdateNumofAssignments()");
        String sql
                = "UPDATE Class SET NumberOfAssignments = ? "
                + "Where ID = ? ";
        LOGGER.warning("Creating the connection to the database");
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            
            stmt.setInt(1, numberofassignments);
            stmt.setString(2,ID);
            LOGGER.config("Variables ID and NumberOfassignments are :" + ID +" "+ numberofassignments);
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
    
    public static int getNumberofAssignments(String ID) throws SQLException, ClassNotFoundException, IOException {        
        
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Assignment_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getNumberofAssignments()");
        String sql = "SELECT NumberOfAssignments FROM Class Where ID = ?";
        ResultSet rs = null;
        int returnId = 0;
        LOGGER.warning("Creating the connection to the database");
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
                stmt.setString(1, ID);
                rs = stmt.executeQuery();
            if (rs.next()) {
                returnId = rs.getInt("NumberOfAssignments");   
            }
            LOGGER.config("Object rs is :" + rs);

        } catch (SQLException e) {
            System.err.println(e);
            return -1;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }

        return returnId ;
        
    }
    
    public static String getLastClassID() throws SQLException, ClassNotFoundException, IOException {        
        
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Assignment_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getLastClassID()");
        String sql = "SELECT MAX(CAST(SUBSTRING(ID, 1, length(ID)) AS UNSIGNED)) AS ID FROM Class";
        ResultSet rs = null;
        String returnId = "";
        LOGGER.warning("Creating the connection to the database");
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
                rs = stmt.executeQuery();
            if (rs.next()) {
                returnId = rs.getString("ID");   
            }
            LOGGER.config("Object rs is :" + rs);

        } catch (SQLException e) {
            System.err.println(e);
            return null;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }

        return returnId ;
        
    }

}
