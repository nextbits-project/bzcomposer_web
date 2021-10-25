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
<title><bean:message key="BzComposer.taxinfotitle" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<script type="text/javascript">alert(1);
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
$(function()
{
    $("#tabs1").tabs();
    $("#tabsTax").tabs();
    $("#tabs2").tabs();
    $("#tabs").tabs();
    $("#tabsFederalTax").tabs();
    $("#tabsCompanyTaxOption").tabs();

    var isUPS = $("#isUPSActive").val();
	var isUSPS = $("#isUSPSActive").val();
	var isFedex = $("#isFeDexActive").val();

	/* alert("is UPS Active:"+isUPS+"\n is USPS Active:"+isUSPS+"\n is Fedex Active:"+isFedex); */

	if(isUPS == 1)
	{
		$("#upsUserId").attr('readonly',true);
		$("#upsPassword").attr('readonly',true);
		$("#accessKey").attr('readonly',true);
		$("#upsAccountNo").attr('readonly',true);
		$("#isUPSActive").attr('checked',true);
	}
	else
	{
		$("#upsUserId").attr('readonly',false);
		$("#upsPassword").attr('readonly',false);
		$("#accessKey").attr('readonly',false);
		$("#upsAccountNo").attr('readonly',false);
		$("#isUPSActive").attr('checked',false);
	}

	if(isUSPS == 1)
	{
		$("#isUSPSActive").attr('checked',true);
		$("#uspsUserId").attr('readonly',true);
	}
	else
	{
		$("#isUSPSActive").attr('checked',false);
		$("#uspsUserId").attr('readonly',false);
	}

	if(isFedex == 1)
	{
		$("#fedexAccountNumber").attr('readonly',true);
		$("#fedexMeterNumber").attr('readonly',true);
		$("#fedexPassword").attr('readonly',true);
		$("#fedexTestKey").attr('readonly',true);
	}
	else
	{
		$("#fedexAccountNumber").attr('readonly',false);
		$("#fedexMeterNumber").attr('readonly',false);
		$("#fedexPassword").attr('readonly',false);
		$("#fedexTestKey").attr('readonly',false);
	}
});

$(document).ready(function(){
	$('#shippingTypeWeight').scroll(function(){
	    var length = $(this).scrollTop();
	    $('#shippingTypePrice').scrollTop(length);
	});
	$('#shippingTypePrice').scroll(function(){
		var length = $(this).scrollTop();
		$('#shippingTypeWeight').scrollTop(length);
	});

	$("#modifySeletedWeight").attr('disabled',true);
 	$("#deleteSeletedWeight").attr('disabled',true);

 	//$("#selectedMailTypeId")append(new Option("", "0"));
 	var o = new Option("", "0");
	$(o).html("");
	var o1 = new Option("", "0");
	$(o1).html("");
	var o2 = new Option("", "0");
	$(o2).html("");
	$("#selectedMailTypeId").append(o);
	$("#selectedPackageSizeId").append(o1);
	$("#selectedContainerId").append(o2);
 	$('select[id="selectedMailTypeId"]').find('option[value="'+0+'"]').attr("selected",true);
 	$('select[id="selectedPackageSizeId"]').find('option[value="'+0+'"]').attr("selected",true);
 	$('select[id="selectedContainerId"]').find('option[value="'+0+'"]').attr("selected",true);
});

function setPrice()
{
	$('select[id="shippingTypePrice"]').find('option').attr("selected",false);
 	var weight = $.trim($("#shippingTypeWeight option:selected").val());
 	$('select[id="shippingTypePrice"]').find('option[value="'+weight+'"]').attr("selected",true);
 	var price = $.trim($("#shippingTypePrice option:selected").text());
 	alert("Selected Weight:"+weight+"\n Price:"+price);
 	$("#upsWeight").val(weight);
 	$("#upsShippingFee").val("$"+price);
 	$("#modifySeletedWeight").attr('disabled',false);
 	$("#deleteSeletedWeight").attr('disabled',false);
}
function showPanel()
{
    var selectedTab = $("#tabs1").tabs('option','active');
    if(selectedTab == 2)
    {
    	document.getElementById("shippingFreeMethodDiv").style.display = "none";
    	document.getElementById("valueAddedCalculator").style.display = "none";
    }
    else
    {
    	document.getElementById("shippingFreeMethodDiv").style.display = "block";
    	document.getElementById("valueAddedCalculator").style.display = "block";
    }
}

