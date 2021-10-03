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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>

<script>
function toggleFunction() {
	debugger;
  var x = document.getElementById("divtoggle");
  var lftmenu = document.getElementById("leftMenu");
  if (x.style.display === "none") {
    x.style.display = "block";
    lftmenu.style.width = "180px";
    lftmenu.style.position = "relative";
    /* document.getElementById("togglebtn").value = "+"; */
  } else {
    x.style.display = "none";
    lftmenu.style.width = "0";
    lftmenu.style.position = "absolute";
    /* document.getElementById("togglebtn").value = "-"; */
  }
} 
</script>
<script type="text/javascript">
function showLocale()
{
	var lang = document.getElementById("locale").value;
	var locale = "<%= request.getAttribute("selectedLocale")%>";
	
	if(lang == "" && locale != "")
	{
		$('select[id="locale"]').find('option[value="'+locale+'"]').attr("selected",true);
		return showLanguageDialog();
	}
	else
	{
		window.location="./changeLocale?lang="+lang;
	}
}
function showLanguageDialog()
{
	event.preventDefault();
	$("#showLanguageDialog").dialog({
    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

$(function() {
    $("#tabs").tabs();
    $("#tabs1").tabs();
});
$(document).ready(function()
{
	debugger;
	var isSOBChecked = "<%= request.getAttribute("isSOBChecked")%>";
	var isISBChecked = "<%= request.getAttribute("isISBChecked")%>";
	var isIRBChecked = "<%= request.getAttribute("isIRBChecked")%>";
	var isPOBChecked = "<%= request.getAttribute("isPOBChecked")%>";
	var isSelectedWeightID = "<%= request.getAttribute("isSelectedWeightID")%>";
	
	$('select[id="weightID"]').find('option[value="'+isSelectedWeightID+'"]').attr("selected",true);
	
	$('#salesOrderBoard').change(function()
	{
		var isChecked = isSOBChecked;
		if($(this).prop("checked") == true)
		{
	        $("#salesOrderBoard").attr('checked', true);
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {
	        $("#salesOrderBoard").attr('checked', false);
	        isChecked = "off";
		}	
	    else
	    {
	        $("#salesOrderBoard").attr('checked', isChecked);
	    }	
		document.configurationForm.salesOrderBoard.value = isChecked;
		$("#salesOrderBoard").val(isChecked);
	});
	$('#itemReceivedBoard').change(function()
	{
		
		var isChecked = isIRBChecked;
		if($(this).prop("checked") == true)
		{
	        $("#itemReceivedBoard").attr('checked', true);
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {
	        $("#itemReceivedBoard").attr('checked', false);
	        isChecked = "off";
		}	
	    else
	    {
	        $("#itemReceivedBoard").attr('checked', isChecked);
	    }	
		document.configurationForm.itemReceivedBoard.value = isChecked;
		$("#itemReceivedBoard").val(isChecked);
	});
	$('#poboard').change(function()
	{
		var isChecked = isPOBChecked;
		if($(this).prop("checked") == true)
		{
	        $("#poboard").attr('checked', true);
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {
	        $("#poboard").attr('checked', false);
	        isChecked = "off";
		}	
	    else
	    {
	        $("#poboard").attr('checked', isChecked);
	    }	
    	document.configurationForm.poboard.value = isChecked;
		$("#poboard").val(isChecked);
	});
	$('#itemShippedBoard').change(function()
	{
		var isChecked = isISBChecked;
		
		if($(this).prop("checked") == true)
		{
	        $("#itemShippedBoard").attr('checked', true);
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {
	        $("#itemShippedBoard").attr('checked', false);
	        isChecked = "off";
		}	
	    else
	    {
	        $("#itemShippedBoard").attr('checked', isChecked);
	    }	
    	document.configurationForm.itemShippedBoard.value = isChecked;
		$("#itemShippedBoard").val(isChecked);
	});
}); 
function TestConnection()
{
	d = new Date();
	var host = document.configurationForm.mailServer.value;
	oEmail = c(CheckEmailConnection);
	oGET(oEmail,'<bean:write name="path" property="pathvalue"/>/include/testMailServerConnection.jsp?HostName='+host+'&Date='+d);
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
  } 
  catch (ex) {
  }
}
function CheckEmailConnection()
{
	if (oEmail.readyState != 4 || oEmail.status != 200) { 
	  	return;
	}
	response = parseInt(trim(oEmail.responseText));
	if(response == 1)
	{
		return serverconnectedseccessdialog();
		document.configurationForm.mailAuth.disabled=false;    		
		EnableDisableFields();
	}
	else
	{
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
<body onload="init();">
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
	<div id="table-negotiations" style="padding: 0; border: 1px solid #ccc;">
		<table cellspacing="0" style="border: 0; padding: 0; width: 100%;overflow-y:scroll;" class="section-border">
			<!-- <tr>
				<td>
					<span style="font-size:30px;cursor:pointer; margin-left: 30px;" onclick="toggleFunction()">&#9776;</span>
				</td>
				<td></td>
			</tr> -->
			<tr>
			<span style="font-size:30px;cursor:pointer; margin-left: 20px;" onclick="toggleFunction()">&#9776;</span>
				<td id="leftMenu" style="position: relative; width: 180px;">
					<table>
						<tr>
							<td>
								<%@include file="menuPage.jsp" %>
							</td>
						</tr>
					</table>
				</td>
				<td valign="top">
				
					<!-- General -->
					<div>
						<html:errors/>
					</div>
					<!-- general page content starts -->
					<div id="general" style="display:none;padding: 0; position: relative; left: 0;">
						<div id="tabs" style="height: auto;">
  							<ul>
    							<li style="font-size: 12px;">
    								<a href="#GeneralSetting">
    									<bean:message key="BzComposer.configuration.tab.generalsettings" />
   									</a>
								</li>
    							<li style="font-size: 12px;">
    								<a href="#features">
    									<bean:message key="BzComposer.configuration.tab.features" />
   									</a>
								</li>
    							<li style="font-size: 12px;">
    								<a href="#orderTemplate">
    									<bean:message key="BzComposer.configuration.tab.orderTemplate" />
   									</a>
								</li>
								<li style="font-size: 12px;">
    								<a href="#reminder">
    									<bean:message key="BizComposer.Configuration.Reminders"/>
   									</a>
								</li>
								<li style="font-size: 12px;">
    								<a href="#emailSetup">
    									<bean:message key="BzComposer.tab.eMailSetup"/>
   									</a>
								</li>
  							</ul>
  							<div id="GeneralSetting">
								<div id="content1" class="tabPage">
									<table class="table-notifications" width="80%">
										<tr>
											<th colspan="2" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.generaltitle" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.currency" />
											</td>
											<td style="font-size: 12px;">
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
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.weight" />
											</td>
											<td style="font-size: 12px;">
												<html:select property="weightID" style="font-size: 12px;" 
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
											<td>
												Language
											</td>
											<td>
												<select name="locale" id="locale" onchange="showLocale();">
													<option value=""><bean:message key="BzComposer.selectlanguage"/></option>
													<option value="en"><bean:message key="BzComposer.selectlanguage.english"/></option>
													<option value="zh"><bean:message key="BzComposer.selectlanguage.chinese"/></option>
													<option value="es"><bean:message key="BzComposer.selectlanguage.spanish"/></option>
												</select>
											</td>
										</tr>
										<tr>
											<th colspan="2" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.addresslabel" />
											</th>
										</tr>
										<tr colspan="2">
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.defaultlabel" />
											</td>
											<td style="font-size: 12px;">
												<logic:present name="Labels">
													<html:select property="defaultLabelID" 
													onchange="SetLabelName(this.value);" style="width:200" 
													styleId="defaultLabelID">
														<html:optionsCollection name="Labels" />
													</html:select>
												</logic:present>
											</td>
										</tr>
										<tr>
											<td colspan="2" align="center" style="font-size: 12px;">
												<input type="button" class="formButton"
												value='<bean:message key="BzComposer.configuration.setuplabelbtn"/>'
												title='<bean:message key="BzComposer.configuration.setuplabeltooltip"/>' />
											</td>
										</tr>
										<tr>
											<th colspan="2" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.defaultfilteroption" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.defaultfilteroption" />:
											</td>
											<td style="font-size: 12px;">
												<html:select property="filterOption" styleId="filterOption">
													<html:option value="All">
													<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.all"/>
													</html:option>
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
											<th colspan="2" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BizCompozer.StartingPageSetting" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.defaultstartingpage" />:
											</td>
											<td style="font-size: 12px;">
												<html:select property="moduleID" styleId="moduleID">
													<html:option value="3"><bean:message key="BzComposer.configuration.defaultstartingpage.customer"/></html:option>
													<html:option value="5"><bean:message key="BzComposer.configuration.defaultstartingpage.inventory"/></html:option>
													<html:option value="1"><bean:message key="BzComposer.configuration.defaultstartingpage.invoice"/></html:option>
													<html:option value="6"><bean:message key="BzComposer.configuration.defaultstartingpage.navigationpage"/></html:option>
													<html:option value="2"><bean:message key="BzComposer.configuration.defaultstartingpage.po"/></html:option>
													<html:option value="4"><bean:message key="BzComposer.configuration.defaultstartingpage.vendor"/></html:option>
												</html:select>
											</td>
										</tr>
										<tr>
											<th colspan="2" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.defaultdashboardsetting" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.defaultcustomdashboard" />:
											</td>
											<td align="left" style="font-size: 12px;">
												<html:checkbox property="salesOrderBoard" styleId="salesOrderBoard">
												<bean:message key="BzComposer.configuration.defaultdashboard.opensalesorders" />
												</html:checkbox>&nbsp;&nbsp;&nbsp;
												<html:checkbox property="itemReceivedBoard" styleId="itemReceivedBoard">
												<bean:message key="BzComposer.configuration.defaultdashboard.itemreceived" />
												</html:checkbox> 
												<br/>
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
											<th colspan="3" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.feturesheader" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<b>
													<bean:message key="BzComposer.configuration.features.availablemodules" />
												</b>
											</td>
											<td>&nbsp;&nbsp;</td>
											<td style="font-size: 12px;">
												<b>
													<bean:message key="BzComposer.configuration.features.selectedmodules" />
												</b>
											</td>
										</tr>
										<tr>
											<td width="25%" style="font-size: 12px;">
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
											<td style="font-size: 12px;">
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
							<div id="orderTemplate" style="font-size: 12px;">
			   					<div id="content3" class="tabPage">
									<table class="table-notifications" width="100%">
										<tr>
											<th colspan="2" align="left" style="font-size: 12px; padding: 5px;">
											<bean:message key="BzComposer.configuration.importantordertemplate" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.importantordertemplate.templatename" />
											</td>
											<td style="font-size: 12px;">
												<html:text property="templateName"></html:text>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.choosefilebtn"/>
											</td>
											<td style="font-size: 12px;">
												<html:file property="fileName" accept=".xls"></html:file>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="2" style="font-size: 12px;">
												<bean:message key="Bzcomposer.configuration.choosefilebtn.onlyexcelfiles"/>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<html:checkbox property="def" >
												</html:checkbox>
												<bean:message key="BzComposer.configuration.defaultchkbox" />
											</td>
										</tr>
										<tr>
											<th colspan="2" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.fieldsmapping" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 12px;"><b><bean:message key="BzComposer.configuration.databasefieldsname"/> </b></td>
											<td style="font-size: 12px;"><b><bean:message key="BzComposer.configuration.mappingfieldsname"/></b></td>
										</tr>
										<tr>
											<td style="font-size: 12px;"><bean:message key= "BzComposer.configuration.itemcode"/>*</td>
											<td style="font-size: 12px;"><html:text property="itemCode"></html:text></td>
										</tr>
										<tr>
											<td style="font-size: 12px;"><bean:message key = "BzComposer.configuration.itemname"/></td>
											<td style="font-size: 12px;"><html:text property="itemName"></html:text></td>
										</tr>
										<tr>
											<td style="font-size: 12px;"><bean:message key="BzComposer.configuration.qty"/>*</td>
											<td style="font-size: 12px;"><html:text property="qty"></html:text></td>
										</tr>
										<tr>
											<td style="font-size: 12px;"><bean:message key="BzComposer.configuration.unitprice"/>*</td>
											<td style="font-size: 12px;"><html:text property="unitPrice"></html:text></td>
										</tr>
										<tr>
											<td style="font-size: 12px;"><bean:message key="BzComposer.configuration.unitweight"/></td>
											<td style="font-size: 12px;"><html:text property="weight"></html:text></td>
										</tr>
										<tr>
											<td style="font-size: 12px;"><bean:message key="BzComposer.configuration.taxable"/></td>
											<td style="font-size: 12px;"><html:text property="taxable" value=""></html:text></td>
										</tr>
										<tr>
											<td colspan="2" align="center" style="font-size: 12px; padding: 5px;">
												<input type="button" name="New" value="<bean:message key='BzComposer.global.new'/>"/>&nbsp;&nbsp;
												<input type="button" name="Save" value="<bean:message key='BzComposer.global.save'/>"/>&nbsp;&nbsp;
												<input type="button" name="Delete" value="<bean:message key='BzComposer.global.delete'/>"/>
											</td>
										</tr>
									</table>
									<div id="orderTemplateList">
										<table class="table-notifications" width="80%">
											<tr>
												<th colspan="2" align="left" style="font-size: 12px;  padding: 5px;">
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
									<jsp:include page="/configuration/ReminderNew.jsp"/>
								</div>
							</div>
							<div id="emailSetup">
								<div id="tabs1" style="height:600px;">
  									<ul>
    									<li style="font-size: 12px;">
    										<a href="#smtpServerSettings">
    											<bean:message key="BzComposer.tab.smtpServerSettings"/>
    										</a>
										</li>
    									<li style="font-size: 12px;">
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
													<td colspan="2" style="font-size: 12px;">
														<b><bean:message key="BzComposer.configuration.setuploginnote" /></b>
													</td>
												</tr>
												<tr>
													<th align="left" colspan="2" style="font-size: 12px; padding: 5px;">
														<bean:message key="BzComposer.configuration.serverinformation" />
													</th>
												</tr>
												<tr>
													<td style="font-size: 12px;">
														<bean:message key="BzComposer.configuration.senderemailaddress" />
													</td>
													<td style="font-size: 12px;">
														&nbsp;&nbsp;&nbsp; 
														<html:text property="senderEmail" size="30" maxlength="45"></html:text>
													</td>
												</tr>
												<tr>
													<td style="font-size: 12px;">
														<bean:message key="BzComposer.configuration.smtpserver" />
													</td>
													<td style="font-size: 12px;">
														&nbsp;&nbsp;&nbsp; 
														<html:text property="mailServer" size="30" maxlength="45"></html:text>
													</td>
												</tr>
												<tr>
													<td colspan="2" style="font-size: 12px;">
														<input type="button" name="testMailConnection" class="formButton" size="25" onclick="TestConnection()"
														value='<bean:message key="BzComposer.configuration.testconnectiontomailserverbtn" />' /> 
													</td>
												</tr>
												<tr>
													<td colspan="2" style="font-size: 12px;"> 
														<bean:message key="BzComposer.configuration.mailserverauthentication" />
													</td>
												</tr>
												<tr>
													<td colspan="2" style="font-size: 12px;">
														<html:checkbox property="mailAuth" onclick="EnableDisableFields();" >
															<bean:message key="BzComposer.configuration.serverrequeiresauthentication" />
														</html:checkbox>
													</td>
												</tr>
												<tr>
													<th align="left" colspan="2" style="font-size: 12px; padding: 5px;">
														<bean:message key="BzComposer.configuration.userinformation" />
													</th>
												</tr>
												<tr>
													<td style="font-size: 12px;">
														<bean:message key="BzComposer.configuration.username" />
													</td>
													<td style="font-size: 12px;">
														&nbsp;&nbsp;&nbsp; 
														<html:text property="mailUserName" size="30" maxlength="45" ></html:text>
													</td>
												</tr>
												<tr>
													<td style="font-size: 12px;">
														<bean:message key="BzComposer.configuration.password" />
													</td>
													<td style="font-size: 12px;">
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
					</div>
					<!-- general page content ends -->
				</td>
			</tr>
	</table>
	<div>
		<html:hidden property="empStateID" />
		<html:hidden property="labelName" /> 
		<html:hidden property="fileName" />
	 </div>
	<div>
		<input type="hidden" name="tabid" id="tabid" value="" />
		<input type="hidden" name="salesOrderBoard" value=""/>
		<input type="hidden" name="itemReceivedBoard" value=""/>
		<input type="hidden" name="itemShippedBoard" value=""/>
		<input type="hidden" name="poboard" value=""/>
	</div>
	<div align="center" id="generalButtons" style="display: block;">
		<input type="submit" name="Save" id="Save" onclick="SaveValues()" style="font-size:14px;" 
		value="<bean:message key='BzComposer.global.save'/>">
		<input type="reset" id="Cancel" name="Cancel" onclick="RevokeValues()" style="font-size:14px;" 
		value="<bean:message key='BzComposer.global.cancel'/>">
	</div>
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
<script type="text/javascript">
function SaveValues()
{
	event.preventDefault();
	$("#showsaverecorddialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	        	"<bean:message key='BzComposer.global.ok'/>": function () {
	            	
	            	/* document.configurationForm.currencyID.value = parseInt(document.configurationForm.currencyID.value);
	        		var currencyValue = $.trim($("#currencyID option:selected").text());
	        		
	        		document.configurationForm.weightID.value = parseInt(document.configurationForm.weightID.value); 
	        		var weightName =$.trim($("#weightID option:selected").text());
	        		
	        		document.configurationForm.defaultLabelID.value = document.configurationForm.defaultLabelID.value;
	        		var labelValue = $.trim($("#defaultLabelID option:selected").text());
	        		
	        		document.configurationForm.filterOption.value = document.configurationForm.filterOption.value;
	        		var filterOption = $.trim($("#filterOption option:selected").text());
	            	
	            	document.configurationForm.moduleID.value = document.configurationForm.moduleID.value;
	        		var moduleName = $.trim($("#moduleID option:selected").text());
	        		//Added by tulsi   
	        		

	        		document.configurationForm.salesOrderBoard.value = document.configurationForm.salesOrderBoard.value;
	        		document.configurationForm.itemReceivedBoard.value = document.configurationForm.itemReceivedBoard.value;
	        		document.configurationForm.poboard.value = document.configurationForm.poboard.value;
	        		document.configurationForm.itemShippedBoard.value = document.configurationForm.itemShippedBoard.value; */
	        		
	        		/*first checkbox for showReminder*/
	        		//document.configurationForm.showReminder.value = $("#showReminder").val();
	        		
	        		/*Radio Button values- Either 0 or 1*/
	        		/* document.configurationForm.invoiceMemo.value = document.configurationForm.invoiceMemo.value;
	        		document.configurationForm.overdueInvoice.value = document.configurationForm.overdueInvoice.value;
	        		document.configurationForm.inventoryOrder.value = document.configurationForm.inventoryOrder.value;
	        		document.configurationForm.billsToPay.value = document.configurationForm.billsToPay.value;
	        		document.configurationForm.memorizeEstimation.value = document.configurationForm.memorizeEstimation.value;
	        		document.configurationForm.serviceBilling.value = document.configurationForm.serviceBilling.value;
	        		document.configurationForm.memorizeBill.value = document.configurationForm.memorizeBill.value;
	        		document.configurationForm.memorizePurchaseOrder.value = document.configurationForm.memorizePurchaseOrder.value; */
	        		
	        		/*All RadioButton Days value*/
	        		/* document.configurationForm.invoiceMemoDays.value = document.configurationForm.invoiceMemoDays.value;
	        		document.configurationForm.overdueInvoiceDays.value = document.configurationForm.overdueInvoiceDays.value;
	        		document.configurationForm.inventoryOrderDays.value = document.configurationForm.inventoryOrderDays.value;
	        		document.configurationForm.billsToPayDays.value = document.configurationForm.billsToPayDays.value;
	        		document.configurationForm.memorizeEstimationDays.value = document.configurationForm.memorizeEstimationDays.value;
	        		document.configurationForm.memorizePurchaseOrderDays.value = document.configurationForm.memorizePurchaseOrderDays.value;
	        		document.configurationForm.serviceBillingDays.value = document.configurationForm.serviceBillingDays.value;
	        		document.configurationForm.memorizeBillDays.value = document.configurationForm.memorizeBillDays.value; 
	        		document.getElementById('showReminderStatus').value = $("#showReminder").val();*/
	        		var currencyID=document.getElementById("currencyID").value; 
	        		var weightID=document.getElementById("weightID").value; 
	        		var defaultLabelID=document.getElementById("defaultLabelID").value; 
	        		var filterOption=document.getElementById("filterOption").value; 
	        		var moduleID=document.getElementById("moduleID").value; 
	        		
	        		
	        		var salesOrderBoard = $("#salesOrderBoard").val();
	        		var itemReceivedBoard = $("#itemReceivedBoard").val();
	        		var poboard = $("#poboard").val();
	        		var itemShippedBoard = $("#itemShippedBoard").val();
	        		document.getElementById('salesOrderBoard').value = salesOrderBoard;
	        		document.getElementById('itemReceivedBoard').value = itemReceivedBoard;
	        		document.getElementById('itemShippedBoard').value = itemShippedBoard;
	        		document.getElementById('poboard').value = poboard;
	        		var x = document.getElementById("selectedModules");
	        	    var modules = "";
	        	    var i;
	        	    var moduleslist = [];
	        	    for (i = 0; i < x.length; i++) 
	        	    {
	        	    	modules =x.options[i].text;
	        	    	moduleslist.push(modules);
	        	    }
	        	    /* document.getElementById('tabid').value="SaveConfigurationGeneral";
	        		document.forms[0].action = "Configuration.do";
	        		document.forms[0].submit(); */
	        		window.location.href= "Configuration.do?tabid=SaveConfigurationGeneral&salesOrderBoard="+salesOrderBoard+"&itemReceivedBoard="
	        				+itemReceivedBoard+"&itemShippedBoard="+itemShippedBoard+"&poboard="+poboard+"&currencyID="+currencyID+"&weightID="+weightID+
	        				"&defaultLabelID="+defaultLabelID+"&filterOption="+filterOption+"&moduleID="+moduleID+"&moduleslist="+moduleslist;
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
		event.preventDefault();
		$("#showsaverecorddialog").dialog({
		    	resizable: false,
		        height: 200,
		        width: 500,
		        modal: true,
		        buttons: {
		        	"<bean:message key='BzComposer.global.ok'/>": function () {
		            	document.configurationForm.selectedModules.value = document.configurationForm.selectedModules.value;
		        		document.configurationForm.selectedModuleId.value = document.configurationForm.selectedModuleId.value;
		        				        		
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