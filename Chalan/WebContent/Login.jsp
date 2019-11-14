<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chalan Management System</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Custom Theme files -->
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
	<!-- //Custom Theme files -->

	<!-- web font -->
	<link href="//fonts.googleapis.com/css?family=Hind:300,400,500,600,700" rel="stylesheet">

<style>
.container {
  width: 800px;
  clear: both;
  text-align: center;
  position:absolute;
  top:50%;
  left:50%;
  transform:translate(-50%,-50%);
  
}
.container label {
  float:left;
  width:40%;
  text-align:right;
  margin-right:5px; /* optional */
}
.container input {
  float:left;
  width:20%;
}
h1
{
	margin-top:200px;
}

</style>
	
</head>
<body>

	
		<h1 align="center">Chalan Management System</h1>

			<div class="container" >
				<form action="Login" method="get" >
					
						<label>Username</label> <input name="uname" type="text" placeholder="Email Address" required=""/><br><br>
					
					
						<label>password</label><input name="pass" type="password" placeholder="Password" required=""/>
					<br><br>
					
					
					
						<button type="submit" class="btn">Log In</button>
					<br>
					
						<a href="Forget.jsp">Forgot Password?</a><br>
						<a href="Regester.jsp">Regester?</a>
					</div>
				</form>	
			</div>
			
		</div>
	</div>
</div>	
</body>
</html>