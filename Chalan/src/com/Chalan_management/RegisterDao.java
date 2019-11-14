package com.Chalan_management;
//import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//import com.mysql.jdbc.Statement;


public class RegisterDao {

	
	public boolean insertData(String name,String surname,String username,String pass,String email,String vno,String phone,String q,String a )
	{
		Connection con=null;
		Statement st = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connectionURL = "jdbc:mysql://localhost:3306/cms?autoReconnect=true&useSSL=false";
			con=DriverManager.getConnection(connectionURL,"root","jarvis");
			String sql="insert into user values ( '"+vno+"','"+name+"', '"+surname+"', '"+email+"', '"+username+"', '"+pass+"', '"+phone+"', '"+q+"', '"+a+"')";
			 st=con.createStatement();
			 st.executeUpdate(sql);
			
			
				st.close();
				con.close();
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			return false;
		}
		finally{
		      
		      try{
		         if(con!=null)
		            con.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }
		}

		
		return true;
	}
}
