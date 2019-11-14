<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	li
	{

    display:inline-block;
    list-style-type:none;
    padding:10px;

	}
	h1
	{
		color: white;
		text-align: center;
	}
	h2
	{
		color: white;
		text-align: center;
	}
	
.header {
  background-color: black;
}
.middle{

padding: 20px 0;
}
.content{
margin-left:300px;
}
.footer{
background-color: black;
height: 150px;
}
</style>
</head>




<body>

<div class="header" style="height: 150px;">

<! java code to get username which is stored in cookies-->
<%
String message = request.getParameter("uname");
//String sessionID = null;

if(message==null)
{
Cookie[] cookies = request.getCookies();
if(cookies != null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("username"))
		{
			//out.println("hi");
			message = cookie.getValue();
		}
		//out.println(cookie.getValue());
	
}
}
}
%>
<h3 style="color:white;">welcome <%= message %></h3>

	<h1>E-CHALLAN SYSTEM</h1>
<center>
<ol>
<li><form action="ChalanCheck" method="post">
	<button>E-CHALLAN</button>
</form>
<li><form action="HistoryCheck" method="post">
	<button>History</button>
</form>
<li><form action="AboutUs.html">
	<button >ABOUT US</button>
</form>
<li><form action="ContactUs.html">
	<button >CONTACT US</button>
</form>
<li><form action="LogoutServlet" method="post">
	<button target="_BLANK">LOGOUT</button>
</form>
</ol>	
</center>
</div>

<div class="middle">
<center>
<img src="pic.jpg" alt="TRAFFIC RULES"><br><br>
</center>
</div>
<div class="content">
<h3 class="h3">1. Keep Left</h3>
Drive adjacent to the left side of the road and let other vehicles in the opposite direction to pass on the right hand side.<br><br>

<h3 class="h3">2.  Turning Left</h3>
If you want to turn left, stay close to the left side and then, turn left. After turning, continue to stay to the left side of the road.<br><br>
<h3 class="h3">3.  Turning Right</h3><br>
When you want to turn right, you should first come to the centre of the road carefully and then, turn right keeping your vehicle close to the left side of the road. <br><br>
<h3 class="h3">4.   Passing</h3>
Always remember to pass or overtake the vehicle in front of yours from its right side. <br><br>
<h3 class="h3">5.  Emergency Vehicles</h3>
As a road user, it is your responsibility to give way to fire service vehicles and ambulances<br><br>
<h3 class="h3">6.  Indicators</h3>
By using mechanical devices or electronic devices, you can simplify the signals for indication<br><br>
<h3 class="h3">7.  Parking</h3>
When you park the vehicle, make sure that it does not cause any hurdle or disturbance to any other road users<br><br>
<h3 class="h3">8.  Stop Lines</h3>
When there are stop lines on the road, ensure that you stop the vehicle behind those lines.<br><br>
<h3 class="h3">9.  Driving in Reverse</h3>
When you take reverse, you should ensure that it does not cause annoyance to any other people on the road.<br><br>

<h3 class="h3">10. Essential Documents</h3>
A driver should possess the following documents while driving a vehicle: <br><br>    a.  Driving license<br>    b.  Registration certificate of the vehicle<br>    c.  Taxation certificate<br>    d.  Insurance certificate<br>    e.  Fitness certificate<br>   f.  Permit
<br>
</div>
<div class="footer">

<center>
	<h1> ThankYou </h1><br>
	<h2>Developed By Rohit Mahale</h2>
</center>
</div>
</body>
</html>