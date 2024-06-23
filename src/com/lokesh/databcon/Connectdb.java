package com.lokesh.databcon;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;
public class Connectdb {
	static Connection con = null;
	public static Connection connect() 
	{
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/missingpersonidentification","root","");
				System.out.println("Connection...");
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		return con;
	}
}
