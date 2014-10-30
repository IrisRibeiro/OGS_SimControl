package OGS.beans;

import java.io.Serializable;

/**
 *
 * @author eloo
 */
/**
 * This is the bean for studentenrollment table
 *
 * @author Yi
 */
public class StudentEnrollment implements Serializable {

    private int studentID;
    private int courseID;
    private String flag;

    /**
     *
     * @return student enrollment's student ID
     */
    public int getStudentID() {
        return studentID;
    }

    /**
     * sets student enrollment's student ID into variable studentID
     *
     * @param studentID
     */
    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    /**
     *
     * @return student enrollment's course ID
     */
    public int getCourseID() {
        return courseID;
    }

    /**
     * sets student enrollment's course ID into variable courseID
     *
     * @param courseID
     */
    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    /**
     *
     * @return student enrollment's flag
     */
    public String getFlag() {
        return flag;
    }

    /**
     * sets student enrollment's flag into variable flag
     *
     * @param flag
     */
    public void setFlag(String flag) {
        this.flag = flag;
    }

}
