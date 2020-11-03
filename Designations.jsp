<jsp:include page='/MasterPageTopSection.jsp' />
<!-- left-panel starts here  -->
<div class='content-left-panel' id='content-left-panel' module='DESIGNATION'>
<jsp:include page='/MasterPageLeftPanel.jsp' />
<!-- left-panel ends here  -->
<!-- right-panel starts here  -->
<div class='content-right-panel'>
<h2>Designation</h2><br>
<table border='1' id='designationsGridTable'>
<thead>
<tr>
<th colspan='4' style='text-align:right;padding:5px'>
<a href='/stylethree/DesignationAddForm.jsp'>Add new Designation</a>
</th>
</tr>
<tr>
<th style='width:60px;text-align:center'>S.No.</th>
<th style='width:200px;text-align:center'>Designation</th>
<th style='width:100px;text-align:center'>Edit</th>
<th style='width:100px;text-align:center'>Delete</th>
</tr>
</thead>
<tbody>
<tr>
<td style='text-align:right' placeHolderId='serialNumber'></td>
<td placeHolderId='designation'></td>
<td style='text-align:center' placeHolderId='editOption'></td>
<td style='text-align:center' placeHolderId='deleteOption'></td>
</tr>
</tbody>
</table>
<script>
function populateDesignations()
{
var designationsGridTable=document.getElementById("designationsGridTable");
var designationsGridTableBody=designationsGridTable.getElementsByTagName("tbody")[0];
var designationsGridTableBodyRowTemplate=designationsGridTableBody.getElementsByTagName("tr")[0];
designationsGridTableBodyRowTemplate.remove();
var designationsGridTableBodyColumnsTemplateCollection=designationsGridTableBodyRowTemplate.getElementsByTagName("td");
var cellTemplate;
var k;
var dynamicRow;
var dynamicRowCells;
var placeHolderFor;

var xmlHttpRequest=new XMLHttpRequest();
xmlHttpRequest.onreadystatechange=function(){
if(this.readyState==4)
{
if(this.status==200)
{
var responseData=this.responseText;
var splits=responseData.split(",");
for(var i=0,k=1;i<splits.length;i+=2,k+=1)
{
dynamicRow=designationsGridTableBodyRowTemplate.cloneNode(true);
designationsGridTableBody.appendChild(dynamicRow);
dynamicRowCells=dynamicRow.getElementsByTagName("td");
for(var j=0;j<dynamicRowCells.length;++j)
{
cellTemplate=dynamicRowCells[j];
placeHolderFor=cellTemplate.getAttribute("placeHolderId");
if(placeHolderFor==null) continue;
if(placeHolderFor=="serialNumber") cellTemplate.innerHTML=k+".";
if(placeHolderFor=="designation") cellTemplate.innerHTML=splits[i+1];
if(placeHolderFor=="editOption") cellTemplate.innerHTML="<a href='/stylethree/editDesignation?id="+splits[i]+"'>Edit</a>";
if(placeHolderFor=="deleteOption") cellTemplate.innerHTML="<a href='/stylethree/confirmDeleteDesignation?id="+splits[i]+"'>Delete</a>";
}
}
}
else
{
alert('some problem');
}
}
};
xmlHttpRequest.open('GET','designations',true);
xmlHttpRequest.send();
}
window.addEventListener('load',populateDesignations);
</script>
<jsp:include page='/MasterPageBottomSection.jsp' />