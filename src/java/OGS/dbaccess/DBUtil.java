package OGS.dbaccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

	private static final String USERNAME = "dbuser";
	private static final String PASSWORD = "dbpassword";
	private static final String M_CONN_STRING = 
			"jdbc:mysql://localhost/simcontrol";
        /**
         * 
         * @param dbType the type of database we are using
         * This method connects to the database with the username and password that you provided
         * @return the Connection to the database
         * @throws SQLException 
         */
	public static Connection getConnection(DBType dbType) throws SQLException {
		
		switch (dbType) {
		case MYSQL:
			return DriverManager.getConnection(M_CONN_STRING, USERNAME, PASSWORD);
		default:
			return null;
		}
		
	}
	/**
         * 
         * @param e 
         * Throws a exception if the connection failed
         */
	public static void processException(SQLException e) {
		System.err.println("Error message: " + e.getMessage());
		System.err.println("Error code: " + e.getErrorCode());
		System.err.println("SQL state: " + e.getSQLState());
	}
	
}
