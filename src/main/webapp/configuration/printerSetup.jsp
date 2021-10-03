<%@ page contentType="text/html;charset=UTF-8" %>
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
<title><bean:message key="BzComposer.printersetuptitle" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script type="text/javascript">
function toggleFunction() {
	debugger;
  var x = document.getElementById("divtoggle");
  var lftmenu = document.getElementById("leftMenu");
  if (x.style.display === "none") {
    x.style.display = "block";
    lftmenu.style.width = "180px";
    lftmenu.style.position = "relative";
  } else {
    x.style.display = "none";
    lftmenu.style.width = "0";
    lftmenu.style.position = "absolute";
  }
} 
$(function() {
    $( "#tabs" ).tabs();
  });
  
$('#img1').on('click', function() {  
	  window.print();  
	  return false; // why false?
	});

/* function testConnection()
{
	alert("Inside testConnection")
} */
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

/* function test()
{
	 alert("inside test")
} */

/* function CheckEmailConnection()
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
		alert('<bean:message key="BzComposer.configuration.manageservicetype.serverconnectedsuccess" />');
		document.configurationForm.mailAuth.disabled=false;    		
		EnableDisableFields();
	}
	else
	{
		debugger
		alert('<bean:message key="BzComposer.configuration.manageservicetype.serverconnectederror" />');
		document.configurationForm.mailAuth.disabled=true;
		EnableDisableFields();
	}
} */

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

/* function TestConnection()
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
} */

/* var funsequence = 0;
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
} */

/* function trim(inputString) {
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
			alert('<bean:message key="BzComposer.configuration.manageservicetype.servicetypenameexist"/>');
			document.getElementById('sname').focus();
			flag=1;
			break;
		}
	}
	return flag;
} */

/* function AddServiceType(){
	var name = trim(document.getElementById('sname').value);
	if(name==""){
		alert('<bean:message key="BzComposer.configuration.manageservicetype.pleaseselectservicetype"/>');
		document.getElementById('sname').focus();
	}
	else{
		if(IsExist()==0){
			if(confirm('<bean:message key="BzComposer.configuration.manageservicetype.addnewservicetype"/>')){
				invid = document.getElementById('sertype').value;
				AddService(name,invid);
			}
		}
	}
} */

/* function AddService(name,invid){
	d = new Date();
	oT = c(SelectService);
	oGET(oT,'<bean:write name="path" property="pathvalue"/>/include/'+
					'manageServiceType.jsp?action=Add&SName='+name+'&InvStyleId='+invid+'&Date='+d);
	nm = name;
} */

/* function SelectService(){
	if (oT.readyState != 4 || oT.status != 200) { 
	  return;
	}
	var res = trim(oT.responseText);
	getRecords(res);	
} */

/* function getRecords(res){
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
        
    }*/
    //var list = slist.split("/*/");
    /*cnt=0;
    for(index = 0;index < size;index++){
    	if(cnt<list.length){
    		serids[index] = list[cnt];
    		cnt++;
    		servicename[index] = list[cnt];
    		cnt++;
    	}	    	
    }
} */

/*function EditServiceType(){
	var name = trim(document.getElementById('sname').value);
	if(name==""){
		alert('<bean:message key="BzComposer.configuration.manageservicetype.pleaseselectservicetype"/>');
		document.getElementById('sname').focus();
	}
	else{
		if(IsExist()==0){
			if(servid==0){
				alert('<bean:message key="BzComposer.configuration.manageservicetype.selectservicetypetoedit"/>');
			}
			else{
				if(confirm('<bean:message key="BzComposer.configuration.manageservicetype.editselectedservicetype"/>')){
					invid = document.getElementById('sertype').value;
					EditService(servid,name,invid);
					servid=0;
				}
			}
		}
	}
}
*/
/* function SelectEditService(){
	if (oT.readyState != 4 || oT.status != 200) { 
	  return;
	}
    var res = trim(oT.responseText);
	getRecords(res);
} */


