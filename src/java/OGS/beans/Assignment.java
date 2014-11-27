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
    private String dueDate;
    private String instructions;
    private String path;
    private String ClassID;
    private int pointsPossible;
    private String ID;
    private int number;
    private String timeDue;
    private String Questions;
    private String Flag;
    
    public String getQuestions(){
        return Questions;
    }
    
    public String getFlag(){
        return Flag;
    }
    
    public String getTimeDue() {
         return timeDue;
     }

    /**
     * sets assignment's due date into variable dueDate
     *
     * @param dueDate
     */
    public void setTimeDue(String timeDue) {
         this.timeDue = timeDue;
     }
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
    
    public void setFlag(String flag){
        this.Flag = flag;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public void setQuestions (String questions){
        this.Questions = questions;
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
    public String getDueDate() {
         return dueDate;
     }

    /**
     * sets assignment's due date into variable dueDate
     *
     * @param dueDate
     */
    public void setDueDate(String dueDate) {
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
    public String getClassID() {
        return ClassID;
    }

    /**
     * sets assignment's course ID into variable courseID
     *
     * @param courseID
     */
    public void setClassID(String classID) {
        this.ClassID = classID;
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
    public String getID() {
        return ID;
    }

    /**
     * sets assignment's ID into variable ID
     *
     * @param ID
     */
    public void setID(String ID) {
        this.ID = ID;
    }

   

}
