function guard()
{
var xmlHttpRequest=new XMLHttpRequest();
xmlHttpRequest.onreadystatechange=function(){
if(this.readyState==4)
{
if(this.status==200)
{
var responseData=this.responseText;
if(responseData.localeCompare("fail")==0) document.getElementById('logoutForm').submit();
else
{
document.getElementById('username').innerHTML=responseData;
}
}
else
{
alert('some problem');
}
}
};
xmlHttpRequest.open('POST','guard',true);
xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
xmlHttpRequest.send("");
}
function logout()
{
var xmlHttpRequest=new XMLHttpRequest();
xmlHttpRequest.onreadystatechange=function(){
if(this.readyState==4)
{
if(this.status==200) document.getElementById('logoutForm').submit();
else alert('some problem');
}
};
xmlHttpRequest.open('POST','logout',true);
xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
xmlHttpRequest.send("");
}
window.addEventListener('load',guard);
