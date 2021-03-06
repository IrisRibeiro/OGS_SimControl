package OGS.tables;

import OGS.beans.Assignment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import OGS.beans.Submission;
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
public class SubmissionManager {
    private static final Logger LOGGER = Logger.getLogger(SubmissionManager.class.getName());
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
                submissionBean.setSubmissionID(rs.getString("ID"));
                submissionBean.setGrade(rs.getDouble("grade"));
                submissionBean.setComments(rs.getString("comments"));
                submissionBean.setPath(rs.getString("path"));
                submissionBean.setDateFlag(rs.getString("dateFlag"));
                submissionBean.setSubmissionTime(rs.getString("submissionTime"));
                submissionBean.setAnswers(rs.getString("Answers"));
                submissionBean.setFileName(rs.getString("FileName"));
                Blob tempfile = rs.getBlob("File");
                if(tempfile != null){
                    InputStream inputStream = tempfile.getBinaryStream();
                    submissionBean.setFile(inputStream);
                }
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
    public static Submission getSubmissionbyIDRow(String SubmissionID) throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM Submissions WHERE ID = ? ";
        ResultSet rs = null;

        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            
            stmt.setString(1, SubmissionID);
            
            rs = stmt.executeQuery();

            if (rs.next()) {
                Submission submissionBean = new Submission();
                submissionBean.setStudentID(rs.getString("StudentID"));
                submissionBean.setAssignmentID(rs.getString("AssignmentID"));
                submissionBean.setGraderID(rs.getString("graderID"));
                submissionBean.setSubmissionID(rs.getString("ID"));
                submissionBean.setGrade(rs.getDouble("grade"));
                submissionBean.setComments(rs.getString("comments"));
                submissionBean.setPath(rs.getString("path"));
                submissionBean.setDateFlag(rs.getString("dateFlag"));
                submissionBean.setSubmissionTime(rs.getString("submissionTime"));
                submissionBean.setAnswers(rs.getString("Answers"));
                submissionBean.setFileName(rs.getString("FileName"));
                Blob tempfile = rs.getBlob("File");
                if(tempfile != null){
                    InputStream inputStream = tempfile.getBinaryStream();
                    submissionBean.setFile(inputStream);
                }
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

        String sql = "INSERT into Submissions"
                + " (studentID, assignmentID, graderID"
                + ", grade, comments, path, dateFlag, submissionTime, ID, answers, File, Filename) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?)";
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
            stmt.setString(7, submissionBean.getDateFlag());
            stmt.setString(8, submissionBean.getSubmissionTime());
            stmt.setString(9, submissionBean.getSubmissionID());
            stmt.setString(10, submissionBean.getAnswers());
            stmt.setBlob(11, submissionBean.getFile());
            stmt.setString(12, submissionBean.getFileName());       
            
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

            stmt.setString(1, submissionBean.getGraderID());
            stmt.setString(2, submissionBean.getSubmissionID());
            stmt.setDouble(3, submissionBean.getGrade());
            stmt.setString(4, submissionBean.getComments());
            stmt.setString(5, submissionBean.getPath());
            stmt.setString(6, submissionBean.getDateFlag());
            stmt.setString(7, submissionBean.getSubmissionTime());
            stmt.setString(8, submissionBean.getStudentID());
            stmt.setString(9, submissionBean.getAssignmentID());
            
            
            
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
    
    public static String getSubmissionNumber() throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Submission_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getAssignmentNumber()");
        String sql = "SELECT MAX(CAST(SUBSTRING(ID, 1, length(ID)) AS UNSIGNED)) AS ID FROM submissions ";
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
        return returnId;
    }
    
    public static boolean DeleteSubmissionsByAssignmentID( String AsssignmentID) throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Submission_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method DeleteSubmissionsByAssignmentID()");
        String sql = "DELETE FROM SUBMISSIONS WHERE ASSIGNMENTID = ?";
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
    
    public static List<Submission> getStudentsSubmissions(String studentID) throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Submission_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getStudentsSubmissions()");
        
