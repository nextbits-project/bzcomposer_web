<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BizComposer.Configuration.Title" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script type="text/javascript">
$(function() {
    $( "#tabs" ).tabs();
  });
  
$('#img1').on('click', function() {  
	  window.print();  
	  return false; // why false?
	});

function testConnection()
{
	alert("Inside testConnection")
}
	function showTextBox()
	{
		if(document.getElementById('invoiceYes').checked)
		{
			document.getElementById('invoiceCopies').readOnly = false;
		}
		else
		{
			document.getElementById('invoiceCopies').readOnly = true;
		}
	}
	
	function showTextBox1()
	{
		if(document.getElementById('salesSlipYes').checked)
		{
			document.getElementById('salesCopies').readOnly = false;
		}
		else
		{
			document.getElementById('salesCopies').readOnly = true;
		}
	}
	
	function showTextBox2()
	{
		if(document.getElementById('labelYes').checked)
		{
			document.getElementById('labelCopies').readOnly = false;
		}
		else
		{
			document.getElementById('labelCopies').readOnly = true;
		}
	}
	
	function showTextBox3()
	{
		if(document.getElementById('reportYes').checked)
		{
			document.getElementById('reportCopies').readOnly = false;
		}
		else
		{
			document.getElementById('reportCopies').readOnly = true;
		}
	}
	
	function showTextBox4()
	{
		if(document.getElementById('eSalesYes').checked)
		{
			document.getElementById('eSalesCopies').readOnly = false;
		}
		else
		{
			document.getElementById('eSalesCopies').readOnly = true;
		}
	}
	
	function showTextBox5()
	{
		if(document.getElementById('purchaseYes').checked)
		{
			document.getElementById('purchaseCopies').readOnly = false;
		}
		else
		{
			document.getElementById('purchaseCopies').readOnly = true;
		}
	}
	
	function showTextBox6()
	{
		if(document.getElementById('checkYes').checked)
		{
			document.getElementById('checkCopies').readOnly = false;
		}
		else
		{
			document.getElementById('checkCopies').readOnly = true;
		}
	}
	
	$(function () {
	$("#defaultPrinter").on('change',function(){
		debugger
		var val = $("#defaultPrinter option:selected").val();
		debugger
		alert("Selected value:"+val);
		if(val == 1)
		{
			debugger
			$('select[name="invoicePrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="labelPrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="eSalesPrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="salesSlipPrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="reportListPrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="purchasePrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="checkPrinter"]').find('option[value="'+val+'"]').attr("selected",true);
		}
		else if(val == 0)
		{
			debugger
			$('select[name="invoicePrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="labelPrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="eSalesPrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="salesSlipPrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="reportListPrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="purchasePrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="checkPrinter"]').find('option[value="'+val+'"]').attr("selected",true);
		}
		else
		{
			debugger
			$('select[name="invoicePrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="labelPrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="eSalesPrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="salesSlipPrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="reportListPrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="purchasePrinter"]').find('option[value="'+val+'"]').attr("selected",true);
			$('select[name="checkPrinter"]').find('option[value="'+val+'"]').attr("selected",true);
		}
		});
	
	
	});
	
</script>
<script type="text/javascript">

function test()
{
	 alert("inside test")
}

function CheckEmailConnection()
{
	 debugger
	if (oEmail.readyState != 4 || oEmail.status != 200) { 
	  	return;
	}
	response = parseInt(trim(oEmail.responseText));
	debugger
	if(response == 1)
	{
		debugger
		alert('<bean:message key="BizComposer.Configuration.smtp.ConnectionSuceessfullyMessage" />');
		document.configurationForm.mailAuth.disabled=false;    		
		EnableDisableFields();
	}
	else
	{
		debugger
		alert('<bean:message key="BizComposer.Configuration.smtp.ConnectionFailedMessage" />');
		document.configurationForm.mailAuth.disabled=true;
		EnableDisableFields();
	}
}

