package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB 
{
	public static Connection getCon()
	{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="system";
		String password="root123";
		Connection con = null;
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			System.out.println("Driver Loaded...!");
			
			con = DriverManager.getConnection(url, user, password);

			System.out.println("Connection Establish...!");
		} 
		catch(Exception e){System.out.println(e);}
		return con;
	}
}
