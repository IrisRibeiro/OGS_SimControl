/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OGS.tables;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import OGS.beans.Person;
import OGS.dbaccess.DBType;
import OGS.dbaccess.DBUtil;
import OGS.beans.Student;
import OGS.beans.Manager;
import OGS.beans.TA;



/** 
 *
 * @author Iris
 */
public class PersonManager {
    
    public static Person getRowfromID(int ID) throws SQLException {

        String sql = "SELECT * FROM PERSON WHERE ID = ?";
        ResultSet rs = null;

        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setInt(1, ID);
            rs = stmt.executeQuery();

            if (rs.next()) {
                Person PersonBean = new Person();
                PersonBean.setName(rs.getString("Name"));
                PersonBean.setID(ID);
                PersonBean.setUserName(rs.getString("UserName"));
                PersonBean.setPassword(rs.getString("Password"));
                PersonBean.setEmailAddress(rs.getString("EmailAddress"));
                PersonBean.setAccessLevel(rs.getInt("AcessLevel"));
                PersonBean.setType(rs.getString("Type"));
               
                return PersonBean;
            } else {
                return null;
            }

        } catch (SQLException e) {
            System.err.println(e);
            return null;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }

    }
    
    public static Person getRowfromUserName(String UserName) throws SQLException {

        String sql = "SELECT * FROM PERSON WHERE UserName = ?";
        ResultSet rs = null;

        try (
                Connection conn = DBUtil.getConnection(DBType.MYSQL);
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, UserName);
            rs = stmt.executeQuery();

            if (rs.next()) {
                Person PersonBean = new Person();
                PersonBean.setName(rs.getString("Name"));
                PersonBean.setID(rs.getInt("ID"));
                PersonBean.setUserName(UserName);
                PersonBean.setPassword(rs.getString("Password"));
                PersonBean.setEmailAddress(rs.getString("EmailAddress"));
                PersonBean.setAccessLevel(rs.getInt("AcessLevel"));
                PersonBean.setType(rs.getString("Type"));
               
                return PersonBean;
            } else {
                return null;
            }

        } catch (SQLException e) {
            System.err.println(e);
            return null;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }

    }
  
}