function EnableDisableFields(){
	if(document.configurationForm.mailAuth.checked==true){
		document.configurationForm.mailUserName.disabled=true;
		document.configurationForm.mailPassword.disabled=true;
	}
	else{
		document.configurationForm.mailUserName.disabled=false;
		document.configurationForm.mailPassword.disabled=false;
	}
}

function TestConnection()
{
	debugger
	d = new Date();
	debugger
	var host = document.configurationForm.mailServer.value;
	debugger
	oEmail = c(CheckEmailConnection);
	debugger
	oGET(oEmail,'<bean:write name="path" property="pathvalue"/>/include/testMailServerConnection.jsp?HostName='+host+'&Date='+d);
	debugger
}

var funsequence = 0;
var _1 = navigator.userAgent.toLowerCase();
var ___ = (_1.indexOf("msie") != -1);
var ___5 = (_1.indexOf("msie 5") != -1);
var _io = (_1.indexOf("opera") != -1);
var _im = (_1.indexOf("mac") != -1);
var ____gi = (_1.indexOf("gecko") != -1);
var i____s = (_1.indexOf("safari") != -1);
var o = null;
var o22 = null;
var o33 = null;
var oEmail = null;
var oT = null;
var nm="";
var r = null;

function c(r) {

  if (___) {
	var t = (___5) ? "Microsoft.XMLHTTP" : "Msxml2.XMLHTTP";
    try {
	  o = new ActiveXObject(t);
      o.onreadystatechange = r;
	} catch (ex) {
      alert("<bean:message key='BzComposer.common.needToEnableActiveXObject'/> ts.." + ex);
	}
  } else {
	o = new XMLHttpRequest();
    o.onload = r;
	o.onerror = r;
  }
  return o;
}
function oGET(oo, url) {
  try {
	oo.open("GET", url, true);	
    oo.send(null);
  } catch (ex) {
		}
}

function trim(inputString) {
	   // Removes the spaces  return from the passed string. 
	   var retValue = inputString;
	   var ch = retValue.substring(0, 1);
	   while (ch == "\n" || ch == "\r" || ch==" " || ch=="\t" ) { 
 	  retValue = retValue.substring(1, retValue.length);
	      ch = retValue.substring(0, 1);
	   }
	   return retValue; 
	}
	
function IsExist(){
	flag=0;
	var name = document.getElementById('sname').value;
	for(cnt=0;cnt<servicename.length;cnt++){
		if(servicename[cnt] == name){
			alert('<bean:message key="BizComposer.Configuration.ManageServiceType.AddServiceType.validation"/>');
			document.getElementById('sname').focus();
			flag=1;
			break;
		}
	}
	return flag;
}

function AddServiceType(){
	var name = trim(document.getElementById('sname').value);
	if(name==""){
		alert('<bean:message key="BizComposer.Configuration.ManageServiceType.ServiceNameBlank.validation"/>');
		document.getElementById('sname').focus();
	}
	else{
		if(IsExist()==0){
			if(confirm('<bean:message key="BizComposer.Configuration.ManageServiceType.AddServiceTypeConfirm"/>')){
				invid = document.getElementById('sertype').value;
				AddService(name,invid);
			}
		}
	}
}

function AddService(name,invid){
	d = new Date();
	oT = c(SelectService);
	oGET(oT,'<bean:write name="path" property="pathvalue"/>/include/'+
					'manageServiceType.jsp?action=Add&SName='+name+'&InvStyleId='+invid+'&Date='+d);
	nm = name;
}

function SelectService(){
	if (oT.readyState != 4 || oT.status != 200) { 
	  return;
	}
	var res = trim(oT.responseText);
	getRecords(res);	
}

function getRecords(res){
	var records=res.split("!!");
	var index=0;
	var sid = 0;
	size=0;
	var slist="";
	if(index< records.length){
		slist = records[index];
		index++;
		size = records[index];
		index++;
		document.getElementById("ServiceTable").innerHTML = "";
        document.getElementById("ServiceTable").innerHTML = records[index];
        
    }
    var list = slist.split("/*/");
    cnt=0;
    for(index = 0;index < size;index++){
    	if(cnt<list.length){
    		serids[index] = list[cnt];
    		cnt++;
    		servicename[index] = list[cnt];
    		cnt++;
    	}	    	
    }
}

