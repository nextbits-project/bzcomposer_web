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
<title><bean:message key="BzComposer.accountingandpaymenttitle" /></title>
<script type="text/javascript" src="<bean:write name="path" property="pathvalue"/>/dist/js/custom.js"></script>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<!-- Remember to include jQuery :) -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>  -->

<!-- jQuery Modal -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->

 <style type="text/css">
 /* * {
  padding: 0;
  margin: 5px;
  text-align: center;
} */
.modal {
  display: none; /* Hidden by default */
}
.fonts
{
	font: 12px;
}
.fontsTitle
{
	font:12px; padding: 5px;
}
</style>

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
    $( "#tabs1" ).tabs();
  });
 $(document).ready(function()
{
	var id = '<%= request.getAttribute("selectedId")%>';
	var pId = '<%=request.getAttribute("paymentId")%>';
	var cateID = '<%= request.getAttribute("cateId")%>';
	
	var arCatID = '<%= request.getAttribute("arCatId")%>';
	var poCatID = '<%= request.getAttribute("poCatId")%>';
	var bpCatID = '<%= request.getAttribute("bpCatId")%>';
	
	var arReceive = '<%= request.getAttribute("arReceiveType")%>';
	var poReceive = '<%= request.getAttribute("poReceiveType")%>';
	var bpReceive = '<%= request.getAttribute("bpReceiveType")%>';
	
	var arDeposit = '<%= request.getAttribute("arDepositTo")%>';
	var poDeposit = '<%= request.getAttribute("poDepositTo")%>';
	var bpDeposit = '<%= request.getAttribute("bpDepositTo")%>';
	
	$('select[id="defaultDepositToId"]').find('option[value="'+id+'"]').attr("selected",true);
	$('select[id="defaultPaymentMethodId"]').find('option[value="'+pId+'"]').attr("selected",true);
	$('select[id="defaultCategoryId"]').find('option[value="'+cateID+'"]').attr("selected",true);
	
	$('select[id="arCategory"]').find('option[value="'+arCatID+'"]').attr("selected",true);
	$('select[id="poCategory"]').find('option[value="'+poCatID+'"]').attr("selected",true);
	$('select[id="bpCategory"]').find('option[value="'+bpCatID+'"]').attr("selected",true);
	
	$('select[id="arReceivedType"]').find('option[value="'+arReceive+'"]').attr("selected",true);
	$('select[id="poReceivedType"]').find('option[value="'+poReceive+'"]').attr("selected",true);
	$('select[id="bpReceivedType"]').find('option[value="'+bpReceive+'"]').attr("selected",true);
	
	$('select[id="arDepositTo"]').find('option[value="'+arDeposit+'"]').attr("selected",true);
	$('select[id="poDepositTo"]').find('option[value="'+poDeposit+'"]').attr("selected",true);
	$('select[id="bpDepositTo"]').find('option[value="'+bpDeposit+'"]').attr("selected",true);
	
	if(document.configurationForm.scheduleDays.value == 0)
	{
		$("#noNeedToSetup").prop("checked",true);
		$("#needSetup").prop("checked",false);
	}
	else
	{
		$("#needSetup").prop("checked",true);
		$("#noNeedToSetup").prop("checked",false);
	}
	
	if(document.configurationForm.reimbursementSettings.value == 2)
	{
		$("#askWhatToDo").prop("checked",true);
		$("#dontAddAny").prop("checked",false);	
		$("#timeForPrompt").prop("checked",false);
	}
	else if(document.configurationForm.reimbursementSettings.value == 1)
	{
		$("#askWhatToDo").prop("checked",false);
		$("#dontAddAny").prop("checked",true);
		$("#timeForPrompt").prop("checked",false);
	}
	else
	{
		$("#askWhatToDo").prop("checked",false);
		$("#dontAddAny").prop("checked",false);
		$("#timeForPrompt").prop("checked",true);
	}
	
	if(document.configurationForm.scheduleDays.value >0)
	{
		$("#scheduleDays").prop("checked",true);
		var scheduleDays = $("#scheduleDays").val();
		document.configurationForm.scheduleDays.value = scheduleDays;
	}
	else
	{
		$("#noNeedToSetup").prop("checked",true);
		document.configurationForm.scheduleDays.value = 0;
	}
	
	/* if($("#noNeedToSetup").prop("checked",true))
	{
		document.configurationForm.scheduleDays.value = 0;
	}
	else
	{
		alert("NeedSetup is checked");
		var scheduleDays = $("#scheduleDays").val();
		document.configurationForm.scheduleDays.value = scheduleDays;
	} */
	
	if(document.configurationForm.reimbursementSettings.value == 2)
	{
		$("#askWhatToDo").prop("checked",true);
		document.configurationForm.reimbursementSettings.value = 2;
	}
	
	else if(document.configurationForm.reimbursementSettings.value == 1)
	{
		$("#dontAddAny").prop("checked",true);
		document.configurationForm.reimbursementSettings.value = 1;
	}
	
	else
	{
		$("#timeForPrompt").prop("checked",true);
		document.configurationForm.reimbursementSettings.value = 0;
	}
	
	/* if($("#askWhatToDo").prop("checked",true))
	{
		document.configurationForm.reimbursementSettings.value = 2;
	}
	else if($("#dontAddAny").prop("checked",true))
	{
		alert("dontNeedAny is checked");
		document.configurationForm.reimbursementSettings.value = 1;
	}
	else
	{
		document.configurationForm.reimbursementSettings.value = 0;
	} */
	
	$('#assessFinanceCharge').change(function()
	{
		var isChecked = "<%= request.getAttribute("isChecked")%>";
		if($(this).prop("checked") == true)
		{

	        $("#assessFinanceCharge").attr('checked', true);
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {

	        $("#assessFinanceCharge").attr('checked', false);
	        isChecked = "off";
		}	
	    else
	    {

	        $("#assessFinanceCharge").attr('checked', true);
	    	document.configurationForm.assessFinanceCharge.value = isChecked;
	    }	
		$("#assessFinanceCharge").val(isChecked);
	});
	
	document.configurationForm.showCombinedBilling.value = '<%= request.getAttribute("showCmbValue")%>';
	var template = '<%= request.getAttribute("billingTemplateID")%>';
	 
	$('select[id="showBillingStatStyle"]').find('option[value="'+template+'"]').attr("selected",true);
});
 
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
 
 /* Added on 04-05-2020 */
 function setDiv()
	{
		var value = $("#stores option:selected").val();

		if(value == 39)
		{
			document.getElementById("forOnlineOption").style.display = "block";
			document.getElementById("forCdromusaOption").style.display = "none";
		}
		else
		{
			document.getElementById("forOnlineOption").style.display = "none";
			document.getElementById("forCdromusaOption").style.display = "block";
		}
	}
	function seteSalesStores()
	{
		$('select[id="eSalesChannels"]').find('option').attr("selected",false);
		var eSalesStore = $.trim($("#eSalesStoreId option:selected").text());	//selected select option value
		var selectedeSalesStore = $.trim($("#eSalesStoreId option:selected").val()); //selected select option id
		var ab = $.trim($('select[id="eSalesStoreId"]').find('option[id="'+selectedeSalesStore+'"]').val());	//abbreviation of selected option 
		
		var storeChannel = $.trim($('select[id="eSalesStoreId"]').find('option[id="'+eSalesStore+'"]').val());
		

		
		$('select[id="eSalesStoreId"]').find('option[id="'+selectedeSalesStore+'"]').attr("selected",true);
		$('select[id="eSalesStoreId"]').find('option[id="'+eSalesStore+'"]').attr("selected",true);
		$('select[id="eSalesChannels"]').find('option[id="'+storeChannel+'"]').attr("selected",true);
		
		$("#storeTypeName").val(eSalesStore);
		$("#eSalesAbbreviation").val(ab);
		
	}
	
	function clearFields()
	{
		$("#storeTypeName").val("");
		$("#eSalesAbbreviation").val("");
		$("#btnAddeBayCategory").attr('disabled',false);
	}
</script>
</head>
<body onload="init();">
<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post" styleId="accountPaymentfrm">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div class="fontsTitle">
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
							<%-- <%@include file="testMenu.jsp" %> --%>
							<%-- <%@include file="menuPage.jsp" %>  --%>
							<jsp:include page="menuPage.jsp"></jsp:include>
						<!-- <div id="table-negotiations"
							style="width: 185px;height:800px;padding-left: 10px;overflow-y:auto;max-height: 1200px;">
							</div> -->
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
					<!-- Account&Payment Starts -->
					<div id="accountPayment"  style="display:none;padding: 0; position: relative; left: 0;" >
						<div id="tabs1" style="height:auto;">
  							<ul>
    							<li style="font-size: 12px;"><a href="#AccountSetting">
    								<bean:message key="BzComposer.configuration.tab.accountsetting" /></a>
   								</li>
    							<li style="font-size: 12px;"><a href="#AccountReceivable">
    								<bean:message key="BzComposer.configuration.tab.accountrecivable" /></a>
   								</li>
    							<li style="font-size: 12px;"><a href="#POPayable">
    								<bean:message key="BzComposer.configuration.tab.popayable" /></a>
   								</li>
    							<li style="font-size: 12px;"><a href="#billing">
    								Billing</a>
   								</li>
    							<li style="font-size: 12px;"><a href="#BillingPayable">
    								<bean:message key="BzComposer.configuration.tab.billingpayable" /></a>
   								</li>
   								<li style="font-size: 12px;"><a href="#PaymentType">
    								Payment Type</a>
   								</li>
   								<li style="font-size: 12px;"><a href="#ReceivedType">
    								Received Type</a>
   								</li>
  							</ul>
							<div id="AccountSetting">
								<div id="content1" class="tabPage">
   									<!-- add here the content of first tab -->
										<table class="table-notifications" width="100%">
											<tr>
												<th colspan="4" align="left" style="font-size: 12px; padding: 5px;">
													<bean:message key="BzComposer.configuration.defaultaccountsetting" />
												</th>
											</tr>
											<tr>
												<td style="font-size: 12px;">
													<bean:message key="BzComposer.configuration.defaultpaymentmethod" />:
												</td>
												<td style="font-size: 12px;">
													<html:select property="defaultPaymentMethodId" styleId="defaultPaymentMethodId">
														<logic:present name="configurationForm" property="listOfExistingAccounts"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingAccounts" scope="session">
																<option value="<bean:write name='objList1' property='accountNumber' />"><bean:write name="objList1" property="accountName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
												<td style="font-size: 12px;">
													<bean:message key="BzComposer.configuration.defaultreceivetype"/>:
												</td>
												<td style="font-size: 12px;">
													<html:select property="selectedPaymentId">
														<logic:present name="configurationForm" property="listOfExistingPayment"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPayment" scope="session">
																<option value="<bean:write name='objList1' property='paymentId' />"><bean:write name="objList1" property="paymentName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
											</tr>
											<tr>
												<td style="font-size: 12px;">
													<bean:message key="BzComposer.configuration.defaultcategory" />:
												</td>
												<td style="font-size: 12px;">
													<html:select property="defaultCategoryId" styleId="defaultCategoryId">
														<logic:present name="configurationForm" property="listOfExistingCategory"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCategory" scope="session">
																<option value="<bean:write name='objList1' property='selectedCategoryId' />"><bean:write name="objList1" property="categoryName" />&nbsp;<bean:write name="objList1" property="categoryNumber" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
												<td style="font-size: 12px;">
													<bean:message key="BzComposer.configuration.depositto"/>:
												</td>
												<td style="font-size: 12px;">
													<html:select property="defaultDepositToId" styleId="defaultDepositToId">
														<logic:present name="configurationForm" property="listOfExistingAccounts"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingAccounts" scope="session">
															<option value="<bean:write name='objList1' property='defaultDepositToId' />"><bean:write name="objList1" property="accountName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
											</tr>
											<tr>
												<th colspan="4" align="left" style="font-size: 12px;  padding: 5px;"><bean:message
												key="BzComposer.configuration.paymentschdulesetting" /></th>
											</tr>
											<tr colspan="2">
												<td style="font-size: 12px;">
													<html:radio property="needSetUp" value="needSetUp" styleId="noNeedToSetup">
													</html:radio>&nbsp;<bean:message key="BzComposer.configuration.noneedtosetup"/>
												</td>
											</tr>
											<tr colspan="2">
												<td style="font-size: 12px;">
													<html:radio property="needSetUp" value="needSetUp" styleId="needSetup">
													</html:radio>&nbsp;
													<html:text property="scheduleDays" styleId="scheduleDays">
													</html:text>
													&nbsp;<bean:message key="BzComposer.configuration.daysbeforeduedate"/>
												</td>
											</tr>
										<tr>
											<th colspan="4" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.reimbursementsettings" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<html:radio property="reimbursementSettings" value="0" styleId="timeForPrompt">
												</html:radio>
												&nbsp;<bean:message key="BzComposer.configuration.reimbursementsettings.timeforprompt"/>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<html:radio property="reimbursementSettings" value="1" styleId="dontAddAny">
												</html:radio>
												&nbsp;<bean:message key="BzComposer.configuration.reimbursementsettings.dontaddany"/>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<html:radio property="reimbursementSettings" value="2" styleId="askWhatToDo">
												</html:radio>
												&nbsp;<bean:message key="BzComposer.configuration.reimbursementsettings.askwhattodo"/>
											</td>
										</tr>
										<tr>
											<th colspan="4" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.applyingcharges" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<%-- <input type="checkbox" name="financeCharge"/> <bean:message key="Bizcomposer.financeCharge"/> --%>
												<html:checkbox property="assessFinanceCharge" styleId="assessFinanceCharge">&nbsp;
													<bean:message key="BzComposer.configuration.applyingcharges.assessfinancecharge" />
												</html:checkbox>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<b><bean:message key="BzComposer.configuration.chargerate" /></b>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.annualinterestrate"/>:
											</td>
											<td style="font-size: 12px;">
												<%-- <html:text property="annualRate"></html:text> --%>
												<html:text property="annualInterestRate" styleId="annualInterestRate" onkeypress="return numbersonly(event,this.value);">
												</html:text>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.minimumfinancerate"/>:
											</td>
											<td style="font-size: 12px;">
												<%-- <html:text property="financeCharge" value=""></html:text> --%>
												<html:text property="minCharge" styleId="minCharge" onkeypress="return numbersonly(event,this.value);">
												</html:text>
											</td>
										</tr>
										<tr>
											<td class=".fonts">
												<bean:message key="BzComposer.configuration.graceperiodindays"/>:
											</td>
											<td>
												<%-- <html:text property="gracePeriodDays" value=""></html:text> --%>
												<html:text property="gracePeriod" styleId="gracePeriod" onkeypress="return numbersonly(event,this.value);">
												</html:text>
											</td>
										</tr>
										<tr>
											<th colspan="4" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.setubudgetyear" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.startmonth"/>:
											</td>
											<td style="font-size: 12px;">
												<html:select property="startMonth" styleId="startMonth">
													<html:option value="0"><bean:message key="BzComposer.configuration.month.january"/></html:option>
													<html:option value="1"><bean:message key="BzComposer.configuration.month.february"/></html:option>
													<html:option value="2"><bean:message key="BzComposer.configuration.month.march"/></html:option>
													<html:option value="3"><bean:message key="BzComposer.configuration.month.april"/></html:option>
													<html:option value="4"><bean:message key="BzComposer.configuration.month.may"/></html:option>
													<html:option value="5"><bean:message key="BzComposer.configuration.month.june"/></html:option>
													<html:option value="6"><bean:message key="BzComposer.configuration.month.july"/></html:option>
													<html:option value="7"><bean:message key="BzComposer.configuration.month.august"/></html:option>
													<html:option value="8"><bean:message key="BzComposer.configuration.month.september"/></html:option>
													<html:option value="9"><bean:message key="BzComposer.configuration.month.october"/></html:option>
													<html:option value="10"><bean:message key="BzComposer.configuration.month.november"/></html:option>
													<html:option value="11"><bean:message key="BzComposer.configuration.month.december"/></html:option>
												</html:select>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.endmonth"/>:
											</td>
											<td style="font-size: 12px;">
												<html:select property="endMonth" styleId="endMonth">
													<html:option value="0"><bean:message key="BzComposer.configuration.month.january"/></html:option>
													<html:option value="1"><bean:message key="BzComposer.configuration.month.february"/></html:option>
													<html:option value="2"><bean:message key="BzComposer.configuration.month.march"/></html:option>
													<html:option value="3"><bean:message key="BzComposer.configuration.month.april"/></html:option>
													<html:option value="4"><bean:message key="BzComposer.configuration.month.may"/></html:option>
													<html:option value="5"><bean:message key="BzComposer.configuration.month.june"/></html:option>
													<html:option value="6"><bean:message key="BzComposer.configuration.month.july"/></html:option>
													<html:option value="7"><bean:message key="BzComposer.configuration.month.august"/></html:option>
													<html:option value="8"><bean:message key="BzComposer.configuration.month.september"/></html:option>
													<html:option value="9"><bean:message key="BzComposer.configuration.month.october"/></html:option>
													<html:option value="10"><bean:message key="BzComposer.configuration.month.november"/></html:option>
													<html:option value="11"><bean:message key="BzComposer.configuration.month.december"/></html:option>
												</html:select>
											</td>
										</tr>
									</table>	
								</div>  
							</div>
		
					  		<div id="AccountReceivable">
					   			<div id="content2" class="tabPage">
					   				<!-- add here the content of second tab -->		
					   				<table class="table-notifications" width="100%">
										<tr>
											<th colspan="2" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.defaultaccountsetting" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.category" />:
											</td>
											<td style="font-size: 12px;">
												<html:select property="arCategory" styleId="arCategory">
													<logic:present name="configurationForm" property="listOfExistingCategory"> 
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCategory" scope="session">
															<option value="<bean:write name='objList1' property='arCategory' />">
																<bean:write name="objList1" property="categoryName" />&nbsp;
																<bean:write name="objList1" property="categoryNumber" />
															</option>
														</logic:iterate>
													</logic:present> 
												</html:select>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.defaultreceivetype"/>:
											</td>
											<td style="font-size: 12px;">
												<html:select property="arReceivedType" styleId="arReceivedType">
													<logic:present name="configurationForm" property="listOfExistingPayment"> 
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPayment" scope="session">
															<option value="<bean:write name='objList1' property='arReceivedType' />"><bean:write name="objList1" property="paymentName" /></option>
														</logic:iterate>
													</logic:present> 
												</html:select>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.depositto" />:
											</td>
											<td style="font-size: 12px;">
												<html:select property="arDepositTo" styleId="arDepositTo">
													<logic:present name="configurationForm" property="listOfExistingAccounts"> 
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingAccounts" scope="session">
															<option value="<bean:write name='objList1' property='arDepositTo' />"><bean:write name="objList1" property="accountName" /></option>
														</logic:iterate>
													</logic:present> 
												</html:select>
											</td>
										</tr>
									</table>
								</div>  
							</div>
							<div id="POPayable">
								<div id="content3" class="tabPage">
								<!-- add here the content of first tab -->
									<table class="table-notifications" width="100%">
										<tr>
											<th colspan="2" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.defaultaccountsetting" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.category" />:
											</td>
											<td style="font-size: 12px;">
												<html:select property="poCategory" styleId="poCategory">
													<logic:present name="configurationForm" property="listOfExistingCategory"> 
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCategory" scope="session">
															<option value="<bean:write name='objList1' property='poCategory' />">
																<bean:write name="objList1" property="categoryName" />&nbsp;
																<bean:write name="objList1" property="categoryNumber" />
															</option>
														</logic:iterate>
													</logic:present> 
												</html:select>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.defaultreceivetype"/>:
											</td>
											<td style="font-size: 12px;">
												<html:select property="poReceivedType" styleId="poReceivedType">
													<logic:present name="configurationForm" property="listOfExistingPaymentGeneralAccount"> 
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPaymentGeneralAccount" scope="session">
															<option value="<bean:write name='objList1' property='poReceivedType' />"><bean:write name="objList1" property="paymentName" /></option>
														</logic:iterate>
													</logic:present> 
												</html:select>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.depositto" />:
											</td>
											<td style="font-size: 12px;">
												<html:select property="poDepositTo" styleId="poDepositTo">
													<logic:present name="configurationForm" property="listOfExistingAccounts"> 
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingAccounts" scope="session">
														<option value="<bean:write name='objList1' property='poDepositTo' />"><bean:write name="objList1" property="accountName" /></option>
													</logic:iterate>
													</logic:present> 
												</html:select>
											</td>
										</tr>
									</table>			
								</div>  
							</div>
							<div id="BillingPayable">
					   			<div id="content4" class="tabPage">
					   				<!-- add here the content of first tab -->
									<table class="table-notifications" width="100%">
										<tr>
											<th colspan="2" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.defaultaccountsetting" />
											</th>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.category" />:
											</td>
											<td style="font-size: 12px;">
												<html:select property="bpCategory" styleId="bpCategory">
													<logic:present name="configurationForm" property="listOfExistingCategory"> 
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCategory" scope="session">
															<option value="<bean:write name='objList1' property='bpCategory' />"><bean:write name="objList1" property="categoryName" />&nbsp;<bean:write name="objList1" property="categoryNumber" /></option>
														</logic:iterate>
													</logic:present> 
												</html:select>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.defaultreceivetype"/>:
											</td>
											<td style="font-size: 12px;">
												<html:select property="bpReceivedType" styleId="bpReceivedType" styleClass="width:50%" >
													<logic:present name="configurationForm" property="listOfExistingPaymentGeneralAccount"> 
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPaymentGeneralAccount" scope="session">
															<option value="<bean:write name='objList1' property='bpReceivedType' />"><bean:write name="objList1" property="paymentName" /></option>
														</logic:iterate>
													</logic:present> 
												</html:select>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.depositto" />:
											</td>
											<td style="font-size: 12px;">
												<html:select property="bpDepositTo" styleId="bpDepositTo">
													<logic:present name="configurationForm" property="listOfExistingAccounts"> 
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingAccounts" scope="session">
															<option value="<bean:write name='objList1' property='bpDepositTo' />">
																<bean:write name="objList1" property="accountName" />
															</option>
														</logic:iterate>
													</logic:present> 
												</html:select>
											</td>
										</tr>
									</table>			
								</div>  
							</div>
							
							<div id="billing">
								<table class="table-notifications" width="80%">
									<tr>
										<th colspan="2" align="left" style="font-size:12px; padding: 5px;"><bean:message key="BzComposer.configuration.invoiceprefrence" /></th>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.startbillinginvoicenumber"/>:
										</td>
										<td colspan="2" align="center" style="font-size:12px;">
											<html:text property="startingBillNumber"></html:text>
										</td>
									</tr>
									<tr>
										<th colspan="2" align="left" style="font-size:12px; padding: 5px;"><bean:message key="BzComposer.configuration.billingstatementpreference" /></th>
									</tr>
									<tr>
										<td colspan="2" style="font-size:12px;">
											<html:checkbox property="showCombinedBilling" styleId="showCombinedBilling">
												<bean:message key="BzComposer.configuration.showbillingstatement"/>
											</html:checkbox>
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<bean:message key="BzComposer.configuration.defaultbillingtemplateforprint"/>
										</td>
										<td colspan="2" align="center" style="font-size:12px;">
											<%-- <html:select property="showBillingStatStyle" styleId="showBillingStatStyle">
												<logic:present name="configurationForm" property="listOfExistingBillingType"> 
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingBillingType" scope="session">
														<option value="<bean:write name='objList1' property='showBillingStatStyle' />">
															<bean:write name="objList1" property="billingTypeName" />
														</option>
													</logic:iterate>
												</logic:present> 
											</html:select> --%>
											<html:select property="showBillingStatStyle" styleId="showBillingStatStyle">
												<logic:present name="configurationForm" property="listOfExistingBillingType"> 
													<logic:iterate name="configurationForm" id="objList1" property="listOfExistingBillingType" scope="session">
														<option value="<bean:write name='objList1' property='showBillingStatStyle' />">
															<bean:write name="objList1" property="billingTypeName" />
														</option>
													</logic:iterate>
												</logic:present> 
											</html:select>
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;">
											<%-- <input type="checkbox" id="mailToCustomer" name="mailToCustomer">
											<bean:message key="Bizcomposer.emailToCustomers"/>&nbsp;&nbsp; --%>
											<html:checkbox property="mailToCustomer" styleId="mailToCustomer">
												<bean:message key="BzComposer.configuration.emailtocustomers"/>
											</html:checkbox>
											&nbsp;&nbsp;
											<%-- <input type="checkbox" id="printBills" name="printBills">
											<bean:message key="Bizcomposer.printBills"/> --%>
											<html:checkbox property="printBills" styleId="printBills">
												<bean:message key="BzComposer.configuration.printbills"/>
											</html:checkbox>
										</td>
									</tr>
								</table>
							</div>
							
							<div id="PaymentType">
								<div id="content6" class="tabPage">
									<table class="table-notifications">
										<tr>
											<th colspan="4" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.creditcardtype" />
											</th>
										</tr>
										<tr>
											<td rowspan="3">
												<table border="2" width="300px;">
													<tr>
														<td align="center" style="font-size: 12px;">
															<b><bean:message key="BzComposer.configuration.creditcardtype" /></b>
														</td>
														<td align="center" style="font-size: 12px;">
															<b><bean:message key="BzComposer.configuration.active" /></b>
														</td>
													</tr>
													<logic:present name="configurationForm" property="listOfExistingCreditCard">
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCreditCard" scope="session">
															<tr>
																<td id="<bean:write name='objList1' property='creditCardTypeId' />"
																onclick="showType(this.val);" align="center" style="font-size: 1em;">
																	<label id="cType" name="cType" value="<bean:write name="objList1" property="creditCardName" />">
																		<bean:write name="objList1" property="creditCardName" />
																	</label>
																</td>
																<td align="center">
																	<html:checkbox property="isActive" value="true">
																	</html:checkbox>
																</td>
															</tr>
														</logic:iterate>
													</logic:present>
												</table>
											</td>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.creditcardtype" /> :
											</td>
											<td>
												<input type="text" id="creditCardName" style="font-size: 12px;">
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.active" />
											</td>
											<td>
												<input type="checkbox" id="active" checked>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<button type="button" class="formbutton" id="Save" name="Save" style="width:60px;">
													<bean:message key="BzComposer.global.save"/>
												</button>
												&nbsp;&nbsp;
												<button type="button" class="formbutton" id="Add" name="Add" style="width:80px;">
													<bean:message key="BzComposer.configuration.addnewbtn"/>
												</button>
												&nbsp;&nbsp;
												<button type="button" class="formbutton" id="Delete" name="Delete" 
												style="width:60px;">
													<bean:message key="BzComposer.global.delete"/>
												</button>
											</td>
										</tr>
										<tr>
											<th colspan="4" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.tab.paymenttype" />
											</th>
										</tr>
										<tr>
											<td rowspan="4" style="font-size: 12px;">
												<table border="2" style='height: 100px; width: 300px;'>
													<tr>
														<td align="center">
															<b><bean:message key="BzComposer.configuration.paymenttypename" /></b>
														</td>
														<td align="center">
															<b><bean:message key="BzComposer.configuration.tab.paymenttype" /></b>
														</td>
													</tr>
													<logic:present name="configurationForm" property="listOfExistingPaymentType">
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPaymentType"
															scope="session">
															<tr>
																<td id="paymentTypeId" value="<bean:write name='objList1' property='paymentTypeId' />"
																onclick="showType();" align="center" style="font-size: 1em;">
																	<label id="pName" name="pName" value="<bean:write name="objList1" property="paymentTypeId" />">
																		<bean:write name="objList1" property="paymentName" />
																	</label>
																</td>
																<td align="center" style="font-size: 12px;">
																	<bean:write name="objList1" property="paymentType" />
																</td>
															</tr>
														</logic:iterate>
													</logic:present>
												</table>
											</td>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.tab.paymenttype" /> :
											</td>
											<td style="font-size: 12px;">
												<input type="text" id="paymentType1">
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.type" /> :
											</td>
											<td style="font-size: 12px;">
												<html:select property="listOfExistingCreditCardType">
													<logic:present name="configurationForm" property="listOfExistingCreditCardType">
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCreditCardType" scope="session">
															<option value="<bean:write name='objList1' property='creditCardName' />">
																<bean:write name="objList1" property="creditCardName" />
															</option>
														</logic:iterate>
													</logic:present>
												</html:select>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.accountcategory" /> :
											</td>
											<td style="font-size: 12px;">
												<select>
													<option></option>
													<option>1</option>
													<option>2</option>
												</select>
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<input type="button" id="Add" name="Add" 
												value="<bean:message key='BzComposer.global.add'/>" class="formbutton" readonly>
												&nbsp;&nbsp;
												<input type="button" id="Update" name="Update" 
												value="<bean:message key='BzComposer.global.update'/>" class="formbutton">
												&nbsp;&nbsp; 
												<input type="button" id="Delete" name="Delete" 
												value="<bean:message key='BzComposer.global.delete'/>" class="formbutton">
												&nbsp;&nbsp; 
												<input type="button" id="Clear" name="Clear" 
												value="<bean:message key='BzComposer.global.clear'/>" class="formbutton">
											</td>
										</tr>
										<tr>
											<td colspan="4" align="center" style="font-size: 12px;">
												<h1>
													<a href="/bzcomposerweb2/Banking.do?tabid=Banking">
														<bean:message key="BzComposer.configuration.gotobank" />
													</a>
												</h1>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div id="ReceivedType">
								<div id="content7" class="tabPage">
									<table class="table-notifications">
										<tr>
											<th colspan="4" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.tab.receivedtype" />
											</th>
										</tr>
										<tr>
											<td rowspan="3" style="font-size: 12px;">
												<table border="2" width="300px;">
													<tr>
														<td align="center" style="font-size: 12px;">
															<b><bean:message key="BzComposer.configuration.creditcardtype" /></b>
														</td>
														<td align="center" style="font-size: 12px;">
															<b><bean:message key="BzComposer.configuration.active" /></b>
														</td>
													</tr>
													<logic:present name="configurationForm" property="listOfExistingCreditCard">
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCreditCard" scope="session">
															<tr>
																<td id="<bean:write name='objList1' property='creditCardTypeId' />" onclick="showType();" align="center">
																	<label id="cType" name="cTyoe" value="<bean:write name="objList1" property="creditCardTypeId" />">
																		<bean:write name="objList1" property="creditCardName" />
																	</label>
																</td>
																<td align="center">
																	<%-- <html:checkbox property="isActive" value="1" style="checked:false; display=none;">
																		</html:checkbox> --%> 
																		<html:checkbox property="isActive" value="0">
																		</html:checkbox>
																</td>
															</tr>
														</logic:iterate>
													</logic:present>
												</table>
											</td>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.creditcardtype" /> :
											</td>
											<td style="font-size: 12px;">
												<input type="text" id="creditCardName">
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.active" /> :
											</td>
											<td style="font-size: 12px;">
												<input type="checkbox" id="active" value="true">
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<button type="button" class="formbutton" id="Save" name="Save" readonly style="width:60px;">
													<bean:message key="BzComposer.global.save"/>
												</button>
												&nbsp;&nbsp;
												<button type="button" class="formbutton" id="Add" name="Add" style="width:80px;">
													<bean:message key="BzComposer.configuration.addnewbtn"/>
												</button>
												&nbsp;&nbsp;
												<button type="button" class="formbutton" id="Delete" name="Delete" style="width:60px;">
													<bean:message key="BzComposer.global.delete"/>
												</button>
											</td>
										</tr>
										<tr>
											<th colspan="4" align="left" style="font-size: 12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.tab.paymenttype" />
											</th>
										</tr>
										<tr>
											<td rowspan="4" style="font-size: 12px;">
												<table border="2" width="300px;">
													<tr>
														<td align="center" style="font-size: 12px;">
															<b><bean:message key="BzComposer.configuration.receivetypename" /></b>
														</td>
														<td align="center" style="font-size: 12px;">
															<b><bean:message key="BzComposer.configuration.tab.receivedtype" /></b>
														</td>
													</tr>
													<logic:present name="configurationForm" property="listOfExistingPaymentType">
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPaymentType" scope="session">
															<tr>
																<td id="paymentTypeId" value="<bean:write name='objList1' property='paymentTypeId' />" 
																onclick="showType();" align="center">
																	<label id="pName" name="pName" value="<bean:write name="objList1" property="paymentTypeId" />" style="font-size: 1em;">
																		<bean:write name="objList1" property="paymentName" />
																	</label>
																</td>
																<td align="center">
																	<bean:write name="objList1" property="paymentType" />
																</td>
															</tr>
														</logic:iterate>
													</logic:present>
												</table>
											</td>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.paymenttypename" /> :
											</td>
											<td style="font-size: 12px;">
												<input type="text" id="paymentType1">
											</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">
												<bean:message key="BzComposer.configuration.type" /> :
											</td>
											<td style="font-size: 12px;">
												<html:select property="listOfExistingCreditCardType">
													<logic:present name="configurationForm" property="listOfExistingCreditCardType">
														<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCreditCardType" scope="session">
															<option value="<bean:write name='objList1' property='creditCardName' />">
																<bean:write name="objList1" property="creditCardName" />
															</option>
														</logic:iterate>
													</logic:present>
												</html:select>
											</td>
											<tr>
												<td style="font-size: 12px;">
													<bean:message key="BzComposer.configuration.accountcategory" /> :
												</td>
												<td style="font-size: 12px;">
													<select>
														<option></option>
														<option>1</option>
														<option>2</option>
													</select>
												</td>
											</tr>
											<tr>
												<td style="font-size: 12px;">
													<input type="button" id="Add" name="Add" class="formbutton" readonly 
													value="<bean:message key='BzComposer.global.add'/>">
													&nbsp;&nbsp;
													<input type="button" id="Update" name="Update" 
													value="<bean:message key='BzComposer.global.update'/>" class="formbutton"> 
													&nbsp;&nbsp;
													<input type="button" id="Delete" name="Delete" 
													value="<bean:message key='BzComposer.global.delete'/>" class="formbutton">
													&nbsp;&nbsp; 
													<input type="button" id="Clear" name="Clear" 
													value="<bean:message key='BzComposer.global.clear'/>" class="formbutton">
												</td>
											</tr>
											<tr>
												<td colspan="4" align="center" style="font-size: 12px;">
													<h1>
														<a href="/bzcomposerweb2/Banking.do?tabid=Banking">
															<bean:message key="BzComposer.configuration.gotobank" />
														</a>
													</h1>
												</td>
											</tr>
										</table>
								</div>
							</div>
						</div>	
					</div>
					<!-- Account&Payment Ends -->
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
		</div>
	</div>
		<div align="center">
			<%-- <html:button property="Submit" onclick="SaveValues()" style="font-size:1em;">Save</html:button>
			<html:cancel property="Cancel" onclick="RevokeValues()" style="font-size:1em;">Cancel</html:cancel> --%>
			<input type="Submit" name="Submit" onclick="SaveValues()" style="font-size:1em;" value="<bean:message key='BzComposer.global.save'/>"/>
		<input type="reset" name="Cancel" onclick="RevokeValues()" style="font-size:1em;" value="<bean:message key='BzComposer.global.cancel'/>"/>
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
/* function SaveValues(){
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

function RevokeValues(){
	document.getElementById('tid').value="config";
	document.forms[0].action = "Configuration.do";
	document.forms[0].submit();
} */

function SaveValues()
{
	//if(confirm('<bean:message key="BzComposer.configuration.saveconfirm"/>'))
	//{
		/* debugger
		//General Account Setting panel options
		document.configurationForm.defaultPaymentMethodId.value = document.configurationForm.defaultPaymentMethodId.value;
		document.configurationForm.defaultCategoryId.value = document.configurationForm.defaultCategoryId.value;
		debugger
		
		document.configurationForm.scheduleDays.value = document.configurationForm.scheduleDays.value;
		
		if($("#askWhatToDo").prop("checked",true))
		{

			document.configurationForm.reimbursementSettings.value = 2;
		}
		else if($("#dontAddAny").prop("checked",true))
		{

			document.configurationForm.reimbursementSettings.value = 1;
		}
		else
		{

			document.configurationForm.reimbursementSettings.value = 0;
		} 
		
		document.configurationForm.reimbursementSettings.value = document.configurationForm.reimbursementSettings.value;
		
		debugger
		
		document.configurationForm.annualInterestRate.value = document.configurationForm.annualInterestRate.value;
		document.configurationForm.minCharge.value = document.configurationForm.minCharge.value;
		document.configurationForm.gracePeriod.value = document.configurationForm.gracePeriod.value; 
		document.configurationForm.assessFinanceCharge.value = $("#assessFinanceCharge").val();
		
		debugger
		
		document.configurationForm.startMonth.value = document.configurationForm.startMonth.value;
		document.configurationForm.endMonth.value = document.configurationForm.endMonth.value;
		
		debugger
		//Account Receivable panel options 
		document.configurationForm.arCategory.value = document.configurationForm.arCategory.value;
		document.configurationForm.arReceivedType.value = document.configurationForm.arReceivedType.value;
		document.configurationForm.arDepositTo.value = document.configurationForm.arDepositTo.value;
		
		debugger 
		
		//Po Payable panel options
		document.configurationForm.poCategory.value = document.configurationForm.poCategory.value;
		document.configurationForm.poReceivedType.value = document.configurationForm.poReceivedType.value;
		document.configurationForm.poDepositTo.value = document.configurationForm.poDepositTo.value;
		
		debugger
		
		//Billing Payable panel options
		document.configurationForm.bpCategory.value = document.configurationForm.bpCategory.value;
		document.configurationForm.bpReceivedType.value = document.configurationForm.bpReceivedType.value;
		document.configurationForm.bpDepositTo.value = document.configurationForm.bpDepositTo.value;
		
		debugger
		
		document.getElementById('tabid').value="SaveConfigurationAccountPayment";
		document.forms[0].action = "Configuration.do";
		document.forms[0].submit(); */
		
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
		            	//General Account Setting panel options
		        		document.configurationForm.defaultPaymentMethodId.value = document.configurationForm.defaultPaymentMethodId.value;
		        		document.configurationForm.defaultCategoryId.value = document.configurationForm.defaultCategoryId.value;
		        		document.configurationForm.scheduleDays.value = document.configurationForm.scheduleDays.value;
		        		
		        		if($("#askWhatToDo").prop("checked",true))
		        		{
		        			document.configurationForm.reimbursementSettings.value = 2;
		        		}
		        		else if($("#dontAddAny").prop("checked",true))
		        		{
		        			document.configurationForm.reimbursementSettings.value = 1;
		        		}
		        		else
		        		{
		        			document.configurationForm.reimbursementSettings.value = 0;
		        		} 
		        		
		        		document.configurationForm.reimbursementSettings.value = document.configurationForm.reimbursementSettings.value;
		        		
		        		document.configurationForm.annualInterestRate.value = document.configurationForm.annualInterestRate.value;
		        		document.configurationForm.minCharge.value = document.configurationForm.minCharge.value;
		        		document.configurationForm.gracePeriod.value = document.configurationForm.gracePeriod.value; 
		        		document.configurationForm.assessFinanceCharge.value = $("#assessFinanceCharge").val();
		        		
		        		document.configurationForm.startMonth.value = document.configurationForm.startMonth.value;
		        		document.configurationForm.endMonth.value = document.configurationForm.endMonth.value;
		        		
		        		//Account Receivable panel options 
		        		document.configurationForm.arCategory.value = document.configurationForm.arCategory.value;
		        		document.configurationForm.arReceivedType.value = document.configurationForm.arReceivedType.value;
		        		document.configurationForm.arDepositTo.value = document.configurationForm.arDepositTo.value;
		        		
		        		//Po Payable panel options
		        		document.configurationForm.poCategory.value = document.configurationForm.poCategory.value;
		        		document.configurationForm.poReceivedType.value = document.configurationForm.poReceivedType.value;
		        		document.configurationForm.poDepositTo.value = document.configurationForm.poDepositTo.value;
		        		
		        		//Billing Payable panel options
		        		document.configurationForm.bpCategory.value = document.configurationForm.bpCategory.value;
		        		document.configurationForm.bpReceivedType.value = document.configurationForm.bpReceivedType.value;
		        		document.configurationForm.bpDepositTo.value = document.configurationForm.bpDepositTo.value;
		        		
		        		//Billing options
		        		var selectedBillingType = $.trim($("#selectedBillingTypeId option:selected").text());
	        			//var printBill = $("#printBills").val();
	        			//var mailCustomer = $("#mailToCustomer").val();
	        			//var combinedBilling = $("#showCombinedBilling").val();
	            	
	            		document.configurationForm.startingBillNumber.value = document.configurationForm.startingBillNumber.value;
	        			document.configurationForm.showCombinedBilling.value = document.configurationForm.showCombinedBilling.value;
	        			document.configurationForm.showBillingStatStyle.value =  document.configurationForm.showBillingStatStyle.value;
	        		
	        			document.configurationForm.mailToCustomer.value = document.configurationForm.mailToCustomer.value;
	        			document.configurationForm.printBills.value = document.configurationForm.printBills.value;
	        		
	        			//document.getElementById('printBillsValue').value= printBill;
	        			//document.getElementById("mailToCust").value = mailCustomer;
	        			//document.getElementById("showCmbBilling").value = combinedBilling;
		        		
		        		//document.getElementById('tabid').value="SaveConfigurationAccountPayment";
		        		document.forms['accountPaymentfrm'].action = "Configuration.do?tabid=SaveConfigurationAccountPayment";
		        		document.forms['accountPaymentfrm'].submit(); 
		            	
						$('form').submit();
		            },
		            "<bean:message key='BzComposer.global.cancel'/>": function () {
		                $(this).dialog("close");
		                return false;
		            }
		        }
		    });
		    return false;
	//}
}
</script>
</html>
<!-- Dialog box used in this page -->
<div id="showsaverecorddialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.saveconfirm"/></p>
</div>