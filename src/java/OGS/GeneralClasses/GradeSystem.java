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

    public static Double calcGradeDist(List<Submission> submission, int index) throws Exception {
        double pointsPossible = (AssignmentManager.getRow(submission.get(1).getAssignmentID()).getPointsPossible());
        double[] disCount = new double[11];
        double[] disGrades = {0, (pointsPossible) * .1, (pointsPossible) * .2,
            (pointsPossible) * .3, (pointsPossible) * .4, (pointsPossible) * .5,
            (pointsPossible) * .6, (pointsPossible) * .7, (pointsPossible) * .8,
            (pointsPossible) * .9, (pointsPossible)};
        for (Submission subs : submission) {
            if((subs.getGrade() >= disGrades[0] && subs.getGrade() < disGrades[1])){
                disCount[0]++;
            } else if((subs.getGrade() >= disGrades[1] && subs.getGrade() < disGrades[2])){
                disCount[1]++;
            } else if((subs.getGrade() >= disGrades[2] && subs.getGrade() < disGrades[3])){
                disCount[2]++;
            } else if((subs.getGrade() >= disGrades[3] && subs.getGrade() < disGrades[4])){
                disCount[3]++;
            } else if((subs.getGrade() >= disGrades[4] && subs.getGrade() < disGrades[5])){
                disCount[4]++;
            } else if((subs.getGrade() >= disGrades[5] && subs.getGrade() < disGrades[6])){
                disCount[5]++;
            } else if((subs.getGrade() >= disGrades[6] && subs.getGrade() < disGrades[7])){
                disCount[6]++;
            } else if((subs.getGrade() >= disGrades[7] && subs.getGrade() < disGrades[8])){
                disCount[7]++;
            } else if((subs.getGrade() >= disGrades[8] && subs.getGrade() < disGrades[9])){
                disCount[8]++;
            } else if((subs.getGrade() >= disGrades[9] && subs.getGrade() < disGrades[10])){
                disCount[9]++;
            } else if(subs.getGrade() >= disGrades[10]){
                disCount[10]++;
            }
        }
        
        switch(index){
            case 0:
                return disCount[0];
            case 1:
                return disCount[1];
            case 2:
                return disCount[2];
            case 3:
                return disCount[3];
            case 4:
                return disCount[4];
            case 5:
                return disCount[5];
            case 6:
                return disCount[6];
            case 7:
                return disCount[7];
            case 8:
                return disCount[8];
            case 9:
                return disCount[9];
            case 10:
                return disCount[10];
                
        }

        return 0.0;
    }
}