function EditServiceType(){
	var name = trim(document.getElementById('sname').value);
	if(name==""){
		alert('<bean:message key="BizComposer.Configuration.ManageServiceType.ServiceNameBlank.validation"/>');
		document.getElementById('sname').focus();
	}
	else{
		if(IsExist()==0){
			if(servid==0){
				alert('<bean:message key="BizComposer.Configuration.ManageServiceType.SelectServiceToEdit.validation"/>');
			}
			else{
				if(confirm('<bean:message key="BizComposer.Configuration.ManageServiceTypeEditServiceTypeConfirm"/>')){
					invid = document.getElementById('sertype').value;
					EditService(servid,name,invid);
					servid=0;
				}
			}
		}
	}
}

function SelectEditService(){
	if (oT.readyState != 4 || oT.status != 200) { 
	  return;
	}
    var res = trim(oT.responseText);
	getRecords(res);
}


function EditService(servid,name,invid){
	d = new Date();
	oT = c(SelectEditService);
	oGET(oT,'<bean:write name="path" property="pathvalue"/>/include/'+
					'manageServiceType.jsp?action=Edit&SName='+name+'&InvStyleId='+invid+'&ServiceID='+servid+'&Date='+d);
}


function DeleteServiceType(){
	if(servid==0){
		alert('<bean:message key="BizComposer.Configuration.ManageServiceType.SelectServiceToDelete.validation"/>');
	}
	else{
		if(confirm('<bean:message key="BizComposer.Configuration.ManageServiceTypeDeleteServiceTypeConfirm"/>')){
			DeleteService(servid);
			servid=0;
		}
	}
} 

function SelectDeleteService(){
	if (oT.readyState != 4 || oT.status != 200) { 
	  return;
	}
    var res = trim(oT.responseText);
	getRecords(res);
 	document.getElementById('sname').value="";
	document.getElementById('sertype').value="0";
}

function DeleteService(servid){
	d = new Date();
	oT = c(SelectDeleteService);
	oGET(oT,'<bean:write name="path" property="pathvalue"/>/include/'+
					'manageServiceType.jsp?action=Delete&ServiceID='+servid+'&Date='+d);
}

function setServiceType(serviceid,servicenm,invstid,rid){
	size = document.getElementById('ssize').value;
	for(i=0;i<size;i++){
		var row = document.getElementById(i+"@@");
		row.className = '';
	}
	
	var rd = document.getElementById(rid);
	rd.className='draft';
	document.getElementById('sname').value=servicenm;
	document.getElementById('sertype').value=invstid;
	servid = serviceid;
}

function ClearServiceType(){
	document.getElementById('sname').value="";
	document.getElementById('sertype').value="0";
	
	size = document.getElementById('ssize').value;
	for(i=0;i<size;i++){
		var row = document.getElementById(i+"@@");
		row.className = '';
	}
	servid=0;
	document.getElementById('sname').focus();
	
}

