<!DOCTYPE html>
<html lang='en'>
<head>
<title>HR Application</title>
<link rel='stylesheet' type='text/css' href='/stylethree/css/LoginStyle.css'>
</head>
<body>
<!-- Main container starts here  -->
<div class='main-container'>
<!-- Header starts here  -->
<div class='header'>
<a href='/stylethree/index.html'><img src='/stylethree/images/logo.png' class='logo'></a>
<div class='brand-name'>Thinking machines</div>
</div> <!-- Header ends here  -->
<!-- Login-section starts here  -->
<div class='login-section'>
<script src='/stylethree/js/LoginForm.js'></script>
<form action='/stylethree/index.jsp' id='onSuccess'></form>
<table>
<tbody>
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
<button type='Button' onclick='validateForm()'>Login</button>
</td>
</tr>
</tbody>
</table>
</div> <!-- Login-section ends here  -->
<!-- Footer starts here  -->
<div class='footer'>
&copy; Thinking Machines 2020
</div> <!-- Footer ends here  -->
</div> <!-- Main container ends here  -->
</body>
</html>
