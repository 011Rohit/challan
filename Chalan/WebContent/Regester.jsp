<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Registration</title>
<style>
.demo{
  padding: 20px 0;
}
.container {
  width: 700px;
  clear: both;
  text-align: center;
}
.container label {
  float:left;
  width:40%;
  text-align:right;
  margin-right:5px;
}
.container input {
  float:left;
  width:30%;
}

.buttons button {
  
    display: flex;
align-items: center;
}

</style>


<SCRIPT LANGUAGE="JavaScript">

<!-- Begin


function spaceCheck()
{
var invalid = " "; // Invalid character is a space
var pw1 = document.forms[0].elements[2].value;
	if (document.forms[0].elements[2].value.indexOf(invalid) > -1) {
	alert("Sorry, spaces are not allowed.");
	document.forms[0].elements[2].value="";
	document.forms[0].elements[2].focus();
	 document.getElementById('check1').innerHTML="";
	 document.getElementById('check').innerHTML="";
	return false;
	}
	return true;
}


function acceptY()
{
var invalid = " "; // Invalid character is a space
var minLength = 5; // Minimum length
var pw1 = document.forms[0].elements[3].value;
var pw2 = document.forms[0].elements[4].value;

// check for a value in both fields.
if (pw1 == '' || pw2 == '') {
alert('Please enter your password twice.');
return false;
}
// check for minimum length
if (document.forms[0].elements[3].value.length < minLength) {
alert('Your password must be at least ' + minLength + ' characters long. Try again.');
document.forms[0].elements[3].value="";
document.forms[0].elements[4].value="";
document.forms[0].elements[3].focus();
return false;
}
// check for spaces
if (document.forms[0].elements[3].value.indexOf(invalid) > -1) {
alert("Sorry, spaces are not allowed.");
document.forms[0].elements[3].value="";
document.forms[0].elements[4].value="";
document.forms[0].elements[3].focus();
return false;
}
else {
if (document.forms[0].elements[4].value.indexOf(invalid) > -1) {
alert("Sorry, spaces are not allowed.");
document.forms[0].elements[3].value="";
document.forms[0].elements[4].value="";
document.forms[0].elements[3].focus();
return false;
}

else {
if (pw1 != pw2) {
alert ("You did not enter the same password twice. Please re-enter your password.");
document.forms[0].elements[3].value="";
document.forms[0].elements[4].value="";
document.forms[0].elements[3].focus();
return false;
}
else {
return true;
      }
   }
}
}
//  End -->
</script>


<script type="text/javascript">
<!--  Begin
var bool="false";
var bool1="false";
function resetform()
{
document.forms[0].elements[1]=="";
}

function submitForms()
{
if (isName() && isSurname() &&isUsername() && isPassword() && isRpassword() && isEmail() && isAddress() && isTel() && isUserUnique() && isVno())
if (confirm("\n You are about to submit your registration form. \n\nPress Ok to submit. Cancel to abort."))
{
alert(document.forms[0].elements[1].value + " " + document.forms[0].elements[0].value +"\n\n\nYour Registration form has been sent successfully. \n\n\nThank you for joining our us!");
return true;
}
else
{
alert("You have chosen to abort the registration.");
return false;
}
else 
return false;
}


function acceptw()
{
if(event.keyCode>45 && event.keyCode<57)
{
event.returnValue=false
window.alert("Sorry ! You can only enter Words.")
}
else
{
if(event.which>45 && event.which<57)
{
event.returnValue=false
window.alert("Sorry ! You can only enter Words.")
}
}
}


function isName()
{
if (document.forms[0].elements[0].value == "")
{
alert ("The Name field is blank. Please enter your Name.")
document.forms[0].elements[0].focus();
return false;
}
return true;
}


function isSurname()
{
if (document.forms[0].elements[1].value == "")
{
alert ("The Surname field is blank. \n\nPlease enter your Surname.")
document.forms[0].elements[1].focus();
return false;
}
return true;
}


function isUsername()
{
if (document.forms[0].elements[2].value == "")
{
alert ("The Username field is blank. \n\nPlease enter your Username.")
document.forms[0].elements[2].focus();
return false;
}
return true;
}


function isPassword()
{
if (document.forms[0].elements[3].value == "")
{
alert ("The Password field is blank. \n\nPlease enter your Password.")
document.forms[0].elements[3].focus();
return false;
}
return true;
}


function isRpassword()
{
if (document.forms[0].elements[4].value == "")
{
alert ("The Re-Enter Password field is blank. \n\nPlease Re-Enter your Password.")
document.forms[0].elements[4].focus();
return false;
}
return true;
}


function isEmail()
{
ml = document.forms[0].elements[5].value;
if(ml == "")
{
alert("Email cannot be blank")
document.forms[0].elements[5].focus();
return false;                
}

else
{
if(ml.length<8)
{
alert("Email length cannot be less than 8 characters");
document.forms[0].elements[5].focus();
return false;  
}

if(ml.indexOf("@")==-1)
{
alert("The Email Address must contain '@' sign");
document.forms[0].elements[5].focus();
return false;  
}

pos1 = ml.indexOf("@")
if(pos1<1)
{
alert("Email address cannot start with '@' sign");
document.forms[0].elements[5].focus();
return false;  
}  

if(ml.indexOf(".")==-1)
{
alert("The Email Address must contain '.' sign");
document.forms[0].elements[5].focus();
return false;  
}

pos = ml.indexOf(" ")
if(pos!=-1)
{
alert("The Email Address cannot contain spaces");
document.forms[0].elements[5].focus();
return false;  
}

pos2 = (pos1+1)
server = ml.substring(pos2);

if(server.indexOf("@")!=-1)
{
alert("A valid Email must contain only one '@' sign");
document.forms[0].elements[5].focus();
return false;  
} 
if(server.indexOf(".")==0)
{
alert("There should some text between '@' and '.' sign");
document.forms[0].elements[5].focus();
return false;  
} 

server_pos = server.lastIndexOf(".")
reqtype = server.substring(server_pos+1)

if(reqtype=="")
{
alert("Email id should end with character(like .com,.net,.org)");
document.forms[0].elements[5].focus();
return false;  
}
 
type_end = reqtype.substring(reqtype.length-1)

if(type_end.toUpperCase()<"A" || type_end.toUpperCase()>"Z")
{
alert("Email id should not end with number or symbol");
document.forms[0].elements[5].focus();
return false;  
}
return true;
}
}


