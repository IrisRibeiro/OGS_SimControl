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
import OGS.beans.Person;
import OGS.dbaccess.DBType;
import OGS.dbaccess.DBUtil;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

/**
 *
 * @author Eric
 */
public class AssignmentManager {

    private static final Logger LOGGER = Logger.getLogger(AssignmentManager.class.getName());

    /**
     *
     * @param takes the ID of the row This method connects to the database and
     * then it gets the row which ID was referenced to and then it parses the
     * information that was returned from the the row.
     * @returns the Assignment object
     * @throws SQLException
     */
    public static Assignment getRow(String ID) throws SQLException, ClassNotFoundException, IOException {
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
        LOGGER.info("Method getRow()");

        String sql = "SELECT * FROM Assignment WHERE ID = ?";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, ID);
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            if (rs.next()) {
                Assignment assignmentBean = new Assignment();
                assignmentBean.setName(rs.getString("Name"));
                assignmentBean.setSpecification(rs.getString("Specification"));
                assignmentBean.setDueDate(rs.getString("DueDate"));
                assignmentBean.setInstructions(rs.getString("Instructions"));
                assignmentBean.setPath(rs.getString("Path"));
                assignmentBean.setClassID(rs.getString("classID"));
                assignmentBean.setPointsPossible(rs.getInt("PointsPossible"));
                assignmentBean.setTimeDue(rs.getString("TimeDue"));
                assignmentBean.setNumber(rs.getInt("number"));
                assignmentBean.setFlag(rs.getString("Flag"));
                assignmentBean.setQuestions(rs.getString("Questions"));
                assignmentBean.setFileName(rs.getString("FileName"));
                Blob tempfile = rs.getBlob("File");
                if(tempfile != null){
                    InputStream inputStream = tempfile.getBinaryStream();
                    assignmentBean.setFile(inputStream);
                }
                assignmentBean.setID(ID);
                LOGGER.config("Object AssignmentBeans is :" + assignmentBean);
                return assignmentBean;

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

    public static String getAssignmentNumber() throws SQLException, ClassNotFoundException, IOException {
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
        LOGGER.info("Method getAssignmentNumber()");
        String sql = "SELECT MAX(CAST(SUBSTRING(ID, 1, length(ID)) AS UNSIGNED)) AS ID FROM Assignment";
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

    /**
     *
     * @param assignmentBean which will be inserted into the database table This
     * Method take assignmentbean and then it parses the information from the
     * assignmentbean and then it inserts the information into the database
     * @returns true if the information was correctly inserted into the database
     * else it returns false.
     * @throws SqlException
     */
    public static boolean insert(Assignment assignmentBean) throws Exception {
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
        LOGGER.info("Method insert()");
        String sql = "INSERT into assignment"
                + " (name, specification, dueDate, instructions, path, "
                + "classID, pointsPossible, ID, number, TimeDue, Flag, Questions,File, Filename) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?)";
        ResultSet keys = null;
        LOGGER.warning("Creating the connection to the database");
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {

            stmt.setString(1, assignmentBean.getName());
            stmt.setString(2, assignmentBean.getSpecification());
            stmt.setString(3, assignmentBean.getDueDate());
            stmt.setString(4, assignmentBean.getInstructions());         
            stmt.setString(5, assignmentBean.getPath());           
            stmt.setString(6, assignmentBean.getClassID());
            stmt.setInt(7, assignmentBean.getPointsPossible());
            stmt.setString(8, assignmentBean.getID());
            stmt.setInt(9,assignmentBean.getNumber());
            stmt.setString(10, assignmentBean.getTimeDue());
            stmt.setString(11, assignmentBean.getFlag());            
            stmt.setString(12, assignmentBean.getQuestions());
            stmt.setBlob(13, assignmentBean.getFile());
            stmt.setString(14, assignmentBean.getFileName());
            int affected = stmt.executeUpdate();           
            
            LOGGER.warning("Finish executing query");
            if (affected != 1) {
                System.err.println("No rows affected");
                return false;
            } 

        } catch (SQLException e) {
            System.err.println(e);
            LOGGER.log(Level.SEVERE, "Exception occur", e);
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
     * @param assignmentBean assignmentBean will be updated This method takes a
     * assignmentBean and updates the information in the database
     * @return true if the information was updated correctly else it returns
     * false
     * @throws SqlException
     */
    public static boolean update(Assignment assignmentBean) throws Exception {
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
        LOGGER.info("Method update()");
        String sql
                = "UPDATE Assignment SET " + "name = ?, specification = ?, "
                + "dueDate = ?, instructions = ?, " + "path = ?, "
                + "classID = ?, TimeDue = ?, pointsPossible = ?, number=?,"
                + "Flag =?,Questions =?,File=?, FileName=? WHERE ID =?";
        LOGGER.warning("Creating the connection to the database");
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {

            stmt.setString(1, assignmentBean.getName());
            stmt.setString(2, assignmentBean.getSpecification());
            stmt.setString(3, assignmentBean.getDueDate());
            stmt.setString(4, assignmentBean.getInstructions());
            stmt.setString(5, assignmentBean.getPath());
            stmt.setString(6, assignmentBean.getClassID());
            stmt.setString(7, assignmentBean.getTimeDue());
            stmt.setInt(8, assignmentBean.getPointsPossible());
            stmt.setInt(9, assignmentBean.getNumber());
            stmt.setString(10, assignmentBean.getFlag());
            stmt.setString(11, assignmentBean.getQuestions());
            stmt.setBlob(12, assignmentBean.getFile());
            stmt.setString(13, assignmentBean.getFileName());
            stmt.setString(14,assignmentBean.getID());
            LOGGER.config("Object AssignmentBeans is :" + assignmentBean);
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
    
    
    public static List<Assignment> getAssignmentByStudentID(String StudentID) throws SQLException, ClassNotFoundException, IOException {
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
        LOGGER.info("Method getAssignmentByStudentID()");
        
        List<Assignment> assignments = new ArrayList<Assignment>();
        String sql = "SELECT ASSIGNMENT.* \n" +
                     "FROM ASSIGNMENT, studentenrollment\n" +
                     "WHERE assignment.ClassID = studentenrollment.ClassID\n" +
                     "AND studentenrollment.Flag = 'E'\n" +
                     "AND studentenrollment.StudentID = ?";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
                stmt.setString(1, StudentID);
                rs = stmt.executeQuery();
                LOGGER.warning("Finish executing query");
            while (rs.next()) {
                
                Assignment assignmentBean = new Assignment();
                assignmentBean.setName(rs.getString("Name"));
                assignmentBean.setSpecification(rs.getString("Specification"));
                assignmentBean.setDueDate(rs.getString("DueDate"));
                assignmentBean.setInstructions(rs.getString("Instructions"));
                assignmentBean.setPath(rs.getString("Path"));
                assignmentBean.setClassID(rs.getString("classID"));
                assignmentBean.setPointsPossible(rs.getInt("PointsPossible"));
                assignmentBean.setTimeDue(rs.getString("TimeDue"));
                assignmentBean.setNumber(rs.getInt("number"));
                assignmentBean.setFlag(rs.getString("Flag"));
                assignmentBean.setQuestions(rs.getString("Questions"));
                assignmentBean.setID(rs.getString("ID"));
                assignmentBean.setFileName(rs.getString("FileName"));
                Blob tempfile = rs.getBlob("File");
                if(tempfile != null){
                    InputStream inputStream = tempfile.getBinaryStream();
                    assignmentBean.setFile(inputStream);
                }
               
                assignments.add(assignmentBean);
                LOGGER.config("Object Assigments is equal to :" + assignments);
               
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
        return assignments;
    }

     
    public static List<Assignment> getAssigmentsForPerson(int accessLevel, String PersonID) throws SQLException, ClassNotFoundException, IOException {
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
        LOGGER.info("Method getAssigmentsForPerson()");
        List<Assignment> Assigments = new ArrayList<Assignment>();
        String sql = null;
        switch (accessLevel) {
            case 1:
                sql = "SELECT ASSIGNMENT.* \n" +
                      "FROM ASSIGNMENT, STUDENTENROLLMENT\n" +
                      "WHERE ASSIGNMENT.CLASSID = STUDENTENROLLMENT.CLASSID\n" +
                      "AND STUDENTENROLLMENT.STUDENTID = ?";
                break;
            case 2:
                sql = "SELECT ASSIGNMENT.* \n" +
                      "FROM ASSIGNMENT, TACOURSE\n" +
                      "WHERE ASSIGNMENT.CLASSID = TACOURSE.CLASSID\n" +
                      "AND TACOURSE.TAID = ?";
                break;
            case 3:
                sql = "SELECT ASSIGNMENT.* \n" +
                "FROM ASSIGNMENT, CLASS\n" +
                "WHERE ASSIGNMENT.CLASSID = CLASS.ID\n" +
                "AND CLASS.INSTRUCTORID = ?";
                break;
            case 4:
                sql = "SELECT * FROM ASSIGNMENT";
                 
        }
    	ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
               if  (accessLevel != 4){
                   stmt.setString(1, PersonID);
               }             
                                
                rs = stmt.executeQuery();
            while (rs.next()) {
            
                Assignment assignmentBean = new Assignment();
                assignmentBean.setName(rs.getString("Name"));
                assignmentBean.setSpecification(rs.getString("Specification"));
                assignmentBean.setDueDate(rs.getString("DueDate"));
                assignmentBean.setInstructions(rs.getString("Instructions"));
                assignmentBean.setPath(rs.getString("Path"));
                assignmentBean.setClassID(rs.getString("classID"));
                assignmentBean.setPointsPossible(rs.getInt("PointsPossible"));
                assignmentBean.setTimeDue(rs.getString("TimeDue"));
                assignmentBean.setNumber(rs.getInt("number"));
                assignmentBean.setFlag(rs.getString("Flag"));
                assignmentBean.setQuestions(rs.getString("Questions"));
                assignmentBean.setID(rs.getString("ID"));
                assignmentBean.setFileName(rs.getString("FileName"));
                Blob tempfile = rs.getBlob("File");
                if(tempfile != null){
                    InputStream inputStream = tempfile.getBinaryStream();
                    assignmentBean.setFile(inputStream);
                }
               
                Assigments.add(assignmentBean);
                LOGGER.config("Object Assigments is equal to :" + Assigments);
               
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Exception occur", e);
            System.err.println(e);

            }
        return Assigments;
        }

            
    public static List<Assignment> getAllAssignments() throws SQLException, ClassNotFoundException, IOException {
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
        LOGGER.info("Method getAllAssignments()");
        
        List<Assignment> assign = new ArrayList<>();
        String sql = "SELECT * FROM assignment";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            while (rs.next()) {
                Assignment assignmentBean = new Assignment();
                assignmentBean.setName(rs.getString("Name"));
                assignmentBean.setSpecification(rs.getString("Specification"));
                assignmentBean.setDueDate(rs.getString("DueDate"));
                assignmentBean.setInstructions(rs.getString("Instructions"));
                assignmentBean.setPath(rs.getString("Path"));
                assignmentBean.setClassID(rs.getString("classID"));
                assignmentBean.setPointsPossible(rs.getInt("PointsPossible"));
                assignmentBean.setTimeDue(rs.getString("TimeDue"));
                assignmentBean.setNumber(rs.getInt("number"));
                assignmentBean.setFlag(rs.getString("Flag"));
                assignmentBean.setQuestions(rs.getString("Questions"));
                assignmentBean.setID(rs.getString("ID"));
                assignmentBean.setFileName(rs.getString("FileName"));
                Blob tempfile = rs.getBlob("File");
                if(tempfile != null){
                    InputStream inputStream = tempfile.getBinaryStream();
                    assignmentBean.setFile(inputStream);
                }
                
                assign.add(assignmentBean);
                LOGGER.config("Object AssignmentBean is equal to :" + assignmentBean);
                
               
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
        return assign;
    }
    
    public static boolean DeleteAssignments( String AsssignmentID) throws SQLException, ClassNotFoundException, IOException {
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
        LOGGER.info("Method DeleteAssignments()");
        String sql = "DELETE FROM ASSIGNMENT WHERE ID = ?";
        ResultSet rs = null;       
        LOGGER.warning("Creating the connection to the database");
        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
                stmt.setString(1, AsssignmentID);
                
            int affected = stmt.executeUpdate();
            if (affected == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.err.println(e);
            return false;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
       
    }
    

  
}