/* comented on 24-11-2019 to prevent simple alert
function updateSelectedWeight()
{
	alert("Inside update weight function")
}

function deleteSelectedWeight()
{
	alert("Inside delete selected weight function");
}*/
function setServices()
{
	debugger
	var serviceName = $.trim($("#upsSelect option:selected").text());
	$("#upsServiceName").val(serviceName);
}

function setUSPSService()
{
	var uspsService = $("#uspsSelect option:selected").text();
	$("#uspsServiceName").val(uspsService);
}

function setWeightPrice()
{
	var shippingType = $("#userShippingType option:selected").val();
	if(shippingType == 0)
	{

		return selectshippingtypedialog();
	}
	else
	{

		$("#modifySeletedWeight").attr('disabled',true);
	 	$("#deleteSeletedWeight").attr('disabled',true);
		window.open("Configuration.do?tabid=config30&shippingCarrierId="+shippingType);
		//window.open("Configuration.do?tabid=showStore");
	}
}

function addModalShippingType()
{
	var sType = $.trim($("#modalShippingType option:selected").text());
	$("#selectedShippingType").val(sType);
}

function setModalDescription()
{
	debugger
	var sType = $.trim($("#modalShippingType option:selected").text());
	$("#selectedShippingType").val(sType);
}

/* comented on 24-11-2019 to prevent simple alert
function saveTemplate()
{
	alert("Inside saveTemplate Method")
}
function deleteTemplate()
{
	alert("Inside deleteTemplate Method")
} */
function saveModalShippingType()
{
	debugger
	var selectedSType = $.trim($("#modalShippingType option:selected").text());
	debugger
	var textboxValue = $("#selectedShippingType").val();
	debugger
	if(textboxValue =="")
	{

		return selectshippingtypetoupdatedialog();
	}
	else if(selectedSType == textboxValue)
	{

		return duplicatevaluedialog();
	}
	else
	{
		return ;
	}		//This else added on 24-11-2019
	/* else
	{
		alert(textboxValue)
	} */
}

function addNewTemplate()
{
	debugger
	document.getElementById("templateName").style.display = "block";
	document.getElementById("templateSubject").style.display = "block";
	document.getElementById("emailText").style.display = "block";
	document.getElementById("txtTemplateText").style.display = "none";
	document.getElementById("txtTemplateName").style.display = "none";
	document.getElementById("txtTemplateSubject").style.display = "none";
	document.getElementById("emailText").value = "<<name>>"+'\n'+"<<company name>>"+'\n'+"<<address>>"+'\n'+"<<phonenumber>>";
}
function setContent()
{
	debugger
	var id = $("#selectedTemplateId option:selected").val();

	document.getElementById("templateName").style.display = "none";
	document.getElementById("txtTemplateName").style.display = "block";
	document.getElementById("templateSubject").style.display = "none";
	document.getElementById("txtTemplateSubject").style.display = "block";
	document.getElementById("emailText").style.display = "none";
	document.getElementById("txtTemplateText").style.display = "block";

	//window.open("Configuration.do?tabid=config21&templateId="+id,null,"scrollbars=yes,height=600,width=1300,status=yes,toolbar=no,menubar=no,location=no");
}

function showTime()
{
	var h = document.getElementById("hours").value;
	var m = document.getElementById("minutes").value;
	var t = document.getElementById("selectedTime").value;
	if(h>=0 && h<10)
	{
		h = "0"+h;
	}
	if(m>=0 && m<10)
	{
		m = "0"+m;
	}
	var time = h+" : "+ m +" "+ t;
	$("#scheduleTime").append("<option value=" + time + ">"+ time + "</option>");
}
function removeTime()
{
	$('#scheduleTime option:selected').remove();
}
</script>
</head>
<!-- <body onload="init2();"> -->
<body onload="init();">
<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post">

