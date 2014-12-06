/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OGS.GeneralClasses;

import OGS.beans.Assignment;
import OGS.beans.Person;
import OGS.beans.Submission;
import OGS.beans.Classes;
import OGS.beans.Course;
import OGS.tables.AssignmentManager;
import OGS.tables.ClassManager;
import OGS.tables.CourseManager;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author Eric
 */
public class GradeSystem {

    private static final Logger LOGGER = Logger.getLogger(GradeSystem.class.getName());

    public static Double calcMax(List<Submission> submission) throws Exception {
        double max = 0.0;
        for (Submission subs : submission) {
            if (subs.getGrade() > max){
                max = subs.getGrade();
            }
        }
        return max;
    }

    public static Double calcMin(List<Submission> submission) throws Exception {
        double min = GradeSystem.calcMax(submission);
        for (Submission subs : submission) {
            if (subs.getGrade() < min){
                min = subs.getGrade();
            }
        }
        return min;
    }

    public static Double calcAvg(List<Submission> submission) throws Exception {
        double avg = 0.0;
        double counter = 0;
        for (Submission subs : submission) {
            avg += subs.getGrade();
            ++counter;
        }
        avg = avg / counter;
        return avg;
    }

    public static Double calcMid(List<Submission> submission) throws Exception {
        int counter = 0;
        for (Submission subs : submission) {
            ++counter;
        }
        return submission.get(counter/2).getGrade();
    }

    public static Double[] calcGradeDist(List<Submission> submission) throws Exception {
        AssignmentManager.getRow(submission.get(1).getAssignmentID());
        return null;
    }
}
