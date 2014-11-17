package OGS.beans;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.Serializable;

/**
 *
 * @author eloo
 */
/**
 * This is the bean for submission table
 *
 * @author Yi
 */
public class Submission implements Serializable {

    private int studentID;
    private int assignmentID;
    private int graderID;
    private int submissionID;
    private double grade;
    private String comments;
    private String path;
    private String dateFlag;
    private String submissionTime;

    /**
     *
     * @return submission's student ID
     */
    public int getStudentID() {
        return studentID;
    }

    /**
     * sets submission's student ID into variable studentID
     *
     * @param studentID
     */
    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    /**
     *
     * @return submission's assignment ID
     */
    public int getAssignmentID() {
        return assignmentID;
    }

    /**
     * sets submission's assignment ID into variable assignmentID
     *
     * @param assignmentID
     */
    public void setAssignmentID(int assignmentID) {
        this.assignmentID = assignmentID;
    }

    /**
     *
     * @return submission's grader ID
     */
    public int getGraderID() {
        return graderID;
    }

    /**
     * sets submission's grader ID into variable graderID
     *
     * @param graderID
     */
    public void setGraderID(int graderID) {
        this.graderID = graderID;
    }

    /**
     *
     * @return submission's submission ID
     */
    public int getSubmissionID() {
        return submissionID;
    }

    /**
     * sets submission's submission ID into variable submissionID
     *
     * @param submissionID
     */
    public void setSubmissionID(int submissionID) {
        this.submissionID = submissionID;
    }

    /**
     *
     * @return submission's grade
     */
    public double getGrade() {
        return grade;
    }

    /**
     * sets submission's grade into variable grade
     *
     * @param grade
     */
    public void setGrade(double grade) {
        this.grade = grade;
    }

    /**
     *
     * @return submission's comments
     */
    public String getComments() {
        return comments;
    }

    /**
     * sets submission's comments into variable comments
     *
     * @param comments
     */
    public void setComments(String comments) {
        this.comments = comments;
    }

    /**
     *
     * @return submission's assignment path
     */
    public String getPath() {
        return path;
    }

    /**
     * sets submission's path into variable path
     *
     * @param path
     */
    public void setPath(String path) {
        this.path = path;
    }

    /**
     *
     * @return submission's assignment date flag
     */
    public String getDateFlag() {
        return dateFlag;
    }

    /**
     * sets submission's date flag into variable dataFlag
     *
     * @param dateFlag
     */
    public void setDateFlag(String dateFlag) {
        this.dateFlag = dateFlag;
    }

    /**
     *
     * @return submission's assignment submission time
     */
    public String getSubmissionTime() {
        return submissionTime;
    }

    /**
     * sets submission's submission time into variable submissionTime
     *
     * @param submissionTime
     */
    public void setSubmissionTime(String submissionTime) {
        this.submissionTime = submissionTime;
    }

}
