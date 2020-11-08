<h2 id='pageTitle'></h2>
<input type='hidden' id='employeeId' value='${employeeId}'>
<table id='employeeFormTable'>
<tbody>
<tr id='descriptionRow'>
<td colspan="2" id='description'></td>
</tr>
<tr id='employeeIdRow'>
<td >Employee Id.</td>
<td>
<b id='boldEmployeeId'>${employeeId}</b>
</td>
</tr>
<tr id='nameRow'>
<td>Name</td>
<td>
<input type='text' id='name' name='name' maxlength='50' size='51' value='${name}'>
<b id='boldName'>${Name}</b>
<span id='nameErrorSection' class='error'></span>
</td>
</tr>
<tr id='designationRow'>
<td>Designation</td>
<td>
<select id='designation' name='designationCode'>
<option value='-1'>&lt;Select Designation&gt;</option>
</select>
<b id='boldDesignation'>${designation}</b>
<span id='designationErrorSection' class='error'></span>
</td>
</tr>
<tr id='dateOfBirthRow'>
<td>Date of birth</td>
<td>
<input type='date' id='dateOfBirth' name='dateOfBirth' value='${dateOfBirth}'>
<b id='boldDateOfBirth'>${dateOfBirth}</b>
<span id='dateOfBirthErrorSection' class='error'></span>
</td>
</tr>
<tr id='genderRow'>
<td>Gender</td>
<td>
<input type='radio' id='male' name='gender' value='Male'>
<span id='maleText'>Male</span>
<span id='genderSpace'>&nbsp;&nbsp;&nbsp;&nbsp;</span>
<input type='radio' id='female' name='gender' value='Female'>
<span id='femaleText'>Female</span>
<b id='boldGender'>${gender}</b>
<span id='genderErrorSection' class='error'></span>
</td>
</tr>
<tr id='isIndianRow'>
<td>Indian ?</td>
<td>
<input type='checkbox' name='isIndian' id='isIndian' value='${isIndian}'>
<b id='boldIsIndian'>${isIndian}</b>
</td>
</tr>
<tr id='basicSalaryRow'>
<td>Basic Salary</td>
<td>
<input type='text'style='text-align:right' name='basicSalary' id='basicSalary' maxlength='13' size='13' value='${basicSalary}'>
<b id='boldBasicSalary'>${basicSalary}</b>
<span id='basicSalaryErrorSection' class='error'></span>
</td>
</tr>
<tr id='panNumberRow'>
<td>PAN Number</td>
<td>
<input type='text' id='panNumber' name='panNumber' maxlength='15' size='16' value='${panNumber}'>
<b id='boldPANNumber'>${panNumber}</b>
<span id='panNumberErrorSection' class='error'></span>
</td>
</tr>
<tr id='aadharCardNumberRow'>
<td>Aadhar Card Number</td>
<td>
<input type='text' id='aadharCardNumber' name='aadharCardNumber' maxlength='15' size='16' value='${aadharCardNumber}'>
<b id='boldAadharCardNumber'>${aadharCardNumber}</b>
<span id='aadharCardNumberErrorSection' class='error'></span>
</td>
</tr>
<tr id='buttonsRow'>
<td id='extraCell'></td>
<td><button type='Button' id='primaryButton' onclick='primaryButtonAction()'></button>
<button type='Button' id='secondaryButton' onclick='secondaryButtonAction()'></button>
</td>
</tr>
</tbody>
</table>
<form action='/stylethree/EmployeeAddForm.jsp' type='submit' id='primaryButtonForm'>
</form>
<form action='/stylethree/Employees.jsp' type='submit' id='secondaryButtonForm'>
</form>
