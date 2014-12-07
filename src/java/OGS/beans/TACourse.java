/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package OGS.beans;

import java.io.Serializable;

/**
 *
 * @author eloo
 */
public class TACourse implements Serializable {

    private String TAID;
    private String ClassID;

    public String getTAID() {
        return TAID;
    }


    public void setTAID(String TAID) {
        this.TAID = TAID;
    }
    
    public String getClassID(){
        return ClassID;
    }
    
    public void setClassID(String classID){
        this.ClassID = classID;
    }
    
}