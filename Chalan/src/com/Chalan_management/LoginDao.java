package com.Chalan_management;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginDao {

	public boolean checkLogin(String username,String pass)
	{
		Connection con=null;
		//Statement st = null;
		boolean flag=false;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connectionURL = "jdbc:mysql://localhost:3306/cms?autoReconnect=true&useSSL=false";
			con=DriverManager.getConnection(connectionURL,"root","jarvis");
			System.out.println("hiii");
			//String sql ="Select uname,password form User where uname=? and password=?";
			String sql="select username,pass from user";
			PreparedStatement st=con.prepareStatement(sql);
			//st.setString(1, username);
			//st.setString(2, pass);
			ResultSet rs= st.executeQuery(sql);
			
			while(rs.next()){
		         //Retrieve by column name
		         String u  = rs.getString("username");
		         String p = rs.getString("pass");

		         //Display values
		        if(u.equals(username) && p.equals(pass))
		        	{
		        	System.out.println("hdrhdfhdtfjhdfh");
		        	return true;
		        	}
		         System.out.print(", First: " + u);
		         System.out.println(", Last: " + p);
		      }
			//flag=st.execute(sql);
			//if(rs.next())
			//	return true;
			
				//rs.close();
				st.close();
				con.close();
			
		}
		catch(Exception e)
		{
			
		}
		finally{
		      
		      try{
		         if(con!=null)
		            con.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }
		}

		
		return false;
	}
	public String getVehicleNo(String uname)
	{
		 String vno=" ";
		Connection con=null;
		boolean flag=false;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connectionURL = "jdbc:mysql://localhost:3306/cms?autoReconnect=true&useSSL=false";
			con=DriverManager.getConnection(connectionURL,"root","jarvis");
			String sql="select * from user";
			PreparedStatement st=con.prepareStatement(sql);
			//st.setString(1, username);
			//st.setString(2, pass);
			ResultSet rs= st.executeQuery(sql);
			
			while(rs.next()){
		         //Retrieve by column name
		         String u  = rs.getString("username");
		        if(u.equals(uname))
		        	{
		        		vno=rs.getString("vno");
		        	}
		      }
			
			st.close();
			con.close();
			
				
				
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally{
		      
		      try{
		         if(con!=null)
		            con.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }
		}
		return vno;
	}
}
