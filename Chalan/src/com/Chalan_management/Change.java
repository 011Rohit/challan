package com.Chalan_management;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Change
 */
@WebServlet("/Change")
public class Change extends HttpServlet {
	private static final long serialVersionUID = 1L;
   static String uname=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pass= request.getParameter("pass");
		
		Connection con=null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connectionURL = "jdbc:mysql://localhost:3306/cms?autoReconnect=true&useSSL=false";
			con=DriverManager.getConnection(connectionURL,"root","jarvis");
			String sql="update user set pass=\""+pass+"\" " +"where username=\""+uname+"\" ";
			
			Statement st=con.createStatement();
			
			st.executeUpdate(sql);
				st.close();
				con.close();
			
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

			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);     
	}
}
