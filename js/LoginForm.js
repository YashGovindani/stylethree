function validateForm()
{
var username=document.getElementById('username').value.trim();
var usernameErrorSection=document.getElementById('usernameErrorSection');
usernameErrorSection.innerHTML='';
var password=document.getElementById('password').value.trim();
var passwordErrorSection=document.getElementById('passwordErrorSection');
passwordErrorSection.innerHTML='';
if(username.length==0 && password.length==0)
{
usernameErrorSection.innerHTML='required';
passwordErrorSection.innerHTML='required';
document.getElementById('username').focus();
return;
}
if(username.length==0)
{
usernameErrorSection.innerHTML='required';
document.getElementById('username').focus();
return;
}
if(password.length==0)
{
passwordErrorSection.innerHTML='required';
document.getElementById('password').focus();
return;
}
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
if(responseData[1].localeCompare('username')==0) usernameErrorSection.innerHTML=responseData[2];
if(responseData[1].localeCompare('password')==0) passwordErrorSection.innerHTML=responseData[2];
return;
}
document.getElementById('onSuccess').submit();
}
else
{
alert('some problem');
}
}
};
xmlHttpRequest.open('POST','login',true);
xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
xmlHttpRequest.send(dataToSend);
}
