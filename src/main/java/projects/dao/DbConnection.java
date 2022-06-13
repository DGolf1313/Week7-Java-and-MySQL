package projects.dao;

import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	
	private static String HOST = "localhost";
	private static String PASSWORD = "diyproject12";
	private static int PORT = 3306;
	private static String SCHEMA = "projects";
	private static String USER = "projects";
	
	public static java.sql.Connection getConnection(){
	
		String uri = String.format("jdbc:mysql://%s:%d/%s?user=%s&password=%s&useSSL=false", HOST, PORT, SCHEMA, USER, PASSWORD);
		java.sql.Connection connection = null;
		 try {
			connection = DriverManager.getConnection(uri);
			System.out.println("Successful Connection");
		} catch (SQLException e) {
			System.out.println("DbException");
			e.printStackTrace();
		}
		return connection;
	} 

}

