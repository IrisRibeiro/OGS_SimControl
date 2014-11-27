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

    private int TAID;
    private int ClassID;

    public int getTAID() {
        return TAID;
    }


    public void setTAID(int TAID) {
        this.TAID = TAID;
    }
    
    public int getClassID(){
        return ClassID;
    }
    
    public void setClassID(){
        this.ClassID = ClassID;
    }
    
}