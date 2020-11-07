<h2 id='pageTitle'></h2>
<table>
<tbody>
<tr>
<td><span id='description'></span><b id='boldDescription'>${title}</b></td>
<td>
<input type='hidden' id='code' name='code' value='${code}'>
<input type='text' id='title' name='title' maxlength='35' size='36' value='${title}'>
<span id='titleErrorSection' class='error'></span>
</td>
</tr>
<tr>
<td id='extraCell'></td>
<td>
<button type='Button' id='primaryButton' onclick='primaryButtonAction()'></button>
<button type='Button' onclick='secondaryButtonAction()' id='secondaryButton'></button>
</td>
</tr>
</tbody>
</table>
<form action='/stylethree/DesignationAddForm.jsp' type='submit' id='primaryButtonForm'>
</form>
<form action='/stylethree/Designations.jsp' type='submit' id='secondaryButtonForm'>
</form>