        List<Submission> Submission = new ArrayList<>();
        String sql = "SELECT * FROM Submissions where StudentID = ?";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            
            stmt.setString(1, studentID);
           
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            while (rs.next()) {
                Submission SubmissionBean = new Submission();
                SubmissionBean.setStudentID(rs.getString("StudentID"));
                SubmissionBean.setAssignmentID(rs.getString("AssignmentID"));
                SubmissionBean.setGrade(rs.getDouble("Grade"));             
                SubmissionBean.setGraderID(rs.getString("GraderID"));                
                SubmissionBean.setComments(rs.getString("Comments"));                
                SubmissionBean.setPath(rs.getString("Path"));
                SubmissionBean.setDateFlag(rs.getString("DateFlag"));
                SubmissionBean.setSubmissionTime(rs.getString("SubmissionTime"));
                SubmissionBean.setSubmissionID(rs.getString("ID"));  
                SubmissionBean.setAnswers(rs.getString("Answers"));  
                Blob tempfile = rs.getBlob("File");
                if(tempfile != null){
                    InputStream inputStream = tempfile.getBinaryStream();
                     SubmissionBean.setFile(inputStream);
                }
                SubmissionBean.setFileName(rs.getString("Filename"));  
                
                Submission.add(SubmissionBean);
                LOGGER.config("Object SubmissionBean is equal to :" + SubmissionBean);
                
               
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
        return Submission;
    }
    
    public static List<Submission> getSubmissionsByAssignmentID(String AssignmentID) throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Submission_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getStudentsSubmissions()");
        
        List<Submission> Submission = new ArrayList<>();
        String sql = "SELECT * FROM submissions where AssignmentID = ?";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            
            stmt.setString(1, AssignmentID);
           
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            while (rs.next()) {
                Submission SubmissionBean = new Submission();
                SubmissionBean.setStudentID(rs.getString("StudentID"));
                SubmissionBean.setAssignmentID(rs.getString("AssignmentID"));
                SubmissionBean.setGrade(rs.getDouble("Grade"));             
                SubmissionBean.setGraderID(rs.getString("GraderID"));                
                SubmissionBean.setComments(rs.getString("Comments"));                
                SubmissionBean.setPath(rs.getString("Path"));
                SubmissionBean.setDateFlag(rs.getString("DateFlag"));
                SubmissionBean.setSubmissionTime(rs.getString("SubmissionTime"));
                SubmissionBean.setSubmissionID(rs.getString("ID"));  
                SubmissionBean.setAnswers(rs.getString("Answers"));                
                Blob tempfile = rs.getBlob("File");
                if(tempfile != null){
                    InputStream inputStream = tempfile.getBinaryStream();
                     SubmissionBean.setFile(inputStream);
                }
                Submission.add(SubmissionBean);
                LOGGER.config("Object SubmissionBean is equal to :" + SubmissionBean);
                
               
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
        return Submission;
    }
    
    public static List<Submission> getSubmissionsByTAID(String TAID) throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Submission_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getSubmissionsByTAID()");
        
        List<Submission> Submission = new ArrayList<>();
        String sql = "SELECT * FROM Submissions where GraderID = ?";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            
            stmt.setString(1, TAID);
           
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            while (rs.next()) {
                Submission SubmissionBean = new Submission();
                SubmissionBean.setStudentID(rs.getString("StudentID"));
                SubmissionBean.setAssignmentID(rs.getString("AssignmentID"));
                SubmissionBean.setGrade(rs.getDouble("Grade"));             
                SubmissionBean.setGraderID(rs.getString("GraderID"));                
                SubmissionBean.setComments(rs.getString("Comments"));                
                SubmissionBean.setPath(rs.getString("Path"));
                SubmissionBean.setDateFlag(rs.getString("DateFlag"));
                SubmissionBean.setSubmissionTime(rs.getString("SubmissionTime"));
                SubmissionBean.setSubmissionID(rs.getString("ID"));  
                SubmissionBean.setAnswers(rs.getString("Answers"));  
                Blob tempfile = rs.getBlob("File");
                if(tempfile != null){
                    InputStream inputStream = tempfile.getBinaryStream();
                     SubmissionBean.setFile(inputStream);
                } 
                SubmissionBean.setFileName(rs.getString("Filename"));  
                
                Submission.add(SubmissionBean);
                LOGGER.config("Object SubmissionBean is equal to :" + SubmissionBean);
                
               
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
        return Submission;
    }
    
    public static List<Submission> getAllSubmissions() throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Submission_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getAllSubmissions()");
        
