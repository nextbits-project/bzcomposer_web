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
<title><bean:message key="BzComposer.generaltitle" /></title>
<script type="text/javascript" src="<bean:write name="path" property="pathvalue"/>/dist/js/custom.js"></script>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<!-- Remember to include jQuery :) -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>  -->

<!-- jQuery Modal -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
<script type="text/javascript">
$(function() {
    $("#tabs").tabs();
    $("#tabs1").tabs();
  });
  
$(document).ready(function()
{
	//var isChecked = "off";
	var isSOBChecked = "<%= request.getAttribute("isSOBChecked")%>";
	var isISBChecked = "<%= request.getAttribute("isISBChecked")%>";
	var isIRBChecked = "<%= request.getAttribute("isIRBChecked")%>";
	var isPOBChecked = "<%= request.getAttribute("isPOBChecked")%>";
	
	$('#salesOrderBoard').change(function()
	{
		var isChecked = isSOBChecked;
		debugger
		if($(this).prop("checked") == true)
		{

	        $("#salesOrderBoard").attr('checked', true);
	        debugger
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {

	        $("#salesOrderBoard").attr('checked', false);
	        debugger
	        isChecked = "off";
		}	
	    else
	    {

	        $("#salesOrderBoard").attr('checked', isChecked);
	       /*  debugger
	    	document.configurationForm.salesOrderBoard.value = isChecked; */
	    	debugger
	    }	
		debugger
		document.configurationForm.salesOrderBoard.value = isChecked;
		$("#salesOrderBoard").val(isChecked);
	});
	$('#itemReceivedBoard').change(function()
	{
		
		var isChecked = isIRBChecked;
		debugger
		if($(this).prop("checked") == true)
		{

	        $("#itemReceivedBoard").attr('checked', true);
	        debugger
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {

	        $("#itemReceivedBoard").attr('checked', false);
	        debugger
	        isChecked = "off";
		}	
	    else
	    {

	        $("#itemReceivedBoard").attr('checked', isChecked);
	       /*  debugger
	    	document.configurationForm.itemReceivedBoard.value = isChecked; */
	    	debugger
	    }	
		debugger
    	document.configurationForm.itemReceivedBoard.value = isChecked;
		$("#itemReceivedBoard").val(isChecked);
	});
	$('#poboard').change(function()
	{
		var isChecked = isPOBChecked;
		
		debugger
		if($(this).prop("checked") == true)
		{

	        $("#poboard").attr('checked', true);
	        debugger
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {

	        $("#poboard").attr('checked', false);
	        debugger
	        isChecked = "off";
		}	
	    else
	    {

	        $("#poboard").attr('checked', isChecked);
	        /* debugger
	    	document.configurationForm.poboard.value = isChecked; */
	    	debugger
	    }	
		debugger
    	document.configurationForm.poboard.value = isChecked;
		$("#poboard").val(isChecked);
	});
	$('#itemShippedBoard').change(function()
	{
		var isChecked = isISBChecked;
		
		debugger
		if($(this).prop("checked") == true)
		{

	        $("#itemShippedBoard").attr('checked', true);
	        debugger
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {

	        $("#itemShippedBoard").attr('checked', false);
	        debugger
	        isChecked = "off";
		}	
	    else
	    {

	        $("#itemShippedBoard").attr('checked', isChecked);
	       /*  debugger
	    	document.configurationForm.itemShippedBoard.value = isChecked; */
	    	debugger
	    }	
		debugger
    	document.configurationForm.itemShippedBoard.value = isChecked;
		$("#itemShippedBoard").val(isChecked);
	});
});
  
/* function showbuttonDiv() 
{
    var selectedTab = $("#tabs").tabs('option','active');
    if(selectedTab == 1)
    {
    	document.getElementById("generalButtons").style.display = "none";
    	document.getElementById("featureButtons").style.display = "block";
    	document.getElementById("orderTemplateButtons").style.display = "none";
    }
    else if(selectedTab == 2)
    {
    	document.getElementById("generalButtons").style.display = "none";
    	document.getElementById("featureButtons").style.display = "none";
    	document.getElementById("orderTemplateButtons").style.display = "block";
    }
    else
    {
    	document.getElementById("generalButtons").style.display = "block";
    	document.getElementById("featureButtons").style.display = "none";
    	document.getElementById("orderTemplateButtons").style.display = "none";
    }
} */

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

		return serverconnectedseccessdialog();
		document.configurationForm.mailAuth.disabled=false;    		
		EnableDisableFields();
	}
	else
	{
		debugger

		return serverconnectederrordialog();
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
function serverconnectederrordialog()
{
	event.preventDefault();
	$("#serverconnectederrordialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
</script>
</head>
<body onload="init();">
<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
	<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; 
	border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.configuration.configurationtitle"/>
	</span>
</div>
<div>
	<div>
		<logic:present name="Labels">
			<bean:size name="Labels" id="size" />
				<input type="hidden" name="lsize" id="lblsize" value='<bean:write name="size" />' />
					<logic:iterate name="Labels" id="lbl" indexId="index">
						<input type="hidden" id='<bean:write name="index" />lid'
						name='<bean:write name="index" />lidname'
						value='<bean:write name="lbl" property="value" />' />
						<input type="hidden" id='<bean:write name="index" />lname'
						name='<bean:write name="index" />lnm'
						value='<bean:write name="lbl" property="label" />' />
					</logic:iterate>
		</logic:present>
	</div>
	<div id="table-negotiations">
		<table cellspacing="0"  style="width: 100%;overflow-y:scroll;" class="section-border">
			<tr>
				<td valign="top"  style="width: 20%;">
					<table>
						<tr>
							<td>
							<%-- <%@include file="testMenu.jsp" %> --%>
								<%@include file="menuPage.jsp" %>
							<!-- <div id="table-negotiations"
								style="width: 185px;height:800px; padding-left: 10px;overflow-x:auto;max-height: 1200px;">					
								</div> -->
							</td>
						</tr>
					<%--<tr align="center">
							<td>
								<input type="button" name="Revoke" class="formButton"
								onclick="RevokeValues();"
								value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
								<input type="button" name="Save" class="formButton"
								onclick="SaveValues();"
								value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>--%>
					</table>
				</td>
				<td valign="top" style="padding-top: 2%;padding-right: 4%;">
					<!-- General -->
					<div>
						<html:errors/>
					</div>
					<br>
					<!-- general starts -->
					<div id="general" style="display:none;">
						<div id="tabs" style="height:800px;">
  							<ul>
    							<li style="font-size: 1em;">
    								<a href="#GeneralSetting">
    									<bean:message key="BzComposer.configuration.tab.generalsettings" />
   									</a>
								</li>
    							<li style="font-size: 1em;">
    								<a href="#features">
    									<bean:message key="BzComposer.configuration.tab.features" />
   									</a>
								</li>
    							<li style="font-size: 1em;">
    								<a href="#orderTemplate">
    									<bean:message key="BzComposer.configuration.tab.orderTemplate" />
   									</a>
								</li>
								<li style="font-size: 1em;">
    								<a href="#reminder">
    									<bean:message key="BizComposer.Configuration.Reminders"/>
   									</a>
								</li>
								<li style="font-size: 1em;">
    								<a href="#emailSetup">
    									<bean:message key="BzComposer.tab.eMailSetup"/>
   									</a>
								</li>
  							</ul>
							<div id="GeneralSetting">
								<div id="content1" class="tabPage">
									<table class="table-notifications" width="80%">
										<tr>
											<th colspan="2" align="left" style="font-size: 1.2em;">
												<bean:message key="BzComposer.configuration.generaltitle" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.currency" />
											</td>
											<td style="font-size: 1em;">
												<html:select property="currencyID" styleId="currencyID">
													<html:option value="0">
														<bean:message key="BzComposer.configuration.select"/>
													</html:option>
													<html:option value="1">
														<bean:message key="BzComposer.configuration.currency.baht"/>
													</html:option>
													<html:option value="2">
														<bean:message key="BzComposer.configuration.currency.bolivar"/>
													</html:option>
													<html:option value="3">
														<bean:message key="BzComposer.configuration.currency.boliviano"/>
													</html:option>
													<html:option value="4">
														<bean:message key="BzComposer.configuration.currency.cedi"/>
													</html:option>
													<html:option value="5">
														<bean:message key="BzComposer.configuration.currency.dirham"/>
													</html:option>
													<html:option value="6">
														<bean:message key="BzComposer.configuration.currency.dinar"/>
													</html:option>
													<html:option value="7">
														<bean:message key="BzComposer.configuration.currency.dollar"/>
													</html:option>
													<html:option value="8">
														<bean:message key="BzComposer.configuration.currency.dong"/>
													</html:option>
													<html:option value="9">
														<bean:message key="BzComposer.configuration.currency.euro"/>
													</html:option>
													<html:option value="10">
														<bean:message key="BzComposer.configuration.currency.forint"/>
													</html:option>
													<html:option value="11">
														<bean:message key="BzComposer.configuration.currency.franc"/>
													</html:option>
													<html:option value="12">
														<bean:message key="BzComposer.configuration.currency.koruna"/>
													</html:option>
													<html:option value="13">
														<bean:message key="BzComposer.configuration.currency.krona"/>
													</html:option>
													<html:option value="14">
														<bean:message key="BzComposer.configuration.currency.krone"/>
													</html:option>
													<html:option value="15">
														<bean:message key="BzComposer.configuration.currency.newshekel"/>
													</html:option>
													<html:option value="16">
														<bean:message key="BzComposer.configuration.currency.nuevosol"/>
													</html:option>
													<html:option value="17">
														<bean:message key="BzComposer.configuration.currency.peso"/>
													</html:option>
													<html:option value="18">
														<bean:message key="BzComposer.configuration.currency.pound"/>
													</html:option>
													<html:option value="19">
														<bean:message key="BzComposer.configuration.currency.pula"/>
													</html:option>
													<html:option value="20">
														<bean:message key="BzComposer.configuration.currency.quetzal"/>
													</html:option>
													<html:option value="21">
														<bean:message key="BzComposer.configuration.currency.rand"/>
													</html:option>
													<html:option value="22">
														<bean:message key="BzComposer.configuration.currency.real"/>
													</html:option>
													<html:option value="23">
														<bean:message key="BzComposer.configuration.currency.ringgit"/>
													</html:option>
													<html:option value="24">
														<bean:message key="BzComposer.configuration.currency.riyal"/>
													</html:option>
													<html:option value="25">
														<bean:message key="BzComposer.configuration.currency.riyali"/>
													</html:option>
													<html:option value="26">
														<bean:message key="BzComposer.configuration.currency.rouble"/>
													</html:option>
													<html:option value="27">
														<bean:message key="BzComposer.configuration.currency.rupee"/>
													</html:option>
													<html:option value="28">
														<bean:message key="BzComposer.configuration.currency.rupiah"/>
													</html:option>
													<html:option value="29">
														<bean:message key="BzComposer.configuration.currency.schilling"/>
													</html:option>
													<html:option value="30">
														<bean:message key="BzComposer.configuration.currency.sucre"/>
													</html:option>
													<html:option value="31">
														<bean:message key="BzComposer.configuration.currency.won"/>
													</html:option>
													<html:option value="32">
														<bean:message key="BzComposer.configuration.currency.yen"/>
													</html:option>
													<html:option value="33">
														<bean:message key="BzComposer.configuration.currency.yuan"/>
													</html:option>
												</html:select>
											</td>
										</tr>
										<tr>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.weight" />
											</td>
											<td style="font-size: 1em;">
												<%-- <html:select property="weightID" styleId="weightID">
												<html:option value="0">Select</html:option>
												<html:option value="1">Pound</html:option>
												<html:option value="2">Once</html:option>
												<html:option value="3">Kg</html:option>
												<html:option value="4">g</html:option>
												</html:select> --%>
												<html:select property="weightID" style="font-size: 1em;" 
												styleId="weightID">
													<logic:present name="configurationForm" 
													property="listOfExistingWeights"> 
														<logic:iterate name="configurationForm" id="objList1" 
														property="listOfExistingWeights" scope="session">
															<option value="<bean:write name='objList1' 
															property='weightID' />">
																<bean:write name="objList1" property="weightName" />
															</option>
												</logic:iterate>
											</logic:present> 
										</html:select>
								</td>
							</tr>
							<tr>
								<th colspan="2" align="left" style="font-size: 1.2em;"><bean:message
								key="BzComposer.configuration.addresslabel" /></th>
							</tr>
							<tr colspan="2">
									<td style="font-size: 1em;"><bean:message key="BzComposer.configuration.defaultlabel" /></td>
									<td style="font-size: 1em;"><logic:present
										name="Labels">
										<html:select property="defaultLabelID"
											onchange="SetLabelName(this.value);" style="width:200" styleId="defaultLabelID">
											<html:optionsCollection name="Labels" />
										</html:select>
									</logic:present></td>
							</tr>
							<tr>
								<td colspan="2" align="center" style="font-size: 1em;"><input type="button"
								class="formButton"
								value='<bean:message key="BzComposer.configuration.setuplabelbtn"/>'
								title='<bean:message key="BzComposer.configuration.setuplabeltooltip"/>' />
								</td>
							</tr>
							<tr>
								<th colspan="2" align="left" style="font-size: 1em;"><bean:message
								key="BzComposer.configuration.defaultfilteroption" /></th>
							</tr>
							<tr>
								<td style="font-size: 1em;"><bean:message key="BzComposer.configuration.defaultfilteroption" />:</td>
								<td style="font-size: 1em;">
									<html:select property="filterOption" styleId="filterOption">
									<%-- <html:option value="0">All</html:option>
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
									<html:option value="15">1 Week</html:option>  --%>
									<html:option value="All"><bean:message key="BzComposer.reportcenter.allinvoicelist.dates.all"/></html:option>
									<html:option value="Custom"><bean:message key="BzComposer.reportcenter.allinvoicelist.dates.custom"/></html:option>
									<html:option value="Today"><bean:message key="BzComposer.reportcenter.allinvoicelist.dates.today"/></html:option>
									<html:option value="This Month"><bean:message key="BzComposer.reportcenter.allinvoicelist.dates.thismonth"/></html:option>
									<html:option value="This Quarter"><bean:message key="BzComposer.configuration.filteroption.thisquarter"/></html:option>
									<html:option value="This Year"><bean:message key="BzComposer.configuration.filteroption.thisyear"/></html:option>
									<html:option value="1 Year"><bean:message key="BzComposer.configuration.filteroption.oneyear"/></html:option>
									<html:option value="2 Year"><bean:message key="BzComposer.configuration.filteroption.twoyear"/></html:option>
									<html:option value="3 Year"><bean:message key="BzComposer.configuration.filteroption.threeyear"/></html:option>
									<html:option value="This Month-to-Date"><bean:message key="BzComposer.reportcenter.allinvoicelist.dates.thismonthtodate"/></html:option>
									<html:option value="This Quarter-to-Date"><bean:message key="BzComposer.configuration.filteroption.thisquartertodate"/></html:option>
									<html:option value="This Year-to-Date"><bean:message key="BzComposer.configuration.filteroption.thisyeartodate"/></html:option>
									<html:option value="Last 10 days"><bean:message key="BzComposer.reportcenter.allinvoicelist.dates.last10days"/></html:option>
									<html:option value="Last 30 days"><bean:message key="BzComposer.reportcenter.allinvoicelist.dates.last30days"/></html:option>
									<html:option value="Last 60 days"><bean:message key="BzComposer.reportcenter.allinvoicelist.dates.last60days"/></html:option>
									<html:option value="1 Week"><bean:message key="BzComposer.configuration.filteroption.oneweek"/></html:option>
									</html:select>
								</td>
							</tr>
							<tr>
								<th colspan="2" align="left" style="font-size: 1.2em;"><bean:message
								key="BzCompozer.configuration.startingpagesetting" /></th>
							</tr>
							<tr>
								<td style="font-size: 1em;"><bean:message key="BzComposer.configuration.defaultstartingpage" />:</td>
								<td style="font-size: 1em;">
									<html:select property="moduleID" styleId="moduleID">
									<html:option value="0"><bean:message key="BzComposer.configuration.defaultstartingpage.customer"/></html:option>
									<html:option value="1"><bean:message key="BzComposer.configuration.defaultstartingpage.inventory"/></html:option>
									<html:option value="2"><bean:message key="BzComposer.configuration.defaultstartingpage.invoice"/></html:option>
									<html:option value="3"><bean:message key="BzComposer.configuration.defaultstartingpage.navigationpage"/></html:option>
									<html:option value="4"><bean:message key="BzComposer.configuration.defaultstartingpage.po"/></html:option>
									<html:option value="5"><bean:message key="BzComposer.configuration.defaultstartingpage.vendor"/></html:option>
									</html:select>
									<%-- <html:select property="moduleName" style="font-size: 1em;" styleId="moduleName">
										<logic:present name="configurationForm" property="listOfExistingModuleNames"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingModuleNames" scope="session">
										<option value="<bean:write name='objList1' property='moduleID' />"><bean:write name="objList1" property="moduleName" /></option>
									</logic:iterate>
								</logic:present> 
							</html:select> --%>
								</td>
								</tr>
								<tr>
									<th colspan="2" align="left" style="font-size: 1.2em;">
										<bean:message key="BzComposer.configuration.defaultdashboardsetting" /></th>
								</tr>
								<tr>
									<td style="font-size: 1em;">
										<bean:message key="BzComposer.configuration.defaultcustomdashboard" />:
									</td>
									<td align="left" style="font-size: 1em;">
										<html:checkbox property="salesOrderBoard" styleId="salesOrderBoard">
										<bean:message key="BzComposer.configuration.defaultdashboard.opensalesorders" />
										</html:checkbox>&nbsp;&nbsp;&nbsp;
										<html:checkbox property="itemReceivedBoard" styleId="itemReceivedBoard">
										<bean:message key="BzComposer.configuration.defaultdashboard.itemreceived" />
										</html:checkbox> 
					<br>
					<html:checkbox property="poboard" styleId="poboard">
						<bean:message
							key="BzComposer.configuration.defaultdashboard.poboard" />
						</html:checkbox>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<html:checkbox property="itemShippedBoard" style="font-size: 1em;" styleId="itemShippedBoard">
						<bean:message
							key="BzComposer.configuration.defaultdashboard.itemshiped" />
						</html:checkbox>
					</td>
				</tr>
			</table>	
			</div>
			</div>
					
  							<div id="features">
   								<div id="content2" class="tabPage">	
			   					 	<table class="table-notifications" width="80%">
										<tr>
											<th colspan="3" align="left" style="font-size: 1.2em;"><bean:message key="BzComposer.configuration.feturesheader" /></th>
										</tr>
										<tr>
											<td style="font-size: 1em;"><b><bean:message key="BzComposer.configuration.features.availablemodules" /></b></td>
											<td>&nbsp;&nbsp;</td>
											<td style="font-size: 1em;"><b><bean:message key="BzComposer.configuration.features.selectedmodules" /></b></td>
										</tr>
										<tr>
											<td width="25%" style="font-size: 1em;">
												<html:select property="selectedModuleId" styleId="selectedModuleId" style="width: 200px; height: 200px;font-size: 1em;" styleClass="featureName1" multiple="true">
													<logic:present name="configurationForm" property="listOfExistingModules"> 
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingModules" scope="session">
															<option value="<bean:write name='objList1' property='selectedModuleId' />">
																<bean:write name="objList1" property="featureName" />
															</option>
														</logic:iterate>
													</logic:present> 
												</html:select>
											</td>
											<td style="font-size: 1em;">
												<br><br>
												<a class="addfeature" style="cursor: pointer; border: 1px solid #000; padding: 5px; background-color: #fff ">
													<bean:message key="BzComposer.configuration.lefttorightbtn"/>
												</a>
												<br/><br/>
												<a class="removefeature" style="cursor: pointer;border: 1px solid #000; padding: 5px; background-color: #fff ">
													<bean:message key="BzComposer.configuration.righttoleftbtn"/>
												</a>
											</td>
											<td>
												<%-- <html:select property="selectedModules" styleId="selectedModules" style="width: 200px; height: 200px;font-size: 1em;" styleClass="featureName2" multiple="true">
													 <logic:present name="configurationForm" property="listOfExistingModules">
														<logic:iterate name="configuraionForm" id="objList1" property="listOfExistingModules" scope="session">
															<option value="<bean:write name='objList1' property='selectedModules'/>">
																<bean:write name="objList1" property="featureName"/>
															</option>
														</logic:iterate>
													</logic:present>
												</html:select> --%>
												<html:select property="selectedModules" styleId="selectedModules" style="width: 200px; height: 200px;font-size: 1em;" styleClass="featureName2" multiple="true">
												<logic:present name="configurationForm" property="listOfExistingselectedModules"> 
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingselectedModules" scope="session">
														<option value="<bean:write name='objList1' property='selectedModuleId' />">
															<bean:write name="objList1" property="featureName" />
														</option>
													</logic:iterate>
												</logic:present>  
											</html:select>
											</td>
										</tr>
									</table>
								</div>  
							</div>

   							<div id="orderTemplate" style="font-size: 1em;">
			   					<div id="content3" class="tabPage">
									<table class="table-notifications" width="100%">
										<tr>
											<th colspan="2" align="left" style="font-size: 1.2em;">
											<bean:message key="BzComposer.configuration.importantordertemplate" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.importantordertemplate.templatename" />
											</td>
											<td style="font-size: 1em;">
												<html:text property="templateName"></html:text>
											</td>
										</tr>
										<tr>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.choosefilebtn"/>
											</td>
											<td style="font-size: 1em;">
												<html:file property="fileName" accept=".xls"></html:file>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="2" style="font-size: 1em;">
												<bean:message key="Bzcomposer.configuration.choosefilebtn.onlyexcelfiles"/>
											</td>
										</tr>
										<tr>
											<td style="font-size: 1em;">
												<html:checkbox property="def" >
												</html:checkbox>
												<bean:message key="BzComposer.configuration.defaultchkbox" />
											</td>
										</tr>
										<tr>
											<th colspan="2" align="left" style="font-size: 1.2em;">
										<bean:message key="BzComposer.configuration.fieldsmapping" />
										</th>
										</tr>
										<tr>
											<td style="font-size: 1em;"><b><bean:message key="BzComposer.configuration.databasefieldsname"/> </b></td>
											<td style="font-size: 1em;"><b><bean:message key="BzComposer.configuration.mappingfieldsname"/></b></td>
										</tr>
										<tr>
											<td style="font-size: 1em;"><bean:message key= "BzComposer.configuration.itemcode"/>*</td>
											<td style="font-size: 1em;"><html:text property="itemCode"></html:text></td>
										</tr>
										<tr>
											<td style="font-size: 1em;"><bean:message key = "BzComposer.configuration.itemname"/></td>
											<td style="font-size: 1em;"><html:text property="itemName"></html:text></td>
										</tr>
										<tr>
											<td style="font-size: 1em;"><bean:message key="BzComposer.configuration.qty"/>*</td>
											<td style="font-size: 1em;"><html:text property="qty"></html:text></td>
										</tr>
										<tr>
											<td style="font-size: 1em;"><bean:message key="BzComposer.configuration.unitprice"/>*</td>
											<td style="font-size: 1em;"><html:text property="unitPrice"></html:text></td>
										</tr>
										<tr>
											<td style="font-size: 1em;"><bean:message key="BzComposer.configuration.unitweight"/></td>
											<td style="font-size: 1em;"><html:text property="weight"></html:text></td>
										</tr>
										<tr>
											<td style="font-size: 1em;"><bean:message key="BzComposer.configuration.taxable"/></td>
											<td style="font-size: 1em;"><html:text property="taxable" value=""></html:text></td>
										</tr>
										<tr>
										<td colspan="2" align="center" style="font-size: 1em;">
											<input type="button" name="New" value="<bean:message key='BzComposer.global.new'/>"/>&nbsp;&nbsp;
											<input type="button" name="Save" value="<bean:message key='BzComposer.global.save'/>"/>&nbsp;&nbsp;
											<input type="button" name="Delete" value="<bean:message key='BzComposer.global.delete'/>"/>
										</td>
									</tr>
								</table>
								<div id="orderTemplateList" style="font-size: 1em;">
									<table class="table-notifications" width="80%">
										<tr>
											<th colspan="2" align="left">
												<bean:message key="BzComposer.configuration.ordertemplatelist" />
											</th>
										</tr>
										<tr>
											<td></td>
										</tr>
									</table>
									</div>	
								</div>  
							</div>	
							<!--  Reminders Starts -->
							<div id="reminder"> 
								<div id="content4" class="tabPage">
									<%-- <%@include file="reminder.jsp" %> --%>
									<jsp:include page="/configuration/ReminderNew.jsp"/>
								</div>
							</div>
							<div id="emailSetup">
								<div id="tabs1" style="height:600px;">
  									<ul>
    									<li style="font-size: 1em;">
    										<a href="#smtpServerSettings">
    											<bean:message key="BzComposer.tab.smtpServerSettings"/>
    										</a>
										</li>
    									<li style="font-size: 1em;">
    										<a href="#emailTemplate">
    											<bean:message key="BzComposer.configuration.emailtemplate"/>
   											</a>
										</li>
									</ul>
									<div id="smtpServerSettings">
										<div id="content" class="tabPage">
											<%-- <jsp:include page="/configuration/smtpSetup.jsp"/> --%> 
											<!-- SMTP Setup Starts -->
											<table class="table-notifications" width="100%">
												<tr>
													<td colspan="2" style="font-size: 1em;">
														<b><bean:message key="BzComposer.configuration.setuploginnote" /></b>
													</td>
												</tr>
												<tr>
													<th align="left" colspan="2" style="font-size: 1.2em;">
														<bean:message key="BzComposer.configuration.serverinformation" />
													</th>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<bean:message key="BzComposer.configuration.senderemailaddress" />
													</td>
													<td style="font-size: 1em;">
														&nbsp;&nbsp;&nbsp; 
														<html:text property="senderEmail" size="30" maxlength="45"></html:text>
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<bean:message key="BzComposer.configuration.smtpserver" />
													</td>
													<td style="font-size: 1em;">
														&nbsp;&nbsp;&nbsp; 
														<html:text property="mailServer" size="30" maxlength="45"></html:text>
													</td>
												</tr>
												<tr>
													<td colspan="2" style="font-size: 1em;">
														<input type="button" name="testMailConnection" class="formButton" size="25" onclick="TestConnection()"
														value='<bean:message key="BzComposer.configuration.testconnectiontomailserverbtn" />' /> 
													</td>
												</tr>
												<tr>
													<td colspan="2" style="font-size: 1em;"> 
														<bean:message key="BzComposer.configuration.mailserverauthentication" />
													</td>
												</tr>
												<tr>
													<td colspan="2" style="font-size: 1em;">
														<html:checkbox property="mailAuth" onclick="EnableDisableFields();" >
															<bean:message key="BzComposer.configuration.serverrequeiresauthentication" />
														</html:checkbox>
													</td>
												</tr>
												<tr>
													<th align="left" colspan="2" style="font-size: 1.2em;">
														<bean:message key="BzComposer.configuration.userinformation" />
													</th>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<bean:message key="BzComposer.configuration.username" />
													</td>
													<td style="font-size: 1em;">
														&nbsp;&nbsp;&nbsp; 
														<html:text property="mailUserName" size="30" maxlength="45" ></html:text>
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<bean:message key="BzComposer.configuration.password" />
													</td>
													<td style="font-size: 1em;">
														&nbsp;&nbsp;&nbsp; 
														<html:text property="mailPassword" size="30" maxlength="35" ></html:text>
													</td>
												</tr>
											</table>
											<!-- SMTP Setup Ends -->
										</div>
									</div>
									<div id="emailTemplate">
										<div id="content2" class="tabPage"> 
										<jsp:include page="/configuration/emailSetupNew.jsp"/>
									</div>
									</div>
								</div>
								</div>
							</div>
							<!-- Remainder Ends -->
					</div>
					<!-- general ends -->
				</td>
			</tr>
	</table>
	<div>
		<html:hidden property="empStateID" />
		<html:hidden property="labelName" /> <html:hidden property="fileName" />
	 </div>
	<div>
		<input type="hidden" name="tabid" id="tabid" value="" />
		<input type="hidden" name="salesOrderBoard" value=""/>
		<input type="hidden" name="itemReceivedBoard" value=""/>
		<input type="hidden" name="itemShippedBoard" value=""/>
		<input type="hidden" name="poboard" value=""/>
	</div>
	</div>
	<div align="center" id="generalButtons" style="display: block;">
		<%-- <html:button property="" onclick="SaveValues()" style="font-size: 1em;">Save</html:button>
		<html:cancel style="font-size: 1em;">Cancel</html:cancel> --%>
		<input type="submit" name="Save" id="Save" onclick="SaveValues()" style="font-size:1em;" value="<bean:message key='BzComposer.global.save'/>">
		<input type="reset" id="Cancel" name="Cancel" onclick="RevokeValues()" style="font-size:1em;" value="<bean:message key='BzComposer.global.cancel'/>">
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</html:form>
<%@ include file="/include/footer.jsp"%>
</body>
<script type="text/javascript">
/* function SaveValues(){
	if(confirm('<bean:message key="BizComposer.Configuration.SaveConfirm"/>')){
		debugger;
		/* document.configurationForm.annualInterestRate.value = wxToFixed(document.configurationForm.annualInterestRate.value,2);
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
		document.configurationForm.currencyID.value = parseInt(document.configurationForm.currencyID.value);
		debugger;
		var currencyValue = $.trim($("#currencyID option:selected").text());
		alert("CurrencyID:"+document.configurationForm.currencyID.value+"\n CurrencyText:"+currencyValue);
		document.configurationForm.weightID.value = parseInt(document.configurationForm.weightID.value); 
		debugger;
		var weightName =$.trim($("#weightID option:selected").text());
		alert("Weight:"+document.configurationForm.weightID.value+"\n WeightName:"+weightName);	
		document.configurationForm.defaultLabelID.value = document.configurationForm.defaultLabelID.value;
		var labelValue = $.trim($("#defaultLabelID option:selected").text());
		alert("DefaultLabelID:"+document.configurationForm.defaultLabelID.value+"\n Label Name:"+labelValue);
		//document.configurationForm.productTaxable.value = 
		document.configurationForm.filterOption.value = document.configurationForm.filterOption.value;
		var filterOption = $.trim($("#filterOption option:selected").text());
		alert("FilterOptionID:"+document.configurationForm.filterOption.value+"\nName:"+filterOption);
		document.configurationForm.moduleName.value = document.configurationForm.moduleName.value;
		//document.configurationForm.moduleID.value = document.configurationForm.moduleID.value;
		var moduleName = $.trim($("#moduleName option:selected").text());
		alert("StartingModuleId:"+document.configurationForm.moduleName.value+"\nName:"+moduleName);
	}
} */

function SaveValues()
{
	/* if(confirm('<bean:message key="BzComposer.configuration.saveconfirm"/>')){
		debugger;
		
		document.configurationForm.currencyID.value = parseInt(document.configurationForm.currencyID.value);
		var currencyValue = $.trim($("#currencyID option:selected").text());
		
		//document.configurationForm.currencyName.value = currencyValue;

		
		document.configurationForm.weightID.value = parseInt(document.configurationForm.weightID.value); 
		var weightName =$.trim($("#weightID option:selected").text());
		//document.configurationForm.weightName.value = weightName;

		
		document.configurationForm.defaultLabelID.value = document.configurationForm.defaultLabelID.value;
		var labelValue = $.trim($("#defaultLabelID option:selected").text());
		//document.configurationForm.labelName.value = labelValue;

		//document.configurationForm.productTaxable.value = 
			
		document.configurationForm.filterOption.value = document.configurationForm.filterOption.value;
		var filterOption = $.trim($("#filterOption option:selected").text());

		
		document.configurationForm.moduleID.value = document.configurationForm.moduleID.value;
		var moduleName = $.trim($("#moduleID option:selected").text());

		debugger;
		
		document.configurationForm.salesOrderBoard.value = document.configurationForm.salesOrderBoard.value;
		document.configurationForm.itemReceivedBoard.value = document.configurationForm.itemReceivedBoard.value;
		document.configurationForm.poboard.value = document.configurationForm.poboard.value;
		document.configurationForm.itemShippedBoard.value = document.configurationForm.itemShippedBoard.value;
		
		var salesOrderBoard = $("#salesOrderBoard").val();
		var itemReceivedBoard = $("#itemReceivedBoard").val();
		var poboard = $("#poboard").val();
		var itemShippedBoard = $("#itemShippedBoard").val();
		
		document.getElementById('salesOrderBoard').value = salesOrderBoard;
		document.getElementById('itemReceivedBoard').value = itemReceivedBoard;
		document.getElementById('itemShippedBoard').value = itemShippedBoard;
		document.getElementById('poboard').value = poboard;
		
		document.getElementById('tabid').value="SaveConfigurationGeneral";
		document.forms[0].action = "Configuration.do";
		document.forms[0].submit();
	}
		*/
		
		debugger;
		event.preventDefault();
		$("#showsaverecorddialog").dialog({
		    	resizable: false,
		        height: 200,
		        width: 500,
		        modal: true,
		        buttons: {
		        	"<bean:message key='BzComposer.global.ok'/>": function () {
		            	debugger;
		            	
		            	document.configurationForm.currencyID.value = parseInt(document.configurationForm.currencyID.value);
		        		var currencyValue = $.trim($("#currencyID option:selected").text());
		        		
		        		document.configurationForm.weightID.value = parseInt(document.configurationForm.weightID.value); 
		        		var weightName =$.trim($("#weightID option:selected").text());
		        		
		        		document.configurationForm.defaultLabelID.value = document.configurationForm.defaultLabelID.value;
		        		var labelValue = $.trim($("#defaultLabelID option:selected").text());
		        		
		        		document.configurationForm.filterOption.value = document.configurationForm.filterOption.value;
		        		var filterOption = $.trim($("#filterOption option:selected").text());
		            	
		            	document.configurationForm.moduleID.value = document.configurationForm.moduleID.value;
		        		var moduleName = $.trim($("#moduleID option:selected").text());
		        		
		            	debugger;
		        		
		        		document.configurationForm.salesOrderBoard.value = document.configurationForm.salesOrderBoard.value;
		        		document.configurationForm.itemReceivedBoard.value = document.configurationForm.itemReceivedBoard.value;
		        		document.configurationForm.poboard.value = document.configurationForm.poboard.value;
		        		document.configurationForm.itemShippedBoard.value = document.configurationForm.itemShippedBoard.value;
		        		
		        		/*first checkbox for showReminder*/
		        		document.configurationForm.showReminder.value = $("#showReminder").val();
		        		
		        		/*Radio Button values- Either 0 or 1*/
		        		document.configurationForm.invoiceMemo.value = document.configurationForm.invoiceMemo.value;
		        		document.configurationForm.overdueInvoice.value = document.configurationForm.overdueInvoice.value;
		        		document.configurationForm.inventoryOrder.value = document.configurationForm.inventoryOrder.value;
		        		document.configurationForm.billsToPay.value = document.configurationForm.billsToPay.value;
		        		document.configurationForm.memorizeEstimation.value = document.configurationForm.memorizeEstimation.value;
		        		document.configurationForm.serviceBilling.value = document.configurationForm.serviceBilling.value;
		        		document.configurationForm.memorizeBill.value = document.configurationForm.memorizeBill.value;
		        		document.configurationForm.memorizePurchaseOrder.value = document.configurationForm.memorizePurchaseOrder.value;
		        		
		        		/*All RadioButton Days value*/
		        		document.configurationForm.invoiceMemoDays.value = document.configurationForm.invoiceMemoDays.value;
		        		document.configurationForm.overdueInvoiceDays.value = document.configurationForm.overdueInvoiceDays.value;
		        		document.configurationForm.inventoryOrderDays.value = document.configurationForm.inventoryOrderDays.value;
		        		document.configurationForm.billsToPayDays.value = document.configurationForm.billsToPayDays.value;
		        		document.configurationForm.memorizeEstimationDays.value = document.configurationForm.memorizeEstimationDays.value;
		        		document.configurationForm.memorizePurchaseOrderDays.value = document.configurationForm.memorizePurchaseOrderDays.value;
		        		document.configurationForm.serviceBillingDays.value = document.configurationForm.serviceBillingDays.value;
		        		document.configurationForm.memorizeBillDays.value = document.configurationForm.memorizeBillDays.value;
		        		
		        		document.getElementById('showReminderStatus').value = $("#showReminder").val();
		        		
		        		
		        		var salesOrderBoard = $("#salesOrderBoard").val();
		        		var itemReceivedBoard = $("#itemReceivedBoard").val();
		        		var poboard = $("#poboard").val();
		        		var itemShippedBoard = $("#itemShippedBoard").val();
		        		
		        		document.getElementById('salesOrderBoard').value = salesOrderBoard;
		        		document.getElementById('itemReceivedBoard').value = itemReceivedBoard;
		        		document.getElementById('itemShippedBoard').value = itemShippedBoard;
		        		document.getElementById('poboard').value = poboard;
		        		
		        		document.getElementById('tabid').value="SaveConfigurationGeneral";
		        		document.forms[0].action = "Configuration.do";
		        		document.forms[0].submit();
						//$('form').submit();
		            },
		            "<bean:message key='BzComposer.global.cancel'/>": function () {
		                $(this).dialog("close");
		                return false;
		            }
		        }
		    });
		    return false;
}

function SaveValuesFeatures()
{
	if(confirm('<bean:message key="BzComposer.configuration.saveconfirm"/>'))
	{
		//debugger;
		
		/* document.configurationForm.selectedModules.value = document.configurationForm.selectedModules.value;
		document.configurationForm.selectedModuleId.value = document.configurationForm.selectedModuleId.value;
		
		debugger
		
		var x = document.getElementById("selectedModules");
	    var txt = "";
	    var i;
	    for (i = 0; i < x.length; i++) 
	    {
	        txt = txt + "\n" + x.options[i].text;
	    }

	    
	    document.configurationForm.selectedModules.value = txt;
	    
	    var x = document.getElementById("selectedModuleId");
	    var txt1 = "";
	    var i;
	    for (i = 0; i < x.length; i++) 
	    {
	        txt1 = txt1 + "\n" + x.options[i].text;
	    }


		document.configurationForm.selectedModuleId.value = txt1; */
		
		debugger;
		event.preventDefault();
		$("#showsaverecorddialog").dialog({
		    	resizable: false,
		        height: 200,
		        width: 500,
		        modal: true,
		        buttons: {
		        	"<bean:message key='BzComposer.global.ok'/>": function () {
		            	debugger;
		            	document.configurationForm.selectedModules.value = document.configurationForm.selectedModules.value;
		        		document.configurationForm.selectedModuleId.value = document.configurationForm.selectedModuleId.value;
		        		
		        		debugger
		        		
		        		var x = document.getElementById("selectedModules");
		        	    var txt = "";
		        	    var i;
		        	    for (i = 0; i < x.length; i++) 
		        	    {
		        	        txt = txt + "\n" + x.options[i].text;
		        	    }
		        	    document.configurationForm.selectedModules.value = txt;
		        	    
		        	    var x = document.getElementById("selectedModuleId");
		        	    var txt1 = "";
		        	    var i;
		        	    for (i = 0; i < x.length; i++) 
		        	    {
		        	        txt1 = txt1 + "\n" + x.options[i].text;
		        	    }
		        		
						//$('form').submit();
		            },
		            "<bean:message key='BzComposer.global.cancel'/>": function () {
		                $(this).dialog("close");
		                return false;
		            }
		        }
		    });
		    return false;
	}
}
function RevokeValues(){
	document.getElementById('tid').value="config";
	document.forms[0].action = "Configuration.do";
	document.forms[0].submit();
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
</script>
</html>
<!-- Dialog box used in this page -->
<div id="showsaverecorddialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.saveconfirm"/></p>
</div>
<div id="serverconnectederrordialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.manageservicetype.serverconnectederror"/></p>
</div>