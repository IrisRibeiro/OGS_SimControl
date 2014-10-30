package OGS.beans;

import java.io.Serializable;

/**
 *
 * @author eloo
 */
public class StudentEnrollment implements Serializable{
    private int studentID;
    private int courseID;
    private String flag;

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }
    
    
}
