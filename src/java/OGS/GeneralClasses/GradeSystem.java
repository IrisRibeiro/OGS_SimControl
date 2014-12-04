/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OGS.GeneralClasses;

import OGS.beans.Person;
import OGS.tables.ClassManager;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author Eric
 */
public class GradeSystem {
    private static final Logger LOGGER = Logger.getLogger(GradeSystem.class.getName());
    
    public static Double calcMax(Person p)throws Exception{
        List<OGS.beans.Class> classes = ClassManager.getClassesForPerson(p.getAccessLevel(), p.getID());
        for(int i = 0; i < classes.size(); i++){
            System.out.println("Index: " + i + " :" + classes.get(i).getNumberOfAssignments());
        }
        return null;
    }
    
    public static Double calcMin(Person p)throws Exception{
        return null;
    }
    
    public static Double calcAvg(Person p)throws Exception{
        return null;
    }
    
    public static Double calcMid(Person p)throws Exception{
        return null;
    }
    
    public static Double calcGradeDist(Person p)throws Exception{
        return null;
    }
    public static void getAllSubmissions(Person p) throws Exception {
        
    }
}
