package com.Chalan_management;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PaymentProcess")
public class PaymentProcess extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=null;
		int amt=0;
		PrintWriter out=response.getWriter();
		
		String password=request.getParameter("pass");
		
	
		
		Connection con=null;
		boolean flag=false;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connectionURL = "jdbc:mysql://localhost:3306/cms?autoReconnect=true&useSSL=false";
			con=DriverManager.getConnection(connectionURL,"root","jarvis");
			String sql="select * from user";
			PreparedStatement st=con.prepareStatement(sql);
			
			ResultSet rs= st.executeQuery();
			while(rs.next()){
				String v = rs.getString("pass");
				if(v.equals(password))
	        	{
					flag=true;
					break;
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

		
		if(flag)
		{
			String vehicleNo=" "; 
			Cookie[] cookies = request.getCookies();
			if(cookies != null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("vehicleNo"))
					{
					vehicleNo = cookie.getValue();
					}
				if(cookie.getName().equals("amt"))
				{
					amt=Integer.parseInt((cookie.getValue()));
					
				}
			}
			}
			
			//calculate the current system date;
			
			
			long millis=System.currentTimeMillis();  
			java.sql.Date date=new java.sql.Date(millis);  
			System.out.println(date);
			
			
			// add all the transations in histroy table
			//deleted all the rows from database of specific user
			try{
				Class.forName("com.mysql.jdbc.Driver");
				String connectionURL = "jdbc:mysql://localhost:3306/cms?autoReconnect=true&useSSL=false";
				con=DriverManager.getConnection(connectionURL,"root","jarvis");
				System.out.println(vehicleNo);
				////String sql1="insert into history value(;
				String sql="delete from chalan where vno=\""+vehicleNo+"\" ";
				
				//response.getOutputStream().println(sql);
				Statement s = con.createStatement();
				//ps.setString(1,vehicleNo);
				//ps.setDate(2,(java.sql.Date) date);
				//ps.setInt(3,amt);
				s.executeUpdate("INSERT INTO history(vno,date,amt) VALUE ('"+vehicleNo+"','"+date+"','"+amt+"')");
				
				Statement st=con.createStatement();
				st.executeUpdate(sql);
					st.close();
					s.close();
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

				
			
			out.println("Payment has been Successfully Made :) ");
			out.println("<center><p><a href='home.jsp'>Home Page</a></p><center>");
			
		}else
		{
			out.println("<center>You have Entered the wrong Credintials\n plz login again :</center>");
			out.println("<center><p><a href='Login.jsp'>Login</a></p><center>");
		}
		
	}//end of method
} //end of class

