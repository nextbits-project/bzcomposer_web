
<ROOT>
<html:form action="Item.do" method="post" >
	<table class="tabla-listados" cellspacing="0">
		<tr>
			<td><bean:message key="BzComposer.Item.SubtotalName" /></td>
		</tr>
		<tr>
			<td><html:text property="itemCode" /></td>
		</tr>
		<tr>
			<td><bean:message key="BzComposer.Item.Description" /></td>
		</tr>
		<tr>
			<td><html:text property="itemName" /></td>
		</tr>
	</table>
</html:form>
</ROOT>