</script>
</head>
<body onload="init4();">
<!-- begin shared/header -->
 <html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA"
	method="post">

	<div id="ddcolortabsline">&nbsp;</div>

	<div id="cos">

	<div class="statusquo ok">

	<div id="hoja">
	<div id="blanquito">
	<div id="padding">

	<div>
		<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<bean:message key="BzComposer.Confuguration"/>
		</span></div>
	<div>
	<div><logic:present name="Labels">
		<bean:size name="Labels" id="size" />
		<input type="hidden" name="lsize" id="lblsize"
			value='<bean:write name="size" />' />
		<logic:iterate name="Labels" id="lbl" indexId="index">
			<input type="hidden" id='<bean:write name="index" />lid'
				name='<bean:write name="index" />lidname'
				value='<bean:write name="lbl" property="value" />' />
			<input type="hidden" id='<bean:write name="index" />lname'
				name='<bean:write name="index" />lnm'
				value='<bean:write name="lbl" property="label" />' />
		</logic:iterate>
	</logic:present></div>
	<div id="table-negotiations">
	<table cellspacing="0"  style="width: 100%;overflow-y:scroll;" class="section-border">
		<tr>

			<td valign="top"  style="width: 20%;">
			<table>
				<tr>
					<td>

					<div id="table-negotiations"
						style="width: 185px;padding-left: 10px;overflow-y:auto;max-height: 497px;">
					<%@include file="testMenu4.jsp" %>
					</div>
					</td>
				</tr>
				<tr align="center">
					<td><input type="button" name="Revoke" class="formButton"
						onclick="RevokeValues();"
						value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
					<input type="button" name="Save" class="formButton"
						onclick="SaveValues();"
						value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
			</table>
			</td>

			<td valign="top" style="padding-top: 2%;padding-right: 4%;"><!-- General -->
				<!-- Printer Setup Starts -->
			 <div id="printerSetup" style="display:none;">
				<table class="table-notifications" width="100%">
					<tr>
						<th colspan="6" align="left"><bean:message key="Bizcomposer.systemDefaultPrinter" /></th>
					</tr>
					<tr>
						<td colspan="3" style="width:40px;">
							<bean:message key="Bizcomposer.setDefaultPrinter"/>
						</td>
						<td colspan="3" style="width:120px;">
							<select style="width:260px;display:block;" id="defaultPrinter" name="defaultPrinter">
								<option value="0">Not Set</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<option value="2">Fax</option>
							</select>
						</td>
					</tr>
					<tr>
						<th colspan="6" align="left"><bean:message key="Bizcomposer.processPrinterSetup" /></th>
					</tr>
					<tr>
						<td colspan="2" style="width:40px;">
							<bean:message key="Bizcomposer.invoicePrinter"/>
						</td>
						<td colspan="2">
							<select style="width:260px;" id="invoicePrinter" name="invoicePrinter">
								<option value="0">Not Set</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<option value="2">Fax</option>
							</select>
						</td>
						<td colspan="2" style="width:20px;" align="left">
							<img id="img1" name="img1" src='<bean:write name="path" scope="session" property="pathvalue"/>/images/Printer.png' style="display:block" onclick="print()"/>Test
						</td>
					</tr>
					<tr>
						<td colspan="2" style="width:40px;">
							<bean:message key="Bizcomposer.labelPrinter"/>
						</td>
						<td colspan="2">
							<select style="width:260px;" id="labelPrinter" name="labelPrinter">
								<option value="0">Not Set</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<option value="2">Fax</option>
							</select>
						</td>
						<td colspan="2" style="width:20px;" align="left">
							<img id="img1" src='<bean:write name="path" scope="session" property="pathvalue"/>/images/Printer.png' style="display:block" onclick="print()"/>Test
						</td>
					</tr>
					<tr>
						<td colspan="2" style="width:40px;">
							<bean:message key="Bizcomposer.eSalesPrinter"/>
						</td>
						<td colspan="2" style="width:120px;">
							<select style="width:260px;" id="eSalesPrinter" name="eSalesPrinter">
								<option value="0">Not Set</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<option value="2">Fax</option>
							</select>
						</td>
						<td colspan="2" style="width:20px;" align="left">
							<img id="img1" src='<bean:write name="path" scope="session" property="pathvalue"/>/images/Printer.png' style="display:block" onclick="print()"/>Test
						</td>
					</tr>
					<tr>
						<td colspan="2" style="width:40px;">
							<bean:message key="Bizcomposer.salesSlipPrinter"/>
						</td>
						<td colspan="2" style="width:120px;">
							<select style="width:260px;" id="salesSlipPrinter" name="salesSlipPrinter">
								<option value="0">Not Set</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<option value="2">Fax</option>
							</select>
						</td>
						<td colspan="2" style="width:20px;" align="left">
							<img id="img1" src='<bean:write name="path" scope="session" property="pathvalue"/>/images/Printer.png' style="display:block" onclick="print()"/>Test
						</td>
					</tr>
					<tr>
						<td colspan="2" style="width:40px;">
							<bean:message key="Bizcomposer.reportListPrinter"/>
						</td>
						<td colspan="2" style="width:120px;">
							<select style="width:260px;" id="reportListPrinter" name="reportListPrinter">
								<option value="0">Not Set</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<option value="2">Fax</option>
							</select>
						</td>
						<td colspan="2" style="width:20px;" align="left">
							<img id="img1" src='<bean:write name="path" scope="session" property="pathvalue"/>/images/Printer.png' style="display:block" onclick="print()"/>Test
						</td>
					</tr>
					<tr>
						<td colspan="2" style="width:40px;">
							<bean:message key="Bizcomposer.purchasePrinter"/>
						</td>
						<td colspan="2" style="width:120px;">
							<select style="width:260px;" id="purchasePrinter" name="purchasePrinter">
								<option value="0">Not Set</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<option value="2">Fax</option>
							</select>
						</td>
						<td colspan="2" style="width:20px;" align="left">
							<img id="img1" src='<bean:write name="path" scope="session" property="pathvalue"/>/images/Printer.png' style="display:block" onclick="print()"/>Test
						</td>
					</tr>
					<tr>
						<td colspan="2" style="width:40px;">
							<bean:message key="Bizcomposer.checkPrinter"/>
						</td>
						<td colspan="2" style="width:120px;">
							<select style="width:260px;" id="checkPrinter" name="checkPrinter">
								<option value="0">Not Set</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<option value="2">Fax</option>
							</select>
						</td>
						<td colspan="2" style="width:20px;" align="left">
							<img id="img1" src='<bean:write name="path" scope="session" property="pathvalue"/>/images/Printer.png' style="display:block" onclick="print()"/>Test
						</td>
					</tr>
					<tr>
						<th colspan="6" align="left"><bean:message key="Bizcomposer.advancedSetup" /></th>
					</tr>
					<tr>
						<td></td>
						<td>Yes/No</td>
						<td>No.Of Copies</td>
						<td></td>
						<td>Yes/No</td>
						<td>No.Of Copies</td>
					</tr>
					<tr>
						<td>Invoice</td>
						<td>
							<input type="radio" id="invoiceYes" name="invoice" value="Yes" onclick="showTextBox()">Yes&nbsp;&nbsp;
							<input type="radio" id="invoiceNo" name="invoice" value="No" onclick="showTextBox()" checked="checked">No
						</td>
						<td>
							<input type="text" id="invoiceCopies" name="invoiceCopies" value="1" readonly="readonly">
						</td>
						<td>Sales Slip</td>
						<td>
							<input type="radio" id="salesSlipYes" name="sales" value="Yes" onclick="showTextBox1()">Yes&nbsp;&nbsp;
							<input type="radio" id="salesSlipNo" name="sales" value="No" onclick="showTextBox1()" checked="checked">No
						</td>
						<td>
							<input type="text" id="salesCopies" name="salesCopies" value="1" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>Label</td>
						<td>
							<input type="radio" id="labelYes" name="label" value="Yes" onclick="showTextBox2()">Yes&nbsp;&nbsp;
							<input type="radio" id="labelNo" name="label" value="No" onclick="showTextBox2()" checked="checked">No
						</td>
						<td>
							<input type="text" id="labelCopies" name="labelCopies" value="1" readonly="readonly">
						</td>
						<td>Report/List</td>
						<td>
							<input type="radio" id="reportYes" name="report" value="Yes" onclick="showTextBox3()">Yes&nbsp;&nbsp;
							<input type="radio" id="reportNo" name="report" value="No" onclick="showTextBox3()" checked="checked">No
						</td>
						<td>
							<input type="text" id="reportCopies" name="reportCopies" value="1" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>eSales</td>
						<td>
							<input type="radio" id="eSalesYes" name="eSales" value="Yes" onclick="showTextBox4()">Yes&nbsp;&nbsp;
							<input type="radio" id="eSalesNo" name="eSales" value="No" onclick="showTextBox4()" checked="checked">No
						</td>
						<td>
							<input type="text" id="eSalesCopies" name="eSalesCopies" value="1" readonly="readonly">
						</td>
						<td>Purchase</td>
						<td>
							<input type="radio" id="purchaseYes" name="purchase" value="Yes" onclick="showTextBox5()">Yes&nbsp;&nbsp;
							<input type="radio" id="purchaseNo" name="purchase" value="No"onclick="showTextBox5()" checked="checked">No
						</td>
						<td>
							<input type="text" id="purchaseCopies" name="purchaseCopies" value="1" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>Check</td>
						<td>
							<input type="radio" id="checkYes" name="check" value="Yes" onclick="showTextBox6()">Yes&nbsp;&nbsp;
							<input type="radio" id="checkNo" name="check" value="No" onclick="showTextBox6()" checked="checked">No
						</td>
						<td>
							<input type="text" id="checkCopies" name="checkCopies" value="1" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td colspan="6" align="right">
							<input type="submit" id="save" name="save" value="save">
						</td>
					</tr>
				</table>
			</div> 
			<!-- Printer Setup Ends -->
			
			<!-- Dashboard Starts -->
		 <div id="dashboard" style="display:none;">
			<table class="table-notifications">
				<tr>
					<th align="left" colspan="2"><bean:message
						key="Bizcomposer.Dashboard.DefaultSettingText" /></th>
				</tr>
				<tr>
					<td align="left">
					<bean:message key="Bizcomposer.DefaultCustomSetting" />
					</td>
				</tr>
				<tr>
					<td align="left">
					<html:checkbox property="productTaxable">
						<bean:message
							key="Bizcomposer.purchase" />
					</html:checkbox>&nbsp;&nbsp;&nbsp;
					<html:checkbox property="productTaxable">
						<bean:message
							key="Bizcomposer.sales" />
					</html:checkbox>
					</td>
				</tr>
				<tr>
					<td align="left">
						<html:checkbox property="productTaxable">
						<bean:message
							key="Bizcomposer.invoice" />
						</html:checkbox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<html:checkbox property="productTaxable">
						<bean:message
							key="Bizcomposer.estimate" />
						</html:checkbox>
					</td>
				</tr>
			</table>
			</div>
			<!-- Dashboard Ends -->
			
			<!-- Performance Starts -->
			 <div id="perfomance">
			<table class="table-notifications" width="100%">
				<tr>
					<th align="left"><bean:message
						key="BizComposer.Configuration.Performance.PerformanceLevel" /></th>
				</tr>
				<tr>
					<td><html:radio property="performance" value="2000">
						<bean:message key="BizComposer.Configuration.Performance.High" />
					</html:radio></td>
				</tr>
				<tr>
					<td><html:radio property="performance" value="5000">
						<bean:message key="BizComposer.Configuration.Performance.Medium" />
					</html:radio></td>
				</tr>
				<tr>
					<td><html:radio property="performance" value="10000">
						<bean:message key="BizComposer.Configuration.Performance.Low" />
					</html:radio></td>
				</tr>
				<tr>
					<td><html:radio property="performance" value="1"
						onclick="CheckPerformance();">
						<bean:message
							key="BizComposer.Configuration.Performance.UserDefine" />
					</html:radio><html:text size="15" property="userDefinePerform" maxlength="15"
						onkeypress="return numbersonly(event,this.value);" /></td>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Performance.ExitProgramMsg" /></td>
				</tr>
			</table>
			</div>
			<!-- Performance Ends -->

			<!-- Manage Service Type Starts -->
			 <div id="servicetype">
			<table class="table-notifications">
				<tr>
					<th align="left" colspan="2"><bean:message
						key="BizComposer.Configuration.ManageServiceType.Title" /></th>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.ManageServiceType.ServiceName" />
					</td>
					<td><input type="text" name="ServiceName" id="sname" size="35"
						maxlength="40" /></td>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.ManageServiceType.InvoiceType" />
					</td>
					<td><logic:present name="InvStyle">
						<select name="styleID" style="width:190;" id="sertype">
							<option value="0"><bean:message
								key="BzComposer.ComboBox.Select" /></option>
							<logic:iterate name="InvStyle" id="style">
								<option value='<bean:write name="style" property="value"/>'><bean:write
									name="style" property="label" /></option>
							</logic:iterate>
						</select>
					</logic:present></td>
				</tr>
				<tr>
					<td colspan="2">
					<div  id="ServiceTable">
					<table class="tabla-listados" cellspacing="0" border="1">
						<thead>
							<tr>
								<th>
								<div align="center"><bean:message
									key="BizComposer.Configuration.ManageServiceType.ServiceName" />
								</div>
								</th>
								<th>
								<div align="center"><bean:message
									key="BizComposer.Configuration.ManageServiceType.InvoiceType" />
								</div>
								</th>
							</tr>
						</thead>
						<tbody>
							<logic:present name="ServiceType">

								<bean:size name="ServiceType" id="sersize" />
								<input type="hidden" name="ServiceSize" id="ssize"
									value='<bean:write name="sersize"/>' />
								<script>
												var servicename = new Array(100);
												var serids = new Array(100);
												count=0;
												ser_size = document.getElementById('ssize').value;
												for(cnt=0;cnt<ser_size;cnt++){
													serids[cnt] = -1;
													servicename[cnt] = "";
												}
												serids[cnt] = -1;
												servicename[cnt] = "";
											</script>
								<logic:iterate name="ServiceType" id="stype" indexId="index">
									<tr id='<bean:write name="index"/>@@'
										onclick="setServiceType('<bean:write name="stype" property="serviceID"/>','<bean:write name="stype" property="serviceName"/>',
														'<bean:write name="stype" property="invStyleID"/>','<bean:write name="index" />@@');">
										<td nowrap="nowrap"><bean:write name="stype"
											property="serviceName" /></td>
										<td nowrap="nowrap"><bean:write name="stype"
											property="invName" /></td>

									</tr>
									<script>
														serids[count]= '<bean:write name="stype" property="serviceID"/>';
														servicename[count] = '<bean:write name="stype" property="serviceName"/>';
														count++;
												</script>
								</logic:iterate>
							</logic:present>
						</tbody>
					</table>
					</div>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="button" name="Add"
						class="formButton" onclick="AddServiceType();"
						value='<bean:message key="BizComposer.Configuration.ManageServiceType.Add"/>' />
					<input type="button" name="Edit" class="formButton"
						onclick="EditServiceType();"
						value='<bean:message key="BizComposer.Configuration.ManageServiceType.Edit"/>' />
					 								<input type="button" name="Delete" class="formButton" onclick="DeleteServiceType();"
									value='<bean:message key="BizComposer.Configuration.ManageServiceType.Delete"/>' />
		 <input type="button" name="Clear" class="formButton"
						onclick="ClearServiceType();"
						value='<bean:message key="BizComposer.Configuration.ManageServiceType.Clear"/>' />
					</td>
				</tr>

				<tr align="center">
					<td colspan="2"><bean:message
						key="BizComposer.Configuration.ManageServiceType.Note" /></td>
				</tr>
			</table>
			</div>
			<!-- Manage-Service Types Ends -->
			
			<!--  Finance charges starts -->
			<div id="finance" style="display:none;">
			<table class="table-notifications" width="100%">
				<tr>
					<th align="left"><bean:message
						key="BizComposer.Configuration.FinnanceCharge.ChargeRate" /></th>
				</tr>
				<tr>
					<td>
					<table>
						<tr>
							<td><bean:message
								key="BizComposer.Configuration.FinnanceCharge.AnnualIterrestRate" />
							&nbsp;&nbsp;&nbsp;</td>
							<td><html:text property="annualInterestRate" size="20"
								maxlength="10"
								onkeypress="return numbersonly(event,this.value);">
							</html:text></td>
						</tr>
						<tr>
							<td><bean:message
								key="BizComposer.Configuration.FinnanceCharge.MinimumFinanceCharge" />
							&nbsp;&nbsp;&nbsp;</td>
							<td><html:text property="minCharge" size="20" maxlength="10"
								onkeypress="return numbersonly(event,this.value);">
							</html:text></td>
						</tr>
						<tr>
							<td><bean:message
								key="BizComposer.Configuration.FinnanceCharge.GracePeriod" />
							&nbsp;&nbsp;&nbsp;</td>
							<td><html:text property="gracePeriod" size="20"
								maxlength="10"
								onkeypress="return numbersonly(event,this.value);">
							</html:text></td>
						</tr>
					</table>

					</td>
				</tr>
				<tr>
					<th align="left"><bean:message
						key="BizComposer.Configuration.FinnanceCharge.ApplyingCharges" />
					</th>
				</tr>
				<tr>
					<td>
					<table>
						<tr>
							<td><html:checkbox property="assessFinanceCharge">
													&nbsp;<bean:message
									key="BizComposer.Configuration.FinnanceCharge.AssessFinanceCharge" />
							</html:checkbox></td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			</div>
			<!-- Finance Charges Ends -->

			<!-- SMTP Setup Starts -->
			<div id="smtp" style="display:none;">
			<table class="table-notifications" width="100%">
				<tr>
					<td colspan="2">
						<bean:message key="BizComposer.Configuration.smtp.SetuploginNote" />
					</td>
				</tr>
				<tr>
					<th align="left" colspan="2">
						<bean:message key="BizComposer.Configuration.smtp.ServerInformation" />
					</th>
				</tr>
				<tr>
					<td>
						<bean:message key="BizComposer.Configuration.smtp.SenderEmailAddr" />
					</td>
					<td>
						&nbsp;&nbsp;&nbsp; 
						<html:text property="senderEmail" size="30" maxlength="45"></html:text>
					</td>
				</tr>
				<tr>
					<td>
						<bean:message key="BizComposer.Configuration.smtp.SMTPServer" />
					</td>
					<td>
						&nbsp;&nbsp;&nbsp; 
						<html:text property="mailServer" size="30" maxlength="45"></html:text>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" name="testMailConnection" class="formButton" size="25" onclick="TestConnection()"
						value='<bean:message key="BizComposer.Configuration.smtp.TestConnection" />' /> 
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<bean:message key="BizComposer.Configuration.smtp.MailServerAuthentication" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<html:checkbox property="mailAuth" onclick="EnableDisableFields();" >
							<bean:message key="BizComposer.Configuration.smtp.ServerRequeiresAuthentication" />
						</html:checkbox>
					</td>
				</tr>
				<tr>
					<th align="left" colspan="2">
						<bean:message key="BizComposer.Configuration.smtp.UserInformation" />
					</th>
				</tr>
				<tr>
					<td>
						<bean:message key="BizComposer.Configuration.smtp.UserName" />
					</td>
					<td>
						&nbsp;&nbsp;&nbsp; 
						<html:text property="mailUserName" size="30" maxlength="45" ></html:text>
					</td>
				</tr>
				<tr>
					<td>
						<bean:message key="BizComposer.Configuration.smtp.Password" />
					</td>
					<td>
						&nbsp;&nbsp;&nbsp; 
						<html:text property="mailPassword" size="30" maxlength="35" ></html:text>
					</td>
				</tr>
			</table>
			</div> 
			<!-- SMTP Setup Ends -->
			
			</td>
		</tr>
	</table>
	<div><html:hidden property="empStateID" /> <html:hidden
		property="labelName" /> <html:hidden property="fileName" /></div>
	<div><input type="hidden" name="tabid" id="tid" value="" />
	</div>
	</div>
	<div>
		<center><html:button property="save">Save</html:button>
		<html:cancel>Cancel</html:cancel></center>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</html:form> 

<%@ include file="/include/footer.jsp"%>
</body>
</html>