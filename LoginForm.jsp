<!DOCTYPE html>
<html lang='en'>
<head>
<title>HR Application</title>
<link rel='stylesheet' type='text/css' href='/styletwo/css/LoginStyle.css'>
</head>
<body>
<!-- Main container starts here  -->
<div class='main-container'>
<!-- Header starts here  -->
<div class='header'>
<a href='/styletwo/index.html'><img src='/styletwo/images/logo.png' class='logo'></a>
<div class='brand-name'>Thinking machines</div>
</div> <!-- Header ends here  -->
<!-- Login-section starts here  -->
<div class='login-section'>
<!-- script src='/styletwo/js/LoginForm.js'></script> -->
<script>
function validateForm(frm)
{
var username=frm.username.value.trim();
var usernameErrorSection=document.getElementById('usernameErrorSection');
usernameErrorSection.innerHTML='';
var password=frm.password.value.trim();
var passwordErrorSection=document.getElementById('passwordErrorSection');
if(username.length==0 && password.length==0)
{
usernameErrorSection.innerHTML='required';
passwordErrorSection.innerHTML='required';
frm.username.focus();
return false;
}
if(username.length==0)
{
usernameErrorSection.innerHTML='required';
frm.username.focus();
return false;
}
if(password.length==0)
{
passwordErrorSection.innerHTML='required';
frm.password.focus();
return false;
}
var valid=true;
var dataToSend="username="+encodeURI(username)+"&password="+encodeURI(password);
var xmlHttpRequest=new XMLHttpRequest();
xmlHttpRequest.onreadystatechange=function(){
if(this.readyState==4)
{
if(this.status==200)
{
var responseData=this.responseText.split(",");
if(responseData[0].localeCompare('error')==0)
{
for(var i=1;i<responseData.length;i+=2)
{
if(responseData[i].localeCompare('username')==0) usernameErrorSection.innerHTML=responseData[i+1];
if(responseData[i].localeCompare('password')==0) passwordErrorSection.innerHTML=responseData[i+1];
}
valid=false;
}
}
else
{
alert('some problem');
valid=false;
}
}
};
xmlHttpRequest.open('POST','login',true);
xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
xmlHttpRequest.send(dataToSend);
return valid;
}
</script>
<form action='/styletwo/index.jsp' onsubmit='return validateForm(this)'>
<table>
<tbody>
<tr>
<td></td>
</tr>
<tr>
<td>
Username
</td>
<td>
<input type='text' id='username' name='username' maxlength='15' size='16'>
<span id='usernameErrorSection' class='error'></span>
</td>
</tr>
<tr>
<td>
Password
</td>
<td>
<input type='password' id='password' name='password' maxlength='15' size='16'>
<span id='passwordErrorSection' class='error'></span>
</td>
</tr>
<tr>
<td></td>
<td>
<button type='submit'>Login</button>
</td>
</tr>
</tbody>
</table>
</form>
</div> <!-- Login-section ends here  -->
<!-- Footer starts here  -->
<div class='footer'>
&copy; Thinking Machines 2020
</div> <!-- Footer ends here  -->
</div> <!-- Main container ends here  -->
</body>
</html>
