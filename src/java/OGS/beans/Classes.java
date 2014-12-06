/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OGS.beans;

import java.io.Serializable;

/**
 *
 * @author Iris
 */
public class Classes implements Serializable {
    private String days;
    private String time;    
    private String building;
    private String room;    
    private String section;
    private String ID;
    private String instructorID;   
    private int numberOfAssignments;
    private String CourseID;

    
    public String getTime() {
         return time;
     }
    
    public String getCourseID(){
        return CourseID;
    }

    /**
     * sets assignment's due date into variable dueDate
     *
     * @param dueDate
     */
    public void setTime(String time) {
         this.time = time;
     }
    
    public void setCourseID(String courseID){
        this.CourseID = courseID;
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
     * @return course's ID
     */
    public String getClassID() {
        return ID;
    }

    /**
     * sets course's ID into variable courseID
     *
     * @param ID
     */
    public void setClassID(String ID) {
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
