
///changes in query part 

package com.Chalan_management;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PasswordChange
 */
@WebServlet("/PasswordChange")
public class PasswordChange extends HttpServlet {
	
	
	String ans=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		ans=request.getParameter("ans");
		Connection con=null;
		boolean flag=false;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connectionURL = "jdbc:mysql://localhost:3306/cms?autoReconnect=true&useSSL=false";
			con=DriverManager.getConnection(connectionURL,"root","jarvis");
			
			
			
			
			
			
			
			//
			String sql = "select * from user";
			Statement st=con.createStatement();
			
			ResultSet rs =st.executeQuery(sql);
			
			while(rs.next())
			{
				if(rs.getString(9).equals(ans))
				{
					flag= true;
					break;
				}
			}
				st.close();
				con.close();
				
				if(flag)
				{
					String name =request.getParameter("uname");
					request.setAttribute("uname",name);
					out.println("<html><head>");
					 out.println("</head><body><center>" +
						  		"<h1> Enter The New Password </h1><br><br>" +
						  		"<form method='post' action='Change'>" +
						  		" <input type='pass' name='pass'>" +
						  		"<button type='submit' '>" +
						  		"submit" +
						  		"</button>" +
						  		"</form" +
						  		"</body></html>");
				}else
				{
					out.println("Wrong Information !!");
					out.println("<center><p><a href='Login.jsp'>Login</a></p><center>");
				}
			
		}catch(Exception e)
		{
			
		}finally{
		      
		      try{
		         if(con!=null)
		            con.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }
		}

			
	}

}
