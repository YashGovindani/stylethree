var title;
var code;
function primaryButtonAction()
{
title=document.getElementById('title').value.trim();
var titleErrorSection=document.getElementById('titleErrorSection');
titleErrorSection.innerHTML='';
if(title.length==0)
{
titleErrorSection.innerHTML='required';
title.focus();
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
document.getElementById('description').innerHTML='Designation updated.';
document.getElementById('title').remove();
document.getElementById('primaryButton').remove();
document.getElementById('secondaryButton').innerHTML='OK';
document.getElementById('extraCell').remove();
}
}
else
{
alert('some problem');
}
}
};
xmlHttpRequest.open('POST','updateDesignation',true);
xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
xmlHttpRequest.send("code="+encodeURI(document.getElementById('code').value.trim())+"&title="+encodeURI(title));
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
document.getElementById('primaryButton').innerHTML='Update';
document.getElementById('secondaryButton').innerHTML='Cancel';
document.getElementById('boldDescription').remove();
document.getElementById('pageTitle').innerHTML='Designation (Edit Module)';
}
window.addEventListener('load',createForm);
