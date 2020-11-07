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
<script src='/stylethree/js/Designations.js'></script>
<jsp:include page='/MasterPageBottomSection.jsp' />