function isAddress()
{
if (document.forms[0].elements[6].value == "")
{
alert ("The Address field is blank. Please enter your address.")
document.forms[0].elements[6].focus();
return false;
}
return true;
}


function isTel()
{
T = document.forms[0].elements[7].value;
if(T == "")
{
alert("Telephone cannot be blank")
document.forms[0].elements[7].focus();
return false;                
}

else
{
if(T.length<10)
{
alert("Telephone Number must contain 10 Numeric Values");
document.forms[0].elements[7].focus();
return false;  
}

return true;
}
}
function isUserUnique()
{
	if(bool=="false")
		{
		alert("plzz enter valid username");
		document.forms[0].elements[2].focus();
		return false;
		}
	return true;
}
function isVno()
{
	if(bool1=="false")
	{
	alert("plzz enter vehicle no");
	document.forms[0].elements[6].focus();
	return false;
	}
return true;
}

//-----------------------------------------------------------------------------
			//                   Ajax code for unique username
var request;  
function myFunction()  
{  
var v=document.formRegister.Username.value;  
var url="in.jsp?val="+v;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request.readyState==4){  
//var val=request.responseText.toString();
var val =request.responseText;
	//document.getElementById('check').innerHTML=val;
	if(request.responseText.trim()=='available')
	 {
		document.getElementById('check').innerHTML=val;
		 document.getElementById('check1').innerHTML=" ";
		 bool="true";
	 }
	 else
		 {
		 document.getElementById('check1').innerHTML=val;
		 document.getElementById('check').innerHTML=" ";
		 bool="false";
		 }
}  
}  
//-----------------------------------------------------------------
  			//Ajax Code for Vehicle NO. check
//-------------------------------------------------------------
 															//
  var request1;												//
function myFunction1()  									//
{  															//
var v=document.formRegister.Vno.value;  					//
var url1="VnoCheck.jsp?val="+v;  							//
  															//
if(window.XMLHttpRequest){  								//
request1=new XMLHttpRequest();  							//
}  															//
else if(window.ActiveXObject){  							//
request1=new ActiveXObject("Microsoft.XMLHTTP");  			//
}  															//
  															//
try{  														//
request1.onreadystatechange=getInfo1;  						//
request1.open("GET",url1,true);  							//
request1.send();  											//
}catch(e){alert("Unable to connect to server");}  			//
}  															//
  															//
function getInfo1(){  										//
if(request1.readyState==4){  								//
var val1 =request1.responseText;							//
															//
	if(request1.responseText.trim()=='Already Exist')		//
	 {														//
															//
		 document.getElementById('Vnocheck').innerHTML=val1;//
		 bool1="false";										//
	 }														//
	 else
	 { 
		 bool1="true";//
		 document.getElementById('Vnocheck').innerHTML="";
	 }
}  															//
}  															//
	
// End -->
</script>



</head>
<body>
<center>

  <div class="demo">
    <div class="container">
        <form name="formRegister" method="post" action="Register" onSubmit="return submitForms()" "return checkPw(this)">
        <h1 align="center">Users Registration Form</h1>
              
                    <label>Name</label><b><input type="text"  name="Name" onkeypress="acceptw()"></b> <br><br> 
                
                   
                    <label>Surname</label> 
                    <b><input type="text"  name="Surname" onkeypress="acceptw()"></b><br><br>
                   
                    <label>Username</label>  
                    <b><input type="text" size="20" name="Username" onchange="spaceCheck()" onkeyup="myFunction()"></b> <span id="check" style="color:green"></span> <span id="check1" style="color:red" ></span> <br><br>
                 
                   
                     <label>  Password </label> 
                    <b><input type="password" maxlength="10" name="pw1" size="20"></b>  <br><br>
                 
                   
                    <label>Confirm Password </label> 
                    <b><input type="password" maxlength="10" name="pw2" onchange="acceptY()" size="20"></b> <br><br> 
                 
                   
                    <label>Email</label>  
                    <b><input type="text"  name="Email"></b>  <br><br>
                 
                
                    <label>Vehicle No</label> 
                    <b><input type="text" cols="" size="10" name="Vno" onchange="myFunction1()"></b> <span id="Vnocheck" style="color:red"></span> <br><br>
                 
                   
                    <label>Phone </label> 
                    <b><input name="Phone" type="text"  maxlength="10" minlength="10" ></b><br><br>

                <h1 style=" margin-top: 5px;"align="center">Security Quetions For Forget-Password </h1>
                <label>Question</label><input type="text" size="20" name="Q"><br><br>
                <label>Answer</label><input type="text" size="20" name="A"><br><br>
           </div>
        <div class="buttons">
           <input type="submit" value="Submit">
            <input type="reset" name="reset" value="Reset" onClick="return confirm('Are you sure you want to clear the current information?');">  
          </div>
        
      </form>
	  <p align="center"><a href="Login.jsp">Home Page</a></p>
    </div>
</center>
</body>
</html>