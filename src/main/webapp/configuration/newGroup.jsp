<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<%@include file="/include/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><bean:message key="BizComposer.Configuration.Networking.addGroup"/></title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

<script type="text/javascript">
	
$( document ).ready(function() {
	var totalCheckBoxes = $('input[type="checkbox"]').length;
	debugger;
	var checkboxesId = $('input[type="checkbox"]').attr("id");
	debugger;
	alert("Total checkBoxes arrived from database are:"+totalCheckBoxes);
	for(var i = 1 ; i < totalCheckBoxes; i++)
	{
		/* alert("checkbox"+i+"id is:"+checkboxesId); */
	}
});

	function addNewGroup()
	{
		//var totalCheckBoxes = $('input[type="checkbox"]').length;
		debugger
		var gName = $("#groupName").val();
		debugger
		//$('select[id="selecctedGroup"]').find('option').attr("selected",false);
		//var groupExist = $('select[id="selectedGroup"]').find('option[value="'+groupName+'"]').val();
		
		debugger
		var camelized = gName.toLowerCase().replace(/\b[a-z]/g, function(letter) {
		    return letter.toUpperCase();
		});

		$('select[id="selectedGroup"]').find('option[value="'+camelized+'"]').attr("selected",true);
		var groupExist = $("#selectedGroup option:selected").val();
		debugger

		if(gName == "")
		{
			alert("Group name can not be blank");	
		}
		else if(gName == groupExist || camelized == groupExist)
		{
			alert("Group Name is exists,Please Choose another name.");
		}
		 else
		{
			alert("Entered group name:"+gName)
		}
		$('select[id="selectedGroup"]').find('option[value="'+camelized+'"]').attr("selected",false);
	}

	function checkAll()
	{
		var isChecked = $('input[type="checkbox"]').prop("checked");
		if(isChecked == true)
		{
			$('input[type="checkbox"]').prop('checked',true);
		}
		else
		{
			$('input[type="checkbox"]').prop('checked',false);
		}
	}
	
	function checkInvocieModule()
	{
		var isChecked = $("#invoiceModule").prop("checked");
		if(isChecked == true)
		{
			$('#invoiceBoard').prop('checked',true);
			$('#estimationBoard').prop('checked',true);
			$('#invoice').prop('checked',true);
			$('#estimation').prop('checked',true);
			$('#items').prop('checked',true);
			$('#dataManager').prop('checked',true);
			$('#salesOrder').prop('checked',true);
			$('#salesOrderBoard').prop('checked',true);
		}
		else
		{
			$('#invoiceBoard').prop('checked',false);
			$('#estimationBoard').prop('checked',false);
			$('#invoice').prop('checked',false);
			$('#estimation').prop('checked',false);
			$('#items').prop('checked',false);
			$('#dataManager').prop('checked',false);
			$('#salesOrder').prop('checked',false);
			$('#salesOrderBoard').prop('checked',false);
		}
	}
		
	function ckeckPurchaseModule()
	{
		var isChecked = $("#purchaseModule").prop("checked");
		if(isChecked == true)
		{
			$('#poBoard').prop('checked',true);
			$('#purchaseOrder').prop('checked',true);
			$('#checkPOOrders').prop('checked',true);
			$('#receivedItems').prop('checked',true);
			$('#poBillBoard').prop('checked',true);
		}
		else
		{
			$('#poBoard').prop('checked',false);
			$('#purchaseOrder').prop('checked',false);
			$('#checkPOOrders').prop('checked',false);
			$('#receivedItems').prop('checked',false);
			$('#poBillBoard').prop('checked',false);
		}	
	}
	
	function checkEmployeeModule()
	{
		var isChecked = $("#employeeModule").prop("checked");
		if(isChecked == true)
		{
			$('#employee').prop('checked',true);
			$('#payRoll').prop('checked',true);
		}
		else
		{
			$('#employee').prop('checked',false);
			$('#payRoll').prop('checked',false);
		}	
	}
	
	function checkAccountModule()
	{
		var isChecked = $("#accountModule").prop("checked");
		if(isChecked == true)
		{
			$('#banking').prop('checked',true);
			$('#accountReceivable').prop('checked',true);
			$('#reconciliation').prop('checked',true);
			$('#categoryDetails').prop('checked',true);
			$('#categoryManager').prop('checked',true);
			$('#accountPayableModule').prop('checked',true);
			$('#payableList').prop('checked',true);
			$('#paidList').prop('checked',true);
			$('#billPayable').prop('checked',true);
			$('#vendorRMA').prop('checked',true);
			$('#poPayable').prop('checked',true);
		}
		else
		{
			$('#banking').prop('checked',false);
			$('#accountReceivable').prop('checked',false);
			$('#reconciliation').prop('checked',false);
			$('#categoryDetails').prop('checked',false);
			$('#categoryManager').prop('checked',false);
			$('#accountPayableModule').prop('checked',false);
			$('#payableList').prop('checked',false);
			$('#paidList').prop('checked',false);
			$('#billPayable').prop('checked',false);
			$('#vendorRMA').prop('checked',false);
			$('#poPayable').prop('checked',false);
		}	
	}
	
	function checkAllAccountPayable()
	{
		var isChecked = $("#accountPayableModule").prop("checked");
		if(isChecked == true)
		{
			$('#payableList').prop('checked',true);
			$('#paidList').prop('checked',true);
			$('#billPayable').prop('checked',true);
			$('#vendorRMA').prop('checked',true);
			$('#poPayable').prop('checked',true);
		}
		else
		{
			$('#payableList').prop('checked',false);
			$('#paidList').prop('checked',false);
			$('#billPayable').prop('checked',false);
			$('#vendorRMA').prop('checked',false);
			$('#poPayable').prop('checked',false);
		}
	}
	
	function closeWindow()
	{
		window.close();
	}
	
	function setHelp()
	{
		alert("Not yet supported");
	}
