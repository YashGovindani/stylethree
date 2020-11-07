var title;
function primaryButtonAction()
{
title=document.getElementById('title').value.trim();
var titleErrorSection=document.getElementById('titleErrorSection');
titleErrorSection.innerHTML='';
if(title.length==0)
{
titleErrorSection.innerHTML='required';
document.getElementById('title').focus();
}
var xmlHttpRequest=new XMLHttpRequest();
xmlHttpRequest.onreadystatechange=function(){
if(this.readyState==4)
{
if(this.status==200)
{
var responseData=this.responseText.split(',');
if(responseData[0].localeCompare('error')==0)
{
titleErrorSection.innerHTML=responseData[1];
return;
}
else
{
document.getElementById('description').innerHTML='Designation added. Want to add more ?';
document.getElementById('title').remove();
var primaryButton=document.getElementById('primaryButton');
primaryButton.innerHTML='Yes';
primaryButton.setAttribute('onclick','primaryButtonSecondaryAction()');
document.getElementById('secondaryButton').innerHTML='No';
document.getElementById('extraCell').remove();
}
}
else
{
alert('some problem');
}
}
};
xmlHttpRequest.open('POST','addDesignation',true);
xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
xmlHttpRequest.send("title="+encodeURI(title));
}
function primaryButtonSecondaryAction()
{
document.getElementById('primaryButtonForm').submit();
}
function secondaryButtonAction()
{
document.getElementById('secondaryButtonForm').submit();
}
function createForm()
{
document.getElementById('description').innerHTML='Designation';
document.getElementById('primaryButton').innerHTML='Add';
document.getElementById('secondaryButton').innerHTML='Cancel';
document.getElementById('title').setAttribute('value','');
document.getElementById('boldDescription').remove();
document.getElementById('pageTitle').innerHTML='Designation (Add Module)';
}
window.addEventListener('load',createForm);

