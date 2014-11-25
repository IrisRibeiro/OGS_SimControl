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

import OGS.beans.Course;
import OGS.beans.Person;
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
 * @author Eric, Zain
 */
/**
 *
 * @author Yi
 */
public class CourseManager {

    private static final Logger LOGGER = Logger.getLogger(CourseManager.class.getName());

    /**
     * Check Meets Prereqs methods
     */
    public static Course getRow(String ID) throws SQLException, ClassNotFoundException, IOException {
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

        String sql = "SELECT * FROM Course WHERE ID = ?";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, ID);
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            if (rs.next()) {
                Course CourseBean = new Course();
                CourseBean.setIdentifier(rs.getString("Identifier"));
                CourseBean.setName(rs.getString("Name"));
                CourseBean.setCourseID(ID);
                CourseBean.setSection(rs.getString("Section"));
                CourseBean.setDays(rs.getString("Days"));
                CourseBean.setWebsite(rs.getString("webpage"));
                CourseBean.setBuilding(rs.getString("Building"));
                CourseBean.setRoom(rs.getString("Room"));
                CourseBean.setCredits(rs.getInt("Credits"));
                CourseBean.setNumberOfAssignments(rs.getInt("NumberOfAssignments"));
                CourseBean.setPrerequisites(rs.getString("Prerequisite"));
                CourseBean.setInstructorID(rs.getString("InstructorID"));
                CourseBean.setTime(rs.getString("Time"));
                LOGGER.config("Object CourseBean is equal to :" + CourseBean);
                return CourseBean;
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

    public static boolean insert(Course CourseBean) throws Exception {
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
        LOGGER.info("Method insert()");

        String sql = "INSERT into Course" + " (Identifier, Name, ID, Section, Days, "
                + "Building, Room,Credits," + "NumberOfAssignments, Prerequisite, InstructorID,"
                + "webpage, time) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?, ?)";
        ResultSet keys = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {

            stmt.setString(1, CourseBean.getIdentifier());
            stmt.setString(2, CourseBean.getName());
            stmt.setString(3, CourseBean.getCourseID());
            stmt.setString(4, CourseBean.getSection());
            stmt.setString(5, CourseBean.getDays());           
            stmt.setString(6, CourseBean.getBuilding());
            stmt.setString(7, CourseBean.getRoom());
            stmt.setInt(8, CourseBean.getCredits());
            stmt.setInt(9, CourseBean.getNumberOfAssignments());
            stmt.setString(10, CourseBean.getPrerequisites());
            stmt.setString(11, CourseBean.getInstructorID());
            stmt.setString(12, CourseBean.getWebsite());
            stmt.setString(13, CourseBean.getTime());
            LOGGER.config("Object CourseBean is equal to :" + CourseBean);
            int affected = stmt.executeUpdate();
            
            if (affected == 1) {
                keys = stmt.getGeneratedKeys();
                keys.next();
                String newKey = keys.getString(1);
                CourseBean.setCourseID(newKey);
            } else {
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
    
    public static List<Course> getCourseByProfessor(String ProfessorID) throws SQLException, ClassNotFoundException, IOException {
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
        
        List<Course> courses = new ArrayList<Course>();
        String sql = "SELECT * FROM Course WHERE InstructorID = ?";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, ProfessorID);
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            while (rs.next()) {
                Course CourseBean = new Course();
                CourseBean.setIdentifier(rs.getString("Identifier"));
                CourseBean.setName(rs.getString("Name"));
                CourseBean.setCourseID(rs.getString("ID"));
                CourseBean.setSection(rs.getString("Section"));
                CourseBean.setDays(rs.getString("Days"));
                CourseBean.setTime(rs.getString("Time"));
                CourseBean.setBuilding(rs.getString("Building"));
                CourseBean.setRoom(rs.getString("Room"));
                CourseBean.setCredits(rs.getInt("Credits"));
                CourseBean.setNumberOfAssignments(rs.getInt("NumberOfAssignments"));
                CourseBean.setPrerequisites(rs.getString("Prerequisite"));
                CourseBean.setInstructorID(rs.getString("InstructorID"));
                CourseBean.setWebsite(rs.getString("webpage"));
                courses.add(CourseBean);
                LOGGER.config("Object CourseBean is equal to :" + courses);
               
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
        return courses;
    }

    
    public static List<Course> getCoursesForPerson(Person person) throws SQLException, ClassNotFoundException, IOException {
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
        LOGGER.info("Method getCoursesForPerson()");
        List<Course> courses = new ArrayList<Course>();
        String sql;
        switch (person.getAccessLevel()) {
            case 1:
                sql = "select Course.* from Course, StudentEnrollment "
                        + "where Course.ID = StudentEnrollment.CourseID and StudentEnrollment.StudentID = ?";
                break;
            case 2:
                sql = "select Course.* from Course, TACourse "
                        + "where Course.ID = TACourse.CourseID and TACourse.TAID = ?";
                break;
            case 3:
                sql = "select * from Course, person " + "where Course.instructorID = ?";
                break;
            case 4:
                sql = "select Course.* from Course " + "where 1 = 1 or (0 = ?)";
                break;
            default:
                return courses;
        }
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, person.getID()); // set Person ID
            rs = stmt.executeQuery();
            while (rs.next()) {
                Course courseBean = new Course();
                courseBean.setIdentifier(rs.getString("Identifier"));
                courseBean.setName(rs.getString("Name"));
                courseBean.setCourseID(rs.getString("ID"));
                courseBean.setSection(rs.getString("Section"));
                courseBean.setDays(rs.getString("Days"));
                courseBean.setTime(rs.getString("Time"));
                courseBean.setBuilding(rs.getString("Building"));
                courseBean.setRoom(rs.getString("Room"));
                courseBean.setCredits(rs.getInt("Credits"));
                courseBean.setNumberOfAssignments(rs.getInt("NumberOfAssignments"));
                courseBean.setPrerequisites(rs.getString("Prerequisite"));
                courseBean.setInstructorID(rs.getString("InstructorID"));
                courseBean.setWebsite(rs.getString("webpage"));
                courses.add(courseBean);
                LOGGER.config("List of courses is euqal to :" + courses);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Exception occur", e);
            System.err.println(e);

        }
        return courses;
    }

    public static Course getCoursesByIDForPerson(String classID, Person person) throws SQLException, ClassNotFoundException, IOException {
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
        LOGGER.info("Method getCoursesByIDForPerson()" + classID + " " + person);
        String sql;
        switch (person.getAccessLevel()) {
            case 1:
                sql = "select Course.* from Course, StudentEnrollment "
                        + "where Course.ID = StudentEnrollment.CourseID and Course.ID=? and StudentEnrollment.StudentID = ?";
                break;
            case 2:
                sql = "select Course.* from Course, TACourse "
                        + "where Course.ID = TACourse.CourseID and Course.ID=? and TACourse.TAID = ?";
                break;
            case 3:
                sql = "select * from Course, person " + "where Course.ID=? and Course.instructorID = ?";
                break;
            case 4:
                sql = "select Course.* from Course " + "where Course.ID=? and (1 = 1 or (0 = ?))";
                break;
            default:
                return null;
        }
        ResultSet rs = null;

        Course courseBean = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, classID); // set ClassID
            stmt.setString(2, person.getID()); // set Person ID
            rs = stmt.executeQuery();
            if (rs.next()) {
                courseBean = new Course();
                courseBean.setIdentifier(rs.getString("Identifier"));
                courseBean.setName(rs.getString("Name"));
                courseBean.setCourseID(rs.getString("ID"));
                courseBean.setSection(rs.getString("Section"));
                courseBean.setDays(rs.getString("Days"));
                courseBean.setTime(rs.getString("Time"));
                courseBean.setBuilding(rs.getString("Building"));
                courseBean.setRoom(rs.getString("Room"));
                courseBean.setCredits(rs.getInt("Credits"));
                courseBean.setNumberOfAssignments(rs.getInt("NumberOfAssignments"));
                courseBean.setPrerequisites(rs.getString("Prerequisite"));
                courseBean.setInstructorID(rs.getString("InstructorID"));
                courseBean.setWebsite(rs.getString("webpage"));
                LOGGER.config("Object CourseBean is equal to :" + courseBean);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Exception occur", e);
            System.err.println(e);

        }

        return courseBean;
    }
    
    public static String getLastCourseID() throws SQLException, ClassNotFoundException, IOException {        
        
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
        LOGGER.info("Method getLastCourseID()");
        String sql = "SELECT MAX(ID) AS ID FROM Course";
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
    
    public static boolean UpdateNumofAssignments(String ID, int numberofassignments) throws Exception {
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
        LOGGER.info("Method UpdateNumofAssignments()");
        String sql
                = "UPDATE Course SET NumberOfAssignments = ? "
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
        String sql = "SELECT NumberOfAssignments FROM Course Where = ?";
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
}
