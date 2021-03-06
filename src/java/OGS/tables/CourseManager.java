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
        if (!f.exists()) {
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
                CourseBean.setWebsite(rs.getString("webpage"));
                CourseBean.setCredits(rs.getInt("Credits"));
                CourseBean.setPrerequisites(rs.getString("Prerequisite"));
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

    public static Course getCourseByClass(String ClassID) throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if (!f.exists()) {
            f.mkdirs();

        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Course_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();
        fh.setFormatter(formatter);

        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getCourseByClass()");

        String sql = "SELECT COURSE.* FROM COURSE, CLASS\n"
                + "WHERE CLASS.COURSEID = COURSE.ID\n"
                + "AND CLASS.ID = ?";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, ClassID);
            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            if (rs.next()) {
                Course CourseBean = new Course();
                CourseBean.setIdentifier(rs.getString("Identifier"));
                CourseBean.setName(rs.getString("Name"));
                CourseBean.setCourseID(rs.getString("ID"));
                CourseBean.setWebsite(rs.getString("webpage"));
                CourseBean.setCredits(rs.getInt("Credits"));
                CourseBean.setPrerequisites(rs.getString("Prerequisite"));
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
        if (!f.exists()) {
            f.mkdirs();

        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Course_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();
        fh.setFormatter(formatter);

        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method insert()");

        String sql = "INSERT into Course (Identifier, Name, ID,"
                + "Credits,Prerequisite, Webpage )"
                + "VALUES (?, ?, ?, ?, ?, ?)";
        ResultSet keys = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {

            stmt.setString(1, CourseBean.getIdentifier());
            stmt.setString(2, CourseBean.getName());
            stmt.setString(3, CourseBean.getCourseID());
            stmt.setInt(4, CourseBean.getCredits());
            stmt.setString(5, CourseBean.getPrerequisites());
            stmt.setString(6, CourseBean.getWebsite());

            LOGGER.config("Object CourseBean is equal to :" + CourseBean);
            int affected = stmt.executeUpdate();

            if (affected != 1) {
                LOGGER.log(Level.SEVERE, "Exception occur", stmt.getGeneratedKeys());
                if (conn != null) {
                    conn.rollback();
                }
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

    public static String getLastCourseID() throws SQLException, ClassNotFoundException, IOException {

        File f = new File("c:/SimControl/Logging/");
        if (!f.exists()) {
            f.mkdirs();

        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Assignment_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();
        fh.setFormatter(formatter);

        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getLastCourseID()");
        String sql = "SELECT MAX(CAST(SUBSTRING(ID, 1, length(ID)) AS UNSIGNED)) AS ID FROM Course";
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

    public static List<Course> getAllCourses() throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if (!f.exists()) {
            f.mkdirs();

        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Course_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();
        fh.setFormatter(formatter);

        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method getAllCourses()");

        List<Course> Courses = new ArrayList<Course>();
        String sql = "SELECT * FROM Course ";
        ResultSet rs = null;
        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {

            rs = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            while (rs.next()) {
                Course CourseBean = new Course();
                CourseBean.setIdentifier(rs.getString("Identifier"));
                CourseBean.setName(rs.getString("Name"));
                CourseBean.setCourseID(rs.getString("ID"));
                CourseBean.setWebsite(rs.getString("webpage"));
                CourseBean.setCredits(rs.getInt("Credits"));
                CourseBean.setPrerequisites(rs.getString("Prerequisite"));
                Courses.add(CourseBean);
                LOGGER.config("Object CourseBean is equal to :" + CourseBean);

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
        return Courses;
    }

    public static boolean deleteCourseByID(String courseID) throws SQLException, ClassNotFoundException, IOException {
        File f = new File("c:/SimControl/Logging/");
        if (!f.exists()) {
            f.mkdirs();

        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Course_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();
        fh.setFormatter(formatter);
        LOGGER.info("Logger Name: " + LOGGER.getName());
        LOGGER.info("Method deleteCourseByID()");

        int affected = 0;
        String sql = "SELECT * FROM class where CourseID = ? ";
        String sqlAssignment = "SELECT * FROM assignment where ClassID = ?";
        String sqlDeleteSubmissions = "DELETE FROM submissions WHERE AssignmentID = ?";
        String sqlDeleteAssignments = "DELETE FROM assignment WHERE ClassID = ?";
        String sqlDeleteClasses = "DELETE FROM class WHERE CourseID = ?";
        String sqlDeleteCourse = "DELETE FROM course WHERE ID = ?";
        ResultSet rsClass = null, rsAssignment = null, rsSubmission = null;

        LOGGER.warning("Creating the connection to the database");
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {

            stmt.setString(1, courseID);

            rsClass = stmt.executeQuery();
            LOGGER.warning("Finish executing query");
            while (rsClass.next()) {
                LOGGER.info("rsClass now has all the classes where courseID = " + rsClass.getString("ID"));

                try (PreparedStatement stmtAssign = conn.prepareStatement(sqlAssignment);) {

                    stmtAssign.setString(1, rsClass.getString("ID"));

                    rsAssignment = stmtAssign.executeQuery();
                    LOGGER.warning("Finish executing query");
                    while (rsAssignment.next()) {
                        LOGGER.info("rsAssignment now has all the Assignments where ClassID =" + rsAssignment.getString("ID"));
                        try (PreparedStatement stmtSubmit = conn.prepareStatement(sqlDeleteSubmissions);) {

                            stmtSubmit.setString(1, rsAssignment.getString("ID"));
                            LOGGER.info("Deleting all submissions with Assignment ID = " + rsAssignment.getString("ID"));
                            affected = stmtSubmit.executeUpdate();
                            LOGGER.warning("Finish executing query");

                        } catch (SQLException e) {
                            System.err.println(e);
                            LOGGER.log(Level.SEVERE, "Exception occur", e);
                            return false;
                        } finally {
                            if (rsSubmission != null) {
                                rsSubmission.close();
                            }
                        }
                    }

                } catch (SQLException e) {
                    System.err.println(e);
                    LOGGER.log(Level.SEVERE, "Exception occur", e);
                    return false;
                } finally {
                    if (rsAssignment != null) {
                        rsAssignment.close();
                    }
                }

                try (PreparedStatement stmtAssignDelete = conn.prepareStatement(sqlDeleteAssignments);) {
                    stmtAssignDelete.setString(1, rsClass.getString("ID"));
                    LOGGER.info("Deleting all Assignments with Class ID = " + rsClass.getString("ID"));
                    affected = stmtAssignDelete.executeUpdate();
                    LOGGER.warning("Finish executing query");

                } catch (SQLException e) {
                    System.err.println(e);
                    LOGGER.log(Level.SEVERE, "Exception occur", e);
                    return false;
                } finally {
                    if (rsAssignment != null) {
                        rsAssignment.close();
                    }
                }

            }

        } catch (SQLException e) {
            System.err.println(e);
            LOGGER.log(Level.SEVERE, "Exception occur", e);
            return false;
        } finally {
            if (rsClass != null) {
                rsClass.close();
            }
        }
        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmtClassDelete = conn.prepareStatement(sqlDeleteClasses);) {
            stmtClassDelete.setString(1, courseID);
            LOGGER.info("Deleting all Classes with Course ID = " + courseID);
            affected = stmtClassDelete.executeUpdate();
            LOGGER.warning("Finish executing query");

        } catch (SQLException e) {
            System.err.println(e);
            LOGGER.log(Level.SEVERE, "Exception occur", e);
            return false;
        } finally {
            if (rsClass != null) {
                rsClass.close();
            }
        }

        try (Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmtCourseDelete = conn.prepareStatement(sqlDeleteCourse);) {
            stmtCourseDelete.setString(1, courseID);
            LOGGER.info("Deleting all courses with Course ID = " + courseID);
             affected = stmtCourseDelete.executeUpdate();
            if (affected != 1) {
                return false;
            }
            LOGGER.warning("Finish executing query");

        } catch (SQLException e) {
            System.err.println(e);
            LOGGER.log(Level.SEVERE, "Exception occur", e);
            return false;
        } finally {
            if (rsClass != null) {
                rsClass.close();
            }
        }
        return true;
    }
}
