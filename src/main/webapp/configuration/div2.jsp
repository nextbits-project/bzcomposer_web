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

function updateSelectedWeight()
{
	alert("Inside update weight function")
}

function deleteSelectedWeight()
{
	alert("Inside delete selected weight function");
}
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
		alert("Please select any shipping type.")
	}
	else
	{
		alert("Weight And Price are:"+shippingType);
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

function saveTemplate()
{
	alert("Inside saveTemplate Method")
}

function deleteTemplate()
{
	alert("Inside deleteTemplate Method")
}
function saveModalShippingType()
{
	debugger
	var selectedSType = $.trim($("#modalShippingType option:selected").text());
	debugger
	var textboxValue = $("#selectedShippingType").val();
	debugger
	if(textboxValue =="")
	{
		alert("Please select a shipping via to update")
	}
	else if(selectedSType == textboxValue)
	{
		alert("Duplicate value")
	}
	else 
	{
		alert(textboxValue)
	}
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
	//alert("Selected Tempalte Id:"+id)
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
<body onload="init2();">
<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post">

<div id="ddcolortabsline">&nbsp;</div>
<div id="cos"></div>
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
	<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.Confuguration"/>
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
	<div id="table-negotiations">
		<table cellspacing="0"  style="width: 100%;overflow-y:scroll;" class="section-border">
			<tr>
				<td valign="top"  style="width: 20%;">
					<table>
						<tr>
							<td>
								<div id="table-negotiations" style="width: 185px;padding-left: 10px;overflow-y:auto;max-height: 497px;">
									<%@include file="testMenu2.jsp" %>
								</div>
							</td>
						</tr>
						<tr align="center">
							<td>
								<input type="button" name="Revoke" class="formButton" onclick="RevokeValues();" value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
								<input type="button" name="Save" class="formButton" onclick="SaveValues();" value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</td>
				<td valign="top" style="padding-top: 2%;padding-right: 4%;">
					<!-- Tax Starts -->
					<div id="tax">
						<div id="tabsTax" style="height:700px;">
							<ul>
								<li>
									<a href="#federalTax"> 
										<bean:message key="BizComposer.Configuration.Tax.federalTax" />
									</a>
								</li>
								<li>
									<a href="#stateTax">
										<bean:message key="BizComposer.Configuration.Tax.stateTax" />
									</a>
								</li>
							</ul>
							<div id="federalTax">
								<div id="tabsFederalTax" style="height:650px;">
									<ul>
										<li>
											<a href="#companyTaxInformation"> 
												<bean:message key="BizComposer.Configuration.Tax.federalTax.companyTaxInformation" />
											</a>
										</li>
										<li>
											<a href="#companyTaxOption">
												<bean:message key="BizComposer.Configuration.Tax.companyTaxOption" />
											</a>
										</li>
									</ul>
									<div id="companyTaxInformation">
										<table class="table-notifications" width="100%">
											<tr>
												<th colspan="4" align="left">
													<b><bean:message key="BizComposer.Configuration.Tax.federalTax.identification" /></b>
												</th>
											</tr>
											<tr>
												<td>
													<bean:message key="BizComposer.Configuration.Tax.federalTax.federalTaxId"/>
												</td>
												<td style="width:20px;">
													<html:text property="salesTaxID"></html:text>
												</td>
												<td style="width:20px;">
													<bean:message key="BizComposer.Configuration.Tax.federalTax.fiscalMonth"/>
												</td>
												<td style="width:20px;">
													<html:select property="startMonth">
														<html:option value="January">January</html:option>
														<html:option value="February">February</html:option>
														<html:option value="March">March</html:option>
														<html:option value="April">April</html:option>
														<html:option value="May">May</html:option>
														<html:option value="June">June</html:option>
														<html:option value="July">July</html:option>		
														<html:option value="August">August</html:option>
														<html:option value="Septempber">September</html:option>
														<html:option value="October">October</html:option>
														<html:option value="November">November</html:option>
														<html:option value="December">December</html:option>
													</html:select>
												</td>
											</tr>
											<tr>
												<th colspan="4" align="left">
													<b><bean:message key="BizComposer.Configuration.Tax.federalTax" /></b>
												</th>
											</tr>
											<tr>
												<td colspan="4" align="left">
													<b><bean:message key="BizComposer.Configuration.Tax.federalTax.incomeTaxWithHold"/></b>
												</td>	
											</tr>
											<tr>
												<td>
													<bean:message key="BizComposer.Configuration.Tax.federalTax.federalIncomeTax"/>
												</td>
												<td>
													<select id="federalIncomeTax">
														<option>Use Federal Income Tax Table<option>
														<option>Use Manual Estimated Tax Rate</option>
													</select>
												</td>
												<td>
													<bean:message key="BizComposer.Configuration.Tax.federalTax.taxYear"/>
												</td>
												<td>
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
												<td colspan="4" align="left">
													<b><bean:message key="BizComposer.Configuration.Tax.federalTax.ficaDeduction"/></b>
												</td>
											</tr>
											<tr>
												<td align="left" style="width:20px;">
													<input type="checkbox" id="fica">
													<bean:message key="BizComposer.Configuration.Tax.federalTax.fica"/>
												</td>
												<td>
												</td>
												<td>
													<bean:message key="BizComposer.Configuration.Tax.rate"/>
													&nbsp;&nbsp;
													<input type="text" id="ficaRate">
												</td>
											</tr>
											<tr>
												<td></td>
												<td style="width:20px;">
													<input type="checkbox" id="socicalSecurityTax">
													<bean:message key="BizComposer.Configuration.Tax.federalTax.socialSecurityRate"/>
												</td>
												<td>
													<bean:message key="BizComposer.Configuration.Tax.rate"/>
													&nbsp;&nbsp;
													<input type="text" id="ficaRate">
												</td>
												<td>
													<bean:message key="BizComposer.Configuration.Tax.upTo"/>
													&nbsp;&nbsp;
													<input type="text" id="upTo">
												</td>
											</tr>
											<tr>
												<td></td>
												<td style="width:20px;">
													<input type="checkbox" id="medicare">
													<bean:message key="BizComposer.Configuration.Tax.federalTax.medicare"/>
												</td>
												<td>
													<bean:message key="BizComposer.Configuration.Tax.rate"/>
													&nbsp;&nbsp;
													<input type="text" id="ficaRate">
												</td>
											</tr>
										</table>
										<div align="right">
										<button type="button" class="formButton">
											<bean:message key="BizComposer.Configuration.Tax.federalTax.saveFederalTax"/>
										</button>
										</div>
									</div>
									<div id="companyTaxOption">
										<div id="tabsCompanyTaxOption" style="height:600px;">
											<ul>
												<li>
													<a href="#deduction"> 
														<bean:message key="BizComposer.Configuration.Tax.companyTaxOption.deduction" />
													</a>
												</li>
												<li>
													<a href="#option">
														<bean:message key="BizComposer.Configuration.Tax.companyTaxOption.option" />
													</a>
												</li>
											</ul>
											<div id="deduction">
												<table class="table-notifications" width="100%">
													<tr>
														<th colspan="4" align="left">
															<b><bean:message key="BizComposer.Configuration.Tax.deduction.deductionInfo" /></b>
														</th>
													</tr>
													<tr>
														<td>
															<bean:message key="BizComposer.Configuration.Tax.deduction.name"/>
														</td>
														<td>
															<input type="text" id="deductionName">
														</td>
														<td>
															<input type="checkbox" id="taxExemption"/>
															<bean:message key="BizComposer.Configuration.Tax.deduction.taxExemption"/>
														</td>
														<td>
															<input type="reset" class="formButton" 
															value="<bean:message key="BzComposer.customer.AddLabel.Clear"/>"/>
														</td>
													</tr>
													<tr>
														<td>
															<input type="radio" id="rate"/>
															<bean:message key="BizComposer.Configuration.Tax.rate"/>
														</td>
														<td>
															<input type="text" id="deductionRate">
														</td>
														<td>
														</td>
														<td>
															<input type="button" class="formButton" 
															value="<bean:message key="BizComposer.Configuration.Tax.deduction.addDeduction"/>"/>
														</td>
													</tr>
													<tr>
														<td>
															<input type="radio" id="amount"/>
															<bean:message key="BzComposer.Employee.Amount"/>
														</td>
														<td>
															<input type="text" id="deductionAmount">
														</td>
														<td>
														</td>
														<td>
															<input type="button" class="formButton" 
															value="<bean:message key="BzComposer.Item.Edit"/>"/>
														</td>
													</tr>
													<tr>
														<td colspan="4" align="left">
															<b><bean:message key="BizComposer.Configuration.Tax.deduction.deductionList"/></b>
														</td>
													</tr>
													<tr>
														<td colspan="4">
														</td>
													</tr>
													<tr>
														<td colspan="4" align="right">
															<button type="button" id="delete" class="formButton">
																<bean:message key="BzComposer.Vendor.DeleteButton"/>
															</button>
														</td>
													</tr>
												</table>
											</div>
											<div id="option">
												<table class="table-notifications" width="100%">
													<tr>
														<th colspan="4" align="left">
															<b><bean:message key="BizComposer.Configuration.Tax.option.payPeriod" /></b>
														</th>
													</tr>
													<tr>
														<td>
															<input type="checkbox" id="dailyOrMiscellaneous">
															<bean:message key="BizComposer.Configuration.Tax.option.dailyOrMiscellaneous"/>
														</td>
														<td>
															<input type="checkbox" id="weekly">
															<bean:message key="BizComposer.Configuration.Tax.option.weekly"/>
														</td>
														<td>
															<input type="checkbox" id="biWeekly">
															<bean:message key="BizComposer.Configuration.Tax.option.biWeekly"/>
														</td>
													</tr>
													<tr>
														<td>
															<input type="checkbox" id="semiMonthly">
															<bean:message key="BizComposer.Configuration.Tax.option.semoMonthly"/>
														</td>
														<td>
															<input type="checkbox" id="monthly">
															<bean:message key="BizComposer.Configuration.Tax.option.monthly"/>
														</td>
														<td>
															<input type="checkbox" id="quartely">
															<bean:message key="BizComposer.Configuration.Tax.option.quartely"/>
														</td>
													</tr>
													<tr>
														<td>
															<input type="checkbox" id="semiAnnualy">
															<bean:message key="BizComposer.Configuration.Tax.option.semiAnnualy"/>
														</td>
														<td>
															<input type="checkbox" id="annualy">
															<bean:message key="BizComposer.Configuration.Tax.option.annualy"/>
														</td>
													</tr>
													<tr>
														<th colspan="2" align="left">
															<bean:message key="BizComposer.Configuration.Tax.option.setOverTime"/>
														</th>
														<th colspan="2" align="left">
															<bean:message key="BizComposer.Configuration.Tax.option.setHolidayTime"/>
														</th>
													</tr>
													<tr>
														<td>
															<input type="radio" id="dailyOverHours">
															<bean:message key="BizComposer.Configuration.Tax.option.dailyOver"/>
														</td>
														<td>
															<input type="text" id="dailyHours">
															&nbsp;&nbsp;
															<bean:message key="BizComposer.Configuration.Tax.option.hours"/>
														</td>
														<td>
															<input type="checkbox" id="weekendSaturday">
															<bean:message key="BizComposer.Configuration.Tax.option.weekendSaturday"/>
														</td>
														<td>
															<bean:message key="BizComposer.Configuration.Tax.rate"/>
															&nbsp;&nbsp;
															<input type="text" id="holidaySaturdayRate">
														</td>
													</tr>
													<tr>
														<td>
															<input type="radio" id="weeklyOverHours">
															<bean:message key="BizComposer.Configuration.Tax.option.weeklyOver"/>
														</td>
														<td>
															<input type="text" id="weeklyHours">
															&nbsp;&nbsp;
															<bean:message key="BizComposer.Configuration.Tax.option.hours"/>
														</td>
														<td>
															<input type="checkbox" id="weekendSunday">
															<bean:message key="BizComposer.Configuration.Tax.option.weekendSunday"/>
														</td>
														<td>
															<bean:message key="BizComposer.Configuration.Tax.rate"/>
															&nbsp;&nbsp;
															<input type="text" id="holidaySundayRate">
														</td>
													</tr>
													<tr>
														<td>
															<bean:message key="BizComposer.Configuration.Tax.rate"/>
														</td>
														<td>
															<input type="text" id="weeklyRate">
														</td>
														<td>
															<input type="checkbox" id="holiday">
															<bean:message key="BizComposer.Configuration.Tax.option.holiday"/>
														</td>
														<td>
															<bean:message key="BizComposer.Configuration.Tax.rate"/>
															&nbsp;&nbsp;
															<input type="text" id="holidayRate">
														</td>
													</tr>
													<tr>
														<th colspan="4" align="left">
															<b><bean:message key="BizComposer.Configuration.Tax.option.setPayRollDay"/></b>
														</th>
													</tr>
													<tr>
														<td>
															<bean:message key="BizComposer.Configuration.Tax.option.startingDate"/>
															&nbsp;
															<input type="date" id="selectStartingDate"/>
														</td>
													</tr>
													<tr>
														<td>
															<input type="checkbox" id="daysOfWeek">
															&nbsp;&nbsp;
															<input type="text" id="txtDayOfWeek">
															&nbsp;&nbsp;
															<bean:message key="BizComposer.Configuration.Tax.option.dayOfWeek"/>
														</td>
													</tr>
													<tr>
														<td>
															<input type="checkbox" id="daysOfMonth">
															&nbsp;&nbsp;
															<input type="text" id="txtDayOfMonth">
															&nbsp;&nbsp;
															<bean:message key="BizComposer.Configuration.Tax.option.dayOfMonth"/>
														</td>
													</tr>
													<tr>
														<td colspan="4" align="right">
															<input type="button" class="formButton" id="saveOption" 
															value="<bean:message key="BizComposer.Configuration.Tax.option.saveOption"/>">
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
										<td>
											<bean:message key="BizComposer.Configuration.Tax.stateTax.stateIncomeTax"/>
										</td>
										<td>
											<select id="stateIncomeTax">
												<option>User Manual Income Tax Rate</option>
												<option>User Manual Income Tax Table</option>
											</select>
										</td>
									</tr>
									<tr>
										<td rowspan="7">
											<b><bean:message key="BizComposer.Configuration.Tax.stateTax.fillingStateList"/></b>
											<br>
											<select id="stateList" multiple="multiple" style="height:280px; width:150px;">
											</select>
										</td>
										<td>
											<b><bean:message key="BizComposer.Configuration.Tax.stateTax.taxInformationOfState"/></b>
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BizComposer.Configuration.Tax.stateTax.stateTaxID"/>
										</td>
										<td>
											<input type="text" id="stateTaxId">
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BizComposer.Configuration.Tax.stateTax.stateIncomeTaxRate"/>
										</td>
										<td>
											<input type="text" id="stateTaxRate">
										</td>
									</tr>
									<tr>
										<td colspan="3" align="left">
											<b><bean:message key="BizComposer.Configuration.Tax.stateTax.otherStateTax"/></b>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox">
											<input type="text">
										</td>
										<td>
											<bean:message key="BizComposer.Configuration.Tax.rate"/>
											&nbsp;&nbsp;
											<input type="text" id="otherStateTaxRate">
										</td>
										<td>
											<bean:message key="BizComposer.Configuration.Tax.upTo"/>
											&nbsp;&nbsp;
											<input type="text" id="otherStateUpto">
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox">
											<input type="text">
										</td>
										<td>
											<bean:message key="BizComposer.Configuration.Tax.rate"/>
											&nbsp;&nbsp;
											<input type="text" id="otherStateTaxRate">
										</td>
										<td>
											<bean:message key="BizComposer.Configuration.Tax.upTo"/>
											&nbsp;&nbsp;
											<input type="text" id="otherStateUpto">
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox">
											<input type="text">
										</td>
										<td>
											<bean:message key="BizComposer.Configuration.Tax.rate"/>
											&nbsp;&nbsp;
											<input type="text" id="otherStateTaxRate">
										</td>
										<td>
											<bean:message key="BizComposer.Configuration.Tax.upTo"/>
											&nbsp;&nbsp;
											<input type="text" id="otherStateUpto">
										</td>
									</tr>
									<tr>
										<td>
											<button type="button" class="formButton">
												<bean:message key="BizComposer.Configuration.Tax.stateTax.showAvailableStates"/>
											</button>
										</td>
										<td colspan="2" align="right">
											<input type="submit" id="save" name="save" class="formButton" value="<bean:message key="Bizcomposer.save"/>">
											&nbsp;
											<input type="reset" id="clear" name="clear" class="formButton" value="<bean:message key="BzComposer.customer.AddLabel.Clear"/>">
											&nbsp;
										</td>
										<td>
											<input type="button" id="delete" name="delete" class="formButton" value="<bean:message key="BzComposer.Vendor.DeleteButton"/>">
											&nbsp;
											<input type="button" id="setAsDefault" name="setAsDefault" class="formButton" 
											value="<bean:message key="BizComposer.Configuration.Tax.stateTax.setAsDefault"/>">
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<!-- Tax Ends -->
			
					<!-- emailSetUp Starts -->
					<div id="emailSetUp" style="display:none;">
						<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="3" align="left">
									<b><bean:message key="BizComposer.Configuration.Reminders.eMailSetup.eMailTemplate" /></b>
								</th>
							</tr>
							<tr>
								<td colspan="3">
									<a href="#" onclick="addNewTemplate();">
										<bean:message key="BizComposer.Configuration.Reminders.eMailSetup.newTemplate"/>
									</a>
									&nbsp;&nbsp;
									<a href="#" onclick="saveTemplate();">
									<bean:message key="BizComposer.Configuration.Reminders.eMailSetup.saveTemplate"/>
									</a>
									&nbsp;&nbsp;
									<a href="#" onclick="deleteTemplate();">
									<bean:message key="BizComposer.Configuration.Reminders.eMailSetup.deleteTemplate"/>
									</a>
								</td>
							</tr>
							<tr>
								<td>
									<bean:message key="BizComposer.Configuration.Reminders.eMailSetup.availableTemplate"/>
								</td>
								<td colspan="3" align="center">
									<bean:message key="BizComposer.Configuration.Reminders.eMailSetup.templateNote"/>
								</td>
							</tr>
							<tr>
								<td rowspan="4">
									<select id="selectedTemplateId"  multiple="multiple" style="height:300px;" onchange="setContent()">
										<logic:present name="configurationForm" property="listOfExistingTemplates"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingTemplates" scope="session">
												<option value="<bean:write name='objList1' property='templateId' />">
													<bean:write name="objList1" property="templateName" />
												</option>
											</logic:iterate>
										</logic:present> 
									</select>
								</td>
								<td>
									<bean:message key="BizComposer.Configuration.Reminders.eMailSetup.templateName"/>
								</td>
								<td>
									<input type="text" id="templateName" style="display: block;">
									<logic:present name="configurationForm" property="listOfExistingTemplates" scope="session"> 
										<input type="text" id="txtTemplateName" style="display: none;" value="<bean:write name="objList1" property="templateName" />" readonly="readonly">
									</logic:present>
								</td>
							</tr>
							<tr>
								<td>
									<bean:message key="BizComposer.Configuration.Reminders.eMailSetup.templateSubject"/>
								</td>
								<td>
									<input type="text" id="templateSubject">
									<logic:present name="configurationForm" property="listOfExistingTemplates" scope="session"> 
										<input type="text" id="txtTemplateSubject" style="display: none;" value="<bean:write name="objList1" property="templateSubject" />" readonly="readonly">
									</logic:present>
								</td>
							</tr>
							<tr>
								<td>
									<bean:message key="BizComposer.Configuration.Reminders.eMailSetup.eMailText"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="left">
									<!-- <input type="text" id="emailText" name="emailText" style="height: 150px; width: 520px;"> -->
									<textarea id="emailText" style="height: 150px;width: 520px;"></textarea>
									<logic:present name="configurationForm" property="listOfExistingTemplates" scope="session"> 
										 //<input type="text" id="txtTemplateText" style="display: none;" value="<bean:write name="objList1" property="templateContent" />"> 
										<textarea id="txtTemplateText" style="display: none;height: 150px;width: 520px;"><bean:write name="objList1" property="templateContent" /></textarea>
									</logic:present>
								</td>
							</tr>
						</table> 
					</div>--%>
					<!-- emailSetUp Ends -->	
							
					<!-- shipping Starts -->
					<div id="shipping" style="display:none;">
						<div id="shippingFreeMethodDiv">
							<fieldset>
								<legend class="h6">
									<bean:message key="BizComposer.Configuration.Shipping.defaultShippingFreeMethod"/>
								</legend>
								<div class="form-check">
									<input type="checkbox" id="manualInsertion" style="class:form-check-input"/>
										<bean:message key="BizComposer.Configuration.Shipping.mannualInsertion"/>
								</div>
							</fieldset>
						</div>
						<div id="tabs1" style="height:800px;">
							<ul>
								<li onclick="showPanel()"><a href="#userDefinedShippingMethod">
									<bean:message key="BizComposer.Configuration.Shipping.userDefinedShippingMehod" />
								</a></li>
								<li onclick="showPanel()"><a href="#realTimeShippingAPI">
									<bean:message key="BizComposer.Configuration.Shipping.realTimeAPIShipping" />
								</a></li>
								<li onclick="showPanel()"><a href="#shipping">
									<bean:message key="BizComposer.Configuration.Shipping.shipping" />
								</a></li>
							</ul>
							<div id="userDefinedShippingMethod">
								<table style="width:1000px; height:400px;">
									<tr>
										<td>
											<input type="checkbox" id="userDataInsertion">
											<bean:message key="BizComposer.Configuration.Shipping.userDataInsertion"/>
										</td>
										<td>
											<a href="#modalAddModify" rel="modal:open">
											<input type="button" class="formButton" id="AddModify"  
											value="<bean:message key="BizComposer.Configuration.Shipping.addModify"/>"></a> 
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BizComposer.Configuration.Shipping.shippingType"/>
											<br>
											
											<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
											<html:select styleId="userShippingType" property="selectedUserDefinedShippingTypeId" 
											style="width:180px;" onchange="setWeightPrice()">
												<option value="0"> </option>
												<logic:present name="configurationForm" property="listOfExistingUserDefiedShippingType"> 
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUserDefiedShippingType" scope="session">
														<option value="<bean:write name='objList1' property='userDefinedShippingTypeId' />">
															<bean:write name="objList1" property="userDefinedShipping" />
														</option>
													</logic:iterate>
												</logic:present>
											</html:select> --%>
										</td>
										<td>
											<a href="#modalviewServices" rel="modal:open">
											<input type="button" class="formButton" id="viewServices" 
											value="<bean:message key="BizComposer.Configuration.Shipping.viewServices"/>">
											</a>
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BizComposer.Configuration.Shipping.weightLbs"/>
										</td>
										<td>
											<input type="text" id="upsWeight">
										</td>
										<td>
											<bean:message key="BizComposer.Configuration.Shipping.shippingFee"/>
										</td>
										<td>
											<input type="text" id="upsShippingFee">
										</td>
									</tr>
									<tr>
										<td rowspan="6">
											<table>
												<tr>
													<td>
														<bean:message key="BzComposer.Item.Weight"/>
													</td>
													<td>
														<bean:message key="BizComposer.Configuration.Shipping.fee"/>
													</td>
												</tr>
												<tr>
													<td>
														<html:select styleId="shippingTypeWeight" multiple="multiple" property="listOfExistingUserDefiedShippingWeightAndPrice" style="width:150px; height:250px;" onchange="setPrice()">
															<logic:present name="configurationForm" property="listOfExistingUserDefiedShippingWeightAndPrice"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUserDefiedShippingWeightAndPrice" scope="session">
																	<option id="weight" value="<bean:write name='objList1' property='userDefinedShippingWeight' />">
																	<bean:write name="objList1" property="userDefinedShippingWeight" />
																	</option>
																	<option value="<bean:write name='objList1' property='userDefinedShippingTypeId' />" id="selectedShippingTypeId" style="display: none;">
																	</option>
																</logic:iterate>
															</logic:present>
														</html:select>
													</td>
													<td>
														 <html:select styleId="shippingTypePrice" multiple="multiple" property="listOfExistingUserDefiedShippingWeightAndPrice" style="width:150px; height:250px;">
															<logic:present name="configurationForm" property="listOfExistingUserDefiedShippingWeightAndPrice"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUserDefiedShippingWeightAndPrice" scope="session">
																	<option id="price" value="<bean:write name='objList1' property='userDefinedShippingWeight' />">
																		<bean:write name="objList1" property="userDefinedShippingPrice" />
																	</option>
																	<option value="<bean:write name='objList1' property='userDefinedShippingTypeId' />" id="selectedShippingTypeId" style="display: none;">
																	</option>
																</logic:iterate>
															</logic:present>
														</html:select>
													</td>
												</tr>
											</table>
										</td>
										<td rowspan="6" align="center">
											<input type="button" class="formButton" id="addSelectedWeight" style="width:80px;" 
											value="<bean:message key="BizComposer.Configuration.Shipping.add"/>">
											<br>
											<input type="button" class="formButton" id="modifySeletedWeight" style="width:80px;"
											value="<bean:message key="BizComposer.Configuration.Shipping.modify"/>" onclick="updateSelectedWeight()">
											<br>
											<input type="button" class="formButton" id="deleteSeletedWeight" style="width:80px;"
											value="<bean:message key="BizComposer.Configuration.Shipping.delete"/>" onclick="deleteSelectedWeight()"> 
										</td>
										<td>
											<bean:message key="BizComposer.Configuration.Shipping.valueAddedServices"/>
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BizComposer.Configuration.Shipping.mailType"/>
										</td>
										<td>
											<html:select styleId="selectedMailTypeId" property="selectedMailTypeId" style="width:100px;">
												<logic:present name="configurationForm" property="listOfExistingMailType"> 
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingMailType" scope="session">
														<option value="<bean:write name='objList1' property='mailTypeId' />">
															<bean:write name="objList1" property="mailType" />
														</option>
													</logic:iterate>
												</logic:present>
											</html:select>
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BizComposer.Configuration.Shipping.packageSize"/>
										</td>
										<td>
											<html:select styleId="selectedPackageSizeId" property="selectedPackageSizeId" style="width:100px;">
												<logic:present name="configurationForm" property="listOfExistingPackageSize"> 
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPackageSize" scope="session">
														<option value="<bean:write name='objList1' property='packageSizeId' />">
															<bean:write name="objList1" property="packageSize" />
														</option>
													</logic:iterate>
												</logic:present>
											</html:select>
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BizComposer.Configuration.Shipping.container"/>
										</td>
										<td>
											<html:select styleId="selectedContainerId" property="selectedContainerId" style="width:100px;">
												<logic:present name="configurationForm" property="listOfExistingContainer"> 
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingContainer" scope="session">
														<option value="<bean:write name='objList1' property='containerId' />">
															<bean:write name="objList1" property="container" />
														</option>
													</logic:iterate>
												</logic:present>
											</html:select>
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="BizComposer.Configuration.Shipping.specialHandlingFee"/>
										</td>
										<td>
											<input type="text" id="specialHandlingFee" style="width:100px;"/>
										</td>
									</tr>
									<tr>
										<td colspan="2" align="center">
											<input type="button" class="formButton" id="addService" 
											value="<bean:message key="BizComposer.Configuration.Shipping.addService"/>"/>	
										</td>
									</tr>
								</table>
							</div>
							<div id="modalAddModify" class="modal modal1" role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
    								<div class="modal-content">
      									<div class="modal-header">
        									<h4 class="modal-title">
        										<bean:message key="BizComposer.Configuration.Shipping.shippingType"/>
        									</h4>
      									</div>
      									<div class="modal-body">
        								<html:select styleId="modalShippingType" multiple="multiple" property="selectedUserDefinedShippingTypeId" 
											style="width:400px; height:180px;" onchange="addModalShippingType()">
												<logic:present name="configurationForm" property="listOfExistingUserDefiedShippingType"> 
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUserDefiedShippingType" scope="session">
														<option value="<bean:write name='objList1' property='userDefinedShippingTypeId' />">
															<bean:write name="objList1" property="userDefinedShipping" />
														</option>
													</logic:iterate>
												</logic:present>
											</html:select>
      									</div>
      									<div class="modal-body">
      									<bean:message key="Bizcomposer.description"/>
      									<br>
      									<input type="text" id="selectedShippingType" style="width:400px;">
      									</div>
      									<div class="modal-footer">
      										<button type="button" class="formButton" id="addShippingType" name="addShippingType" onclick="saveModalShippingType()">
      											<bean:message key="BizComposer.Configuration.Shipping.add"/>
      										</button>
      										<button type="button" class="formButton" id="modifyShippingType" name="modifyShippingType">
      											<bean:message key="BizComposer.Configuration.Shipping.modify"/>
      										</button>
      										<button type="button" class="formButton" id="deleteShippingType" name="deleteShippingType">
      											<bean:message key="BizComposer.Configuration.Shipping.delete"/>
      										</button>
        									<a href="#" rel="modal:close">
        										<button type="button" class="formButton" data-dismiss="modal" id="closeShippingType" name="closeShippingType">
        											<bean:message key="BzComposer.customer.AddLabel.Close"/>
        										</button>
       										</a>
      									</div>
    								</div>
   								</div>
							</div>
							<div id="realTimeShippingAPI" class="tabPage">
								<table class="table-notifications" style="height: 500px;">
									<tr>
										<td style="width:50px;">
											<html:checkbox property="shippingAPI">
												<bean:message key="BizComposer.Configuration.Shipping.shippingAPI"/>
											</html:checkbox>
										</td>
										<td style="width:150px;">
											<bean:message key="BizComposer.Configuration.Shipping.accountForEachService"/>
										</td>
									</tr>
									<tr>
										<td style="width:200px;">
											<bean:message key="BizComposer.Configuration.Shipping.availableShippingAPIs"/>
										</td>
										<td>
										</td>
									</tr>
									<tr>
										<td colspan="2" align="left" style="width:auto;">
											<div id="tabs" style="height: 600px;">
												<ul>
													<li><a href="#ups">
														<bean:message key="BizComposer.Configuration.Shipping.ups" />
													</a></li>
													<li><a href="#usps">
														<bean:message key="BizComposer.Configuration.Shipping.usps" />
													</a></li>
													<li><a href="#fedex">
														<bean:message key="BizComposer.Configuration.Shipping.fedex" />
													</a></li>
												</ul>
												<div id="ups" style="width:auto;">
													<table style="width:1200px;">
														<tr>
															<th colspan="3" align="left">
																<bean:message key="BizComposer.Configuration.Shipping.upsAccountSettings"/>
															</th>
														</tr>
														<tr>
															<td>
															<logic:present name="configurationForm" property="listOfExistingUpsUSers"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUpsUSers" scope="session">
																<%-- <html:checkbox property="isUPSActive" value="<bean:write name='objList1' property='isUPSActive' />">
																	<bean:message key="BizComposer.Configuration.Shipping.ups"/>
																</html:checkbox> --%>
																<input type="checkbox" id="isUPSActive" name="isUPSActive" value="<bean:write name='objList1' property='isUPSActive' />"/>
																<bean:message key="BizComposer.Configuration.Shipping.ups"/>
															</logic:iterate>
															</logic:present>
															</td>
														</tr>
														<tr>
															<td>
																<bean:message key="BizComposer.Configuration.Shipping.upsUserID"/>
															</td>
															<td>
																<%-- <html:text property="upsUserId"></html:text> --%>
																<logic:present name="configurationForm" property="listOfExistingUpsUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUpsUSers" scope="session">
																	<input type="text" id="upsUserId" name="upsUserId" value="<bean:write name='objList1' property='upsUserId' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<td>
																<bean:message key="BizComposer.Configuration.Shipping.upsPassword"/>
															</td>
															<td>
																<%-- <html:password property="upsPassword"></html:password> --%>
																<logic:present name="configurationForm" property="listOfExistingUpsUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUpsUSers" scope="session">
																	<input type="password" id="upsPassword" name="upsPassword" value="<bean:write name='objList1' property='upsPassword' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<td>
																<bean:message key="BizComposer.Configuration.Shipping.accessKey"/>
															</td>
															<td>
																<%-- <html:text property="accesskey"></html:text> --%>
																<logic:present name="configurationForm" property="listOfExistingUpsUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUpsUSers" scope="session">
																	<input type="text" id="accessKey" name="accessKey" value="<bean:write name='objList1' property='accesskey' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<td>
																<bean:message key="BizComposer.Configuration.Shipping.upsAccountNo"/>
															</td>
															<td>
																<%-- <html:text property="upsAccountNo"></html:text> --%>
																<logic:present name="configurationForm" property="listOfExistingUpsUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUpsUSers" scope="session">
																	<input type="text" id="upsAccountNo" name="upsAccountNo" value="<bean:write name='objList1' property='upsAccountNo' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<th colspan="3" align="left">
																<bean:message key="BizComposer.Configuration.Shipping.valueAddedServices"/>
															</th>
														</tr>
														<tr>
															<td colspan="3" align="left">
																<bean:message key="BizComposer.Configuration.Shipping.availableServices"/>
															</td>
														</tr>
														<tr>
															<td rowspan="4">
																<html:select property="selectedRealTimeShippingServiceId" multiple="multiple" style="width:200px; height:200px;" onclick="setServices()" styleId="upsSelect">
																	<logic:present name="configurationForm" property="listOfExistingRealTimeShippingServices"> 
																		<logic:iterate name="configurationForm" id="objList1" property="listOfExistingRealTimeShippingServices" scope="session">
																			<option value="<bean:write name='objList1' property='realTimeShippingServiceId' />" >
																				<bean:write name="objList1" property="realTimeShippingService" />
																			</option>
																			<bean:write name="objList1" property="realTimeShippingPrice" />
																		</logic:iterate>
																	</logic:present>
																</html:select>
															</td>
															<td>
																<bean:message key="BizComposer.Configuration.Shipping.enterServiceName"/>
																<br>
																<html:text property="upsServiceName" styleId="upsServiceName" readonly="true"></html:text>
															</td>
															<td>
																<input type="button" id="add" name="add" class="formButton" 
																value="<bean:message key="BizComposer.Configuration.ManageServiceType.Add"/>">
															</td>
														</tr>
														<tr>
															<td>
																<bean:message key="BizComposer.Configuration.Shipping.enterServicePrice"/>
																<br>
																<html:text property="upsServicePrice"></html:text>
															</td>
															<td>
																<input type="button" id="edit" class="formButton"
																value="<bean:message key="BizComposer.Configuration.ManageServiceType.Edit"/>">
															</td>
														</tr>
														<tr>
															<td>
															</td>
															<td>
																<input type="button" id="edit" class="formButton"
																value="<bean:message key="BizComposer.Configuration.ManageServiceType.Delete"/>">
															</td>
														</tr>
													</table>
												</div>
												<div id="usps">
													<table style="width:1200px;">
														<tr>
															<th colspan="3" align="left">
																<bean:message key="BizComposer.Configuration.Shipping.uspsAccountSettings"/>
															</th>
														</tr>
														<tr>
															<td>
																<%-- <html:checkbox property="isUSPSActive">
																	<bean:message key="BizComposer.Configuration.Shipping.usps"/>
																</html:checkbox> --%>
																<logic:present name="configurationForm" property="listOfExistingUspsUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUspsUSers" scope="session">
																	<input type="checkbox" id="isUSPSActive" name="isUSPSActive" value="<bean:write name='objList1' property='isUSPSActive' />"/>
																	<bean:message key="BizComposer.Configuration.Shipping.usps"/>
															</logic:iterate>
															</logic:present>
															</td>
														</tr>
														<tr>
															<td>
																<bean:message key="BizComposer.Configuration.Shipping.uspsUserID"/>
															</td>
															<td>
																<%-- <html:text property="uspsUserId"></html:text> --%>
																<logic:present name="configurationForm" property="listOfExistingUspsUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingUspsUSers" scope="session">
																	<input type="text" id="uspsUserId" name="uspsUserId" value="<bean:write name='objList1' property='uspsUserId' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<th colspan="3" align="left">
																<bean:message key="BizComposer.Configuration.Shipping.valueAddedServices"/>
															</th>
														</tr>
														<tr>
															<td colspan="3" align="left">
																<bean:message key="BizComposer.Configuration.Shipping.availableServices"/>
															</td>
														</tr>
														<tr>
															<td rowspan="4">
																<html:select property="selectedRealTimeShippingServiceId" multiple="multiple" styleId="uspsSelect" style="width:200px; height:200px;" onclick="setUSPSService()">
																	<logic:present name="configurationForm" property="listOfExistingRealTimeShippingServices1"> 
																		<logic:iterate name="configurationForm" id="objList1" property="listOfExistingRealTimeShippingServices1" scope="session">
																			<option value="<bean:write name='objList1' property='realTimeShippingServiceId' />"><bean:write name="objList1" property="realTimeShippingService" /></option>
																		</logic:iterate>
																	</logic:present>
																</html:select>
															</td>
															<td>
																<bean:message key="BizComposer.Configuration.Shipping.enterServiceName"/>
																<br>
																<html:text property="upsServiceName" styleId="uspsServiceName"></html:text>
															</td>
															<td>
																<input type="button" id="add" name="add" class="formButton" 
																value="<bean:message key="BizComposer.Configuration.ManageServiceType.Add"/>">
															</td>
														</tr>
														<tr>
															<td>
																<bean:message key="BizComposer.Configuration.Shipping.enterServicePrice"/>
																<br>
																<html:text property="upsServicePrice"></html:text>
															</td>
															<td>
																<input type="button" id="edit" class="formButton"
																value="<bean:message key="BizComposer.Configuration.ManageServiceType.Edit"/>">
															</td>
														</tr>
														<tr>
															<td>
															</td>
															<td>
																<input type="button" id="edit" class="formButton"
																value="<bean:message key="BizComposer.Configuration.ManageServiceType.Delete"/>">
															</td>
														</tr>
													</table>
												</div>
												<div id="fedex">
													<table style="width:1200px;">
														<tr>
															<th colspan="3" align="left">
																<bean:message key="BizComposer.Configuration.Shipping.fedexAccountSettings"/>
															</th>
														</tr>
														<tr>
															<td>
																<%-- <html:checkbox property="isFeDexActive">
																	<bean:message key="BizComposer.Configuration.Shipping.fedex"/>
																</html:checkbox> --%>
																<logic:present name="configurationForm" property="listOfExistingFedexUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingFedexUSers" scope="session">
																	<input type="checkbox" id="isFeDexActive" name="isFeDexActive" value="<bean:write name='objList1' property='isFeDexActive' />"/>
																	<bean:message key="BizComposer.Configuration.Shipping.fedex"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<td>
																<bean:message key="BizComposer.Configuration.Shipping.fedexAccountNumber"/>
															</td>
															<td>
																<%-- <html:text property="fedexAccountNumber"></html:text> --%>
																<logic:present name="configurationForm" property="listOfExistingFedexUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingFedexUSers" scope="session">
																	<input type="text" id="fedexAccountNumber" name="fedexAccountNumber" value="<bean:write name='objList1' property='fedexAccountNumber' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<td>
																<bean:message key="BizComposer.Configuration.Shipping.fedexMeterNumber"/>
															</td>
															<td>
																<%-- <html:password property="fedexMeterNumber"></html:password> --%>
																<logic:present name="configurationForm" property="listOfExistingFedexUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingFedexUSers" scope="session">
																	<input type="text" id="fedexMeterNumber" name="fedexMeterNumber" value="<bean:write name='objList1' property='fedexMeterNumber' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<td>
																<bean:message key="BizComposer.Configuration.Shipping.fedexPassword"/>
															</td>
															<td>
																<%-- <html:text property="fedexPassword"></html:text> --%>
																<logic:present name="configurationForm" property="listOfExistingFedexUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingFedexUSers" scope="session">
																	<input type="password" id="fedexPassword" name="fedexPassword" value="<bean:write name='objList1' property='fedexPassword' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<td>
																<bean:message key="BizComposer.Configuration.Shipping.fedexTestKey"/>
															</td>
															<td>
																<%-- <html:text property="fedexTestKey"></html:text> --%>
																<logic:present name="configurationForm" property="listOfExistingFedexUSers"> 
																<logic:iterate name="configurationForm" id="objList1" property="listOfExistingFedexUSers" scope="session">
																	<input type="text" id="fedexTestKey" name="fedexTestKey" value="<bean:write name='objList1' property='fedexTestKey' />"/>
																</logic:iterate>
																</logic:present>
															</td>
														</tr>
														<tr>
															<th colspan="3" align="left">
																<bean:message key="BizComposer.Configuration.Shipping.valueAddedServices"/>
															</th>
														</tr>
														<tr>
															<td colspan="3" align="left">
																<bean:message key="BizComposer.Configuration.Shipping.availableServices"/>
															</td>
														</tr>
														<tr>
															<td rowspan="4">
																<html:select property="selectedRealTimeShippingServiceId" multiple="multiple" style="width:200px; height:200px;">
																	<logic:present name="configurationForm" property="listOfExistingRealTimeShippingService2"> 
																		<logic:iterate name="configurationForm" id="objList1" property="list2" scope="session">
																			<option value="<bean:write name='objList1' property='listOfExistingRealTimeShippingService2' />" ><bean:write name="objList1" property="realTimeShippingService" /></option>
																		</logic:iterate>
																	</logic:present>
																</html:select>
															</td>
															<td>
																<bean:message key="BizComposer.Configuration.Shipping.enterServiceName"/>
																<br>
																<html:text property="upsServiceName"></html:text>
															</td>
															<td>
																<input type="button" id="add" name="add" class="formButton" 
																value="<bean:message key="BizComposer.Configuration.ManageServiceType.Add"/>">
															</td>
														</tr>
														<tr>
															<td>
																<bean:message key="BizComposer.Configuration.Shipping.enterServicePrice"/>
																<br>
																<html:text property="upsServicePrice"></html:text>
															</td>
															<td>
																<input type="button" id="edit" class="formButton"
																value="<bean:message key="BizComposer.Configuration.ManageServiceType.Edit"/>">
															</td>
														</tr>
														<tr>
															<td>
															</td>
															<td>
																<input type="button" id="edit" class="formButton"
																value="<bean:message key="BizComposer.Configuration.ManageServiceType.Delete"/>">
															</td>
														</tr>
													</table>
												</div>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<div id="shipping" class="tabPage">
								<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
								<div class="form-check">
									<input type="checkbox" id="shippingdData">
										<bean:message key="BizComposer.Configuration.Shipping.allowUpdateShippingDataMultiple"/>
								</div>
								<div class="form-inline mt-2 align-items-start">
									<div class="form-inline mb-2">
										<bean:message key="Bizcomposer.scheduleTimes"/>
									</div>
									<div class="form-inline mx-sm-3 mb-2">
										<select id="scheduleTime" name="scheduleTime" multiple="multiple" style="width: 180px;">
										</select>
									</div>
									<div class="form-inline mx-sm-3 mb-2 d-block">	
										<p>
										<br>
										<a href="#m1" rel="modal:open">
											<button type="button" class="formbutton" data-toggle="modal" data-target="#modal">
												Add
											</button>
										</a>
										<br><br>
										<button type="button" class="formbutton" onclick="removeTime()">
											Remove
										</button>
										</p>
										<div id="m1" class="modal modal1">
  													<div id="container">
  														<div id="title" style="text-align: center">
  														<h3>Select Time</h3>
  														</div>
  														<div id="container">
  															<div class="row" align="center">
  																<table style="text-align: center; width: 600px;">
  																	<tr>
  																		<td>
  																			Time:
  																		</td>
  																		<td>
  																			<select id="hours">
  																				<option value="1">1</option>
  																				<option value="2">2</option>
  																				<option value="3">3</option>
  																				<option value="4">4</option>
  																				<option value="5">5</option>
  																				<option value="6">6</option>
  																				<option value="7">7</option>
  																				<option value="8">8</option>
  																				<option value="9">9</option>
  																				<option value="10">10</option>
  																				<option value="11">11</option>
  																				<option value="12">12</option>
  																			</select>	
  																		</td>
  																		<td>
  																			<select id="minutes"> 
  																				<option value="0">0</option>
  																				<option value="1">1</option>
  																				<option value="2">2</option>
  																				<option value="3">3</option>
  																				<option value="4">4</option>
  																				<option value="5">5</option>
  																				<option value="6">6</option>
  																				<option value="7">7</option>
  																				<option value="8">8</option>
  																				<option value="9">9</option>
  																				<option value="10">10</option>
  																				<option value="11">11</option>
  																				<option value="12">12</option>
  																				<option value="13">13</option>
  																				<option value="14">14</option>
  																				<option value="15">15</option>
  																				<option value="16">16</option>
  																				<option value="17">17</option>
  																				<option value="18">18</option>
  																				<option value="19">19</option>
  																				<option value="20">20</option>
  																				<option value="21">21</option>
  																				<option value="22">22</option>
  																				<option value="23">23</option>
  																				<option value="24">24</option>
  																				<option value="25">25</option>
  																				<option value="26">26</option>
  																				<option value="27">27</option>
  																				<option value="28">28</option>
  																				<option value="29">29</option>
  																				<option value="30">30</option>
  																				<option value="31">31</option>
  																				<option value="32">32</option>
  																				<option value="33">33</option>
  																				<option value="34">34</option>
  																				<option value="35">35</option>
  																				<option value="36">36</option>
  																				<option value="37">37</option>
  																				<option value="38">38</option>
  																				<option value="39">39</option>
  																				<option value="40">40</option>
  																				<option value="41">41</option>
  																				<option value="42">42</option>
  																				<option value="43">43</option>
  																				<option value="44">44</option>
  																				<option value="45">45</option>
  																				<option value="46">46</option>
  																				<option value="47">47</option>
  																				<option value="48">48</option>
  																				<option value="49">49</option>
  																				<option value="50">50</option>
  																				<option value="51">51</option>
  																				<option value="52">52</option>
  																				<option value="53">53</option>
  																				<option value="54">54</option>
  																				<option value="55">55</option>
  																				<option value="56">56</option>
  																				<option value="57">57</option>
  																				<option value="58">58</option>
  																				<option value="59">59</option>
  																			</select>
  																		</td>
  																		<td>
  																			<select id="selectedTime">
  																				<option value="AM">AM</option>
  																				<option value="PM">PM</option>
  																			</select>
  																		</td>
  																	</tr>
  																	<tr>
  																		<td>
  																		</td>
  																		<td>
  																			[Hours]
  																		</td>
  																		<td>
  																			[Min]
  																		</td>
  																	<td>
  																</td>
  															</tr>
  															<tr>
  																<td colspan="2">
  																	<input type="submit" id="ok" style="width:90px;"  name="ok" class="formbutton" value="Ok" onclick="showTime()">
  																</td>
  																<td colspan="2">
  																	<a href="#" rel="modal:close"><input type="reset" id="cancel" style="width:90px;" name="cancel" class="formbutton" value="Cancel"></a>
  																</td>
  															</tr>
  														</table>
  													</div>
  												</div>
  											</div> 
										</div>						
									</div>
									<div class="container">
										<bean:message key="BizComposer.Configuration.Shipping.shippingDatabasePath"/>
									</div>
									<div>
										<input type="radio" id="rbdDatabasePath" name="rbdDatabasePath"/><bean:message key="BzComposer.ComboBox.Select"/>
										&nbsp;&nbsp;
										<input type="radio" id="rbdDatabasePath" name="rbdDatabasePath"/>Create
										<br>
										<input type="file" id="selectDatabase" accept="(/*.mdb)" value="SHIPPING.mdb">
									</div> 
								</div>
							</div> --%>
					</div>
					<div id="valueAddedCalculator">
						<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
						<fieldset>
							<legend class="h6">
								<bean:message key="BizComposer.Configuration.Shipping.valueAddedCalculator"/>
							</legend>
							<div>
								<bean:message key="BizComposer.Configuration.Shipping.calculatorNote"/>
							</div>
							<div class="col-md-12">
								<div class="col-md-6" align="left">
									<bean:message key="BizComposer.Configuration.Shipping.extraAmount"/>
									&nbsp;
									<input type="text" id="extraAmount">
									&nbsp;&nbsp;
									<bean:message key="BizComposer.Configuration.Shipping.unit"/>
									&nbsp;
									<select id="unit">
										<option>$</option>
										<option>%</option>
									</select>
								</div>
							</div>
						</fieldset> 
					</div> --%>
			</div>
			<!-- shipping Ends -->
			
			<!-- RMA Starts -->
			<div id="rma" style="display:none;">
				<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
				<div id="tabs2" style="height:400px;">
  					<ul>
    					<li><a href="#addModifyReason"><bean:message key="Bizcomposer.addModifyReason" /></a></li>
    					<li><a href="#chargeForRMAItem" style="display:none;"><bean:message key="Bizcomposer.chargeForRMA" /></a></li>
  					</ul>
  					<div id="addModifyReason">
						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="2" align="left">
									<b><bean:message key="Bizcomposer.addModifyReason" /></b>
								</th>
							</tr>
							<tr>
								<td>
									<bean:message key="Bizcomposer.addReason"/>
								</td>
								<td>
									<html:text property="reason"></html:text> 
								</td>
							</tr>
							<tr>
								<td>
									<bean:message key="Bizcomposer.type"/>
								</td>
								<td>
									<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
									<html:select property="listOfExistingReasonType">
										<logic:present name="configurationForm" property="listOfExistingReasonType"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingReasonType" scope="session">
												<option value="<bean:write name='objList1' property='reasonTypeId' />"><bean:write name="objList1" property="reasonType" /></option>
											</logic:iterate>
										</logic:present>
									</html:select> --%>
								</td>
							</tr>
							<tr>
								<td>
									<%-- <html:select property="">
										<html:option value="">
											<html:select property="">
												<html:option value="">
												</html:option>
											</html:select>
										</html:option>
									</html:select> 
								</td>
								<td>
									<html:button property="Save">Add</html:button>
									<br>
									<html:button property="Save">Update</html:button>
									<br>
									<html:button property="Delete">Delete</html:button>
									<br>
									<html:button property="reset">Clear</html:button> 
								</td>
							</tr>
						</table>
						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="2" align="left">
									<b><bean:message key="Bizcomposer.defaultBankForAction" /></b>
								</th>
							</tr>
							<tr>
								<td>
									<bean:message key="Bizcomposer.defaultBank"/>
								</td>
								<td>
									<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
									<html:select property="listOfExistingBankAccount">
										<logic:present name="configurationForm" property="listOfExistingBankAccount"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingBankAccount" scope="session">
												<option value="<bean:write name='objList1' property='selectedBankAccountId' />"><bean:write name="objList1" property="selectedAccountName" /></option>
											</logic:iterate>
										</logic:present> 
									</html:select> 
								</td>
							</tr>
						</table>
					</div>
					<div id="chargeForRMAItem" style="display:none;">
						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="2" align="left">
									<b><bean:message key="Bizcomposer.chargeForRMA" /></b>
								</th>
							</tr>
							<tr>
								<td>
									<bean:message key="Bizcomposer.chargeForRMAItem"/>
								</td>
								<td>
									<%-- <html:text property=""></html:text> 
								</td>
							</tr>
						</table>
					</div>
				</div> 
			</div>--%>
			<!-- RMA Ends -->

			<!--  Reminders Starts -->
			
			<div id="reminder">
			<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
			<table class="table-notifications" width="100%">
				<tr>
					<td> 
						<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
						<html:checkbox property="showReminder">
							<bean:message key="BizComposer.Configuration.Reminders.ShowReminder" />
						</html:checkbox>
					</td>
				</tr>
				<tr>
					<th align="left">
						<bean:message key="BizComposer.Configuration.Reminders.ReminderList" />
					</th>
				</tr>
				<tr>
				<td>
					<table>
						<tr>
							<td align="right" style="width:100px;">
								<bean:message key="BizComposer.Configuration.Reminders.ReminderMe" />
							</td>
							<td style="width:100px;">&nbsp;&nbsp;</td>
							<td style="width:100px;">&nbsp;&nbsp;</td>
							<td align="left" style="width:110px;">
								<bean:message key="BizComposer.Configuration.Reminders.DontReminderMe" />
							</td>
						</tr>
						<tr>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.memorizeInvoices" />
							</td>
							<td align="center">
								<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
								<html:radio property="invoiceMemo" value="1"></html:radio> 
							</td>
							<td align="center">
								<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit 
								<html:radio property="invoiceMemo" value="0"></html:radio> --%>
							</td>
							<td>
								<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
								<html:text property="invoiceMemoDays" size="10" maxlength="7" onkeypress="return numbersonly(event,this.value);">
								</html:text> 
							</td>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.daysAfterMemorizeDate" />
							</td>
						</tr>
						<tr>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.memorizeEstimation" />
							</td>
							<td align="center">
								<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
								<html:radio property="memorizeEstimation" value="1"></html:radio>
							</td>
							<td align="center">
								<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
								<html:radio property="memorizeEstimation" value="0"></html:radio> --%>
							</td>
							<td>
								<%--  Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit 
								<html:text property="memorizeEstimationDays" size="10" maxlength="7" onkeypress="return numbersonly(event,this.value);">
								</html:text>
							</td>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.daysAfterMemorizeDate" />
							</td>
						</tr>
						<tr>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.OverdueInvoices" />
							</td>
							<td align="center">
								<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
								<html:radio property="overdueInvoice" value="1"></html:radio>
							</td>
							<td align="center">
								<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
								<html:radio property="overdueInvoice" value="0"></html:radio> --%>
							</td>
							<td>
								<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
								<html:text property="overdueInvoiceDays" size="10" maxlength="7" onkeypress="return numbersonly(event,this.value);">
								</html:text> 
							</td>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.daysBeforeDue" />
							</td>
						</tr>
						<tr>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.Inventory2Reorder" />
							</td>
							<td align="center">
								<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
								<html:radio property="inventoryOrder" value="1"></html:radio> 
							</td>
							<td align="center">
								<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
								<html:radio property="inventoryOrder" value="0"></html:radio> --%>
							</td>
							<td>
								<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
								<html:text property="inventoryOrderDays" size="10" maxlength="7" onkeypress="return numbersonly(event,this.value);">
								</html:text> 
							</td>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.quantityBeforeReorderPoint" />
							</td>
						</tr>
						<tr>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.serviceBilling" />
							</td>
							<td align="center">
								<%-- Comment because of this error: The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit
								<html:radio property="serviceBilling" value="1"></html:radio> 
							</td>
							<td align="center">
								<html:radio property="serviceBilling" value="0"></html:radio>
							</td>
							<td>
								<html:text property="serviceBillingDays" size="10" maxlength="7" onkeypress="return numbersonly(event,this.value);">
								</html:text>
							</td>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.daysBeforeScheduleBillingDate" />
							</td>
						</tr>
						<tr>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.Bills2Pay" />
							</td>
							<td align="center">
								<html:radio property="billsToPay" value="1"></html:radio>
							</td>
							<td align="center">
								<html:radio property="billsToPay" value="0"></html:radio>
							</td>
							<td>
								<html:text property="billsToPayDays" size="10" maxlength="7" onkeypress="return numbersonly(event,this.value);">
								</html:text>
							</td>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.daysBeforeDue" />
							</td>
						</tr>
						<tr>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.memorizePurchaseOrder" />
							</td>
							<td align="center">
								<html:radio property="memorizePurchaseOrder" value="1"></html:radio>
							</td>
							<td align="center">
								<html:radio property="memorizePurchaseOrder" value="0"></html:radio>
							</td>
							<td>
								<html:text property="memorizePurchaseOrderDays" size="10" maxlength="7" onkeypress="return numbersonly(event,this.value);">
								</html:text>
							</td>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.daysAfterMemorizeDate" />
							</td>
						</tr>
						<tr>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.memorizeBill" />
							</td>
							<td align="center">
								<html:radio property="memorizeBill" value="1"></html:radio>
							</td>
							<td align="center">
								<html:radio property="memorizeBill" value="0"></html:radio>
							</td>
							<td>
								<html:text property="memorizeBillDays" size="10" maxlength="7" onkeypress="return numbersonly(event,this.value);">
								</html:text>
							</td>
							<td>
								<bean:message key="BizComposer.Configuration.Reminders.daysAfterMemorizeDate" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			</table> --%>
			</div>
	<!-- Remainder Ends -->
			</td>
		</tr>
	</table>
	<div><html:hidden property="fileName" /></div>
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          