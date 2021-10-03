
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>

<html>
<head>
<script>
	window.self.resizeTo(900,600);
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title><bean:message
	key="BizComposer.Email.AmazonBulkMailer.SetPreferences.Title" /></title>

<script type="text/javascript">
	
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
		d = new Date();
		var host = document.configurationForm.mailServer.value;
		oEmail = c(CheckEmailConnection);
		oGET(oEmail,'<bean:write name="path" property="pathvalue"/>/include/testMailServerConnection.jsp?HostName='+host+'&Date='+d);
	}
	
	/*Magage Service Type */
	
	function SelectService(){
		if (oT.readyState != 4 || oT.status != 200) { 
    	  return;
    	}
    	var res = trim(oT.responseText);
    	var records=res.split("!!");
		var index=0;
		var sid = 0;
		if(index< records.length){
		//	sid=records[index];
			index++;
    		document.getElementById("ServiceTable").innerHTML = "";
    		alert(records[index]);
	        document.getElementById("ServiceTable").innerHTML = records[index];
	        
	    }
		/*setValues();*/
		/*serids[count]=sid;
		servicename[count]=nm;
		count++;*/
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
	    document.getElementById("ServiceTable").innerHTML = "";
	    document.getElementById("ServiceTable").innerHTML = oT.responseText ;
	   // setValues();
//	    addServiceName();
	}
	
	function EditService(servid,name,invid){
		d = new Date();
//		deleteServiceName();
		oT = c(SelectEditService);
		oGET(oT,'<bean:write name="path" property="pathvalue"/>/include/'+
						'manageServiceType.jsp?action=Edit&SName='+name+'&InvStyleId='+invid+'&ServiceID='+servid+'&Date='+d);
	}
	
	function SelectDeleteService(){
		if (oT.readyState != 4 || oT.status != 200) { 
    	  return;
    	}
	    document.getElementById("ServiceTable").innerHTML = "";
	    document.getElementById("ServiceTable").innerHTML = oT.responseText ;
	    //setValues();
	}
	
	function DeleteService(servid){
		d = new Date();
		//deleteServiceName();
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
	
		code = document.getElementById('jcode').value;
		if(code==""){
			alert('<bean:message key="BizComposer.Configuration.Employee.Add.JobCodeNotEmptyValidation" />');
			document.getElementById('jcode').focus();
		}
		else{
			cst = document.getElementById('cost').value;
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
			code = document.getElementById('jcode').value;
			if(code==""){
				alert('<bean:message key="BizComposer.Configuration.Employee.Add.JobCodeNotEmptyValidation" />');
				document.getElementById('jcode').focus();
			}
			else{
				cst = document.getElementById('cost').value;
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
	   // Removes leading carriage return from the passed string. Also removes
	   // consecutive carriage return.
	   var retValue = inputString;
	   var ch = retValue.substring(0, 1);
	   while (ch == "\n" || ch == "\r" || ch==" " || ch=="\t" ) { // Check for carriage return at the beginning of the string
    	  retValue = retValue.substring(1, retValue.length);
	      ch = retValue.substring(0, 1);
	   }
	   return retValue; 
	}
	
	function ShowSetPreference(){
		document.forms[0].action="Configuration.do?tabid=ShowSetPreference";
		document.forms[0].submit();
	}
	
	function SetColor(liId){
		 
	}

</script>
</head>
<body onload="init();">



<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA"
	method="post">

	</div>

	<div id="pointermenu"></div>

	<div id="breadcrumb">

	<div class="clear"></div>

	</div>

	<div id="cos">

	<div class="statusquo ok">

	<div id="hoja">
	<div id="blanquito">
	<div id="padding"><!-- begin Contents --> <span id="waitMessage"> <img
		src='<bean:write name="path" property="pathvalue"/>/images/spinner.gif'>
	Loading Contents...</span>

	<div><span
		style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"></span></div>
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
	<table cellspacing="0">

		<tr>
			<td valign="top">
			<table style="width:675;" cellpadding="0" cellspacing="0">
				<tr>
					<td>
					<div id="ddcolortabs">
					<ul>
						<li id="tr7" onmouseover="SetColor(this);"
							onclick="SetRow('tr7');"><a><span><bean:message
							key="BizComposer.Configuration.Tax" /></span></a></li>
						<li id="tr8" onclick="SetRow('tr8');"><a><span><bean:message
							key="BizComposer.Configuration.Reminders" /></span></a></li>
						<li id="tr9" onclick="SetRow('tr9');"><a><span><bean:message
							key="BizComposer.Configuration.FinanceCharges" /></span></a></li>
						<li id="tr10" style="margin-left: 1px" onclick="SetRow('tr10');">
						<a><span><bean:message key="BizComposer.Configuration.SMTPSetup" /></span></a>
						</li>
						<li id="tr11" onclick="SetRow('tr11');"><a><span><bean:message
							key="BizComposer.Configuration.Performance" /></span></a></li>
						<li id="tr12" onclick="SetRow('tr12');"><a><span><bean:message
							key="BizComposer.Configuration.ManageServiceType" /></span></a>
						</li>
					</ul>
					</div>
					<hr width="590" align="left">
					<div id="ddcolortabs">
					<ul>
						<li id="tr1" onclick="SetRow('tr1');"
							onmouseover="SetColor(this);"><a><span><bean:message
							key="BizComposer.Configuration.General" /></span></a></li>
						<li id="tr2" onclick="SetRow('tr2');"><a><span><bean:message
							key="BizComposer.Configuration.Networking&Security" /></span></a>
						</li>
						<li id="tr3" onclick="SetRow('tr3');"><a><span><bean:message
							key="BizComposer.Configuration.Sales&Customer" /></span></a></li>
						<li id="tr4" onclick="SetRow('tr4');"><a><span><bean:message
							key="BizComposer.Configuration.Purchase&Vendor" /></span></a></li>
						<li id="tr5" onclick="SetRow('tr5');"><a><span><bean:message
							key="BizComposer.Configuration.Inventory" /></span></a></li>
						<li id="tr6" onclick="SetRow('tr6');"><a><span><bean:message
							key="BizComposer.Configuration.Employee" /></span></a></li>
					</ul>
					</div>

					</td>
				</tr>
				<tr>
					<td>
					<fieldset><!-- General -->
					<div id="general">
					<table>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;<strong><bean:message
								key="BizComposer.Configuration.General" /></strong>
							<fieldset>
							<table>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <bean:message
										key="BizComposer.Configuration.Currency" /></td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<html:select property="currencyID" style="width:200">
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
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <bean:message
										key="BizComposer.Configuration.Weight" /></td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<html:select property="weightID" style="width:200">
										<html:option value="0">Select</html:option>
										<html:option value="1">Pound</html:option>
										<html:option value="2">Once</html:option>
										<html:option value="3">Kg</html:option>
										<html:option value="4">g</html:option>
									</html:select></td>
								</tr>
							</table>
							</fieldset>
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>

						<tr>
							<td>&nbsp;&nbsp;&nbsp;<strong> <bean:message
								key="BizComposer.Configuration.AddressLabel" /> </strong>
							<fieldset>
							<table>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <bean:message
										key="BizComposer.amazonBulkMailer.SetPreferences.Genral.ChooseLabel" />
									</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <logic:present
										name="Labels">
										<html:select property="defaultLabelID"
											onchange="SetLabelName(this.value);" style="width:200">
											<html:optionsCollection name="Labels" />
										</html:select>
									</logic:present></td>
								</tr>
							</table>
							</fieldset>
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;<strong> <bean:message
								key="BizComposer.amazonBulkMailer.SetPreferences.Genral.BackupData" />
							</strong>
							<fieldset>
							<table>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <bean:message
										key="BizComposer.amazonBulkMailer.SetPreferences.Genral.BackupPeriod" />
									</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <html:select
										property="backupPeriod" style="width:200">
										<html:option value="">Select</html:option>
										<html:option value="Daily">Daily</html:option>
										<html:option value="Weekly">Weekly</html:option>
										<html:option value="Bi-Weekly">Bi-Weekly</html:option>
										<html:option value="Monthly">Monthly</html:option>
										<html:option value="Quaterly">Quaterly</html:option>
									</html:select></td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <bean:message
										key="BizComposer.amazonBulkMailer.SetPreferences.Genral.BackupPlace" />
									</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <html:text
										property="backupPlace" style="width:200" maxlength="45"></html:text>
									</td>
								</tr>

							</table>
							</fieldset>
							</td>
						</tr>
					</table>
					</div>

					<!--  Networking & Security -->
					<div id="nw"
						style="display:none;overflow:auto;height:400;width:600;">
					<table>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.Configuration.Networking.Administrator" /> </strong>
							<fieldset>
							<table>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <bean:message
										key="BizComposer.Configuration.Networking.UserName" /></td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <html:text
										property="userName" size="20" maxlength="30"></html:text></td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <bean:message
										key="BizComposer.Configuration.Networking.Password" /></td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <html:text
										property="password" size="20" maxlength="30"></html:text></td>
								</tr>
							</table>
							</fieldset>
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.amazonBulkMailer.SetPreferences.Networking.SingleMultiUser" />
							</strong>
							<fieldset>
							<div align="center">
							<table>
								<tr>
									<td><html:radio property="multiUserConnection" value="0">
										<bean:message
											key="BizComposer.amazonBulkMailer.SetPreferences.Networking.SingleMode" />
									</html:radio> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <html:radio
										property="multiUserConnection" value="1">
										<bean:message
											key="BizComposer.amazonBulkMailer.SetPreferences.Networking.MultiMode" />
									</html:radio></td>
								</tr>
							</table>
							</div>
							</fieldset>
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.Configuration.Networking.Users" /> </strong>
							<fieldset>
							<table>
								<tr>
									<td>&nbsp;</td>
									<td>
									<div align="center"><bean:message
										key="BizComposer.amazonBulkMailer.SetPreferences.Networking.UserName" />
									</div>
									</td>
									<td>
									<div align="center"><bean:message
										key="BizComposer.amazonBulkMailer.SetPreferences.Networking.Password" />
									</div>
									</td>

								</tr>
								<tr>
									<td>
									<div align="center"><bean:message
										key="BizComposer.amazonBulkMailer.SetPreferences.Networking.User1Label" />
									</div>
									</td>
									<td><input type="text" size="25" /></td>
									<td>&nbsp;&nbsp;&nbsp; <input type="text" size="25" /></td>


								</tr>
								<tr>
									<td>
									<div align="center"><bean:message
										key="BizComposer.amazonBulkMailer.SetPreferences.Networking.User2Label" />
									</div>
									</td>
									<td><input type="text" size="25" /></td>
									<td>&nbsp;&nbsp;&nbsp; <input type="text" size="25" /></td>


								</tr>
								<tr>
									<td>
									<div align="center"><bean:message
										key="BizComposer.amazonBulkMailer.SetPreferences.Networking.User3Label" />
									</div>
									</td>
									<td><input type="text" size="25" /></td>
									<td>&nbsp;&nbsp;&nbsp; <input type="text" size="25" /></td>


								</tr>
								<tr>
									<td>
									<div align="center"><bean:message
										key="BizComposer.amazonBulkMailer.SetPreferences.Networking.User4Label" />
									</div>
									</td>
									<td><input type="text" size="25" /></td>
									<td>&nbsp;&nbsp;&nbsp; <input type="text" size="25" /></td>
								</tr>

							</table>
							</fieldset>
							</td>
						</tr>
					</table>
					</div>

					<!-- Sales & Customer  -->
					<div id="sales"
						style="display:none;overflow:auto;height:400;width:600;">
					<table>
						<tr>
							<td nowrap="nowrap">
							<table>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
										key="BizComposer.Configuration.Sales.Customer" /> </strong>
									<fieldset>
									<table>
										<tr>
											<td><bean:message
												key="BizComposer.amazonBulkMailer.SetPreferences.Sales.PreferedCountry" />
											</td>
											<td>&nbsp;&nbsp;&nbsp; <logic:present name="CountryList">
												<html:select property="custDefaultCountryID"
													style="width:200;">
													<html:option value="0">
														<bean:message key="BzComposer.ComboBox.Select" />
													</html:option>
													<html:options collection="CountryList" property="value"
														labelProperty="label" />
												</html:select>
											</logic:present></td>
										</tr>
										<tr>
											<td><html:checkbox property="custTaxable">
												<bean:message
													key="BizComposer.Configuration.Sales.AllCustTaxable" />
											</html:checkbox></td>
											<td>&nbsp;</td>
										</tr>
									</table>
									<table>
										<tr>
											<td><html:checkbox property="personPrefer">
												<bean:message
													key="BizComposer.amazonBulkMailer.SetPreferences.Sales.PreferedPersonName" />
											</html:checkbox></td>
											<td>&nbsp;</td>
										</tr>
									</table>
									</fieldset>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>

								</tr>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
										key="BizComposer.Configuration.Sales.InvoicePreference" /> </strong>
									<fieldset>
									<table>
										<tr>
											<td><bean:message
												key="BizComposer.Configuration.Sales.StartInvoiceNo" /></td>
											<td>&nbsp;&nbsp;&nbsp; <html:text property="startInvoiceNo"
												size="20" maxlength="20" style="width:100;"
												onkeypress="return numbersonly(event,this.value);"></html:text>
											</td>
										</tr>
										<tr>
											<td><bean:message
												key="BizComposer.Configuration.Sales.InvoiceStyle" /></td>
											<td>&nbsp;&nbsp;&nbsp; <logic:present name="InvStyle">
												<html:select property="invStyleID" style="width:100;">
													<html:option value="0">
														<bean:message key="BzComposer.ComboBox.Select" />
													</html:option>
													<html:options collection="InvStyle" property="value"
														labelProperty="label" />
												</html:select>
											</logic:present></td>
										</tr>
										<tr>
											<td><bean:message
												key="BizComposer.Configuration.Sales.DefaultFootnote" /></td>
											<td id="dfoot">&nbsp;&nbsp;&nbsp; <logic:present
												name="Footnote">
												<html:select property="defaultFootnoteID" style="width:100;">
													<html:option value="0">
														<bean:message key="BzComposer.ComboBox.Select" />
													</html:option>
													<html:options collection="Footnote" property="value"
														labelProperty="label" />
												</html:select>
											</logic:present></td>
											<td><input type="button" class="formButton"
												name="EditFootnote" onclick="ShowEditFoootenote();"
												value='<bean:message key="BizComposer.Configuration.Sales.EditFootnoteButton"/>' />
											</td>
										</tr>
										<tr>
											<td><html:checkbox property="isProductWeight">
												<bean:message
													key="BizComposer.amazonBulkMailer.SetPreferences.Sales.ProductWeight" />
											</html:checkbox></td>
										</tr>
										<tr>
											<td><html:checkbox property="shippingTable">
												<bean:message
													key="BizComposer.amazonBulkMailer.SetPreferences.Sales.ShippingTable" />
											</html:checkbox></td>
										</tr>
										<tr>
											<td><html:checkbox property="isCompanyName">
												<bean:message
													key="BizComposer.amazonBulkMailer.SetPreferences.Sales.CompanyName" />
											</html:checkbox></td>
										</tr>

									</table>
									</fieldset>
									</td>
								</tr>
							</table>
							</td>
							<td valign="top">
							<table>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
										key="BizComposer.Configuration.Sales.InvoiceDefaultLogo" /> </strong>
									<fieldset>
									<table>
										<tr>
											<td><bean:message
												key="BizComposer.Configuration.Sales.SelectLogoImage" /></td>
											<td>&nbsp;&nbsp;&nbsp; <html:file
												property="invoiceDefaultLogo" size="0" value="File"
												onchange="setImagePreview();"></html:file></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><img id="previewIMG" style="display:none;" /></td>
										</tr>
									</table>
									</fieldset>
									</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
					</div>

					<!-- Purchase & Vendor -->
					<div id="purchase"
						style="display:none;overflow:auto;height:400;width:600;">
					<table>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.Configuration.Purchase.Vendor" /> </strong>
							<fieldset>
							<table>
								<tr>
									<td><bean:message
										key="BizComposer.amazonBulkMailer.SetPreferences.Sales.PreferedCountry" />
									</td>
									<td>&nbsp;&nbsp;&nbsp; <logic:present name="CountryList">
										<html:select property="vendorDefaultCountryID"
											style="width:200;">
											<html:option value="0">
												<bean:message key="BzComposer.ComboBox.Select" />
											</html:option>
											<html:options collection="CountryList" property="value"
												labelProperty="label" />
										</html:select>
									</logic:present></td>
								</tr>

							</table>
							</fieldset>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.Configuration.Purchase.PurchaseOrderPreference" />
							</strong>
							<fieldset>
							<table>
								<tr>
									<td><bean:message
										key="BizComposer.Configuration.Purchase.StartPONum" /></td>
									<td>&nbsp;&nbsp;&nbsp; <html:text property="startPONum"
										size="20" maxlength="15" style="width:100;"
										onkeypress="return numbersonly(event,this.value);">
									</html:text></td>
								</tr>
								<tr>
									<td><bean:message
										key="BizComposer.Configuration.Purchase.POStyle" /></td>
									<td>&nbsp;&nbsp;&nbsp; <logic:present name="InvStyle">
										<html:select property="poStyleID" style="width:100;">
											<html:option value="0">
												<bean:message key="BzComposer.ComboBox.Select" />
											</html:option>
											<html:options collection="InvStyle" property="value"
												labelProperty="label" />
										</html:select>
									</logic:present></td>
								</tr>
								<tr>
									<td><bean:message
										key="BizComposer.Configuration.Sales.DefaultFootnote" /></td>
									<td id="vdfoot">&nbsp;&nbsp;&nbsp; <logic:present
										name="Footnote">
										<html:select property="vendorDefaultFootnoteID"
											style="width:100;">
											<html:option value="0">
												<bean:message key="BzComposer.ComboBox.Select" />
											</html:option>
											<html:options collection="Footnote" property="value"
												labelProperty="label" />
										</html:select>
									</logic:present></td>
									<td><input type="button" class="formButton" name="EditFootnote"
										onclick="ShowEditFoootenote();"
										value='<bean:message key="BizComposer.Configuration.Sales.EditFootnoteButton"/>' />
									</td>
								</tr>
							</table>
							</fieldset>
							</td>
						</tr>
					</table>
					</div>


					<!--  Inventory -->
					<div id="inventory">
					<table>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.Configuration.Inventory.Inventory" /> </strong>
							<fieldset>
							<table>
								<tr>
									<td><html:checkbox property="productTaxable">
										<bean:message
											key="BizComposer.Configuration.Inventory.ProductTaxable" />
									</html:checkbox></td>
								</tr>
							</table>
							</fieldset>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.Configuration.Inventory.ReceivedItemPreference" />
							</strong>
							<fieldset>
							<table>
								<tr>
									<td><bean:message
										key="BizComposer.Configuration.Inventory.StartRI" /></td>
									<td>&nbsp;&nbsp;&nbsp; <html:text property="startRINum"
										style="width:100;" maxlength="15"
										onkeypress="return numbersonly(event,this.value);">

									</html:text></td>
								</tr>
							</table>
							</fieldset>
							</td>
						</tr>
					</table>
					</div>

					<!-- Employee -->

					<div id="employee" style="overflow:auto;height:400;width:600;">
					<table>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.Configuration.Employee.General" /> </strong>
							<fieldset>
							<table>
								<tr>
									<td><bean:message
										key="BizComposer.Configuration.Employee.State" /></td>
									<td id="state"></td>
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
								</tr>

							</table>
							</fieldset>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.Configuration.Employee.JobCodeTimesheet" /> </strong>
							<fieldset>
							<table>
								<tr>
									<td>
									<table>
										<tr>
											<td><bean:message
												key="BizComposer.Configuration.Employee.JobCode" /></td>
											<td>&nbsp;&nbsp;&nbsp; <input type="text" size="35"
												name="jobcode" id="jcode" maxlength="35" /></td>
										</tr>
										<tr>
											<td><bean:message
												key="BizComposer.Configuration.Employee.JobCost" /></td>
											<td>&nbsp;&nbsp;&nbsp; <input type="text" size="20"
												name="jobcost" id="cost"
												onkeypress="return numbersonly(event,this.value);"
												maxlength="10" /></td>
										</tr>
										<tr>
											<td><bean:message
												key="BizComposer.Configuration.Employee.Description" /></td>
											<td>&nbsp;&nbsp;&nbsp; <input type="text" size="45"
												name="jobdesc" id="desc" maxlength="60" /></td>
										</tr>
									</table>
									</td>
								</tr>
								<tr align="center">
									<td id="job_desc" align="center">
									<div align="center" style="overflow:auto;height:150;width:400"
										id="jobCodeTime">
									<table class="tabla-listados" border="1" cellspacing="0">
										<thead>
											<tr>
												<th colspan="3">
												<div align="center"><bean:message
													key="BizComposer.Configuration.Employee.Job" /></div>
												</th>
												<th colspan="3">
												<div align="center"><bean:message
													key="BizComposer.Configuration.Employee.Cost" /></div>
												</th>
												<th colspan="3">
												<div align="center"><bean:message
													key="BizComposer.Configuration.Employee.Description" /></div>
												</th>
											</tr>
										</thead>

										<tbody>

											<logic:present name="JobCodeDetail">
												<bean:size name="JobCodeDetail" id="tsize" />
												<input type="hidden" id="tabsize" name="size"
													value='<bean:write name="tsize" />' />
												<logic:iterate name="JobCodeDetail" id="jobcode"
													indexId="index">

													<tr id='<bean:write name="index"/>$$'
														onclick="setJobValues('<bean:write name="jobcode" property="jobCodeID"/>','<bean:write name="jobcode" property="job"/>',
																	'<bean:write name="jobcode" property="cost"/>','<bean:write name="jobcode" property="description"/>',
																	'<bean:write name="index"/>$$');">
														<td colspan="3" nowrap="nowrap"><bean:write name="jobcode"
															property="job" /></td>
														<td colspan="3" align="right">&nbsp; <bean:write
															name="jobcode" property="cost" /></td>
														<td colspan="3" nowrap="nowrap">&nbsp; <bean:write
															name="jobcode" property="description" /></td>
													</tr>
												</logic:iterate>
											</logic:present>

										</tbody>
									</table>
									</div>
									</td>
								</tr>
								<tr align="center">
									<td><input type="button" class="formButton" name="add"
										onclick="AddJobCode();"
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
							</table>

							</fieldset>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.Configuration.Employee.TimeSheet" /> </strong>
							<fieldset>
							<table>
								<tr>
									<td><bean:message
										key="BizComposer.Configuration.Employee.NoOfInOutTimeSheet" />
									</td>
									<td>&nbsp;&nbsp;&nbsp; <html:text property="timeSheet"
										style="width:100;" maxlength="10"
										onkeypress="return numbersonly(event,this.value);">
									</html:text></td>
								</tr>
							</table>
							</fieldset>
							</td>
						</tr>
					</table>
					</div>

					<!-- Tax -->
					<div id="tax"><br>
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
						key="BizComposer.Configuration.Tax.SalesTax" /> </strong>
					<fieldset>
					<table>
						<tr>
							<td><html:checkbox property="chargeSalesTax">
								<bean:message key="BizComposer.Configuration.Tax.ChargeSalesTax" />
							</html:checkbox></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
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
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><bean:message key="BizComposer.Configuration.Tax.PaySalesTax" />
							</td>
						</tr>
						<tr>
							<td><html:radio property="howOftenSalesTax" value="1">
								<bean:message key="BizComposer.Configuration.Tax.Monthly" />
							</html:radio> &nbsp;&nbsp;&nbsp; <html:radio
								property="howOftenSalesTax" value="2">
								<bean:message key="BizComposer.Configuration.Tax.Quaterly" />
							</html:radio> &nbsp;&nbsp;&nbsp; <html:radio
								property="howOftenSalesTax" value="3">
								<bean:message key="BizComposer.Configuration.Tax.Annually" />
							</html:radio></td>
						</tr>
					</table>
					</fieldset>
					</div>

					<!--  Reminders -->
					<div id="reminder" style="overflow:auto;height:400;width:590;">
					<table>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp; <html:checkbox
								property="showReminder">
									&nbsp;<bean:message
									key="BizComposer.Configuration.Reminders.ShowReminder" />
							</html:checkbox></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.Configuration.Reminders.ReminderList" /> </strong>
							<fieldset>
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
										key="BizComposer.Configuration.Reminders.InvoiceCreditMemos" />
									</td>
									<td align="center"><html:radio property="invoiceMemo" value="1"></html:radio>
									</td>

									<td align="center"><html:radio property="invoiceMemo" value="0"></html:radio>
									</td>

									<td><html:text property="invoiceMemoDays" size="10"
										maxlength="7"
										onkeypress="return numbersonly(event,this.value);">
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
										maxlength="7"
										onkeypress="return numbersonly(event,this.value);">
									</html:text></td>
									<td nowrap="nowrap"><bean:message
										key="BizComposer.Configuration.Reminders.DaysAfterdueDate" />
									</td>
								</tr>
								<tr>
									<td><bean:message
										key="BizComposer.Configuration.Reminders.Inventory2Reorder" />
									</td>
									<td align="center"><html:radio property="inventoryOrder"
										value="1"></html:radio></td>
									<td align="center"><html:radio property="inventoryOrder"
										value="0"></html:radio></td>
									<td><html:text property="inventoryOrderDays" size="10"
										maxlength="7"
										onkeypress="return numbersonly(event,this.value);">
									</html:text></td>
									<td><bean:message
										key="BizComposer.Configuration.Reminders.DaysBeforedueDate" />
									</td>
								</tr>
								<tr>
									<td><bean:message
										key="BizComposer.Configuration.Reminders.Bills2Pay" /></td>
									<td align="center"><html:radio property="billsToPay" value="1"></html:radio>
									</td>
									<td align="center"><html:radio property="billsToPay" value="0"></html:radio>
									</td>
									<td><html:text property="billsToPayDays" size="10"
										maxlength="7"
										onkeypress="return numbersonly(event,this.value);">
									</html:text></td>
									<td><bean:message
										key="BizComposer.Configuration.Reminders.DaysBeforedueDate" />
									</td>
								</tr>
							</table>
							</fieldset>
							</td>
						</tr>
					</table>

					</div>

					<!--  Finance charges -->
					<div id="finance">
					<table>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.Configuration.FinnanceCharge.ChargeRate" /> </strong>
							<fieldset>
							<table>
								<tr>
									<td><bean:message
										key="BizComposer.Configuration.FinnanceCharge.AnnualIterrestRate" />
									</td>
									<td><html:text property="annualInterestRate" size="20"
										maxlength="10"
										onkeypress="return numbersonly(event,this.value);">
									</html:text></td>
								</tr>
								<tr>
									<td><bean:message
										key="BizComposer.Configuration.FinnanceCharge.MinimumFinanceCharge" />
									</td>
									<td><html:text property="minCharge" size="20" maxlength="10"
										onkeypress="return numbersonly(event,this.value);">
									</html:text></td>
								</tr>
								<tr>
									<td><bean:message
										key="BizComposer.Configuration.FinnanceCharge.GracePeriod" />
									</td>
									<td><html:text property="gracePeriod" size="20" maxlength="10"
										onkeypress="return numbersonly(event,this.value);">
									</html:text></td>
								</tr>
							</table>
							</fieldset>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.Configuration.FinnanceCharge.ApplyingCharges" />
							</strong>
							<fieldset>
							<table>
								<tr>
									<td><html:checkbox property="assessFinanceCharge">
													&nbsp;<bean:message
											key="BizComposer.Configuration.FinnanceCharge.AssessFinanceCharge" />
									</html:checkbox></td>
								</tr>
							</table>
							</fieldset>
							</td>
						</tr>
					</table>
					</div>

					<!-- SMTP Setup -->
					<div id="smtp">
					<table>
						<tr>
							<td><bean:message
								key="BizComposer.Configuration.smtp.SetuploginNote" /></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.Configuration.smtp.ServerInformation" /> </strong>
							<fieldset>
							<table>
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
							</table>
							</fieldset>
							</td>
						</tr>
						<tr>
							<td><input type="button" name="testMailConnection"
								class="formButton" size="25" onclick="TestConnection();"
								value='<bean:message key="BizComposer.Configuration.smtp.TestConnection" />' />
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><bean:message
								key="BizComposer.Configuration.smtp.MailServerAuthentication" />
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp; <html:checkbox property="mailAuth"
								disabled="true" onclick="EnableDisableFields();">
								<bean:message
									key="BizComposer.Configuration.smtp.ServerRequeiresAuthentication" />
							</html:checkbox></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.Configuration.smtp.UserInformation" /> </strong>
							<fieldset>
							<table>
								<tr>
									<td><bean:message key="BizComposer.Configuration.smtp.UserName" />
									</td>
									<td>&nbsp;&nbsp;&nbsp; <html:text property="mailUserName"
										size="30" maxlength="45" disabled="true"></html:text></td>

								</tr>
								<tr>
									<td><bean:message key="BizComposer.Configuration.smtp.Password" />
									</td>
									<td>&nbsp;&nbsp;&nbsp; <html:text property="mailPassword"
										size="30" maxlength="35" disabled="true"></html:text></td>

								</tr>
							</table>
							</fieldset>
							</td>
						</tr>
					</table>

					</div>

					<!-- Performance -->
					<div id="perfomance">
					<table>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> <bean:message
								key="BizComposer.Configuration.Performance.PerformanceLevel" />
							</strong></td>
						</tr>
						<tr>
							<td>
							<fieldset>
							<table>
								<tr>
									<td>&nbsp;&nbsp;&nbsp; <html:radio property="performance"
										value="2000">
										<bean:message key="BizComposer.Configuration.Performance.High" />
									</html:radio></td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;&nbsp; <html:radio property="performance"
										value="5000">
										<bean:message
											key="BizComposer.Configuration.Performance.Medium" />
									</html:radio></td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;&nbsp; <html:radio property="performance"
										value="10000">
										<bean:message key="BizComposer.Configuration.Performance.Low" />
									</html:radio></td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;&nbsp; <html:radio property="performance"
										value="1" onclick="CheckPerformance();">
										<bean:message
											key="BizComposer.Configuration.Performance.UserDefine" />
									</html:radio> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <html:text
										size="15" property="userDefinePerform" maxlength="15"
										onkeypress="return numbersonly(event,this.value);" /></td>
								</tr>
							</table>
							</fieldset>
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp; <bean:message
								key="BizComposer.Configuration.Performance.ExitProgramMsg" /></td>
						</tr>
					</table>
					</div>

					<!-- Manage Service Type -->
					<div id="servicetype">
					<table>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
							<table>
								<tr>
									<td><bean:message
										key="BizComposer.Configuration.ManageServiceType.ServiceName" />
									</td>
									<td>&nbsp;&nbsp;&nbsp; <input type="text" name="ServiceName"
										id="sname" size="35" maxlength="40" /></td>

								</tr>
								<tr>
									<td><bean:message
										key="BizComposer.Configuration.ManageServiceType.InvoiceType" />
									</td>
									<td>&nbsp;&nbsp;&nbsp; <logic:present name="InvStyle">
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
							</table>
							</td>
						</tr>
						<tr>
							<td>
							<div style="overflow:auto;width:400;height:200;"
								id="ServiceTable">
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
							<td><input type="button" name="Add" class="formButton"
								onclick="AddServiceType();"
								value='<bean:message key="BizComposer.Configuration.ManageServiceType.Add"/>' />
							<input type="button" name="Edit" class="formButton"
								onclick="EditServiceType();"
								value='<bean:message key="BizComposer.Configuration.ManageServiceType.Edit"/>' />
							<input type="button" name="Delete" class="formButton"
								onclick="DeleteServiceType();"
								value='<bean:message key="BizComposer.Configuration.ManageServiceType.Delete"/>' />
							<input type="button" name="Clear" class="formButton"
								onclick="ClearServiceType();"
								value='<bean:message key="BizComposer.Configuration.ManageServiceType.Clear"/>' />
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr align="center">
							<td><bean:message
								key="BizComposer.Configuration.ManageServiceType.Note" /></td>
						</tr>
					</table>
					</div>
					</fieldset>
					</td>
				</tr>
			</table>
			</td>
			<td align="center" valign="top">
			<div align="center">
			<table align="center">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><input type="button" name="SavePreferences" class="formButton"
						onclick="SaveValues();" style="width:60;"
						value='<bean:message key="BizComposer.amazonBulkMailer.SetPreferences.Button.Save"/>' />
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><input type="button" name="ClosePreferences"
						onclick="window.close();" class="formButton" style="width:60;"
						value='<bean:message key="BizComposer.amazonBulkMailer.SetPreferences.Button.Close"/>' />
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><input type="submit" name="DefaultPreferences"
						class="formButton" onclick="RevokeValues();" style="width:60;"
						value='<bean:message key="BizComposer.amazonBulkMailer.SetPreferences.Button.Default"/>' />
					</td>
				</tr>
			</table>
			</div>
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
		if(rid=="tr1"){
			document.getElementById('general').style.display='block';
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
		}
		else if(rid=="tr2"){
			document.getElementById('general').style.display='none';
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
		}
		else if(rid=="tr3"){
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
		}
		else if(rid=="tr4"){
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='block';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
		}
		else if(rid=="tr5"){
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='block';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
		}
		else if(rid=="tr6"){
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='block';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
		}
		else if(rid=="tr7"){
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='block';
			document.getElementById('reminder').style.display='none';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
		}
		else if(rid=="tr8"){
			document.getElementById('general').style.display='none';
			document.getElementById('nw').style.display='none';
			document.getElementById('sales').style.display='none';
			document.getElementById('purchase').style.display='none';
			document.getElementById('inventory').style.display='none';
			document.getElementById('employee').style.display='none';
			document.getElementById('tax').style.display='none';
			document.getElementById('reminder').style.display='block';
			document.getElementById('finance').style.display='none';
			document.getElementById('smtp').style.display='none';
			document.getElementById('perfomance').style.display='none';
			document.getElementById('servicetype').style.display='none';
		}
		else if(rid=="tr9"){
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
		}
		else if(rid=="tr10"){
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
		}
		else if(rid=="tr11"){
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
		}
		else if(rid=="tr12"){
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
		SetRow('tr10');
		setLogo();
		<logic:present name="EmpState">
			refreshItemsNow(document.configurationForm.empCountryID.value,'<bean:write name="EmpState"/>');
		</logic:present>
		EnableDisableFields();
	}
	
	function setValues(){
		<logic:present name="ServiceType">
			ser_size = document.getElementById('ssize').value;
			for(cnt=0;cnt<=ser_size;cnt++){
				serids[cnt]=-1;
				servicename[cnt]="";
			}
			count=0;
			<logic:iterate name="ServiceType" id="stype">
				serids[count]= '<bean:write name="stype" property="serviceID"/>';
				servicename[count] = '<bean:write name="stype" property="serviceName"/>';
				count++;
			</logic:iterate>
		</logic:present>
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
		var name = document.getElementById('sname').value;
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
	
	/*function addServiceName(){
		var name = document.getElementById('sname').value;
		for(cnt=0;cnt<serids.length;cnt++){
			if(serids[cnt] == servid){
				servicename[cnt]= name;
				break;
			}
		}
	}*/
	
	function deleteServiceName(){
		idvalue = 0;
		nmvalue = 0; 
		flagid = 0;
		flagnm = 0;
		var name = document.getElementById('sname').value;
		/* Delete Service type id */
		for(cnt=0;cnt<serids.length;cnt++){
			if(serids[cnt] == servid){
				idvalue = cnt;
				flagid = 1;
				break;
			}
			
		}
		
		if(flagid==1){
			for(cnt=idvalue;cnt<((serids.length)-1);cnt++){
				serids[cnt] = serids[cnt+1];
			}	
			serids[cnt] = -1;
		}
		
		/* Delete Service type name */
		for(cnt=0;cnt<servicename.length;cnt++){
			if(servicename[cnt] == name){
				nmvalue = cnt;
				flagnm = 1;
				break;
			}
		}
		
		if(flagnm==1){
			for(cnt=nmvalue;cnt<((servicename.length)-1);cnt++){
				servicename[cnt] = servicename[cnt+1];
			}	
			servicename[cnt]="";
		}
		
		/* Clear the service name and invoice style field */
		document.getElementById('sname').value="";
		document.getElementById('sertype').value="0";
	}
	
	function EditServiceType(){
		var name = document.getElementById('sname').value;
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
		document.getElementById('tid').value="ShowSetPreference";
		
	}
	
	function SaveValues(){
		if(confirm('<bean:message key="BizComposer.Configuration.SaveConfirm"/>')){
			document.configurationForm.annualInterestRate.value = wxToFixed(document.configurationForm.annualInterestRate.value,2);
			document.configurationForm.minCharge.value = wxToFixed(document.configurationForm.minCharge.value,2);
			
			document.configurationForm.startInvoiceNo.value = parseInt(document.configurationForm.startInvoiceNo.value);	
			document.configurationForm.startPONum.value = parseInt(document.configurationForm.startPONum.value);
			document.configurationForm.startRINum.value = parseInt(document.configurationForm.startRINum.value);
			document.configurationForm.timeSheet.value = parseInt(document.configurationForm.timeSheet.value);
	
			document.getElementById('cost').value = parseInt(document.getElementById('cost').value);
		
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
			document.getElementById('tid').value="SavePreferences";
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