/* function EditService(servid,name,invid){
	d = new Date();
	oT = c(SelectEditService);
	oGET(oT,'<bean:write name="path" property="pathvalue"/>/include/'+
					'manageServiceType.jsp?action=Edit&SName='+name+'&InvStyleId='+invid+'&ServiceID='+servid+'&Date='+d);
}


function DeleteServiceType(){
	if(servid==0){
		alert('<bean:message key="BzComposer.configuration.manageservicetype.selectservicetypetodelete"/>');
	}
	else{
		if(confirm('<bean:message key="BzComposer.configuration.manageservicetype.deleteselectedservicetype"/>')){
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
 */
</script>
</head>
<!-- <body onload="init4();"> -->
<body onload="init();">
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
			<bean:message key="BzComposer.configuration.configurationtitle"/>
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
	<div id="table-negotiations" style="padding: 0; border: 1px solid #ccc;">
	<table cellspacing="0"  style="border: 0;width: 100%;overflow-y:scroll;" class="section-border">
		<span style="font-size:30px;cursor:pointer; margin-left: 20px;" onclick="toggleFunction()">&#9776;</span>
		<tr>
			<td id="leftMenu" style="position: relative; width: 180px;">
			<table>
				<tr>
					<td>
						<%-- <%@include file="testMenu4.jsp" %> --%>
						<%@include file="menuPage.jsp" %>
					<%-- <div id="table-negotiations"
						style="width: 185px;padding-left: 10px;overflow-y:auto;max-height: 497px;">
					<%@include file="testMenu4.jsp" %>
					</div> --%>
					</td>
				</tr>
				<%-- <tr align="center">
					<td><input type="button" name="Revoke" class="formButton"
						onclick="RevokeValues();"
						value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
					<input type="button" name="Save" class="formButton"
						onclick="SaveValues();"
						value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr> --%>
			</table>
			</td>
			<td valign="top" >
				<div id="tabs" style="height:auto;">
					<ul>
 						<li style="font-size: 12px;">
 							<a href="#printerSetup">
 								Printer Setup
							</a>
						</li>
 						<li style="font-size: 12px;">
 							<a href="#MySQLConfiguration">
 								Barcode Setup
							</a>
						</li>
					</ul>
				<!-- Printer Setup Starts -->
			 <div id="printerSetup" style="display:none;">
				<table class="table-notifications" width="100%">
					<tr>
						<th colspan="6" align="left" style="font-size: 12px; padding: 5px;">
							<bean:message key="BzComposer.configuration.systemdefaultprinter" />
						</th>
					</tr>
					<tr>
						<td colspan="3" style="width:40px;font-size:12px;">
							<bean:message key="BzComposer.configuration.setdefaultprinter"/>
						</td>
						<td colspan="3" style="width:120px;font-size:12px">
							<%-- <select style="width:260px;display:block;" id="defaultPrinter" name="defaultPrinter">
								<option value="0">Not Set</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<option value="2">Fax</option>
							</select> --%>
							<%-- Commented on 22-11-2019 for exceeding 65535 bytes limit 
							<html:select property="selectedDefaultPrinterId" styleId="selectedDefaultPrinterId">
								<option value="0">
									<bean:message key="BzComposer.configuration.notset"/>
								</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
							</html:select> --%>
						</td>
					</tr>
					<tr>
						<th colspan="6" align="left" style="font-size: 12px; padding: 5px;">
							<bean:message key="BzComposer.configuration.processprintersetup" />
						</th>
					</tr>
					<tr>
						<td colspan="2" style="width:40px;font-size: 12px;">
							<bean:message key="BzComposer.configuration.invoiceprinter"/>
						</td>
						<td colspan="2" style="font-size: 12px;">
							<select style="width:260px;" id="invoicePrinter" name="invoicePrinter">
								<option value="0">
									<bean:message key="BzComposer.configuration.notset"/>
								</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<!-- <option value="2">Fax</option> -->
							</select>
						</td>
						<td colspan="2" style="width:20px;" align="left">
							<img id="img1" name="img1" src='<bean:write name="path" scope="session" 
							property="pathvalue"/>/images/Printer.png' style="display:block" onclick="print()"/>
							<bean:message key="BzComposer.configuration.testbtn"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="width:20px;font-size: 12px;">
							<bean:message key="BzComposer.configuration.labelprinter"/>
						</td>
						<td colspan="2" style="font-size: 12px;">
							<select style="width:260px;" id="labelPrinter" name="labelPrinter">
								<option value="0">
									<bean:message key="BzComposer.configuration.notset"/>
								</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<!-- <option value="2">Fax</option> -->
							</select> 
						</td>
						<td colspan="2" style="width:20px;" align="left">
							<img id="img1" src='<bean:write name="path" scope="session" 
							property="pathvalue"/>/images/Printer.png' style="display:block" onclick="print()"/>
							<bean:message key="BzComposer.configuration.testbtn"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="width:40px;font-size: 12px;">
							<bean:message key="BzComposer.configuration.esalesprinter"/>
						</td>
						<td colspan="2" style="width:120px;font-size: 12px;">
							<select style="width:260px;" id="eSalesPrinter" name="eSalesPrinter">
								<option value="0">
									<bean:message key="BzComposer.configuration.notset"/>
								</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<!-- <option value="2">Fax</option> -->
							</select>
						</td>
						<td colspan="2" style="width:20px;" align="left">
							<img id="img1" src='<bean:write name="path" scope="session" 
							property="pathvalue"/>/images/Printer.png' style="display:block" onclick="print()"/>
							<bean:message key="BzComposer.configuration.testbtn"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="width:40px;font-size: 12px;">
							<bean:message key="BzComposer.configuration.salesslipprinter"/>
						</td>
						<td colspan="2" style="width:120px;font-size: 12px;">
							<select style="width:260px;" id="salesSlipPrinter" name="salesSlipPrinter">
								<option value="0">
									<bean:message key="BzComposer.configuration.notset"/>
								</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<!-- <option value="2">Fax</option> -->
							</select>
						</td>
						<td colspan="2" style="width:20px;" align="left">
							<img id="img1" src='<bean:write name="path" scope="session" 
							property="pathvalue"/>/images/Printer.png' style="display:block" onclick="print()"/>
							<bean:message key="BzComposer.configuration.testbtn"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="width:40px;font-size: 12px;">
							<bean:message key="BzComposer.configuration.reportlistprinter"/>
						</td>
						<td colspan="2" style="width:120px;font-size: 12px;">
							<select style="width:260px;" id="reportListPrinter" name="reportListPrinter">
								<option value="0">
									<bean:message key="BzComposer.configuration.notset"/>
								</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<!-- <option value="2">Fax</option> -->
							</select>
						</td>
						<td colspan="2" style="width:20px;" align="left">
							<img id="img1" src='<bean:write name="path" scope="session" 
							property="pathvalue"/>/images/Printer.png' style="display:block" onclick="print()"/>
							<bean:message key="BzComposer.configuration.testbtn"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="width:40px;font-size: 12px;">
							<bean:message key="BzComposer.configuration.purchaseprinter"/>
						</td>
						<td colspan="2" style="width:120px;font-size: 12px;">
							<select style="width:260px;" id="purchasePrinter" name="purchasePrinter">
								<option value="0">
									<bean:message key="BzComposer.configuration.notset"/>
								</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<!-- <option value="2">Fax</option> -->
							</select>
						</td>
						<td colspan="2" style="width:20px;" align="left">
							<img id="img1" src='<bean:write name="path" scope="session" 
							property="pathvalue"/>/images/Printer.png' style="display:block" onclick="print()"/>
							<bean:message key="BzComposer.configuration.testbtn"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="width:40px;font-size: 12px;">
							<bean:message key="BzComposer.configuration.checkprinter"/>
						</td>
						<td colspan="2" style="width:120px;font-size: 12px;">
							<select style="width:260px;" id="checkPrinter" name="checkPrinter">
								<option value="0">
									<bean:message key="BzComposer.configuration.notset"/>
								</option>
								<logic:present name="configurationForm" property="listOfExistingDefaultPrinter">
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingDefaultPrinter" scope="session">
										<option value="1"><bean:write name="objList1" property="printerName" /></option>
									</logic:iterate>
								</logic:present>
								<!-- <option value="2">Fax</option> -->
							</select>
						</td>
						<td colspan="2" style="width:20px;" align="left">
							<img id="img1" src='<bean:write name="path" scope="session" 
							property="pathvalue"/>/images/Printer.png' style="display:block" onclick="print()"/>
							<bean:message key="BzComposer.configuration.testbtn"/>
						</td>
					</tr>
					<tr>
						<th colspan="6" align="left" style="font-size: 12px; padding: 5px;">
							<bean:message key="BzComposer.configuration.advancedsetup" />
						</th>
					</tr>
					<tr>
						<td></td>
						<td style="font-size: 12px;">
							<b>
								<bean:message key="BzComposer.configuration.yesorno"/>
							</b>
						</td>
						<td style="font-size: 12px;">
							<b>
								<bean:message key="BzComposer.configuration.numofcopies"/>
							</b>
						</td>
						<td></td>
						<td style="font-size: 12px;"><b><bean:message key="BzComposer.configuration.yesorno"/></b></td>
						<td style="font-size: 12px;"><b><bean:message key="BzComposer.configuration.numofcopies"/></b></td>
					</tr>
					<tr>
						<td style="font-size: 12px;"><bean:message key="Bzcomposer.configuration.invoice"/></td>
						<td>
							<input type="radio" id="invoiceYes" name="invoice" value="Yes" onclick="showTextBox()">
							<bean:message key="BzComposer.configuration.yes"/>
							&nbsp;&nbsp;
							<input type="radio" id="invoiceNo" name="invoice" value="No" onclick="showTextBox()" 
							checked="checked">
							<bean:message key="BzComposer.configuration.no"/>
						</td>
						<td style="font-size: 12px;">
							<input type="text" id="invoiceCopies" name="invoiceCopies" value="1" readonly="readonly">
						</td>
						<td style="font-size: 12px;">
							<bean:message key="BzComposer.configuration.salesslip"/>
						</td>
						<td>
							<input type="radio" id="salesSlipYes" name="sales" value="Yes" onclick="showTextBox1()">
							<bean:message key="BzComposer.configuration.yes"/>
							&nbsp;&nbsp;
							<input type="radio" id="salesSlipNo" name="sales" value="No" onclick="showTextBox1()" 
							checked="checked">
							<bean:message key="BzComposer.configuration.no"/>
						</td>
						<td style="font-size: 12px;">
							<input type="text" id="salesCopies" name="salesCopies" value="1" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td style="font-size: 12px;">
							<bean:message key="BzComposer.configuration.label"/>
						</td>
						<td>
							<input type="radio" id="labelYes" name="label" value="Yes" onclick="showTextBox2()">
							<bean:message key="BzComposer.configuration.yes"/>
							&nbsp;&nbsp;
							<input type="radio" id="labelNo" name="label" value="No" onclick="showTextBox2()" 
							checked="checked">
							<bean:message key="BzComposer.configuration.no"/>
						</td>
						<td style="font-size: 12px;">
							<input type="text" id="labelCopies" name="labelCopies" value="1" readonly="readonly">
						</td>
						<td style="font-size: 12px;">
							<bean:message key="BzComposer.configuration.reportorlist"/>
						</td>
						<td>
							<input type="radio" id="reportYes" name="report" value="Yes" onclick="showTextBox3()">
							<bean:message key="BzComposer.configuration.yes"/>
							&nbsp;&nbsp;
							<input type="radio" id="reportNo" name="report" value="No" onclick="showTextBox3()" 
							checked="checked">
							<bean:message key="BzComposer.configuration.no"/>
						</td>
						<td style="font-size: 12px;">
							<input type="text" id="reportCopies" name="reportCopies" value="1" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td style="font-size: 12px;">
							<bean:message key="BzComposer.configuration.esales"/>
						</td>
						<td>
							<input type="radio" id="eSalesYes" name="eSales" value="Yes" onclick="showTextBox4()">
							<bean:message key="BzComposer.configuration.yes"/>
							&nbsp;&nbsp;
							<input type="radio" id="eSalesNo" name="eSales" value="No" onclick="showTextBox4()" 
							checked="checked">
							<bean:message key="BzComposer.configuration.no"/>
						</td>
						<td style="font-size: 12px;">
							<input type="text" id="eSalesCopies" name="eSalesCopies" value="1" readonly="readonly">
						</td>
						<td style="font-size: 12px;">
							<bean:message key="Bzcomposer.configuration.purchase"/>
						</td>
						<td>
							<input type="radio" id="purchaseYes" name="purchase" value="Yes" onclick="showTextBox5()">
							<bean:message key="BzComposer.configuration.yes"/>
							&nbsp;&nbsp;
							<input type="radio" id="purchaseNo" name="purchase" value="No"onclick="showTextBox5()" 
							checked="checked">
							<bean:message key="BzComposer.configuration.no"/>
						</td>
						<td style="font-size: 12px;">
							<input type="text" id="purchaseCopies" name="purchaseCopies" value="1" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td style="font-size: 12px;">
							<bean:message key="BzComposer.configuration.check"/>
						</td>
						<td>
							<input type="radio" id="checkYes" name="check" value="Yes" onclick="showTextBox6()">
							<bean:message key="BzComposer.configuration.yes"/>
							&nbsp;&nbsp;
							<input type="radio" id="checkNo" name="check" value="No" onclick="showTextBox6()" 
							checked="checked">
							<bean:message key="BzComposer.configuration.no"/>
						</td>
						<td style="font-size: 12px;">
							<input type="text" id="checkCopies" name="checkCopies" value="1" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td colspan="6" align="right" style="font-size: 12px;">
							<input type="submit" id="save" class="formButton" style="width: 60px;"name="save" 
							value="<bean:message key="BzComposer.global.save"/>">
						</td>
					</tr>
				</table>
			</div> 
			<!-- Printer Setup Ends -->
			<!-- Barcode Setup Starts -->
			<div id="MySQLConfiguration" style="display: none;">
				<table class="table-notifications">
					<tr>
						<th align="left" colspan="2" style="font-size: 12px; padding: 5px;">
							<bean:message key="BzComposer.configuration.mysqlsettings" />
						</th>
					</tr>
					<tr>
						<td align="left" style="font-size: 12px;">
							<b><bean:message key="BzComposer.configuration.mysqlsetting" /></b>
						</td>
					</tr>
				 	<tr>
						<td style="font-size: 12px;">
							<bean:message key="BzComposer.configuration.hostaddress" /> :
						</td>
						<td>
							<input type="text" name="hostAddess" style="font-size: 1em;"/>
						</td>
					</tr>
					<tr>
						<td style="font-size: 12px;">
							<bean:message key="BzComposer.configuration.username" /> :
						</td>
						<td>
							<input type="text" name="userName" style="font-size: 1em;"/>
						</td>
					</tr>
					<tr>
						<td style="font-size: 12px;">
							<bean:message key="BzComposer.configuration.password"/> :
						</td>
						<td>
							<input type="text" name="password" style="font-size: 1em;"/>
						</td>
					</tr>
					<tr>
						<td style="font-size: 12px;">
							<bean:message key="BzComposer.configuration.port" /> :
						</td>
						<td>
							<input type="text" name="port" style="font-size: 12px;"/>
						</td>
					</tr>
				</table> 
			</div>
			<!-- Barcode Setup Ends -->
			</div>
			</td>
		</tr>
	</table>
	<div><html:hidden property="empStateID" /> <html:hidden
		property="labelName" /> <html:hidden property="fileName" /></div>
	<div><input type="hidden" name="tabid" id="tid" value="" />
	</div>
	</div>
	<div>
	<div align="center">
		<html:button property="save"><bean:message key="BzComposer.global.save"/></html:button>
		<%-- <html:cancel><bean:message key="BzComposer.global.cancel"/></html:cancel> --%>
		<input type="reset" name="Cancel" style="font-size:1em;" value="<bean:message key="BzComposer.global.cancel"/>"/>
		</div>
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