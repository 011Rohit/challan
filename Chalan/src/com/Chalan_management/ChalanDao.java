package com.Chalan_management;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ChalanDao {

	 int count=0;
	public int PrintChalan(String vno)
	{
	Connection con=null;
	//Statement st = null;
	boolean flag=false;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String connectionURL = "jdbc:mysql://localhost:3306/cms?autoReconnect=true&useSSL=false";
		con=DriverManager.getConnection(connectionURL,"root","jarvis");
		//String sql ="Select uname,password form User where uname=? and password=?";
		String sql="select * from chalan";
		PreparedStatement st=con.prepareStatement(sql);
		//st.setString(1, vno);
		
		ResultSet rs= st.executeQuery();
	
		//pw.println("<html><table><tr>");
		
		//pw.println("</tr></table></html>");
		while(rs.next()){
			String v = rs.getString("vno");
			if(v.equals(vno))
        	{
				
        	}
	      }
		
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

	
	return count;
	}
}
