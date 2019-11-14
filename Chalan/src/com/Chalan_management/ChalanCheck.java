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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ChalanCheck")
public class ChalanCheck extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String vno=" ";
		 int totalChallan=0;
		Cookie[] cookie=request.getCookies();
		if(cookie!=null)
		for(Cookie c:cookie)
		{
					if(c.getName().equals("vehicleNo"))
					{
						vno=c.getValue();
						
					}
		}
		//ChalanDao dao = new ChalanDao();
		//System.out.println(vno);
		PrintWriter out= response.getWriter();
		
		
		
		Connection con=null;
		//Statement st = null;
		//boolean flag=false;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connectionURL = "jdbc:mysql://localhost:3306/cms?autoReconnect=true&useSSL=false";
			con=DriverManager.getConnection(connectionURL,"root","jarvis");
			String sql="select * from chalan";
			PreparedStatement st=con.prepareStatement(sql);
			ResultSet rs= st.executeQuery();
		
			out.println("<html><head>");
			 out.println("<style>");     // start style
  // enclose style attributes withing the <style> </style> elements
  out.println("table{");        // note leading brace
  out.println("color:green;");
  out.println("}");     
  out.println("div{"); 
  out.println("margin-top: 100px;");
  out.println("}"); 
  out.println("</style>");
  out.println("</head><body><div><center>" +
  		"<h1> All THE PENDING CHALLAN'S</h1>" +
  		"<table border=2px>" +
  		"<tr><th>Amount</th>" +
  		"<th>Date</th>" +
  		"<th> Reason for Challan</th>");
		
			while(rs.next()){
				String v = rs.getString("vno");
				if(v.equals(vno))
	        	{
				
					out.println("<tr><td>"+Integer.parseInt(rs.getString("amt"))+"</td>");
					out.println("<td>"+rs.getString("date")+"</td>");
					out.println("<td>"+rs.getString("reason")+"</td></tr>");
					totalChallan+=Integer.parseInt(rs.getString("amt"));
					
	        	}
		      }
			
			out.println("<tr><td colspan=2>TOTAL CHALLAN</td>" +
					"<td>" + totalChallan +"</td></tr>"+
					"</table>" +
					"<br><br>"
					 +
					"</center></div></body></html>");
				
				if(totalChallan!=0)
				{
					HttpSession s= request.getSession(true);
					//String total=
					Cookie amt = new Cookie("amt", String.valueOf(totalChallan));
					response.addCookie(amt);
					out.println("<center><form action='Payment.jsp' method='post'>" +
					"<button type='submit'>PAY</button>" +
					"<br> <br>" +
					"</form></center>");
				}
				out.println("<center><p><a href='home.jsp'>Home Page</a></p><center>");
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

		
		
	}

}
