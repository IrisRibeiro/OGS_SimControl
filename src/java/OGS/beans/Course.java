package OGS.beans;

import java.io.Serializable;
import java.sql.Date;

/**
 * This is the bean for course table
 *
 * @author Yi
 */
public class Course implements Serializable {

    private String identifier;
    private String name;    
    private String prerequisites;   
    private String ID;    
    private String Website;
    private int credits;
   

    public String getWebsite(){
        return Website;
    } 
    
   
    public void setWebsite(String website){
        this.Website = website;
    }
    /**
     *
     * @return course's identifier
     */
    public String getIdentifier() {
        return identifier;
    }

    /**
     * sets course's identifier into variable identifier
     *
     * @param identifier
     */
    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    /**
     *
     * @return course's name
     */
    public String getName() {
        return name;
    }

    /**
     * sets course's name into variable name
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }
    
    /**
     *
     * @return course's prerequisites
     */
    public String getPrerequisites() {
        return prerequisites;
    }

    /**
     * sets course's prerequisites into variable prerequisites
     *
     * @param prerequisites
     */
    public void setPrerequisites(String prerequisites) {
        this.prerequisites = prerequisites;
    }

    /**
     *
     * @return course's ID
     */
    public String getCourseID() {
        return ID;
    }

    /**
     * sets course's ID into variable courseID
     *
     * @param ID
     */
    public void setCourseID(String ID) {
        this.ID = ID;
    }    
    /**
     *
     * @return course's credits
     */
    public int getCredits() {
        return credits;
    }

    /**
     * sets course's credits into variable credits
     *
     * @param credits
     */
    public void setCredits(int credits) {
        this.credits = credits;
    }    

}
