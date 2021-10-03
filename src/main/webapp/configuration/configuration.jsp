
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
<script type="text/javascript">
$(function() {
    $( "#tabs" ).tabs();
  });
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
	
	function refreshItemsNow(val,sval){
	  d = new Date();
	  o33 = c(writeSelect);
	  oGET(o33,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=state&Cid=' + val+"&sval="+sval+'&Date='+d)
	}

	function writeSelect(){
  	   if (o33.readyState != 4 || o33.status != 200) { 
    	  return;
    	}
        document.getElementById("state").innerHTML = o33.responseText;
	}
	
	function setState(stateid){
		document.configurationForm.empStateID.value=stateid;
	}
	
	function CheckEmailConnection(){
		if (oEmail.readyState != 4 || oEmail.status != 200) { 
    	  	return;
    	}
    	response = parseInt(trim(oEmail.responseText));
    	if(response == 1){
    		alert('<bean:message key="BizComposer.Configuration.smtp.ConnectionSuceessfullyMessage" />');
			document.configurationForm.mailAuth.disabled=false;    		
			EnableDisableFields();
    	}
    	else{
    		alert('<bean:message key="BizComposer.Configuration.smtp.ConnectionFailedMessage" />');
    		document.configurationForm.mailAuth.disabled=true;
    		EnableDisableFields();
    	}
	}
	
	function TestConnection(){
		debugger
		d = new Date();
		var host = document.configurationForm.mailServer.value;
		debugger
		oEmail = c(CheckEmailConnection);
		debugger
		oGET(oEmail,'<bean:write name="path" property="pathvalue"/>/include/testMailServerConnection.jsp?HostName='+host+'&Date='+d);
	}
	
	/*Magage Service Type */
	
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
	
	function SelectService(){
		if (oT.readyState != 4 || oT.status != 200) { 
    	  return;
    	}
    	var res = trim(oT.responseText);
    	getRecords(res);	
	}
	
	
	function AddService(name,invid){
		d = new Date();
		oT = c(SelectService);
		oGET(oT,'<bean:write name="path" property="pathvalue"/>/include/'+
						'manageServiceType.jsp?action=Add&SName='+name+'&InvStyleId='+invid+'&Date='+d);
		nm = name;
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
	
	/* Employee */
	function SelectJob(){
		if (o.readyState != 4 || o.status != 200) { 
    	  return;
    	}
    	document.getElementById("jobCodeTime").innerHTML = "";
        document.getElementById("jobCodeTime").innerHTML = o.responseText ;
	}
	
	function AddJobCode(){
	
		code = trim(document.getElementById('jcode').value);
		if(code=="" || document.getElementById('jcode').value.length == 0){
			alert('<bean:message key="BizComposer.Configuration.Employee.Add.JobCodeNotEmptyValidation" />');
			document.getElementById('jcode').focus();
		}
		else{
			cst = wxToFixed(document.getElementById('cost').value,2);
			document.getElementById('cost').value = cst;
			if(cst=="" || cst==0){
				alert('<bean:message key="BizComposer.Configuration.Employee.CostGreaterValidation" />');
				document.getElementById('cost').value="";
				document.getElementById('cost').focus();
			}
			else{
				if(confirm('<bean:message key="BizComposer.Configuration.Employee.AddJobCodeConfirm" />')){
					description = document.getElementById('desc').value;
					d = new Date();
					o = c(SelectJob);
					oGET(o,'<bean:write name="path" property="pathvalue"/>/include/'+
						'jobCodeTimeSheet.jsp?action=Add&code='+code+'&cost='+cst+'&desc='+description+'&Date='+d);
				}
			}
		}
	}

	
	
	function EditJobCode(){
		
		
		if(jid==0){
			alert('<bean:message key="BizComposer.Configuration.Employee.Remove.JobCodeNotSelectedValidation" />');
		}
		else{
			code = trim(document.getElementById('jcode').value);
			
			if(code=="" || document.getElementById('jcode').value.length == 0){
				alert('<bean:message key="BizComposer.Configuration.Employee.Add.JobCodeNotEmptyValidation" />');
				document.getElementById('jcode').focus();
			}
			else{
				cst = wxToFixed(document.getElementById('cost').value,2);
				document.getElementById('cost').value = cst;
				if(cst=="" || cst==0){
					alert('<bean:message key="BizComposer.Configuration.Employee.CostGreaterValidation" />');
					document.getElementById('cost').value="";
					document.getElementById('cost').focus();
				}
				else{
					if(confirm('<bean:message key="BizComposer.Configuration.Employee.EditJobCodeConfirm" />')){
						description = document.getElementById('desc').value;
						d = new Date();
						o = c(SelectJob);
						oGET(o,'<bean:write name="path" property="pathvalue"/>/include/'+
							'jobCodeTimeSheet.jsp?action=Edit&code='+code+'&cost='+cst+'&desc='+description+'&jobId='+jid+'&Date='+d);
					}
				}
			}
		}
	}
	
	function RemoveJobCode(){
		if(jid==0){
			alert('<bean:message key="BizComposer.Configuration.Employee.Remove.JobCodeNotSelectedValidation" />');
		}
		else{
			if(confirm('<bean:message key="BizComposer.Configuration.Employee.RemoveJobCodeConfirm" />')){
				d = new Date();
				o = c(SelectJob);
				oGET(o,'<bean:write name="path" property="pathvalue"/>/include/'+
					'jobCodeTimeSheet.jsp?action=Remove&jobId='+jid+'&Date='+d);
			}
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

  
 	
</script>
</head>
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

	<div><span
		style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">Configuration</span></div>
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
					<table class="tabla-listados" cellspacing="0">
						<tr onclick="SetRow('tr1');" id="tr1">
							<td><img id="img1"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/general.png'
								style="display:block" /> <img id="img2"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/generalY.png'
								style="display:none" /></td>
						</tr>
						<tr onclick="SetRow('tr2');" id="tr2">
							<td><img id="img3"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/general.png'
								style="display:block" /> <img id="img4"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/generalY.png'
								style="display:none" /></td>
						</tr>
						<tr onclick="SetRow('tr3');" id="tr3">
							<td><img id="img5"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Accounting-&-Payment.png'
								style="display:block" /> <img id="img6"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Accounting-&-PaymentY.png'
								style="display:none" /></td>
						</tr>
						<tr onclick="SetRow('tr4');" id="tr4">
							<td><img id="img7"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/NetworkSecurity.png'
								style="display:block" /> <img id="img8"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Network-&-SecurityY.png'
								style="display:none" /></td>
						</tr>
						<tr onclick="SetRow('tr5');" id="tr5">
							<td><img id="img9"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Billing.png'
								style="display:block" /> <img id="img10"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/BillingY.png'
								style="display:none" /></td>
						</tr>
						<tr onclick="SetRow('tr6');" id="tr6">
							<td><img id="img11"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/CustomerInvoice.png'
								style="display:block" /> <img id="img12"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Customer-&-InvoiceY.png'
								style="display:none" /></td>
						</tr>
						
						<tr onclick="SetRow('tr7');" id="tr7">
							<td><img id="img13"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Estimation.png'
								style="display:block" /> <img id="img14"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/EstimationY.png'
								style="display:none" /></td>
						</tr>
						
						<tr onclick="SetRow('tr8');" id="tr8">
							<td><img id="img15"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Inventory-Setting.png'
								style="display:block" /> <img id="img16"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Inventory-SettingY.png'
								style="display:none" /></td>
						</tr>
						
						<tr onclick="SetRow('tr9');" id="tr9">
							<td><img id="img17"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/FormCustomization.png'
								style="display:block" /> <img id="img18"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Form-CustomizationY.png'
								style="display:none" /></td>
						</tr>
						
						<tr onclick="SetRow('tr10');" id="tr10">
							<td><img id="img19"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/VendorPurchaseOrder.png'
								style="display:block" /> <img id="img20"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Vendor-&-Purchase-OrderY.png'
								style="display:none" /></td>
						</tr>
						
						<tr onclick="SetRow('tr11');" id="tr11">
							<td><img id="img21"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Employee.png'
								style="display:block" /> <img id="img22"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/EmployeeY.png'
								style="display:none" /></td>
						</tr>
						<tr onclick="SetRow('tr12');" id="tr12">
							<td><img id="img23"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Tax.png'
								style="display:block" /> <img id="img24"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/TaxY.png'
								style="display:none" /></td>
						</tr>
						<tr onclick="SetRow('tr13');" id="tr13">
							<td><img id="img25"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/reminder.png'
								style="display:block" /> <img id="img26"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/reminderY.png'
								style="display:none" /></td>
						</tr>
						<tr onclick="SetRow('tr14');" id="tr14">
							<td><img id="img27"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Email-SetUp.png'
								style="display:block" /> <img id="img28"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Email-SetUpY.png'
								style="display:none" /></td>
						</tr>
						<tr onclick="SetRow('tr15');" id="tr15">
							<td><img id="img29"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/shipping.png'
								style="display:block" /> <img id="img30"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/shippingY.png'
								style="display:none" /></td>
						</tr>
						<tr onclick="SetRow('tr16');" id="tr16">
							<td><img id="img31"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/RMA.png'
								style="display:block" /> <img id="img32"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/RMAY.png'
								style="display:none" /></td>
						</tr>
						
						<tr onclick="SetRow('tr17');" id="tr17">
							<td><img id="img33"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/eSales.png'
								style="display:block" /> <img id="img34"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/eSalesY.png'
								style="display:none" /></td>
						</tr>
						
						<tr onclick="SetRow('tr18');" id="tr18">
							<td><img id="img35"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Payment-&-Received-Options.png'
								style="display:block" /> <img id="img36"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/Payment-&-Received-OptionsY.png'
								style="display:none" /></td>
						</tr>
						
						<tr onclick="SetRow('tr19');" id="tr19">
							<td><img id="img37"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/MySQL-Configuration.png'
								style="display:block" /> <img id="img38"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/MySQL-ConfigurationY.png'
								style="display:none" /></td>
						</tr>
						
						<tr onclick="SetRow('tr20');" id="tr20">
							<td><img id="img39"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/device_manager.png'
								style="display:block" /> <img id="img40"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/device_managerY.png'
								style="display:none" /></td>
						</tr>
						
						<tr onclick="SetRow('tr21');" id="tr21">
							<td><img id="img41"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/payment_gateway.png'
								style="display:block" /> <img id="img42"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/payment_gatewayY.png'
								style="display:none" /></td>
						</tr>
						
						<tr onclick="SetRow('tr22');" id="tr22">
							<td><img id="img43"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/PrinterSetup.png'
								style="display:block" /> <img id="img44"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/PrinterSetupY.png'
								style="display:none" /></td>
						</tr>
						<tr onclick="SetRow('tr23');" id="tr23">
							<td><img id="img45"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/finance.jpg'
								style="display:block" /> <img id="img46"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/financeY.jpg'
								style="display:none" /></td>
						</tr>
						<tr onclick="SetRow('tr24');" id="tr24">
							<td><img id="img47"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/smtp.jpg'
								style="display:block" /> <img id="img48"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/smtpY.jpg'
								style="display:none" /></td>
						</tr>
						<tr onclick="SetRow('tr25');" id="tr25">
							<td><img id="img49"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/performance.png'
								style="display:block" /> <img id="img50"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/performanceY.png'
								style="display:none" /></td>
						</tr>
						<tr onclick="SetRow('tr26');" id="tr26">
							<td><img id="img51"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/service.jpg'
								style="display:block" /> <img id="img52"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/serviceY.jpg'
								style="display:none" /></td>
						</tr>
						<tr onclick="SetRow('tr27');" id="tr27">
							<td><img id="img53"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/dashboard.png'
								style="display:block" /> <img id="img54"
								src='<bean:write name="path" scope="session" property="pathvalue"/>/ConfigurationImages/dashboardY.png'
								style="display:none" /></td>
						</tr>
						
					</table>
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

			<!-- general starts -->
			<div id="general">
			<%-- <%@include file="generalDiv.jsp" %> --%>
			<div id="tabs" style="height:500px;">
  				<ul>
    				<li><a href="#GeneralSetting"><bean:message key="Bizcomposer.general" /></a></li>
    				<li><a href="#features"><bean:message key="Bzcomposer.features" /></a></li>
    				<li><a href="#orderTemplate"><bean:message key="Bizcomposer.orderTemplate" /></a></li>
  				</ul>
				<div id="GeneralSetting">
					<div id="content1" class="tabPage">
   						<!-- add here the content of first tab -->
						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="2" align="left"><bean:message
								key="BizComposer.Configuration.General" /></th>
							</tr>
							<tr>
								<td><bean:message key="BizComposer.Configuration.Currency" /></td>
								<td><html:select property="currencyID">
									<html:option value="0">Select</html:option>
									<html:option value="1">Baht</html:option>
									<html:option value="2">Bolivar</html:option>
									<html:option value="3">Boliviano</html:option>
									<html:option value="4">Cedi</html:option>
									<html:option value="5">Dihram</html:option>
									<html:option value="6">Dinar</html:option>
									<html:option value="7">Dollar</html:option>
									<html:option value="8">Dong</html:option>
									<html:option value="9">Euro</html:option>
									<html:option value="10">Forint</html:option>
									<html:option value="11">Franc</html:option>
									<html:option value="12">Koruna</html:option>
									<html:option value="13">Krona</html:option>
									<html:option value="14">Krone</html:option>
									<html:option value="15">New Shekal</html:option>
									<html:option value="16">Nuevo Sol</html:option>
									<html:option value="17">Peso</html:option>
									<html:option value="18">Pound</html:option>
									<html:option value="19">Pula</html:option>
									<html:option value="20">Quetzal</html:option>
									<html:option value="21">Rand</html:option>
									<html:option value="22">Real</html:option>
									<html:option value="23">Ringgit</html:option>
									<html:option value="24">Riyal</html:option>
									<html:option value="25">Riyali</html:option>
									<html:option value="26">Rouble</html:option>
									<html:option value="27">Rupee</html:option>
									<html:option value="28">Rupiah</html:option>
									<html:option value="29">Schilling</html:option>
									<html:option value="30">Sucre</html:option>
									<html:option value="31">Won</html:option>
									<html:option value="32">Yen</html:option>
									<html:option value="33">Yuan</html:option>
								</html:select></td>
							</tr>
							<tr>
								<td><bean:message key="BizComposer.Configuration.Weight" /></td>
								<td>
									<html:select property="weightID">
									<html:option value="0">Select</html:option>
									<html:option value="1">Pound</html:option>
									<html:option value="2">Once</html:option>
									<html:option value="3">Kg</html:option>
									<html:option value="4">g</html:option>
									</html:select>
								</td>
							</tr>
							<tr>
								<th colspan="2" align="left"><bean:message
								key="BizComposer.Configuration.AddressLabel" /></th>
							</tr>
							<tr colspan="2">
									<td><bean:message key="BizComposer.Configuration.DefaultLabel" /></td>
									<td><logic:present
										name="Labels">
										<html:select property="defaultLabelID"
											onchange="SetLabelName(this.value);" style="width:200">
											<html:optionsCollection name="Labels" />
										</html:select>
									</logic:present></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="button"
								class="formButton"
								value='<bean:message key="BizComposer.Configuration.General.BackUpButton"/>'
								title='<bean:message key="BizComposer.Configuration.General.BackUpButtonToolTip"/>' />
								</td>
							</tr>
							<tr>
								<th colspan="2" align="left"><bean:message
								key="BizComposer.Configuration.defaultFilter" /></th>
							</tr>
							<tr>
								<td><bean:message key="BizComposer.Configuration.defaultFilter" />:</td>
								<td>
									<html:select property="weightID">
									<html:option value="0">All</html:option>
									<html:option value="1">Custom</html:option>
									<html:option value="2">Today</html:option>
									<html:option value="3">This Month</html:option>
									<html:option value="4">This Quarter</html:option>
									<html:option value="5">This Year</html:option>
									<html:option value="6">1 Year</html:option>
									<html:option value="7">2 Year</html:option>
									<html:option value="8">3 Year</html:option>
									<html:option value="9">This Month-to-Date</html:option>
									<html:option value="10">This Quarter-to-Date</html:option>
									<html:option value="11">This Year-to-Date</html:option>
									<html:option value="12">Last 10 days</html:option>
									<html:option value="13">Last 30 days</html:option>
									<html:option value="14">Last 60 days</html:option>
									<html:option value="15">1 Week</html:option>
									</html:select>
								</td>
							</tr>
							<tr>
								<th colspan="2" align="left"><bean:message
								key="BizCompozer.StartingPageSetting" /></th>
							</tr>
							<tr>
								<td><bean:message key="BizCompozer.StartingPage" />:</td>
								<td>
									<html:select property="weightID">
									<html:option value="0">Customer</html:option>
									<html:option value="1">Inventory</html:option>
									<html:option value="2">Invoice</html:option>
									<html:option value="3">Navifgation Page</html:option>
									<html:option value="4">PO</html:option>
									<html:option value="5">Vendor</html:option>
									</html:select>
								</td>
								</tr>
								<tr>
									<th colspan="2" align="left"><bean:message
									key="Bizcomposer.Dashboard.DefaultSettingText" /></th>
								</tr>
								<tr>
									<td><bean:message key="BizComposer.Configuration.defaultCustomDashboard" />:</td>
									<td align="left">
										<html:checkbox property="productTaxable">
										<bean:message key="BizCompozer.OpenSalesOrder" />
										</html:checkbox>&nbsp;&nbsp;&nbsp;
										<html:checkbox property="productTaxable">
										<bean:message key="BizCompozer.ItemReceived" />
										</html:checkbox>
					<br>
					<html:checkbox property="productTaxable">
						<bean:message
							key="BizCompozer.POBoard" />
						</html:checkbox>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<html:checkbox property="productTaxable">
						<bean:message
							key="BizCompozer.ItemShipped" />
						</html:checkbox>
					</td>
				</tr>
			</table>	
					
					</div>  
				</div>
  				<div id="features">
   					<div id="content2" class="tabPage"><!-- add here the content of second tab -->		
   					 This is second tab. 
					</div>  
				</div>
   				<div id="orderTemplate">
   					<div id="content3" class="tabPage"><!-- add here the content of first tab -->
						This is Third Tab			
					</div>  
				</div>	
			</div>
			</div>
			<!-- general ends -->
		<!--  	 Accounting and Payment -->
		 <%--  <div id="accounting&Payment" style="display:none;">
			<table class="table-notifications" width="100%">
				<tr>
					<th colspan="2" align="left"><bean:message
						key="BizComposer.Configuration.Accounting&Pay" /></th>
				</tr>
				<tr>
					<td><bean:message key="BizComposer.Configuration.DefAccSet" /></td>
					
				</tr>
			</table>
			</div>    --%>

			<!--  Networking & Security Starts -->
			<div id="nw" style="display:none;">
			<table class="table-notifications" width="80%">

				<tr>
					<th colspan="3" align="left"><bean:message
						key="BizComposer.Configuration.Networking.Administrator" /></th>
				</tr>

				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Networking.UserName" /></td>
					<td><bean:message
						key="BizComposer.Configuration.Networking.UserAdmin" /></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Networking.Password" /></td>
					<td><html:password property="password" size="20"
						maxlength="30"></html:password></td>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<th colspan="3" align="left"><bean:message
						key="BizComposer.Configuration.Networking.MultiUserConnection" />
					</th>
				</tr>
				<tr>
					<td colspan="3"><html:radio property="multiUserConnection"
						value="0">
						<bean:message
							key="BizComposer.Configuration.Networking.SingleUser" />
					</html:radio></td>
				</tr>
				<tr>
					<td colspan="3"><html:radio property="multiUserConnection"
						value="1">
						<bean:message key="BizComposer.Configuration.Networking.MultiUser" />
					</html:radio></td>
				</tr>
				<tr>
					<th colspan="3" align="left"><bean:message
						key="BizComposer.Configuration.Networking.Users" /></th>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Networking.UserName" /></td>
					<td>&nbsp;&nbsp;&nbsp; <bean:message
						key="BizComposer.Configuration.Networking.Password" /></td>
					<td>&nbsp;&nbsp;&nbsp; <bean:message
						key="BizComposer.Configuration.Networking.Group" /></td>

				</tr>
				<tr>
					<td><input type="text" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <input type="password" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <logic:present name="UserGroup">
						<select style="width:100;">
							<logic:iterate id="group" name="UserGroup">
								<option value='$(group.groupID)'><bean:write
									name="group" property="groupNm" /></option>
							</logic:iterate>
						</select>
					</logic:present></td>

				</tr>
				<tr>
					<td><input type="text" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <input type="password" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <logic:present name="UserGroup">
						<select style="width:100;">
							<logic:iterate id="group" name="UserGroup">
								<option value='$(group.groupID)'><bean:write
									name="group" property="groupNm" /></option>
							</logic:iterate>
						</select>
					</logic:present></td>

				</tr>
				<tr>
					<td><input type="text" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <input type="password" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <logic:present name="UserGroup">
						<select style="width:100;">
							<logic:iterate id="group" name="UserGroup">
								<option value='$(group.groupID)'><bean:write
									name="group" property="groupNm" /></option>
							</logic:iterate>
						</select>
					</logic:present></td>

				</tr>
				<tr>
					<td><input type="text" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <input type="password" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <logic:present name="UserGroup">
						<select style="width:100;">
							<logic:iterate id="group" name="UserGroup">
								<option value='$(group.groupID)'><bean:write
									name="group" property="groupNm" /></option>
							</logic:iterate>
						</select>
					</logic:present></td>

				</tr>
				<tr>
					<td><input type="text" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <input type="password" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <logic:present name="UserGroup">
						<select style="width:100;">
							<logic:iterate id="group" name="UserGroup">
								<option value='$(group.groupID)'><bean:write
									name="group" property="groupNm" /></option>
							</logic:iterate>
						</select>
					</logic:present></td>

				</tr>
				<tr>
					<td><input type="text" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <input type="password" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <logic:present name="UserGroup">
						<select style="width:100;">
							<logic:iterate id="group" name="UserGroup">
								<option value='$(group.groupID)'><bean:write
									name="group" property="groupNm" /></option>
							</logic:iterate>
						</select>
					</logic:present></td>

				</tr>
				<tr>
					<td><input type="text" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <input type="password" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <logic:present name="UserGroup">
						<select style="width:100;">
							<logic:iterate id="group" name="UserGroup">
								<option value='$(group.groupID)'><bean:write
									name="group" property="groupNm" /></option>
							</logic:iterate>
						</select>
					</logic:present></td>
				</tr>
				<tr>
					<td><input type="text" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <input type="password" size="25" /></td>
					<td>&nbsp;&nbsp;&nbsp; <logic:present name="UserGroup">
						<select style="width:100;">
							<logic:iterate id="group" name="UserGroup">
								<option value='$(group.groupID)'><bean:write
									name="group" property="groupNm" /></option>
							</logic:iterate>
						</select>
					</logic:present></td>

				</tr>


			</table>
			</div>
			<!-- nw Ends -->
			
			<!-- Billing Starts  -->
			
			<div id="billing" style="display:none;">
				This is billing div.
			</div>
			
			<!-- Billing Ends -->
			
			<!-- Account&Payment Starts -->
			<div id="Account&Payment" style="display:none;">
				This is Account&Payment div.
			</div>
			<!-- Account&Payment Ends -->

			<!-- Sales & Customer Starts -->
			<div id="sales" style="display:none;">
			<table class="table-notifications" width="80%">
				<tr>
					<th colspan="2" align="left"><bean:message
						key="BizComposer.Configuration.Sales.Customer" /></th>
					<th>&nbsp;&nbsp;</th>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Sales.CustomerDefaultCountry" /></td>
					<td>&nbsp;&nbsp;&nbsp; <logic:present name="CountryList">
						<html:select property="custDefaultCountryID" style="width:200;">
							<html:option value="0">
								<bean:message key="BzComposer.ComboBox.Select" />
							</html:option>
							<html:options collection="CountryList" property="value"
								labelProperty="label" />
						</html:select>
					</logic:present></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><html:checkbox property="custTaxable">
						<bean:message key="BizComposer.Configuration.Sales.AllCustTaxable" />
					</html:checkbox></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<th colspan="2" align="left"><bean:message
						key="BizComposer.Configuration.Sales.InvoicePreference" /></th>
					<th>&nbsp;&nbsp;</th>
				</tr>

				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Sales.StartInvoiceNo" /></td>
					<td><html:text property="startInvoiceNo" size="20"
						maxlength="20" style="width:100;"
						onkeypress="return numbersonly(event,this.value);"></html:text></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Sales.InvoiceStyle" /></td>
					<td><logic:present name="InvStyle">
						<html:select property="invStyleID" style="width:100;">
							<html:option value="0">
								<bean:message key="BzComposer.ComboBox.Select" />
							</html:option>
							<html:options collection="InvStyle" property="value"
								labelProperty="label" />
						</html:select>
					</logic:present></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Sales.DefaultFootnote" /></td>
					<td id="dfoot"><logic:present name="Footnote">
						<html:select property="defaultFootnoteID" style="width:100;">
							<html:option value="0">
								<bean:message key="BzComposer.ComboBox.Select" />
							</html:option>
							<html:options collection="Footnote" property="value"
								labelProperty="label" />
						</html:select>
					</logic:present></td>
					<td>&nbsp; <a href="#" onclick="ShowEditFoootenote();"> <strong>
					<bean:message
						key="BizComposer.Configuration.Sales.EditFootnoteButton" /> </strong> </a></td>
				</tr>
				<tr>
					<td colspan="2"><html:checkbox property="isProductWeight">
						<bean:message
							key="BizComposer.Configuration.Sales.ShowProductWeight" />
					</html:checkbox></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2"><html:checkbox property="isCompanyName">
						<bean:message key="BizComposer.Configuration.Sales.ShowCountyName" />
					</html:checkbox></td>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<th colspan="2" align="left"><bean:message
						key="BizComposer.Configuration.Sales.InvoiceDefaultLogo" /></th>
					<th>&nbsp;</th>
				</tr>

				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Sales.SelectLogoImage" /></td>
					<td><html:file property="invoiceDefaultLogo" size="0"
						value="File" onchange="setImagePreview();"></html:file></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><img id="previewIMG" style="display:none;" /></td>
					<td>&nbsp;</td>
				</tr>

			</table>
			</div>
			<!-- sales Ends -->

			<!-- Purchase & Vendor Starts -->
			<div id="purchase" style="display:none;">
			<table class="table-notifications" width="100%">
				<tr>
					<th colspan="2" align="left"><bean:message
						key="BizComposer.Configuration.Purchase.Vendor" /></th>
					<th>&nbsp;</th>

				</tr>

				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Purchase.VendorDefaultCountry" />
					</td>
					<td><logic:present name="CountryList">
						<html:select property="vendorDefaultCountryID" style="width:200;">
							<html:option value="0">
								<bean:message key="BzComposer.ComboBox.Select" />
							</html:option>
							<html:options collection="CountryList" property="value"
								labelProperty="label" />
						</html:select>
					</logic:present></td>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<th colspan="2" align="left"><bean:message
						key="BizComposer.Configuration.Purchase.PurchaseOrderPreference" />
					</th>
					<th>&nbsp;</th>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Purchase.StartPONum" /></td>
					<td><html:text property="startPONum" size="20" maxlength="15"
						style="width:100;"
						onkeypress="return numbersonly(event,this.value);">
					</html:text></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Purchase.POStyle" /></td>
					<td><logic:present name="InvStyle">
						<html:select property="poStyleID" style="width:100;">
							<html:option value="0">
								<bean:message key="BzComposer.ComboBox.Select" />
							</html:option>
							<html:options collection="InvStyle" property="value"
								labelProperty="label" />
						</html:select>
					</logic:present></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Sales.DefaultFootnote" /></td>
					<td id="vdfoot"><logic:present name="Footnote">
						<html:select property="vendorDefaultFootnoteID" style="width:100;">
							<html:option value="0">
								<bean:message key="BzComposer.ComboBox.Select" />
							</html:option>
							<html:options collection="Footnote" property="value"
								labelProperty="label" />
						</html:select>
					</logic:present></td>
					<td valign="top">&nbsp; <a href="#"
						onclick="ShowEditFoootenote();"> <strong> <bean:message
						key="BizComposer.Configuration.Sales.EditFootnoteButton" /> </strong> </a></td>
				</tr>

			</table>
			</div>
			<!-- Purchase & Vendor Ends -->

			<!--  Inventory Starts -->
			<div id="inventory">
			<table class="table-notifications" width="100%">
				<tr>
					<th colspan="2" align="left"><bean:message
						key="BizComposer.Configuration.Inventory.Inventory" /></th>
				</tr>
				<tr>
					<td colspan="2"><html:checkbox property="productTaxable">
						<bean:message
							key="BizComposer.Configuration.Inventory.ProductTaxable" />
					</html:checkbox></td>
				</tr>
				<tr>
					<th colspan="2" align="left"><bean:message
						key="BizComposer.Configuration.Inventory.ReceivedItemPreference" />
					</th>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Inventory.StartRI" /></td>
					<td><html:text property="startRINum" style="width:100;"
						maxlength="15" onkeypress="return numbersonly(event,this.value);">

					</html:text></td>
				</tr>

			</table>
			</div>
			<!-- Inventory Ends -->

			<!-- Employee Starts-->

			<div id="employee" >
			<table width="100%">
				<tr>
					<td>
					<table class="table-notifications" width="100%">
						<tr>
							<th colspan="3" align="left"><bean:message
								key="BizComposer.Configuration.Employee.General" /></th>
						</tr>
						<tr>
							<td><bean:message
								key="BizComposer.Configuration.Employee.State" /></td>
							<td id="state"></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><bean:message
								key="BizComposer.Configuration.Employee.Country" /></td>
							<td><logic:present name="CountryList">
								<html:select property="empCountryID" style="width:200;"
									onchange="refreshItemsNow(this.value,0)">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="CountryList" property="value"
										labelProperty="label" />
								</html:select>
							</logic:present></td>
							<td>&nbsp;</td>
						</tr>


						<tr>
							<th colspan="3" align="left"><bean:message
								key="BizComposer.Configuration.Employee.JobCodeTimesheet" /></th>
						</tr>
						<tr>
							<td><bean:message
								key="BizComposer.Configuration.Employee.JobCode" /></td>
							<td colspan="2"><input type="text" size="35" name="jobcode"
								id="jcode" maxlength="35" /></td>
						</tr>
						<tr>
							<td><bean:message
								key="BizComposer.Configuration.Employee.JobCost" /></td>
							<td colspan="2"><input type="text" size="20" name="jobcost"
								id="cost" onkeypress="return numbersonly(event,this.value);"
								maxlength="10" /></td>
						</tr>
						<tr>
							<td><bean:message
								key="BizComposer.Configuration.Employee.Description" /></td>
							<td colspan="2"><input type="text" size="45" name="jobdesc"
								id="desc" maxlength="60" /></td>
						</tr>
					</table>
					</td>
				<tr>
					<td align="center">
					<div style="overflow:auto;height:200;" id="jobCodeTime" class="section-border">
					<table class="tabla-listados" cellspacing="0" border="1">
						<thead>
							<tr>
								<th class="emblem"><bean:message
									key="BizComposer.Configuration.Employee.Job" /></th>
								<th class="emblem"><bean:message
									key="BizComposer.Configuration.Employee.Cost" /></th>
								<th class="emblem"><bean:message
									key="BizComposer.Configuration.Employee.Description" /></th>
							</tr>
						</thead>
						<tbody>
							<logic:present name="JobCodeDetail">
								<bean:size name="JobCodeDetail" id="tsize" />
								<input type="hidden" id="tabsize" name="size"
									value='<bean:write name="tsize" />' />
								<logic:iterate name="JobCodeDetail" id="jobcode" indexId="index">

									<tr id='<bean:write name="index"/>$$'
										onclick="setJobValues('<bean:write name="jobcode" property="jobCodeID"/>','<bean:write name="jobcode" property="job"/>',
																	'<bean:write name="jobcode" property="cost"/>','<bean:write name="jobcode" property="description"/>',
																	'<bean:write name="index"/>$$');">
										<td><bean:write name="jobcode" property="job" /></td>
										<td align="left"><bean:write name="jobcode"
											property="cost" /></td>
										<td>&nbsp; <bean:write name="jobcode"
											property="description" /></td>
									</tr>
								</logic:iterate>
							</logic:present>
						</tbody>
					</table>
					</div>
					</td>
				</tr>
				<tr>
					<td>
					<table class="table-notifications" width="100%">
						<tr align="center">
							<td colspan="3"><input type="button" class="formButton"
								name="add" onclick="AddJobCode();"
								value='<bean:message key="BizComposer.Configuration.Employee.Add"/>' />
							<input type="button" class="formButton" name="edit"
								onclick="EditJobCode();"
								value='<bean:message key="BizComposer.Configuration.Employee.Edit"/>' />
							<input type="button" class="formButton" name="remove"
								onclick="RemoveJobCode();"
								value='<bean:message key="BizComposer.Configuration.Employee.Remove"/>' />
							<input type="button" class="formButton" name="clear"
								onclick="ClearJobField();"
								value='<bean:message key="BizComposer.Configuration.Employee.Clear"/>' />
							</td>

						</tr>

						<tr>
							<th colspan="3" align="left"><bean:message
								key="BizComposer.Configuration.Employee.TimeSheet" /></th>
						</tr>
						<tr>
							<td colspan="3"><bean:message
								key="BizComposer.Configuration.Employee.NoOfInOutTimeSheet" /><html:text
								property="timeSheet" style="width:100;" maxlength="10"
								onkeypress="return numbersonly(event,this.value);">
							</html:text></td>

						</tr>
					</table>
					</td>
				</tr>
			</table>
			</div>
			<!-- Employee Ends -->

			<!-- Tax Starts -->
			<div id="tax"><br>
			<br>
			<table class="table-notifications" width="100%">
				<tr>
					<th align="left"><bean:message
						key="BizComposer.Configuration.Tax.SalesTax" /></th>
				</tr>
				<tr>
					<td><html:checkbox property="chargeSalesTax">
						<bean:message key="BizComposer.Configuration.Tax.ChargeSalesTax" />
					</html:checkbox></td>
				</tr>
				<tr>
					<td>
					<table>
						<tr>
							<td><bean:message
								key="BizComposer.Configuration.Tax.SalesTaxType" /></td>
							<td>&nbsp;&nbsp;&nbsp; <logic:present name="SalesTax">
								<html:select property="salesTaxID" style="width:200">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="SalesTax" property="value"
										labelProperty="label" />
								</html:select>
							</logic:present></td>
						</tr>
					</table>
					</td>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.Tax.PaySalesTax" /></td>
				</tr>
				<tr>
					<td><html:radio property="howOftenSalesTax" value="1">
						<bean:message key="BizComposer.Configuration.Tax.Monthly" />
					</html:radio> &nbsp;&nbsp;&nbsp; <html:radio property="howOftenSalesTax"
						value="2">
						<bean:message key="BizComposer.Configuration.Tax.Quaterly" />
					</html:radio> &nbsp;&nbsp;&nbsp; <html:radio property="howOftenSalesTax"
						value="3">
						<bean:message key="BizComposer.Configuration.Tax.Annually" />
					</html:radio></td>
				</tr>
			</table>
			</div>
			<!-- Tax Ends -->

			<!--  Reminders Starts -->
			<div id="reminder" >
			<table class="table-notifications" width="100%">
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp; <html:checkbox
						property="showReminder">
									&nbsp;<bean:message
							key="BizComposer.Configuration.Reminders.ShowReminder" />
					</html:checkbox></td>
				</tr>
				<tr>
					<th align="left"><bean:message
						key="BizComposer.Configuration.Reminders.ReminderList" /></th>
				</tr>
				<tr>
					<td>
					<table>
						<tr>
							<td>&nbsp;</td>
							<td nowrap="nowrap"><bean:message
								key="BizComposer.Configuration.Reminders.ReminderMe" /></td>
							<td nowrap="nowrap">&nbsp;&nbsp; <bean:message
								key="BizComposer.Configuration.Reminders.DontReminderMe" /></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td nowrap="nowrap"><bean:message
								key="BizComposer.Configuration.Reminders.InvoiceCreditMemos" /></td>
							<td align="center"><html:radio property="invoiceMemo"
								value="1"></html:radio></td>

							<td align="center"><html:radio property="invoiceMemo"
								value="0"></html:radio></td>

							<td><html:text property="invoiceMemoDays" size="10"
								maxlength="7" onkeypress="return numbersonly(event,this.value);">
							</html:text></td>
							<td nowrap="nowrap"><bean:message
								key="BizComposer.Configuration.Reminders.DaysBeforeInvoiceDate" />
							</td>

						</tr>
						<tr>
							<td nowrap="nowrap"><bean:message
								key="BizComposer.Configuration.Reminders.OverdueInvoices" /></td>
							<td align="center"><html:radio property="overdueInvoice"
								value="1"></html:radio></td>
							<td align="center"><html:radio property="overdueInvoice"
								value="0"></html:radio></td>
							<td><html:text property="overdueInvoiceDays" size="10"
								maxlength="7" onkeypress="return numbersonly(event,this.value);">
							</html:text></td>
							<td nowrap="nowrap"><bean:message
								key="BizComposer.Configuration.Reminders.DaysAfterdueDate" /></td>
						</tr>
						<tr>
							<td><bean:message
								key="BizComposer.Configuration.Reminders.Inventory2Reorder" /></td>
							<td align="center"><html:radio property="inventoryOrder"
								value="1"></html:radio></td>
							<td align="center"><html:radio property="inventoryOrder"
								value="0"></html:radio></td>
							<td><html:text property="inventoryOrderDays" size="10"
								maxlength="7" onkeypress="return numbersonly(event,this.value);">
							</html:text></td>
							<td><bean:message
								key="BizComposer.Configuration.Reminders.DaysBeforedueDate" /></td>
						</tr>
						<tr>
							<td><bean:message
								key="BizComposer.Configuration.Reminders.Bills2Pay" /></td>
							<td align="center"><html:radio property="billsToPay"
								value="1"></html:radio></td>
							<td align="center"><html:radio property="billsToPay"
								value="0"></html:radio></td>
							<td><html:text property="billsToPayDays" size="10"
								maxlength="7" onkeypress="return numbersonly(event,this.value);">
							</html:text></td>
							<td><bean:message
								key="BizComposer.Configuration.Reminders.DaysBeforedueDate" /></td>
						</tr>
					</table>
					</td>
				</tr>
			</table>

			</div>
			<!-- Remainder Ends -->

			<!--  Finance charges starts -->
			<div id="finance">
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
			<div id="smtp" >
			<table class="table-notifications" width="100%">
				<tr>
					<td colspan="2"><bean:message
						key="BizComposer.Configuration.smtp.SetuploginNote" /></td>
				</tr>
				<tr>
					<th align="left" colspan="2"><bean:message
						key="BizComposer.Configuration.smtp.ServerInformation" /></th>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.smtp.SenderEmailAddr" /></td>
					<td>&nbsp;&nbsp;&nbsp; <html:text property="senderEmail"
						size="30" maxlength="45"></html:text></td>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.smtp.SMTPServer" /></td>
					<td>&nbsp;&nbsp;&nbsp; <html:text property="mailServer"
						size="30" maxlength="45"></html:text></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" name="testMailConnection"
						class="formButton" size="25" onclick="TestConnection();"
						value='<bean:message key="BizComposer.Configuration.smtp.TestConnection" />' />
					</td>
				</tr>

				<tr>
					<td colspan="2"><bean:message
						key="BizComposer.Configuration.smtp.MailServerAuthentication" /></td>
				</tr>
				<tr>
					<td colspan="2"><html:checkbox property="mailAuth"
						disabled="true" onclick="EnableDisableFields();">
						<bean:message
							key="BizComposer.Configuration.smtp.ServerRequeiresAuthentication" />
					</html:checkbox></td>
				</tr>
				<tr>
					<th align="left" colspan="2"><bean:message
						key="BizComposer.Configuration.smtp.UserInformation" /></th>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.smtp.UserName" /></td>
					<td>&nbsp;&nbsp;&nbsp; <html:text property="mailUserName"
						size="30" maxlength="45" disabled="true"></html:text></td>
				</tr>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.smtp.Password" /></td>
					<td>&nbsp;&nbsp;&nbsp; <html:text property="mailPassword"
						size="30" maxlength="35" disabled="true"></html:text></td>
				</tr>
			</table>

			</div>
			<!-- SMTP Setup Ends -->
			
			<!-- customerInvoice Starts -->
			<div id="customerInvoice" style="display:none">This is customer Invoive Div.</div>

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
					<!--  								<input type="button" name="Delete" class="formButton" onclick="DeleteServiceType();"
									value='<bean:message key="BizComposer.Configuration.ManageServiceType.Delete"/>' />
		--> <input type="button" name="Clear" class="formButton"
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
			<!-- estimation Starts -->
			<div id="estimation" style="display:none;">
				<table class="table-notifications">
				<tr>
					<th align="left" colspan="2">Estimation preference</th>
				</tr>
				<tr>
					<td>Starting Estimation Number:
					</td>
					<td><input type="text" name="txtNumber" ></td>
				</tr>
				</table>
				
			</div>
			<!-- estimation Ends -->
			
			<!-- formCustomization Starts -->
			<div id="formCustomization" style="display:none;">
			This is formCustomization div.
			</div>
			<!-- formCustomization Ends -->
			
			<!-- emailSetUp Starts -->
			<div id="emailSetUp" style="display:none;">
			This is emailSetUp div.
			</div>
			<!-- emailSetUp Ends -->
			
			<!-- shipping Starts -->
			<div id="shipping" style="display:none;">
			This is shipping div.
			</div>
			<!-- shipping Ends -->
			
			<!-- RMA Starts -->
			<div id="rma" style="display:none;">
			This is RMA div.
			</div>
			<!-- RMA Ends -->
			
			<!-- eSales Starts -->
			<div id="eSales" style="display:none;">
			This is eSales div.
			</div>
			<!-- eSales Ends -->
			
			<!-- Payment&Received Options Starts -->
			<div id="Payment&Received-Options" style="display:none;">
			This is Payment&Received Option div.
			</div>
			<!-- Payment&Received Options Ends -->
			
			<!-- MySQL Configuration Starts -->
			<div id="MySQLConfiguration" style="display:none;">
			<%@include file="mySqlConfiguration.jsp"%>
			</div>
			<!-- MySQL Configuration Ends -->
			
			<!-- Device Manager Starts -->
			<div id="deviceManager" style="display:none;">
			Customize your machine for Bar code scanner
			</div>
			<!-- Device Manager Ends -->
			
			<!-- Payment Gateway Starts -->
			<div id="paymentGateway" style="display:none;">
			This is Payment Gateway div.
			</div>
			<!-- Payment Gateway Ends -->
			
			<!-- Printer Setup Starts -->
			<div id="printerSetup" style="display:none;">
			This is Printer Setup div.
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
			</td>
		</tr>
	</table>
	<div><html:hidden property="empStateID" /> <html:hidden
		property="labelName" /> <html:hidden property="fileName" /></div>
	<div><input type="hidden" name="tabid" id="tid" value="" /></div>
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

<script type="text/javascript">
	
	jid=0;
	servid=0;
	
	function CheckPerformance(){
		perform_value = document.configurationForm.userDefinePerform.value;
		if(perform_value =="" || perform_value == "0"){
			alert('<bean:message key="BizComposer.Configuration.Performance.UserDefineValue.Validation" />');
			document.configurationForm.userDefinePerform.value = "";
			document.configurationForm.userDefinePerform.focus();
		}
		else{
			performance = parseInt(document.configurationForm.userDefinePerform.value);
			if(performance <=10000){
				document.configurationForm.userDefinePerform.value = 10001;
				
			}
		}		
	}

	function EnableDisableFields(){
		if(document.configurationForm.mailAuth.checked==true){
			document.configurationForm.mailUserName.disabled=false;
			document.configurationForm.mailPassword.disabled=false;
		}
		else{
			document.configurationForm.mailUserName.disabled=true;
			document.configurationForm.mailPassword.disabled=true;
		}
	}
	
	function SetLabelName(lblid){
		size = document.getElementById('lblsize').value;
		for(cnt=0;cnt<size;cnt++){
			lid = document.getElementById(cnt+'lid').value;
			if(lblid == lid){
				document.configurationForm.labelName.value =  document.getElementById(cnt+'lname').value;
				break;
			}
		}
	}
	
	function SetRow(rid){
		setTableVisible(rid);
	}
	
	function setTableVisible(rid){
		debugger;
		if(rid=="tr1"){
			document.getElementById('general').style.display='block';
			document.getElementById('customerInvoice').style.display='none';
			document.getElementById('shipping').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('shipping').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='block';
			document.getElementById('img3').style.display='none';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
			
		}
		else if(rid=="tr2" )
		{
			document.getElementById('general').style.display='block';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('shipping').style.display='none';
			document.getElementById('customerInvoice').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='none';
			document.getElementById('img4').style.display='block';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}	
		else if(rid=="tr3"){
			document.getElementById('Account&Payment').style.display='block';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('customerInvoice').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('shipping').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='none';
			document.getElementById('img6').style.display='block';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		else if(rid=="tr4"){
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('customerInvoice').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('shipping').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('nw').style.display='block';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='none';
			document.getElementById('img8').style.display='block';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		else if(rid=="tr5"){
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('billing').style.display='block';
			document.getElementById('customerInvoice').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('shipping').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='none';
			document.getElementById('img10').style.display='block';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		else if(rid=="tr6"){
			document.getElementById("customerInvoice").style.display='block';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('shipping').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='none';
			document.getElementById('img12').style.display='block';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		else if(rid=="tr7"){
			document.getElementById('estimation').style.display='block';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('customerInvoice').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('shipping').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='none';
			document.getElementById('img14').style.display='block';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		else if(rid=="tr8"){
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('shipping').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='block';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='none';
			document.getElementById('img16').style.display='block';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
			
		}
		else if(rid=="tr9"){
			document.getElementById('formCustomization').style.display='block';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('shipping').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='none';
			document.getElementById('img18').style.display='block';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
			
		}
		else if(rid=="tr10"){
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='block';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('shipping').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='none';
			document.getElementById('img20').style.display='block';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
			
		}
		else if(rid=="tr11"){
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('shipping').style.display='none';
			document.getElementById('employee').style.display='block';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='none';
			document.getElementById('img22').style.display='block';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
			
		}
		else if(rid=="tr12"){
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='block';
			document.getElementById('reminder').style.display='none';
			document.getElementById('shipping').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='none';
			document.getElementById('img24').style.display='block';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
			
		}
		else if(rid=="tr13"){
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('shipping').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='block';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='none';
			document.getElementById('img26').style.display='block';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
			
		}
		else if(rid=="tr14" )
		{
			document.getElementById('emailSetUp').style.display='block';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('shipping').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='none';
			document.getElementById('img28').style.display='block';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		
		else if(rid=="tr15")
		{
			document.getElementById('shipping').style.display='block';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='none';
			document.getElementById('img30').style.display='block';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		
		else if(rid=="tr16")
		{
			document.getElementById('shipping').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='block';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='none';
			document.getElementById('img32').style.display='block';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		
		else if(rid=="tr17")
		{
			document.getElementById('shipping').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='block';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='none';
			document.getElementById('img34').style.display='block';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		
		else if(rid=="tr18")
		{
			document.getElementById('shipping').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='block';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='none';
			document.getElementById('img36').style.display='block';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		
		else if(rid=="tr19")
		{
			document.getElementById('shipping').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='block';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='none';
			document.getElementById('img38').style.display='block';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		
		else if(rid=="tr20")
		{
			document.getElementById('shipping').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='block';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='none';
			document.getElementById('img40').style.display='block';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		
		else if(rid=="tr21")
		{
			document.getElementById('shipping').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='block';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='none';
			document.getElementById('img42').style.display='block';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		
		else if(rid=="tr22")
		{
			document.getElementById('shipping').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='block';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='none';
			document.getElementById('img44').style.display='block';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		
		else if(rid=="tr23")
		{
			document.getElementById('shipping').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='block';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='none';
			document.getElementById('img46').style.display='block';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		
		else if(rid=="tr24")
		{
			document.getElementById('shipping').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='block';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='none';
			document.getElementById('img48').style.display='block';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		
		else if(rid=="tr25")
		{
			document.getElementById('shipping').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='block';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='none';
			document.getElementById('img50').style.display='block';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		
		else if(rid=="tr26")
		{
			document.getElementById('shipping').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='block';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='none';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='none';
			document.getElementById('img52').style.display='block';
			document.getElementById('img53').style.display='block';
			document.getElementById('img54').style.display='none';
		}
		
		else if(rid=="tr27")
		{
			document.getElementById('shipping').style.display='none';
			document.getElementById('emailSetUp').style.display='none';
			document.getElementById('formCustomization').style.display='none';
			document.getElementById('Account&Payment').style.display='none';
			document.getElementById('estimation').style.display='none';
			document.getElementById('billing').style.display='none';
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
			document.getElementById('rma').style.display='none';
			document.getElementById('Payment&Received-Options').style.display='none';
			document.getElementById('MySQLConfiguration').style.display='none';
			document.getElementById('deviceManager').style.display='none';
			document.getElementById('paymentGateway').style.display='none';
			document.getElementById('printerSetup').style.display='none';
			document.getElementById('dashboard').style.display='block';
			
			document.getElementById('img1').style.display='none';
			document.getElementById('img2').style.display='none';
			document.getElementById('img3').style.display='block';
			document.getElementById('img4').style.display='none';
			document.getElementById('img5').style.display='block';
			document.getElementById('img6').style.display='none';
			document.getElementById('img7').style.display='block';
			document.getElementById('img8').style.display='none';
			document.getElementById('img9').style.display='block';
			document.getElementById('img10').style.display='none';
			document.getElementById('img11').style.display='block';
			document.getElementById('img12').style.display='none';
			document.getElementById('img13').style.display='block';
			document.getElementById('img14').style.display='none';
			document.getElementById('img15').style.display='block';
			document.getElementById('img16').style.display='none';
			document.getElementById('img17').style.display='block';
			document.getElementById('img18').style.display='none';
			document.getElementById('img19').style.display='block';
			document.getElementById('img20').style.display='none';
			document.getElementById('img21').style.display='block';
			document.getElementById('img22').style.display='none';
			document.getElementById('img23').style.display='block';
			document.getElementById('img24').style.display='none';
			document.getElementById('img25').style.display='block';
			document.getElementById('img26').style.display='none';
			document.getElementById('img27').style.display='block';
			document.getElementById('img28').style.display='none';
			document.getElementById('img29').style.display='block';
			document.getElementById('img30').style.display='none';
			document.getElementById('img31').style.display='block';
			document.getElementById('img32').style.display='none';
			document.getElementById('img33').style.display='block';
			document.getElementById('img34').style.display='none';
			document.getElementById('img35').style.display='block';
			document.getElementById('img36').style.display='none';
			document.getElementById('img37').style.display='block';
			document.getElementById('img38').style.display='none';
			document.getElementById('img39').style.display='block';
			document.getElementById('img40').style.display='none';
			document.getElementById('img41').style.display='block';
			document.getElementById('img42').style.display='none';
			document.getElementById('img43').style.display='block';
			document.getElementById('img44').style.display='none';
			document.getElementById('img45').style.display='block';
			document.getElementById('img46').style.display='none';
			document.getElementById('img47').style.display='block';
			document.getElementById('img48').style.display='none';
			document.getElementById('img49').style.display='block';
			document.getElementById('img50').style.display='none';
			document.getElementById('img51').style.display='block';
			document.getElementById('img52').style.display='none';
			document.getElementById('img53').style.display='none';
			document.getElementById('img54').style.display='block';
		}
		
	}
	
	function setJobValues(jobid,job,cost,desc,rid){
		size = document.getElementById('tabsize').value;
		for(i=0;i<size;i++){
			var row1=document.getElementById(i+"$$");
			row1.className = "";
		}
		var rd=document.getElementById(rid);
		rd.className = "draft";
		document.getElementById('jcode').value = job;
		document.getElementById('cost').value = cost;
		document.getElementById('desc').value = desc;
		jid = jobid;
	}
	
	function ClearJobField(){
		document.getElementById('jcode').value = "";
		document.getElementById('cost').value = "";
		document.getElementById('desc').value = "";
		
		size = document.getElementById('tabsize').value;
		for(i=0;i<size;i++){
			var row1=document.getElementById(i+"$$");
			row1.className = "";
		}
		jid=0;
		document.getElementById('jcode').focus();
	}
	
	function SetRowColor(rid){
		for(i=1;i<=12;i++){
			var row1=document.getElementById("tr"+i);
			if(row1.className == "draft")
				row1.className = "draft";
			else
				row1.style.background  = '#FFFFFF';
		}
		var rd=document.getElementById(rid);
		rd.style.background = '#8798DE';
	}
	
	function init(){
		
		SetRow('tr1');
		setLogo();
		<logic:present name="EmpState">
			refreshItemsNow(document.configurationForm.empCountryID.value,'<bean:write name="EmpState"/>');
		</logic:present>
		EnableDisableFields();
	}
	
	function setImagePreview(){
		pathv = document.configurationForm.invoiceDefaultLogo.value;
		image = document.getElementById('previewIMG');
		if(window.event){
			path = pathv.replace(/\\/, '/');
		}
		else{
			path = 'File:\/\/' + pathv;
		}
		image.src=path;
		image.style.display = 'block';
		image.style.width = "150px";
		image.style.height = "150px";
	}
	
	function setLogo(){
		image = document.getElementById('previewIMG');
		<logic:present name="path">
			<logic:present name="Image">
				<logic:notEmpty name="Image">
					path = '<bean:write name="path" scope="session" property="pathvalue"/>/uploadedImages/'+
						'<bean:write name="Image"/>';
					path = path.replace(/\\/, '/');
					image.src=path;
					image.style.display = 'block';
					image.style.width = "150px";
					image.style.height = "150px";
				</logic:notEmpty>
			</logic:present>
		</logic:present>
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
	
	function ShowEditFoootenote(){
		/*if(window.showModalDialog){
			window.showModalDialog("Configuration.do?tabid=ShowEditFootnote","BizComposer - Select Footnote to be printed","dialogWidth:600px;dialogHeight:600px");
		}
		else*/
			window.open("Configuration.do?tabid=ShowEditFootnote",null,"scrollbars=yes,height=400,width=600,status=yes,toolbar=no,menubar=no,location=no,modal=yes");
	}
	
	function RevokeValues(){
		document.getElementById('tid').value="config";
		document.forms[0].action = "Configuration.do";
		document.forms[0].submit();
	}
	
	function SaveValues(){
		if(confirm('<bean:message key="BizComposer.Configuration.SaveConfirm"/>')){
			document.configurationForm.annualInterestRate.value = wxToFixed(document.configurationForm.annualInterestRate.value,2);
			document.configurationForm.minCharge.value = wxToFixed(document.configurationForm.minCharge.value,2);
			
			document.configurationForm.startInvoiceNo.value = parseInt(document.configurationForm.startInvoiceNo.value);	
			document.configurationForm.startPONum.value = parseInt(document.configurationForm.startPONum.value);
			document.configurationForm.startRINum.value = parseInt(document.configurationForm.startRINum.value);
			document.configurationForm.timeSheet.value = parseInt(document.configurationForm.timeSheet.value);
			
			document.configurationForm.invoiceMemoDays.value = parseInt(document.configurationForm.invoiceMemoDays.value);
			document.configurationForm.overdueInvoiceDays.value = parseInt(document.configurationForm.overdueInvoiceDays.value);
			document.configurationForm.inventoryOrderDays.value = parseInt(document.configurationForm.inventoryOrderDays.value);
			document.configurationForm.billsToPayDays.value = parseInt(document.configurationForm.billsToPayDays.value);
			document.configurationForm.gracePeriod.value = parseInt(document.configurationForm.gracePeriod.value);
			
			performance_value = document.configurationForm.userDefinePerform.value;
			if(document.configurationForm.timeSheet.value <2){
				document.configurationForm.timeSheet.value = 2;
			}
			if(performance_value == "" || parseInt(performance_value) <= 10000 || (!IsNumeric(performance_value))){
				document.configurationForm.userDefinePerform.value = 10001;
				
			}
			document.getElementById('tid').value="SaveConfiguration";
			document.forms[0].action = "Configuration.do";
			document.forms[0].submit();
		}
	}
	
	function ShowBackupOption(){
		if(window.showModalDialog){
			window.showModalDialog("Configuration.do?tabid=BackupOption","BizComposer - Select Footnote to be printed","dialogWidth:600px;dialogHeight:600px");
		}
		else
			window.open("Configuration.do?tabid=BackupOption",null,"scrollbars=yes,height=400,width=550,status=yes,toolbar=no,menubar=no,location=no,modal=yes");

	}
	
	function IsNumeric(stext){
	   var validchars = "0123456789";
	   var isnumber=true;
	   var ch;
	   for (i = 0; i < stext.length && isnumber == true; i++){ 
	      ch = stext.charAt(i); 
    	  if (validchars.indexOf(ch) == -1){
	         isnumber = false;
    	  }
       }
	   return isnumber;
   }
   
</script>
<script type="text/javascript">
function numbersonly(e,val)
{
var temp=val.indexOf(".");

var unicode=e.charCode? e.charCode : e.keyCode;


if (unicode!=8)
{
 //if the key isn't the backspace key (which we should allow)

if(unicode==46 && temp==-1)
{
 return true;
} 
else 
if (unicode<48||unicode>57) //if not a number
return false; //disable key press

}
}

function wxToFixed(value,digits)
{
    factor = Math.pow(10,digits);
    fixed = ( Math.floor(value * factor + 0.5) ) / factor;
    fixedString = ''+fixed; // toString is JavaScript 1.1
    decimalPosition = fixedString.indexOf('.');
    if ( decimalPosition == -1 )
    {
        decimalsLength = 0;
        if ( digits > 0 )
        {
            fixedString = fixedString + '.';
        }
    }
    else
    {
        decimalsLength = (fixedString.substr(decimalPosition + 1)).length;
    }
    numZerosAppend = digits - decimalsLength;
    for ( i = 0; i < numZerosAppend; i++ )
    {
        fixedString = fixedString + '0';
    }
    return fixedString;
}

</script>