<div id="ddcolortabsline">&nbsp;</div>
<!-- <div id="cos"></div> -->
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
	<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.configuration.configurationtitle"/>
	</span>
</div>
<div>
	<div>
		<logic:present name="Labels">
			<bean:size name="Labels" id="size" />
				<input type="hidden" name="lsize" id="lblsize" value='<bean:write name="size" />' />
				<logic:iterate name="Labels" id="lbl" indexId="index">
					<input type="hidden" id='<bean:write name="index" />lid' name='<bean:write name="index" />lidname'
						value='<bean:write name="lbl" property="value" />' />
					<input type="hidden" id='<bean:write name="index" />lname' name='<bean:write name="index" />lnm'
						value='<bean:write name="lbl" property="label" />' />
				</logic:iterate>
		</logic:present>
	</div>
	<div id="table-negotiations" style="padding: 0; border: 1px solid #ccc;">
		<span style="font-size:30px;cursor:pointer; margin-left: 20px;" onclick="toggleFunction()">&#9776;</span>
		<table cellspacing="0"  style="border: 0;width: 100%;overflow-y:scroll;" class="section-border">
			<tr>
				<td id="leftMenu" style="position: relative; width: 180px;">
					<table>
						<tr>
							<td>
								<%-- <%@include file="testMenu2.jsp" %> --%>
								<%@include file="menuPage.jsp" %>
								<%-- <div id="table-negotiations" style="width: 185px;padding-left: 10px;overflow-y:auto;max-height: 497px;">
									<%@include file="testMenu2.jsp" %>
								</div> --%>
							</td>
						</tr>
						<%-- <tr align="center">
							<td>
								<input type="button" name="Revoke" class="formButton" onclick="RevokeValues();" value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
								<input type="button" name="Save" class="formButton" onclick="SaveValues();" value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr> --%>
					</table>
				</td>
				<td valign="top">
					<!-- Tax Starts -->
					<div id="tax" style="display:none;padding: 0; position: relative; left: 0;">
						<div id="tabsTax" style="height:auto;">
							<ul>
								<li style="font-size:12px;">
									<a href="#federalTax">
										<bean:message key="BzComposer.configuration.tab.federaltax" />
									</a>
								</li>
								<li style="font-size:12px;">
									<a href="#stateTax">
										<bean:message key="BzComposer.configuration.tab.statetax" />
									</a>
								</li>
							</ul>
							<div id="federalTax">
								<div id="tabsFederalTax" style="height:auto;">
									<ul>
										<li style="font-size:12px;">
											<a href="#companyTaxInformation">
												<bean:message key="BzComposer.configuration.tab.companytaxinformation" />
											</a>
										</li>
										<li style="font-size:12px;">
											<a href="#companyTaxOption">
												<bean:message key="BzComposer.configuration.tab.companytaxoption" />
											</a>
										</li>
									</ul>
									<div id="companyTaxInformation">
										<table class="table-notifications" width="100%">
											<tr>
												<th colspan="4" align="left" style="font-size:12px; padding: 5px;">
													<b><bean:message key="BzComposer.configuration.identification" /></b>
												</th>
											</tr>
											<tr>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.federaltaxid"/> :
												</td>
												<td style="width:20px;font-size:12px;">
													<html:text property="salesTaxID"></html:text>
												</td>
												<td style="width:20px;font-size:12px;">
													<bean:message key="BzComposer.configuration.fiscalmonth"/> :
												</td>
												<td style="width:20px;font-size:12px;">
													<html:select property="startMonth">
														<html:option value="January">
															<bean:message key="BzComposer.configuration.month.january"/>
														</html:option>
														<html:option value="February">
															<bean:message key="BzComposer.configuration.month.february"/>
														</html:option>
														<html:option value="March">
															<bean:message key="BzComposer.configuration.month.march"/>
														</html:option>
														<html:option value="April">
															<bean:message key="BzComposer.configuration.month.april"/>
														</html:option>
														<html:option value="May">
															<bean:message key="BzComposer.configuration.month.may"/>
														</html:option>
														<html:option value="June">
															<bean:message key="BzComposer.configuration.month.june"/>
														</html:option>
														<html:option value="July">
															<bean:message key="BzComposer.configuration.month.july"/>
														</html:option>
														<html:option value="August">
															<bean:message key="BzComposer.configuration.month.august"/>
														</html:option>
														<html:option value="Septempber">
															<bean:message key="BzComposer.configuration.month.september"/>
														</html:option>
														<html:option value="October">
															<bean:message key="BzComposer.configuration.month.october"/>
														</html:option>
														<html:option value="November">
															<bean:message key="BzComposer.configuration.month.november"/>
														</html:option>
														<html:option value="December">
															<bean:message key="BzComposer.configuration.month.december"/>
														</html:option>
													</html:select>
												</td>
											</tr>
											<tr>
												<th colspan="4" align="left" style="font-size:12px; padding: 5px;">
													<b><bean:message key="BzComposer.configuration.federaltax" /></b>
												</th>
											</tr>
											<tr>
												<td colspan="4" align="left" style="font-size:12px; padding: 5px;">
													<b><bean:message key="BzComposer.configuration.incometaxwithhold"/></b>
												</td>
											</tr>
											<tr>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.federalincometax"/> :
												</td>
												<td style="font-size:12px;">
													<select id="federalIncomeTax">
														<option value="Use Federal Income Tax Table">
															<bean:message key="BzComposer.configuration.usefederalincometaxtable"/>
														<option>
														<option value="Use Manual Estimated Tax Rate">
															<bean:message key="BzComposer.configuration.usemanualestimatedtaxrate"/>
														</option>
													</select>
												</td>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.taxyear"/> :
												</td>
												<td style="font-size:12px;">
													<html:select styleId="selectedTaxYear" property="selectedTaxYear">
														<logic:present name="configurationForm" property="listOfExistingTaxYear">
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingTaxYear" scope="session">
														<option value="<bean:write name='objList1' property='availableTaxYear' />">
															<bean:write name="objList1" property="selectedTaxYear" />
														</option>
													</logic:iterate>
												</logic:present>
											</html:select>
												</td>
											</tr>
											<tr>
												<td colspan="4" align="left" style="font-size:12px; padding: 5px;">
													<b><bean:message key="BzComposer.configuration.ficadeduction"/></b>
												</td>
											</tr>
											<tr>
												<td align="left" style="width:20px;font-size:12px;">
													<input type="checkbox" id="fica">
													<bean:message key="BzComposer.configuration.fica"/> :
												</td>
												<td>
												</td>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.rate"/>
													&nbsp;&nbsp;
													<input type="text" id="ficaRate">
												</td>
											</tr>
											<tr>
												<td></td>
												<td style="width:20px;font-size:12px;">
													<input type="checkbox" id="socicalSecurityTax">
													<bean:message key="BzComposer.configuration.socialsecurityrate"/> :
												</td>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.rate"/>
													&nbsp;&nbsp;
													<input type="text" id="ficaRate">
												</td>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.upto"/>
													&nbsp;&nbsp;
													<input type="text" id="upTo">
												</td>
											</tr>
											<tr>
												<td></td>
												<td style="width:20px;font-size:12px;">
													<input type="checkbox" id="medicare">
													<bean:message key="BzComposer.configuration.medicare"/> :
												</td>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.rate"/>
													&nbsp;&nbsp;
													<input type="text" id="ficaRate">
												</td>
											</tr>
										</table>
										<div align="right">
										<button type="button" class="formButton" style="font-size:12px;">
											<bean:message key="BzComposer.configuration.savefederaltaxbtn"/>
										</button>
										</div>
									</div>
									<div id="companyTaxOption">
										<div id="tabsCompanyTaxOption" style="height:700px;">
											<ul>
												<li style="font-size:12px;">
													<a href="#deduction">
														<bean:message key="BzComposer.configuration.tab.deduction" />
													</a>
												</li>
												<li style="font-size:12px;">
													<a href="#option">
														<bean:message key="BzComposer.configuration.tab.option" />
													</a>
												</li>
											</ul>
											<div id="deduction">
												<table class="table-notifications" width="100%">
													<tr>
														<th colspan="4" align="left" style="font-size:12px; padding: 5px;">
															<b><bean:message key="BzComposer.configuration.deductioninformation" /></b>
														</th>
													</tr>
													<tr>
														<td style="font-size:12px;">
															<bean:message key="BzComposer.configuration.name"/> :
														</td>
														<td style="font-size:12px;">
															<input type="text" id="deductionName">
														</td>
														<td style="font-size:12px;">
															<input type="checkbox" id="taxExemption"/>
															<bean:message key="BzComposer.configuration.taxexemption"/>
														</td>
														<td style="font-size:12px;">
															<input type="reset" class="formButton"
															value="<bean:message key="BzComposer.global.clear"/>"/>
														</td>
													</tr>
													<tr>
														<td style="font-size:12px;">
															<input type="radio" id="rate"/>
															<bean:message key="BzComposer.configuration.rate"/>
														</td>
														<td style="font-size:12px;">
															<input type="text" id="deductionRate">
														</td>
														<td>
														</td>
														<td style="font-size:12px;">
															<input type="button" class="formButton"
															value="<bean:message key="BzComposer.configuration.adddeductionbtn"/>"/>
														</td>
													</tr>
													<tr>
														<td style="font-size:12px;">
															<input type="radio" id="amount"/>
															<bean:message key="BzComposer.configuration.amount"/> :
														</td>
														<td style="font-size:12px;">
															<input type="text" id="deductionAmount">
														</td>
														<td>
														</td>
														<td style="font-size:12px;">
															<input type="button" class="formButton"
															value="<bean:message key="BzComposer.global.edit"/>"/>
														</td>
													</tr>
													<tr>
														<td colspan="4" align="left" style="font-size:12px; padding: 5px;">
															<b><bean:message key="BzComposer.configuration.deductionlist"/></b>
														</td>
													</tr>
													<tr>
														<td colspan="4">
														</td>
													</tr>
													<tr>
														<td colspan="4" align="right" style="font-size:12px; padding: 5px;">
															<button type="button" id="delete" class="formButton">
																<bean:message key="BzComposer.global.delete"/>
															</button>
														</td>
													</tr>
												</table>
											</div>
											<div id="option">
												<table class="table-notifications" width="100%">
													<tr>
														<th colspan="4" align="left" style="font-size:12px; padding: 5px;">
															<b><bean:message key="BzComposer.configuration.payperiod" /></b>
														</th>
													</tr>
													<tr>
														<td style="font-size:12px;">
															<input type="checkbox" id="dailyOrMiscellaneous">
															<bean:message key="BzComposer.configuration.dailyormiscellaneous"/>
														</td>
														<td style="font-size:12px;">
															<input type="checkbox" id="weekly">
															<bean:message key="BzComposer.configuration.weekly"/>
														</td>
														<td style="font-size:12px;">
															<input type="checkbox" id="biWeekly">
															<bean:message key="BzComposer.configuration.biweekly"/>
														</td>
													</tr>
													<tr>
														<td style="font-size:12px;">
															<input type="checkbox" id="semiMonthly">
															<bean:message key="BzComposer.configuration.semimonthly"/>
														</td>
														<td style="font-size:12px;">
															<input type="checkbox" id="monthly">
															<bean:message key="BzComposer.configuration.monthly"/>
														</td>
														<td style="font-size:12px;">
															<input type="checkbox" id="quartely">
															<bean:message key="BzComposer.configuration.quarterly"/>
														</td>
													</tr>
													<tr>
														<td style="font-size:12px;">
															<input type="checkbox" id="semiAnnualy">
															<bean:message key="BzComposer.configuration.semiannualy"/>
														</td>
														<td style="font-size:12px;">
															<input type="checkbox" id="annualy">
															<bean:message key="BzComposer.configuration.annually"/>
														</td>
													</tr>
													<tr>
														<th colspan="2" align="left" style="font-size:12px; padding: 5px;">
															<bean:message key="BzComposer.configuration.setovertime"/>
														</th>
														<th colspan="2" align="left" style="font-size:12px; padding:5px;">
															<bean:message key="BzComposer.configuration.setholidaytime"/>
														</th>
													</tr>
													<tr>
														<td style="font-size:12px;">
															<input type="radio" id="dailyOverHours">
															<bean:message key="BzComposer.configuration.dailyover"/>
														</td>
														<td style="font-size:12px;">
															<input type="text" id="dailyHours">
															&nbsp;&nbsp;
															<bean:message key="Bzcomposer.configuration.hours"/>
														</td>
														<td style="font-size:12px;">
															<input type="checkbox" id="weekendSaturday">
															<bean:message key="BzComposer.configuration.weekendsaturday"/>
														</td>
														<td style="font-size:12px;">
															<bean:message key="BzComposer.configuration.rate"/>
															&nbsp;&nbsp;
															<input type="text" id="holidaySaturdayRate">
														</td>
													</tr>
													<tr>
														<td style="font-size:12px;">
															<input type="radio" id="weeklyOverHours">
															<bean:message key="BzComposer.configuration.weeklyover"/>
														</td>
														<td style="font-size:12px;">
															<input type="text" id="weeklyHours">
															&nbsp;&nbsp;
															<bean:message key="Bzcomposer.configuration.hours"/>
														</td>
														<td style="font-size:12px;">
															<input type="checkbox" id="weekendSunday">
															<bean:message key="BzComposer.configuration.weekendsunday"/>
														</td>
														<td style="font-size:12px;">
															<bean:message key="BzComposer.configuration.rate"/>
															&nbsp;&nbsp;
															<input type="text" id="holidaySundayRate">
														</td>
													</tr>
													<tr>
														<td style="font-size:12px;">
															<bean:message key="BzComposer.configuration.rate"/>
														</td>
														<td style="font-size:12px;">
															<input type="text" id="weeklyRate">
														</td>
														<td style="font-size:12px;">
															<input type="checkbox" id="holiday">
															<bean:message key="BzComposer.configuration.holiday"/> :
														</td>
														<td style="font-size:12px;">
															<bean:message key="BzComposer.configuration.rate"/>
															&nbsp;&nbsp;
															<input type="text" id="holidayRate">
														</td>
													</tr>
													<tr>
														<th colspan="4" align="left" style="font-size:12px; padding: 5px;">
															<b><bean:message key="BzComposer.configuration.setpayrollday"/></b>
														</th>
													</tr>
													<tr>
														<td style="font-size:12px;">
															<bean:message key="BzComposer.configuration.startingdate"/> :
															&nbsp;
															<input type="date" id="selectStartingDate"/>
														</td>
													</tr>
													<tr>
														<td style="font-size:12px;">
															<input type="checkbox" id="daysOfWeek">
															&nbsp;&nbsp;
															<input type="text" id="txtDayOfWeek">
															&nbsp;&nbsp;
															<bean:message key="BzComposer.configuration.dayofweek"/>
														</td>
													</tr>
													<tr>
														<td style="font-size:12px;">
															<input type="checkbox" id="daysOfMonth">
															&nbsp;&nbsp;
															<input type="text" id="txtDayOfMonth">
															&nbsp;&nbsp;
															<bean:message key="BzComposer.configuration.dayofmonth"/>
														</td>
													</tr>
													<tr>
														<td colspan="4" align="right" style="font-size:12px; padding: 5px;">
															<input type="button" class="formButton" id="saveOption"
															value="<bean:message key="BzComposer.configuration.saveoptionbtn"/>">
														</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="stateTax">
								<table class="table-notifications" width="100%">
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.stateincometax"/> :
										</td>
										<td style="font-size:12px;">
											<select id="stateIncomeTax">
												<option value="User Manual Income Tax Rate">
													<bean:message key="BzComposer.configuration.usermanualincometaxrate"/>
												</option>
												<option value="User Manual Income Tax Table">
													<bean:message key="BzComposer.configuration.usermanualincometaxtable"/>
												</option>
											</select>
										</td>
									</tr>
									<tr>
										<td rowspan="7" style="font-size:12px;">
											<b><bean:message key="BzComposer.configuration.fillingstatelist"/></b>
											<br>
											<select id="stateList" multiple="multiple" style="height:280px; width:150px;">
											</select>
										</td>
										<td style="font-size:12px;">
											<b><bean:message key="BzComposer.configuration.taxinformationofstate"/></b>
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.statetaxid"/> :
										</td>
										<td style="font-size:12px;">
											<input type="text" id="stateTaxId">
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.stateincometaxrate"/> :
										</td>
										<td style="font-size:12px;">
											<input type="text" id="stateTaxRate">
										</td>
									</tr>
									<tr>
										<td colspan="3" align="left" style="font-size:12px; padding: 5px;">
											<b><bean:message key="BzComposer.configuration.otherstatetax"/></b>
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<input type="checkbox">
											<input type="text">
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.rate"/>
											&nbsp;&nbsp;
											<input type="text" id="otherStateTaxRate">
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.upto"/>
											&nbsp;&nbsp;
											<input type="text" id="otherStateUpto">
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<input type="checkbox">
											<input type="text">
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.rate"/>
											&nbsp;&nbsp;
											<input type="text" id="otherStateTaxRate">
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.upto"/>
											&nbsp;&nbsp;
											<input type="text" id="otherStateUpto">
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<input type="checkbox">
											<input type="text">
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.rate"/>
											&nbsp;&nbsp;
											<input type="text" id="otherStateTaxRate">
										</td>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.upto"/>
											&nbsp;&nbsp;
											<input type="text" id="otherStateUpto">
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<button type="button" class="formButton">
												<bean:message key="BzComposer.configuration.showavailablestatesbtn"/>
											</button>
										</td>
										<td colspan="2" align="right" style="font-size:12px;">
											<input type="submit" id="save" name="save" class="formButton" value="<bean:message key="BzComposer.global.save"/>">
											&nbsp;
											<input type="reset" id="clear" name="clear" class="formButton" value="<bean:message key="BzComposer.global.clear"/>">
											&nbsp;
										</td>
										<td style="font-size:12px;">
											<input type="button" id="delete" name="delete" class="formButton" value="<bean:message key="BzComposer.global.delete"/>">
											&nbsp;
											<input type="button" id="setAsDefault" name="setAsDefault" class="formButton"
											value="<bean:message key="BzComposer.configuration.setasdefaultbtn"/>">
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<!-- Tax Ends -->
			</td>
		</tr>
	</table>
	<div><html:hidden property="fileName" /></div>
	<div><input type="hidden" name="tabid" id="tid" value="" />
	</div>
	</div>
	<div>
		<div align="center">
		<html:button property="save" style="font-size:12px;"><bean:message key="BzComposer.global.add"/></html:button>
		<%-- <html:cancel style="font-size:12px;"><bean:message key="BzComposer.global.cancel"/></html:cancel> --%>
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
<script type="text/javascript">
function selectshippingtypedialog()
{
	event.preventDefault();
	$("#selectshippingtypedialog").dialog({
    	resizable: false,
        height: 200,
        width: 450,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function selectshippingtypetoupdatedialog()
{
	event.preventDefault();
	$("#selectshippingtypetoupdatedialog").dialog({
    	resizable: false,
        height: 200,
        width: 450,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function duplicatevaluedialog()
{
	event.preventDefault();
	$("#duplicatevaluedialog").dialog({
    	resizable: false,
        height: 200,
        width: 450,
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
</html>
<!-- Dialog box used in this page -->
<div id="selectshippingtypedialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.tax.selectshippingtype"/></p>
</div>
<div id="selectshippingtypetoupdatedialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.tax.selectshippingviatoupdate"/></p>
</div>
<div id="duplicatevaluedialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.tax.duplicatevalue"/></p>
</div>