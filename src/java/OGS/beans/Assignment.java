package OGS.beans;

import java.io.Serializable;
import java.sql.Date;
/**
 *
 * @author eloo
 */
/**
 * This is the bean for assignment table
 *
 * @author Yi
 */
public class Assignment implements Serializable {
    
    private String name;
    private String specification;
    private Date dueDate;
    private String instructions;
    private String path;
    private String courseID;
    private int pointsPossible;
    private int ID;
    private int number;
    

    /**
     *
     * @return assignment's name
     */
    public String getName() {
        return name;
    }
    
    public int getNumber(){
        return number;
    }
    
    

    /**
     * sets assignment's name into variable name
     *
     * @param name
     */
    
    public void setNumber(int number){
        this.number = number;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    /**
     *
     * @return assignment's specification
     */
    public String getSpecification() {
        return specification;
    }

    /**
     * sets assignment's specification into variable specification
     *
     * @param specification
     */
    public void setSpecification(String specification) {
        this.specification = specification;
    }

    /**
     *
     * @return assignment's due date
     */
    public Date getDueDate() {
         return dueDate;
     }

    /**
     * sets assignment's due date into variable dueDate
     *
     * @param dueDate
     */
    public void setDueDate(Date dueDate) {
         this.dueDate = dueDate;
     }

    /**
     *
     * @return assignment's instructions
     */
    public String getInstructions() {
        return instructions;
    }

    /**
     * sets assignment's instructions into variable instructions
     *
     * @param instructions
     */
    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    /**
     *
     * @return assignment's path
     */
    public String getPath() {
        return path;
    }

    /**
     * sets assignment's path into variable path
     *
     * @param path
     */
    public void setPath(String path) {
        this.path = path;
    }

    /**
     *
     * @return assignment's course ID
     */
    public String getCourseID() {
        return courseID;
    }

    /**
     * sets assignment's course ID into variable courseID
     *
     * @param courseID
     */
    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    /**
     *
     * @return assignment's possible points
     */
    public int getPointsPossible() {
        return pointsPossible;
    }

    /**
     * sets assignment's possible points into variable pointsPossible
     *
     * @param pointsPossible
     */
    public void setPointsPossible(int pointsPossible) {
        this.pointsPossible = pointsPossible;
    }

    /**
     *
     * @return assignment's ID
     */
    public int getID() {
        return ID;
    }

    /**
     * sets assignment's ID into variable ID
     *
     * @param ID
     */
    public void setID(int ID) {
        this.ID = ID;
    }

   

}
