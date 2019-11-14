<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Payment</title>
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


<script type="text/javascript">
<!--  Begin

function resetform()
{
document.forms[0].elements[1]=="";
}

function submitForms()
{
if (isName() &&  isPassword() && isCard() && isCVV() )
if (confirm("\n You Are About Payment Thorugh Credit Card \n\nPress Ok to Confirm. Cancel to abort."))
{
return true;
}
else
{
alert("You have chosen to abort the Payment");
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




function isPassword()
{
if (document.forms[0].elements[1].value == "")
{
alert ("The Password field is blank. \n\nPlease enter your Password.")
document.forms[0].elements[1].focus();
return false;
}
return true;
}


						function isCard()
						{
						T = document.forms[0].elements[2].value;
						if(T == "")
						{
						alert("Credit Card cannot be blank")
						document.forms[0].elements[2].focus();
						return false;                
						}

						else
						{
						if(T == 0)
						{
						alert("Credit Card cannot be less or equal to zero");
						document.forms[0].elements[2].focus();
						return false;  
						}

						else
						{
						if(T.length<14)
						{
						alert("Credit Card Number must be 14 digits");
						document.forms[0].elements[2].focus();
						return false;  
						}

						else
						{
						if(T.indexOf(".")==1)
						{
						alert("Credit Card cannot contain dot sign");
						document.forms[0].elements[2].focus();
						return false;  
						}

						return true;
						}
						}
						}
						}


function isCVV()
{
if (document.forms[0].elements[3].value == "")
{
alert ("The cvv field is blank. \n\nPlease enter CVV")
document.forms[0].elements[3].focus();
return false;
}
return true;
}


// End -->
</script>



</head>
<body>
<center>

  <div class="demo">
    <div class="container">
        <form name="formRegister" method="post" action="PaymentProcess" onSubmit="return submitForms()">
        <h1 align="center">Payment Gateway</h1>
              
                    <label>Name On Card</label><b><input type="text"  name="Name" onkeypress="acceptw()"></b> <br><br> 
                
                   
                   
                     <label>  Password </label> 
                    <b><input type="password" maxlength="10" name="pass" size="20"></b>  <br><br>
                 
                   
                    <label>Credit Card No.</label> 
                    <b><input name="cno" type="text"  maxlength="14" minlength="14" ></b><br><br>

                    <label>CVV</label> 
                    <b><input name="cvv" type="text"  maxlength="4" minlength="3" ></b><br><br>
           </div>
        <div class="buttons">
           <input type="submit" value="Submit">
            <input type="reset" name="reset" value="Reset" onClick="return confirm('Are you sure you want to clear the current information?');">  
          </div>
        
      </form>
	  
    </div>
</center>
</body>
</html>