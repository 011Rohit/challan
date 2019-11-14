package com.Chalan_management;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForgetProcess
 */
@WebServlet("/ForgetProcess")
public class ForgetProcess extends HttpServlet {
String name=null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		name=request.getParameter("username");
		Change.uname=name;
		System.out.println(name);
		String question = null;
		Connection con=null;
		boolean flag=false;
		try{
		Class.forName("com.mysql.jdbc.Driver");
		String connectionURL = "jdbc:mysql://localhost:3306/cms?autoReconnect=true&useSSL=false";
		con=DriverManager.getConnection(connectionURL,"root","jarvis");
		String sql="select * from user";
		PreparedStatement st=con.prepareStatement(sql);
		ResultSet rs= st.executeQuery(sql);
		
		while(rs.next()){
	         //Retrieve by column name
	         String u  = rs.getString("username");
	        if(u.equals(name))
	        	{
	        		question =rs.getString(8);
	        		break;
	        	}
	      }
		
		st.close();
		con.close();
		
			if(question!=null)
			{
				request.setAttribute("uname",name);
				//out.println(question);
				out.println("<html><head>");
				 out.println("</head><body><center><h1>Your security Quetion <h1><br>" + question+
					  		"<h1> Enter The Answer </h1><br><br>" +
					  		"<form method='post' action='PasswordChange'>" +
					  		"Answer: <input type='text' name='ans'>" +
					  		"<button type='submit'>" +
					  		"submit" +
					  		"</button>" +
					  		"</form" +
					  		"</body></html>");
			}else
			{
				out.println("there is no account with this username !!");
				out.println("<center><p><a href='Login.jsp'>Login</a></p><center>");
			}
			
		
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
	}
	String getName()
	{
		return name;
	}

}
