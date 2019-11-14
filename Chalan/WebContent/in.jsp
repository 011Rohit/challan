<%@ page import="java.sql.*"%>  
  
<%  

boolean flag=false;
String s=request.getParameter("val");  
if(s==null || s.trim().equals("")){  
out.print("Please enter id");  
}else{
	
//out.print(s);  
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","jarvis");  
PreparedStatement ps=con.prepareStatement("select * from user");  
//ps.setString(1,s);  
ResultSet rs=ps.executeQuery();  
	while(rs.next()){  
	if(rs.getString(5).equals(s))
	{
		flag=true;
		break;
	}
	}  
con.close();  
}catch(Exception e){
	e.printStackTrace();
	}
	if(flag)
		out.println("not available");
	else
		out.println("available");
}  
%>  