        List<Submission> Submission = new ArrayList<>();
        String sql = "SELECT * FROM Submissions";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            while (rs.next()) {
                Submission SubmissionBean = new Submission();
                SubmissionBean.setStudentID(rs.getString("StudentID"));
                SubmissionBean.setAssignmentID(rs.getString("AssignmentID"));
                SubmissionBean.setGrade(rs.getDouble("Grade"));             
                SubmissionBean.setGraderID(rs.getString("GraderID"));                
                SubmissionBean.setComments(rs.getString("Comments"));                
                SubmissionBean.setPath(rs.getString("Path"));
                SubmissionBean.setDateFlag(rs.getString("DateFlag"));
                SubmissionBean.setSubmissionTime(rs.getString("SubmissionTime"));
                SubmissionBean.setSubmissionID(rs.getString("ID"));  
                SubmissionBean.setAnswers(rs.getString("Answers"));  
                Blob tempfile = rs.getBlob("File");
                if(tempfile != null){
                    InputStream inputStream = tempfile.getBinaryStream();
                     SubmissionBean.setFile(inputStream);
                } 
                SubmissionBean.setFileName(rs.getString("Filename"));  
                
                Submission.add(SubmissionBean);
                LOGGER.config("Object SubmissionBean is equal to :" + SubmissionBean);
                
               
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
        return Submission;
    }
    
     public static int getNumGradedSubmissionsByAssignmentID(String assignmentID) 
             throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Submission_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getNumGradedSubmissionsByAssignmentID()");
        
        String sql = "SELECT * FROM Submissions where Grade IS NOT NULL AND AssignmentID = ?";
        ResultSet rs = null;
        int count = 0;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            
            stmt.setString(1, assignmentID);
            
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            while (rs.next()) {
                ++count;
            } 

        } catch (SQLException e) {
            System.err.println(e);
            LOGGER.log(Level.SEVERE, "Exception occur", e);
            return -1;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        return count;
    }
     
    public static List<Submission> getGradedSubmissionsByAssignmentID(String assignmentID) 
            throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Submission_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getGradedSubmissionsByAssignmentID()");
        
        List<Submission> Submission = new ArrayList<>();
        String sql = "SELECT * FROM simcontrol.submissions where AssignmentID = ? AND Grade IS NOT NULL;";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            
            stmt.setString(1, assignmentID);
           
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            while (rs.next()) {
                Submission SubmissionBean = new Submission();
                SubmissionBean.setStudentID(rs.getString("StudentID"));
                SubmissionBean.setAssignmentID(rs.getString("AssignmentID"));
                SubmissionBean.setGrade(rs.getDouble("Grade"));             
                SubmissionBean.setGraderID(rs.getString("GraderID"));                
                SubmissionBean.setComments(rs.getString("Comments"));                
                SubmissionBean.setPath(rs.getString("Path"));
                SubmissionBean.setDateFlag(rs.getString("DateFlag"));
                SubmissionBean.setSubmissionTime(rs.getString("SubmissionTime"));
                SubmissionBean.setSubmissionID(rs.getString("ID"));  
                SubmissionBean.setAnswers(rs.getString("Answers"));  
                Blob tempfile = rs.getBlob("File");
                if(tempfile != null){
                    InputStream inputStream = tempfile.getBinaryStream();
                     SubmissionBean.setFile(inputStream);
                } 
                SubmissionBean.setFileName(rs.getString("Filename"));  
                
                Submission.add(SubmissionBean);
                LOGGER.config("Object SubmissionBean is equal to :" + SubmissionBean);
                
               
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
        return Submission;
    }
    
    public static List<Submission> getSubmissionsByAssignment(String AssignmentID) throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Submission_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getAssignmentByStudentID()");
        
        List<Submission> submissions = new ArrayList<Submission>();
        String sql = "SELECT * FROM submissions\n" +
                    "WHERE SUBMISSIONS.ASSIGNMENTID = ? ";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
                stmt.setString(1, AssignmentID);
                rs = stmt.executeQuery();
                LOGGER.warning("Finish executing query");
            while (rs.next()) {
                
                Submission submissionBean = new Submission();
                
                submissionBean.setStudentID(rs.getString("studentID"));
                submissionBean.setAssignmentID(rs.getString("assignmentID"));
                submissionBean.setGraderID(rs.getString("graderID"));
                submissionBean.setSubmissionID(rs.getString("ID"));
                submissionBean.setGrade(rs.getDouble("grade"));
                submissionBean.setComments(rs.getString("comments"));
                submissionBean.setPath(rs.getString("path"));
                submissionBean.setDateFlag(rs.getString("dateFlag"));
                submissionBean.setSubmissionTime(rs.getString("submissionTime"));                 
                submissionBean.setAnswers(rs.getString("Answers"));  
                Blob tempfile = rs.getBlob("File");
                if(tempfile != null){
                    InputStream inputStream = tempfile.getBinaryStream();
                     submissionBean.setFile(inputStream);
                } 
                submissionBean.setFileName(rs.getString("Filename")); 
                submissions.add(submissionBean);
                LOGGER.config("Object Assigments is equal to :" + submissions);
               
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
        return submissions;
    }
    
    

}
