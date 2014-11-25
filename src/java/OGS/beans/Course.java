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
    private String days;
    private String time;
    
    private String building;
    private String room;    
    private String prerequisites;
    private String section;
    private String ID;
    private String instructorID; 
    private String Website;
    private int credits;
    private int numberOfAssignments;

    public String getWebsite(){
        return Website;
    }
    
    public String getTime() {
         return time;
     }

    /**
     * sets assignment's due date into variable dueDate
     *
     * @param dueDate
     */
    public void setTime(String time) {
         this.time = time;
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
     * @return course's lasting days
     */
    public String getDays() {
        return days;
    }

    /**
     * sets course's lasting days into variable days
     *
     * @param days
     */
    public void setDays(String days) {
        this.days = days;
    }

    /**
     *
     * @return course's office hours
     */
    

    /**
     * sets course's office hours into variable officeHours
     *
     * @param officeHours
     */
    

    /**
     *
     * @return course's building location
     */
    public String getBuilding() {
        return building;
    }

    /**
     * sets course's building location into variable building
     *
     * @param building
     */
    public void setBuilding(String building) {
        this.building = building;
    }

    /**
     *
     * @return course's room location
     */
    public String getRoom() {
        return room;
    }

    /**
     * sets course's room location into variable room
     *
     * @param room
     */
    public void setRoom(String room) {
        this.room = room;
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
     * @return course's instructor ID
     */
    public String getInstructorID() {
        return instructorID;
    }

    public void setInstructorID(String instructorID) {
        this.instructorID = instructorID;
    }

    /**
     *
     * @return course's section
     */
    public String getSection() {
        return section;
    }

    /**
     * sets course's section into variable section
     *
     * @param section
     */
    public void setSection(String section) {
        this.section = section;
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

    /**
     *
     * @return course's number of assignments
     */
    public int getNumberOfAssignments() {
        return numberOfAssignments;
    }

    /**
     * sets course's number of assignments into variable numberOfAssignments
     *
     * @param numberOfAssignments
     */
    public void setNumberOfAssignments(int numberOfAssignments) {
        this.numberOfAssignments = numberOfAssignments;
    }

}
