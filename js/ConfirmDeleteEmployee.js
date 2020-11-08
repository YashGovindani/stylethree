var descriptionRow;
var buttonsRow;
var primaryButton;
var secondaryButton;
function getEmployeeDetails()
{
var xmlHttpRequest=new XMLHttpRequest();
xmlHttpRequest.onreadystatechange=function(){
if(this.readyState==4)
{
if(this.status==200)
{
var responseData=this.responseText;
var employeeDetails=responseData.split(",");
if(employeeDetails[0].localeCompare('invalid')==0) secondaryButtonAction();
document.getElementById('boldName').innerHTML=employeeDetails[1];
document.getElementById('boldDesignation').innerHTML=employeeDetails[9];
document.getElementById('boldDateOfBirth').innerHTML=employeeDetails[3];
document.getElementById('boldGender').innerHTML=employeeDetails[4];
if(employeeDetails[5].localeCompare('true')==0) document.getElementById('boldIsIndian').innerHTML='Yes';
else document.getElementById('boldIsIndian').innerHTML='No';
document.getElementById('boldBasicSalary').innerHTML=employeeDetails[6];
document.getElementById('boldPANNumber').innerHTML=employeeDetails[7];
document.getElementById('boldAadharCardNumber').innerHTML=employeeDetails[8];
document.getElementById('boldEmployeeId').innerHTML=employeeDetails[0];
}
else
{
alert('some problem in details');
}
}
};
xmlHttpRequest.open('POST','employeeDetails',true);
var id=new URLSearchParams(window.location.search).get('id');
var dataToSend='employeeId='+encodeURI(id);
xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
xmlHttpRequest.send(dataToSend);
}
function primaryButtonAction()
{
var xmlHttpRequest=new XMLHttpRequest();
xmlHttpRequest.onreadystatechange=function(){
if(this.readyState==4)
{
if(this.status==200)
{
var responseData=this.responseText.split(',');
if(responseData[0].localeCompare('error')==0)
{
for(var i=1;i<responseData.length;i+=2)
{
var errorType=responseData[i];
var errorMessage=responseData[i+1];
document.getElementById(errorType+'ErrorSection').innerHTML=errorMessage;
if(i==1) document.getElementById(errorType).focus();
}
return;
}
else
{
var employeeFormTable=document.getElementById('employeeFormTable');
var employeeFormTableBody=employeeFormTable.getElementsByTagName('tbody')[0];
document.getElementById('employeeIdRow').remove();
document.getElementById('nameRow').remove();
document.getElementById('designationRow').remove();
document.getElementById('dateOfBirthRow').remove();
document.getElementById('genderRow').remove();
document.getElementById('isIndianRow').remove();
document.getElementById('basicSalaryRow').remove();
document.getElementById('panNumberRow').remove();
document.getElementById('aadharCardNumberRow').remove();
document.getElementById('description').innerHTML='Employee deleted.';
primaryButton=document.getElementById('primaryButton').remove();
document.getElementById('secondaryButton').innerHTML='Ok';
}
}
else
{
alert('some problem');
}
}
};
xmlHttpRequest.open('POST','deleteEmployee',true);
xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
var dataToSend="";
dataToSend+="employeeId="+encodeURI(document.getElementById('boldEmployeeId').innerHTML);
xmlHttpRequest.send(dataToSend);
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
getEmployeeDetails();
document.getElementById('description').innerHTML='Confirm delete employee with following details :-';
primaryButton=document.getElementById('primaryButton');
secondaryButton=document.getElementById('secondaryButton');
document.getElementById('name').remove();
document.getElementById('designation').remove();
document.getElementById('dateOfBirth').remove();
document.getElementById('maleText').remove();
document.getElementById('male').remove();
document.getElementById('femaleText').remove();
document.getElementById('female').remove();
document.getElementById('genderSpace').remove();
document.getElementById('isIndian').remove();
document.getElementById('basicSalary').remove();
document.getElementById('panNumber').remove();
document.getElementById('aadharCardNumber').remove();
document.getElementById('extraCell').remove();
document.getElementById('pageTitle').innerHTML='Employee (Delete Module)';
buttonsRow=document.getElementById('buttonsRow');
primaryButton.innerHTML='Delete';
secondaryButton.innerHTML='Cancel';
}
window.addEventListener('load',createForm);