</script>
<body>
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post">
<div id="ddcolortabsline">&nbsp;</div>

	<div id="cos">

	<div class="statusquo ok">

	<div id="hoja">
	<div id="blanquito">
	<div id="padding">
	<div>
	<div id="table-negotiations">
	<table class="table-notifications" style="height:80%; width: 100%">
		<html:select property="selectedGroupId" styleId="selectedGroup" multiple="multiple" style="display:none;">
			<logic:present name="configurationForm" property="listOfExistingGroup"> 
				<logic:iterate name="configurationForm" id="objList1" property="listOfExistingGroup" scope="session">
					<option value="<bean:write name="objList1" property="groupName" />">
						<bean:write name="objList1" property="groupName" />
					</option>
				</logic:iterate>
			</logic:present> 
		</html:select>
		<tr>
			<th colspan="4" align="left">
				<b><bean:message key="BizComposer.Configuration.Networking.moduleAccessForGroup"/></b>
			</th>
		</tr>
		<tr>
			<td>
				<bean:message key="Bizcomposer.groupName"/>
			</td>
			<td>
				<input type="text" id="groupName">
			</td>
		</tr>
		<tr>
			<td>
				<bean:message key="BzComposer.datamanager.Description"/>
			</td>
			<td>
				<input type="text" id="description">
			</td>
		</tr>
		<tr>
			<th colspan="4" align="left">
				<b><bean:message key="BizComposer.Configuration.Networking.accessPermissions"/></b>
			</th>
		</tr>
		<!-- <tr>
			 <td>
				<input type="checkbox" id="allModules" class="allModules" name="allModules" onchange="checkAll()"><b>All Modules</b>
			</td>
		</tr>
		
		<tr>
		<td>
				&nbsp;&nbsp;<input type="checkbox" class="allModules" id="invoiceModule" name="invoiceModule" onChange="checkInvocieModule()"><b>Invoice Module</b>
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" class="allModules" id="invoiceBoard" name="invoiceBoard">Invoice Board
			</td>
			<td>
				<input type="checkbox" class="allModules" id="estimationBoard" name="estimationBoard">Estimation Board
			</td>
			<td>
				<input type="checkbox" class="allModules" id="invoice" name="invoice">Invoice 
			</td>
			<td>
				<input type="checkbox" class="allModules" id="estimation" name="estimation">Estimation
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="items" class="allModules" name="items">Items
			</td>
			<td>
				<input type="checkbox" class="allModules" id="dataManager" name="dataManager">Data Manager
			</td>
			<td>
				<input type="checkbox" class="allModules" id="salesOrder" name="salesOrder">Sales Order 
			</td>
			<td>
				<input type="checkbox" class="allModules" id="salesOrderBoard" name="salesOrderBoard">Sales Order Board
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;&nbsp;<input type="checkbox" id="purchaseModule" class="allModules" name="purchaseModule" onchange="ckeckPurchaseModule()"><b>Purchase Module</b>
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" class="allModules" id="poBoard" name="poBoard">P.O.Board
			</td>
			<td>
				<input type="checkbox" id="purchaseOrder" class="allModules" name="purchaseOrder">Purchase Order
			</td>
			<td>
				<input type="checkbox" id="checkPOOrders" class="allModules" name="checkPOOrders">Check PO Orders 
			</td>
			<td>
				<input type="checkbox" id="receivedItems" class="allModules" name="receivedItems">Received Items
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="poBillBoard" class="allModules" name="poBillBoard">P.O.Bill Board
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;&nbsp;<input type="checkbox" id="employeeModule" class="allModules" name="employeeModule" onchange="checkEmployeeModule()"><b>Employee Module</b>
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="employee" class="allModules" name="employee">Employee
			</td>
			<td>
				<input type="checkbox" id="payRoll" class="allModules" name="payRoll">Payroll
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;&nbsp;<input type="checkbox" id="accountModule" class="allModules" name="accountModule" onchange="checkAccountModule()"><b>Account Module</b>
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="banking" class="allModules" name="banking">Banking
			</td>
			<td>
				<input type="checkbox" id="accountReceivable" class="allModules" name="accountReceivable">Account Receivable
			</td>
			<td>
				<input type="checkbox" id="reconciliation" class="allModules" name="reconciliation">Reconciliation
			</td>
			<td>
				<input type="checkbox" id="categoryDetails" class="allModules" name="categoryDetails">Category Details
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="categoryManager" class="allModules" name="categoryManager">Category Manager
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="accountPayableModule" class="allModules" name="accountPayable" onchange="checkAllAccountPayable()"><b>Account Payable</b>
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="payableList" class="allModules" name="payableList">Payable List
			</td>
			<td>
				<input type="checkbox" id="paidList" class="allModules" name="paidList">Paid List
			</td>
			<td>
				<input type="checkbox" id="billPayable" class="allModules" name="billPayable">Bill Payable
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="vendorRMA" class="allModules" name="vendorRMA">Vendor RMA
			</td>
			<td>
				<input type="checkbox" id="poPayable" class="allModules" name="poPayable">P.O. Payable
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;<input type="checkbox" id="customerRMA" class="allModules" name="customerRMA"><b>Customer RMA</b>
			</td>
			<td>
				<input type="checkbox" id="billingModule" class="allModules" name="billingModule"><b>Billing Module</b>
			</td>
			<td>
				<input type="checkbox" id="eSalesModule" class="allModules" name="eSalesModule"><b>eSales Module</b>
			</td>
			<td>
				<input type="checkbox" id="listModule" class="allModules" name="listModule"><b>List Module</b>
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;<input type="checkbox" id="reportsModule" class="allModules" name="reportsModule"><b>Reports Module</b>
			</td>
			<td>
				<input type="checkbox" id="customerModule" class="allModules" name="customerModule"><b>Customer Module</b>
			</td>
			<td>
				<input type="checkbox" id="vendorModule" class="allModules" name="vendorModule"><b>Vendor Module</b>
			</td>
			<td>
				<input type="checkbox" id="configurationModule" class="allModules" name="configurationModule"><b>Configuration Module</b>
			</td>  -->
		<logic:present name="configurationForm" property="listOfExistingModule"> 
		<logic:iterate name="configurationForm" id="objList1" property="listOfExistingModule" scope="session">
		<tr>
			<td>
				<%-- <html:checkbox property="moduleName" styleId="<bean:write name='objList1' property='moduleName' />">
					<b><bean:write name='objList1' property='moduleName' /></b>
				</html:checkbox> --%>	
				<html:checkbox property="moduleName"  
					styleId="<bean:write name='objList1' property='moduleName' />">
					<b><bean:write name='objList1' property='moduleName' /></b>
				</html:checkbox>		
			</td>	
		</tr>
		</logic:iterate>
		</logic:present>
		<tr>
			<td colspan="4" align="right">
				<input type="button" class="formButton" value="Add Group" onclick="addNewGroup()">
				&nbsp;&nbsp;
				<input type="button" class="formButton" value="Cancel" onclick="closeWindow()">
				&nbsp;&nbsp;
				<input type="button" class="formButton" value="Help" onclick="setHelp()">
			</td>
		</tr>
	</table>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</html:form>
</body>
</html>