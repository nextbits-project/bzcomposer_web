<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.customerinvoicetitle" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
<%-- <script src="<bean:write name="path" property="pathvalue"/>/dist/js/jquery.min.js"></script>  --%>
<%-- <script src="<bean:write name="path" property="pathvalue"/>/dist/js/bootstrap.min.js"></script> --%>
</head>
<head>
<jsp:include page="/configuration/customerInvoiceFunctionPage.jsp"></jsp:include>
<%-- <%@include file ="/configuration/customerInvoiceFunctionPage.jsp" %> --%>

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
$(document).ready(function()
		{
			$("#refundReasonSel option").each(function() 
			{
				if ($(this).val() == 1) 
				{
		            $(this).css("color", 'Blue');
				}
				else
				{

				}
		    });
			
			var groupId = '<%= request.getAttribute("groupId")%>';
			var countryId = '<%= request.getAttribute("countryId")%>';
			var stateId = '<%= request.getAttribute("stateId")%>';
			var shippingFeeMethodId = '<%= request.getAttribute("shippingMethodId")%>'; 
			var termId = '<%= request.getAttribute("termId")%>';
			var salesRepId = '<%= request.getAttribute("salesRepId")%>';
			var payMethodId = '<%= request.getAttribute("payMethodId")%>';
			
			var InvoiceFootnoteID =  '<%= request.getAttribute("InvoiceFootnoteID")%>';
			debugger;
			var selectedInvoiceStyleId =<%= request.getAttribute("selectedInvoiceStyleId")%>;
			$('select[id="selectedInvoiceStyleId"]').find('option[value="'+selectedInvoiceStyleId+'"]').attr("selected",true);
			var DefaultPaymentMethodId = '<%= request.getAttribute("DefaultPaymentMethodId")%>';
			//Added on 01-05-2020
			debugger
			var sortId = '<%= request.getAttribute("sortById")%>';
			debugger
			$('select[id="sortBy"]').find('option[value="'+sortId+'"]').attr("selected",true);
			debugger
			//$("#description").val("");
			
			var packingSlipStyleId = '<%= request.getAttribute("packingSlipStyleId")%>';
			
			var isChecked = '<%= request.getAttribute("isRefundAllowed")%>';

		    if(isChecked == "on")
		    {
				

		      	$("#isRefundAllowed").attr('checked', true);
		      	 
				$("#refundReason").prop('readonly', false);
		        $("#refundReasonSel").prop('readonly',false);
		        $("#addRefundReason").prop('disabled',false);
		        $("#updateRefundReason").prop('disabled',false);
		        $("#deleteRefundReason").prop('disabled',false);
		        $("#defaultReason").prop('disabled',false);
			} 
			else if(isChecked == "off")
		    {

		        $("#refundReason").prop('readonly', true);
				$("#refundReasonSel").prop('readonly',true);
			    $("#addRefundReason").prop('disabled',true);
			    $("#updateRefundReason").prop('disabled',true);
			    $("#deleteRefundReason").prop('disabled',true);
			    $("#defaultReason").prop('disabled',true);
		    }
			else
			{
				$("#refundReason").prop('readonly', isChecked);
		        $("#refundReasonSel").prop('readonly',isChecked);
		        $("#addRefundReason").prop('disabled',isChecked);
		        $("#updateRefundReason").prop('disabled',isChecked);
		        $("#deleteRefundReason").prop('disabled',isChecked);
		        $("#defaultReason").prop('disabled',isChecked);
			}
			
			if(countryId==2)
			{
				$('#customerState').prop('disabled', false);	
			}
			else
			{
				$('#customerState').prop('disabled', true);
			}
			$('select[id="customerGroup"]').find('option[value="'+groupId+'"]').attr("selected",true);
			$('select[id="customerCountry"]').find('option[value="'+countryId+'"]').attr("selected",true);
			$('select[id="customerState"]').find('option[value="'+stateId+'"]').attr("selected",true);
			
			$('select[id="customerShippingId"]').find('option[value="'+shippingFeeMethodId+'"]').attr("selected",true);
			$('select[id="selectedTermId"]').find('option[value="'+termId+'"]').attr("selected",true);
			$('select[id="customerSalesRep"]').find('option[value="'+salesRepId+'"]').attr("selected",true);
			$('select[id="selectedPaymentId"]').find('option[value="'+payMethodId+'"]').attr("selected",true);
			
			$('select[id="packingSlipTemplateId"]').find('option[value="'+packingSlipStyleId+'"]').attr("selected",true);
			
			$('select[id="selectedMessageId"]').find('option[value="'+InvoiceFootnoteID+'"]').attr("selected",true);
			$('select[id="selectedBankAccountId"]').find('option[value="'+DefaultPaymentMethodId+'"]').attr("selected",true);
			
			$("#isDefaultCreditTerm").change(function()
			{
		    	var isChecked = '<%= request.getAttribute("isDefault")%>';
		    	//var isChecked = "on";
		        if($(this).prop("checked") == true){

		            $("#isDefaultCreditTerm").attr('checked', true);
		            
		            isChecked = "on"; 
		        }
		        else if($(this).prop("checked") == false){

		            $("#isDefaultCreditTerm").attr('checked', false);
		            
		             isChecked = "off";
		        }	
		        else{
		        	$("#isDefaultCreditTerm").attr('checked', isChecked);
		        }	
		    	document.configurationForm.isDefaultCreditTerm.value = isChecked;
		    	$("#isDefaultCreditTerm").val(isChecked);
		    });
			
			$("#custTaxable").change(function()
			{
		    	var isChecked = '<%= request.getAttribute("custTaxableStatus")%>';
		        if($(this).prop("checked") == true){

		            $("#custTaxable").attr('checked', true);
		            isChecked = "on"; 
		        }
		        else if($(this).prop("checked") == false){

		            $("#custTaxable").attr('checked', false);
		             isChecked = "off";
		        }	
		        else{
		        	$("#custTaxable").attr('checked', isChecked);
		        	document.configurationForm.custTaxable.value = isChecked;
		        }	
		    	$("#custTaxable").val(isChecked);
		    });
			
			$("#addressSettings").change(function()
			{
		    	var isChecked = '<%= request.getAttribute("addressStatus")%>';
		        if($(this).prop("checked") == true)
		        {
		            $("#addressSettings").attr('checked', true);
		            isChecked = "on"; 
		        }
		        else if($(this).prop("checked") == false)
		        {
		            $("#addressSettings").attr('checked', false);
		            isChecked = "off";
		        }	
		        else{
		        	$("#custTaxable").attr('checked', isChecked);
		        	document.configurationForm.addressSettings.value = isChecked;
		        }	
		    	$("#addressSettings").val(isChecked);
		    });
			$("#isSalesOrder").change(function()
			{
		    	var isChecked = '<%= request.getAttribute("salesOrderStatus")%>';
		        if($(this).prop("checked") == true){
		            $("#isSalesOrder").attr('checked', true);
		            isChecked = "on"; 
		        }
		        else if($(this).prop("checked") == false){
		            $("#isSalesOrder").attr('checked', false);
		            isChecked = "off";
		        }	
		        else
		        {
		            $("#isSalesOrder").attr('checked', isChecked);
		        	document.configurationForm.isSalesOrder.value = isChecked;
		        }	
		    	$("#isSalesOrder").val(isChecked);
		    });
			
			
			/*for Sales&Invocie panel*/
			$("#saleShowCountry").change(function()
			{
		    	var isChecked = '<%=request.getAttribute("showCountry")%>';
		        if($(this).prop("checked") == true){
		            $("#saleShowCountry").attr('checked', true);
		            isChecked = "on"; 
		        }
		        else if($(this).prop("checked") == false){
		            $("#saleShowCountry").attr('checked', false);
					isChecked = "off";
		        }	
		        else
		        {
		            $("#isSalesOrder").attr('checked', isChecked);
		        	document.configurationForm.saleShowCountry.value = isChecked;
		        }	
		    	$("#saleShowCountry").val(isChecked);
		    });
			
			$("#ratePriceChangable").change(function()
			{
		    	var isChecked = '<%=request.getAttribute("ratePrice")%>';
		        if($(this).prop("checked") == true){
		            $("#ratePriceChangable").attr('checked', true);
		            isChecked = "on"; 
		        }
		        else if($(this).prop("checked") == false){
		            $("#ratePriceChangable").attr('checked', false);
		             isChecked = "off";
		        }	
		        else
		        {
		            $("#ratePriceChangable").attr('checked', isChecked);
		        	document.configurationForm.ratePriceChangable.value = isChecked;
		        }	
		    	$("#ratePriceChangable").val(isChecked);
		    });
			
			$("#saleShowTelephone").change(function()
			{
		    	var isChecked = '<%= request.getAttribute("salesShowTelephone")%>';
		        if($(this).prop("checked") == true){
		            $("#saleShowTelephone").attr('checked', true);
		            isChecked = "on"; 
		        }
		        else if($(this).prop("checked") == false){
		            $("#saleShowTelephone").attr('checked', false);
		            isChecked = "off";
		        }	
		        else
		        {
		            $("#saleShowTelephone").attr('checked', isChecked);
		        	document.configurationForm.saleShowTelephone.value = isChecked;
		        }	
		    	$("#saleShowTelephone").val(isChecked);
		    });
			
			$("#isSalePrefix").change(function()
			{
		    	var isChecked = '<%= request.getAttribute("isSalePrefix")%>';
		        if($(this).prop("checked") == true){
		            $("#isSalePrefix").attr('checked', true);
		            isChecked = "on"; 
		        }
		        else if($(this).prop("checked") == false){
		            $("#isSalePrefix").attr('checked', false);
		            isChecked = "off";
		        }	
		        else
		        {
		            $("#isSalePrefix").attr('checked', isChecked);
		        	document.configurationForm.isSalePrefix.value = isChecked;
		        }	
		    	$("#isSalePrefix").val(isChecked);
		    });
			
			$("#extraChargeApplicable").change(function()
			{
		    	var isChecked = '<%= request.getAttribute("extraCharge")%>';
		        if($(this).prop("checked") == true){
		            $("#extraChargeApplicable").attr('checked', true);
		            isChecked = "on"; 
		        }
		        else if($(this).prop("checked") == false){
		            $("#extraChargeApplicable").attr('checked', false);
		             isChecked = "off";
		        }	
		        else
		        {
		            $("#extraChargeApplicable").attr('checked', isChecked);
		        	document.configurationForm.extraChargeApplicable.value = isChecked;
		        }	
		    	$("#extraChargeApplicable").val(isChecked);
		    }); 
			
			$("#recurringServiceBill").change(function()
			{
				var isChecked = "on";
				if($(this).prop("checked") == true){
		            $("#recurringServiceBill").attr('checked', true);
		            isChecked = "on"; 
		        }
		        else if($(this).prop("checked") == false){
		            $("#recurringServiceBill").attr('checked', false);
		             isChecked = "off";
		        }	
		        else
		        {
		            $("#recurringServiceBill").attr('checked', isChecked);
		        	document.configurationForm.recurringServiceBill.value = isChecked;
		        }	
		    	$("#recurringServiceBill").val(isChecked);
			});
			
			$("#invoiceLocation").change(function(){
				var filePath = $("#invoiceLocation").val();

				$("invoiceLocation").val(filePath);
				//document.configurationForm.invoiceLocation.value = filePath;
				//debugger
			});
			
			$("#saveImage").change(function(){
				var filePath = $("#saveImage").val();

				$("saveImage").val(filePath);
				//document.configurationForm.invoiceLocation.value = filePath;
				//debugger
			});
			
			/* $("#form").submit(function(){
				debugger
				var form = $('form')[0]; // You need to use standard javascript object here
				debugger
				var formData = new FormData(form);
				formData.append('image', $('input[type=file]')[0].files[0]);
				$.ajax({
				    url: 'Configuration.do?tabid=SaveCustomerInvocieSettings',
				    data: formData,
				    type: 'POST',
				    contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
				    processData: false, // NEEDED, DON'T OMIT THIS
				    // ... Other options like success and etc
				});
			}); */
			<%-- Commented on 05-05-2019 due to this error:
			The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit --%>
			
			 $("#isRefundAllowed").change(function () 
			{
		      	
		      	<%-- var isChecked = '<%= request.getAttribute("isRefundAllowed")%>'; --%>
		      	var checked = "on";
		        if($(this).prop("checked") == true)
		        {

		          	$("#isRefundAllowed").attr('checked', true);
		          	 
					$("#refundReason").prop('readonly', false);
		            $("#refundReasonSel").prop('readonly',false);
		            $("#addRefundReason").prop('disabled',false);
		            $("#updateRefundReason").prop('disabled',false);
		            $("#deleteRefundReason").prop('disabled',false);
		            $("#defaultReason").prop('disabled',false);
		              
		            document.configurationForm.isRefundAllowed.value = "on"; 
				} 
				else if($(this).prop("checked") == false)
		        {

		            $("#refundReason").prop('readonly', true);
					$("#refundReasonSel").prop('readonly',true);
				    $("#addRefundReason").prop('disabled',true);
				    $("#updateRefundReason").prop('disabled',true);
				    $("#deleteRefundReason").prop('disabled',true);
				    $("#defaultReason").prop('disabled',true);
		              
		            document.configurationForm.isRefundAllowed.value = "off";
				}
		      }); 
			/* $("#form").submit(function( event ) 
			{
				var text = $('#description').val();
				var setup = $("#setupID option:selected").val();
				if(text == "" || text == " ")
				{
					alert("Necessary data is empty");
				}
				else
				{
					if(setup == "Location")
					{
						debugger
						alert(text);
						$.ajax({
							type: "POST",
			   				url:"Configuration.do?tabid=addDescription&Description="+text,
			               	data:  { location : text }
			           		}).done(function(data){
			           		debugger
			               	//$("#state").html(data);
			           		$(document).find('div#locationDiv table').replaceWith($(data).find('div#locationDiv').html());
			           		//$('select[id="phonecode"]').find('option[id="'+selectedCountry+'"]').attr("selected",true);
			           	});
						
						/* document.getElementById('Description').value = text;
						document.getElementById('tabid').value="addDescription";
						document.forms[0].action = "Configuration.do";
						document.forms[0].submit();
						debugger */
					/*}	
				}
			}); */
			
			/* Added on 04-05-2020 */
		 	var accountID = '<%= request.getAttribute("accountId")%>';
			/* $('select[id="selectedBankAccountId"]').find('option[value="'+accountID+'"]').attr("selected",true); */
			$("#reason").val("");
			$("#parentReasonId option").prop("selected",false);
			$("#availableReasons option").prop("selected",false);
			
		});  

</script>
</head>
<!-- <body onload="init1();"> -->
<body onload="init();">
<!-- begin shared/header -->
<%-- <html:form action="Configuration.do?" enctype="multipart/form-data" method="post" styleId="form"> --%>
<html:form action="Configuration.do" method="post" styleId="form">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
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
						<input type="hidden" id='<bean:write name="index" />lid' name='<bean:write name="index" />lidname' value='<bean:write name="lbl" property="value" />' />
						<input type="hidden" id='<bean:write name="index" />lname' name='<bean:write name="index" />lnm' value='<bean:write name="lbl" property="label" />' />
					</logic:iterate>
			</logic:present>
		</div>
		<div id="table-negotiations" style="padding: 0; border: 1px solid #ccc;">
			<table cellspacing="0"  style="border: 0;width: 100%;overflow-y:scroll;" class="section-border">
			<span style="font-size:30px;cursor:pointer; margin-left: 20px;" onclick="toggleFunction()">&#9776;</span>
				<tr>
					<td  id="leftMenu" style="position: relative; width: 180px;">
						<table>
							<tr>
								<td>
									<%-- <%@include file="testMenu1.jsp" %> --%>
									<%@include file="menuPage.jsp" %>
									<%-- <jsp:include page="menuPage.jsp"></jsp:include> --%>
								<%--<div id="table-negotiations" style="width: 185px;height:800px;padding-left: 10px;overflow-y:auto;max-height: 1200px;">
										<%@include file="testMenu1.jsp" %>
									</div> --%>
								</td>
							</tr>
							<%-- <tr align="center">
								<td>
									<input type="button" name="Revoke" class="formButton" onclick="RevokeValues();" value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
									<input type="button" name="Save" class="formButton" onclick="SaveValues();" value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
								</td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr> --%>
						</table>
					</td>
					<td valign="top">
						<!-- customerInvoice Starts -->
						<div id="customerInvoice"  style="display:none;padding: 0; position: relative; left: 0;" >
							<div id="tabs" style="height:auto;">
  								<ul>
    								<li style="font-size:12px;"><a href="#Customer"><bean:message key="BzComposer.configuration.tab.customer" /></a></li>
    								<li style="font-size:12px;"><a href="#estimation"><bean:message key="BzComposer.sales.Estimation"/></a></li>
    								<li style="font-size:12px;"><a href="#Sales&Invoice"><bean:message key="BzComposer.configuration.tab.salesinvoice" /></a></li>
    								<li style="font-size:12px;"><a href="#SalesOption"><bean:message key="BzComposer.configuration.tab.salesoption" /></a></li>
    								<li style="font-size:12px;"><a href="#RefundSettings"><bean:message key="BzComposer.configuration.tab.refundsetting" /></a></li>
    								<li style="font-size:12px;"><a href="#InvoiceSaveOption"><bean:message key="BzComposer.configuration.tab.invoicesaveoption" /></a></li>
    								<li style="font-size:12px;"><a href="#Customer&Job"><bean:message key="BzComposer.configuration.tab.customerjob" /></a></li>
    								<li style="font-size:12px;"><a href="#Rma"><bean:message key="BzComposer.RMA"/></a></li>
  								</ul>
  								<div id="Customer">
									<div id="content1" class="tabPage">
   						 				<table class="table-notifications" width="100%">
											<tr>
												<th colspan="5" align="left" style="font-size:12px; padding: 5px;">
													<bean:message key="BzComposer.configuration.tab.customer" />
												</th>
											</tr>
											<tr>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.customerlistsortby" />:
												</td>
												<td style="font-size:12px;">
													<html:select property="sortBy" styleId="sortBy">
														<html:option value="0"><bean:message key="BzComposer.configuration.companyname"/></html:option>
														<html:option value="1"><bean:message key="BzComposer.global.lastname"/></html:option>
														<%-- <html:option value="0"><bean:message key="BzComposer.configuration.select"/></html:option> --%>
													</html:select>
												</td>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.customerGroup"/>:
												</td>
												<td style="font-size:12px;">
													<html:select property="customerGroup" styleId="customerGroup">
														<logic:present name="configurationForm" property="listOfExistingCustomerGroup"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCustomerGroup" scope="session">
																<option value="<bean:write name='objList1' property='customerGroup' />">
																	<bean:write name="objList1" property="groupName" />
																</option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
												<td style="font-size:12px;">
													<%-- <html:file property="saveImage" styleId="saveImage" accept="image/*"></html:file> --%>
												</td>
											</tr>
											<tr>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.defaultCustomerCountry"/>
												</td>
												<td id="country" style="font-size:12px;">
													<html:select property="custDefaultCountryID" styleId="customerCountry" onchange="disable()">
														<logic:present name="configurationForm" property="listOfExistingCountry"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCountry" scope="session">
																<option value="<bean:write name='objList1' property='countryId' />"><bean:write name="objList1" property="countryName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.defaultCustomerState"/>:
												</td>
												<td id="state" style="font-size:12px;">
													<html:select property="selectedStateId" styleId="customerState">
														<logic:present name="configurationForm" property="listOfExistingState"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingState" scope="session">
																<option value="<bean:write name='objList1' property='selectedStateId' />"><bean:write name="objList1" property="stateName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="font-size:12px;">
													<%-- <html:checkbox property="taxable"> --%>
													<html:checkbox property="custTaxable" styleId="custTaxable">
														<bean:message key="BzComposer.configuration.allCustomerAreTaxable"/>
													</html:checkbox>
												</td>
												<td align="center" style="font-size:12px;">
													<bean:message key="BzComposer.configuration.province"/>:
												</td>
												<td style="font-size:12px;">
													<html:text property="customerProvince"></html:text>
												</td>
											</tr>
											<tr>
												<th colspan="5" align="left" style="font-size:12px; padding: 5px;">
													<bean:message key="BzComposer.configuration.customerprefrence"/>
												</th>
											</tr>
											<tr>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.shipping"/> :
												</td>
												<td style="font-size:12px;">
													<html:select property="customerShippingId" styleId="customerShippingId">
														<!-- <option value="0"></option> -->
														<logic:present name="configurationForm" property="listOfExistingShipping"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingShipping" scope="session">
																<option value="<bean:write name='objList1' property='selectedShippingId' />"><bean:write name="objList1" property="shippingName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.term"/> :
												</td>
												<td style="font-size:12px;">
									  				<html:select property="selectedTermId" styleId="selectedTermId">
														<!-- <option value="0"></option>	 -->
														<logic:present name="configurationForm" property="listOfExistingTerm"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingTerm" scope="session">
																<option value="<bean:write name='objList1' property='selectedTermId' />"><bean:write name="objList1" property="termName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>  
												</td>
											</tr>
											<tr>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.rep"/> :
												</td>
												<td style="font-size:12px;">
													<html:select property="selectedSalesRepId" styleId="selectedSalesRepId">
														<!-- <option value="0"></option> -->
														<logic:present name="configurationForm" property="listOfExistingSalesRep"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingSalesRep" scope="session">
																<option value="<bean:write name='objList1' property='selectedSalesRepId' />"><bean:write name="objList1" property="salesRepName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.paymethod"/> :
												</td>
												<td style="font-size:12px;">
													<html:select property="selectedPaymentId" styleId="selectedPaymentId">
														<logic:present name="configurationForm" property="listOfExistingPayment"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPayment" scope="session">
																<option value="<bean:write name='objList1' property='paymentId' />"><bean:write name="objList1" property="paymentName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
											</tr>
											<tr>
												<th colspan="5" align="left" style="font-size:12px; padding: 5px;">
													<bean:message key="BzComposer.configuration.addresssettings"/>
												</th>
											</tr>
											<tr>
												<td colspan="5" style="font-size:12px;">
													<html:checkbox property="addressSettings" styleId="addressSettings">
														<bean:message key="BzComposer.configuration.addresssettingstext"/>
													</html:checkbox>
												</td>
											</tr>
											<tr>
												<th colspan="5" align="left" style="font-size:12px; padding: 5px;">
													<bean:message key="BzComposer.configuration.salesorderpreference"/>
												</th>
											</tr>
											<tr>
												<td colspan="5" style="font-size:12px;">
													<html:checkbox property="isSalesOrder" styleId="isSalesOrder"></html:checkbox>
													<bean:message key="BzComposer.configuration.usesalesorder"/>
												</td>
											</tr>
										</table> 
 									</div>
								</div>	
								
								<!-- estimation Starts -->
								<div id="estimation">
									<table class="table-notifications">
										<tr>
											<th align="left" colspan="2" style="font-size:12px; padding: 5px;">
												<bean:message key="BzComposer.configuration.estimationpreference"/>
											</th>
										</tr>
										<tr>
											<td style="font-size:12px;">
												<bean:message key="BzComposer.configuration.startingestimationnumber"/>:
											</td>
											<td style="font-size:12px;">
												<html:text property="startingEstimationNumber"></html:text>
											</td>
										</tr>
									</table>
								</div>
								<!-- estimation Ends -->
								<div id="Sales&Invoice">
									<div id="content1" class="tabPage">
   										<table class="table-notifications" width="100%">
											<tr>
												<th colspan="4" align="left" style="font-size:12px; padding: 5px;">
													<bean:message key="BzComposer.configuration.invoicesalespreference" />
												</th>
											</tr>
											<tr>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.startinvoicenumber"/> :
												</td>
												<td style="font-size:12px;">
													<html:text property="startInvoiceNo" readonly="true" styleId="startInvoiceNo"></html:text>
												</td>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.defaultpackingslipstyle"/> :
												</td>
												<td style="font-size:12px;">
													<html:select property="packingSlipTemplateId" styleId="packingSlipTemplateId">
														<logic:present name="configurationForm" property="listOfExistingPackingSlipTemplate"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingPackingSlipTemplate" scope="session">
																<option value="<bean:write name='objList1' property='packingSlipTemplateId' />"><bean:write name="objList1" property="packingSlipTemplateName" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
											</tr>
											<tr>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.invoicestyle"/> :
												</td>
												<td style="font-size:12px;">
													<html:select property="selectedInvoiceStyleId" styleId="selectedInvoiceStyleId">
														<logic:present name="configurationForm" property="listOfExistingInvoiceStyle"> 
															<logic:iterate name="configurationForm" id="objList1" property="listOfExistingInvoiceStyle" scope="session">
																<option value="<bean:write name='objList1' property='selectedInvoiceStyleId' />"><bean:write name="objList1" property="invoiceStyle" /></option>
															</logic:iterate>
														</logic:present> 
													</html:select>
												</td>
												<td style="font-size:12px;">
													<bean:message key="Bizcomposer.PoNumPrefix"/>
												</td>
												<td style="font-size:12px;">
													<html:text property="poNumPrefix" styleId="poNumPrefix"></html:text>
												</td>
											</tr>
											<tr>
												<td style="font-size:12px;">
													<bean:message key="BzComposer.configuration.defaultfootnote"/> :
												</td>
												<td style="font-size:12px;">
													<html:select property="selectedMessageId" styleId="selectedMessageId">
														<logic:present name="configurationForm" property="messages"> 
															<logic:iterate name="configurationForm" id="objList1" property="messages" scope="session">
																<option value="<bean:write name='objList1' property='selectedMessageId' />">
																	<bean:write name="objList1" property="messageName" />
																</option>
															</logic:iterate>
														</logic:present>
													</html:select>
												</td>
											</tr>
											<tr>
											<td style="font-size:12px;">
												<html:checkbox property="saleShowCountry" styleId="saleShowCountry">
													<bean:message key="BzComposer.configuration.showcountrynameoninvoice"/>
												</html:checkbox>
											</td>
											<td style="font-size:12px;">
												<html:checkbox property="ratePriceChangable" styleId="ratePriceChangable">				
													<bean:message key="BzComposer.configuration.ratepricechangable"/>
												</html:checkbox> 
											</td> 
										</tr>
										<tr>
											<td style="font-size:12px;">
												<html:checkbox property="saleShowTelephone" styleId="saleShowTelephone">
													<bean:message key="BzComposer.configuration.showtelephonefaxoninvoice"/>
												</html:checkbox>
											</td>
											<td style="font-size:12px;">
												<html:checkbox property="isSalePrefix" styleId="isSalePrefix">			
													<bean:message key="BzComposer.configuration.useprefix"/>
												</html:checkbox>  
											</td>
										</tr>
										<tr>
											<td style="font-size:12px;">
												<bean:message key="BzComposer.configuration.taxcode"/> :
											</td>
											<td style="font-size:12px;">
												<html:text property="salesTaxCode" styleId="salesTaxCode">		
												</html:text>
											</td>
										</tr>
										<tr>
											<td style="font-size:12px;">
												<bean:message key="BzComposer.configuration.taxrate"/> :
											</td>
											<td style="font-size:12px;">
												<html:text property="saleTaxRate" styleId="saleTaxRate"></html:text> 
											</td>
										</tr>
							<tr>
								<td style="font-size:12px;">
									<bean:message key="BzComposer.configuration.howoftenyoupaysalestax"/> :
								</td>
								<td style="font-size:12px;">
									<html:radio property="howOftenSalestax" value="1" styleId="monthlySalesTax">
										<bean:message key="BzComposer.configuration.monthly"/>
									</html:radio> 
									&nbsp;
									<html:radio property="howOftenSalestax" value="2" styleId="quartely">
										<bean:message key="BzComposer.configuration.quarterly"/>
									</html:radio>
									&nbsp;
									<html:radio property="howOftenSalestax" value="3" styleId="annually">
										<bean:message key="BzComposer.configuration.annually"/>
									</html:radio> 
								</td>
							</tr>
							<tr>
								<th colspan="4" align="left" style="font-size:12px; padding: 5px;"><bean:message key="BzComposer.configuration.dropshippingcharge" /></th>
							</tr>
							<tr>
								<td style="font-size:12px;">
									<bean:message key="BzComposer.configuration.dropshippingcharge"/> :
								</td>
								<td style="font-size:12px;">
									<html:text property="dropShipCharge" styleId="dropShipCharge"></html:text>		
								</td>
							</tr>
							<tr>
								<td style="font-size:12px;">
									<html:radio property="isShowDropShipItems" value="0">			
										<bean:message key="BzComposer.configuration.showallitems"/>
									</html:radio> 
								</td>
							</tr>
							<tr>
								<td colspan="2" align="left" style="font-size:12px;">
									<html:radio property="isShowDropShipItems" value="1">
										<bean:message key="BzComposer.configuration.showdropshipitemsonly"/>
									</html:radio>
								</td>
							</tr>
							<tr>
								<th colspan="4" align="left" style="font-size:12px; padding: 5px;"><bean:message key="BzComposer.configuration.extrachargeforinvoice" /></th>
							</tr>
							<tr>
								<td style="font-size:12px;">
									<html:checkbox property="extraChargeApplicable">
										<bean:message key="BzComposer.configuration.isextrachargeppplicable"/>
									</html:checkbox>
								</td>
							</tr>
							<tr>
								<td style="font-size:12px;">
									<bean:message key="BzComposer.configuration.chargeextra"/> :
								</td>
								<td style="font-size:12px;">
									<html:text property="chargeAmount">
									</html:text>
								</td>
								<td style="font-size:12px;">
									<bean:message key="BzComposer.configuration.iftotalorderislessthan"/> :
								</td>
								<td style="font-size:12px;">
									<html:text property="orderAmount">
									</html:text>
								</td>
							</tr>
							<tr>
								<td style="font-size:12px;">
									<input type="checkbox" name="backOrderNeeded">
										<bean:message key="BzComposer.configuration.backorderconfirmationneeded"/>
								</td>
							</tr> 
							
						</table> 
 					</div>
				</div>
								<div id="SalesOption">
					<div id="content1" class="tabPage">
   						 <table class="table-notifications" width="100%">
							<tr>
								<th colspan="4" align="left" style="font-size:12px; padding: 5px;"><bean:message key="BzComposer.configuration.tab.salesoption" /></th>
							</tr>
							<tr>
								<td style="width:100px;font-size: 12px;">
									<b><bean:message key="BzComposer.configuration.setup"/></b>
								</td>
								<td style="font-size:12px;">
									<select id="setupID" onchange="showSetupID()">
										<option value="Location"><bean:message key="BzComposer.configuration.location"/></option>
										<option value="Message"><bean:message key="BzComposer.configuration.message"/></option>
										<option value="REP"><bean:message key="BzComposer.configuration.rep"/></option>
										<option value="Terms"><bean:message key="BzComposer.configuration.terms"/></option>
										<option value="SalesTax"><bean:message key="BzComposer.configuration.salestax"/></option>
										<option value="creditTerm"><bean:message key="BzComposer.configuration.lineofcreditterm"/></option>
									</select>
								</td>
								<td rowspan="2" align="center">
									<button type="submit" class="formButton" id="AddDecription" name="AddDescription" onclick="AddDescription1()" style="width:60px;font-size: 1em;">
										<bean:message key="BzComposer.global.add"/>
									</button>
									<br><br>
									<button type="submit" class="formButton" id="Delete" name="Delete" onclick="deleteDescription()" style="width:60px;font-size: 1em;">
										<bean:message key="BzComposer.global.delete"/>
									</button>
									<br><br>
									<button type="submit" class="formButton" id="Update" name="Update" onclick="updateDescription()" style="width:60px;font-size: 1em;">
										<bean:message key="BzComposer.global.update"/>
									</button>
									<br><br>
									<button type="button" class="formButton" id="Clear" name="Clear" onclick="clearDescription()" style="width:60px;font-size: 1em;">
										<bean:message key="BzComposer.global.clear"/>
									</button>
								</td>
								<td style="height:2px;">
									<b><bean:message key="BzComposer.configuration.description"/> :</b>
									<br>
									<html:text property="description" styleId="description" style="font-size:1em;"></html:text>
									<!-- <input type="text" id="description" name="description" style="font-size:1em;"> --> 
								</td>
							</tr>
							<tr>
								<td></td>
								<td style="width:100px;font-size:12px;">
									<div id="locationDiv">
									<table><tr><td>
									<select id="location" name="location" style="display:block; width: 200px; height: 200px;" multiple="multiple">
										<logic:present name="configurationForm" property="listOfExistingLocation"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingLocation" scope="session">
												<option value="<bean:write name='objList1' property='selectedLocationId' />" onclick="setDescription()"><bean:write name="objList1" property="locationName" /></option>
											</logic:iterate>
										</logic:present> 
									</select>
									</td></tr>
									</table>
									</div>
									<select id="message" name="message" style="display:none; width: 200px; height: 200px;" multiple="multiple">
										<logic:present name="configurationForm" property="messages"> 
											<logic:iterate name="configurationForm" id="objList1" property="messages" scope="session">
												<option value="<bean:write name='objList1' property='selectedMessageId' />" onclick="setDescription1()"><bean:write name="objList1" property="messageName" /></option>
											</logic:iterate>
										</logic:present> 
									</select>
									<select id="rep" name="rep" style="display:none; width: 200px; height: 200px;" multiple="multiple">
										<logic:present name="configurationForm" property="listOfExistingSalesRep"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingSalesRep" scope="session">
												<option value="<bean:write name='objList1' property='selectedSalesRepId' />" onclick="setDescription2()"><bean:write name="objList1" property="salesRepName" /></option>
											</logic:iterate>
										</logic:present> 
									</select>
									<select id="terms" name="terms" style="display:none; width: 200px; height: 200px;" multiple="multiple">
									<logic:present name="configurationForm" property="listOfExistingTerm"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingTerm" scope="session">
												<option id="<bean:write name='objList1' property='selectedTermId' />" onclick="setDescription3()" value="<bean:write name="objList1" property="days" />"><bean:write name="objList1" property="termName" /></option>
											</logic:iterate>
										</logic:present>
									</select>
									<select id="salesTax" name="salesTax" style="display:none; width: 200px; height: 200px;" multiple="multiple">
									<logic:present name="configurationForm" property="listOfExistingSalesTax"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingSalesTax" scope="session">
												<option id="<bean:write name='objList1' property='selectedSalesTaxId' />" value="<bean:write name='objList1' property='salesTaxRate' />" onclick="setDescription4()"><bean:write name="objList1" property="salesTaxName" /></option>
											</logic:iterate>
										</logic:present>
									</select>  
									<select id="creditTerm" name="creditTerm" style="display:none; width: 200px; height: 200px;" multiple="multiple">
									<logic:present name="configurationForm" property="listOfExistingCreditTerm"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCreditTerm" scope="session">
												<option name="<bean:write name='objList1' property='isDefault' />" id="<bean:write name='objList1' property='selectedCreditTermId' />" value="<bean:write name="objList1" property="days" />" onclick="setDescription5()"><bean:write name="objList1" property="creditTermName" /></option>
											</logic:iterate>
										</logic:present>
									</select>  
								</td>
								<td>
									<div id="days" style="display:none;font-size: 12px;">
										<b><bean:message key="BzComposer.configuration.days"/><br></b>
										<input type="text" id="txtTerms" name="txtTerms">
									</div>
									<div id="tax" style="display:none;font-size: 12px;">
										<b><bean:message key="BzComposer.configuration.tax"/><br></b>
										<input type="text" id="txtTax" name="txtTax">
									</div>
									<div id="days1" style="display:none;font-size: 12px;">
										<b><bean:message key="BzComposer.configuration.days"/><br></b>
										<input type="text" id="txtDays" name="txtDays"><br><br>
										<html:checkbox property="isDefaultCreditTerm" styleId="isDefaultCreditTerm">
											<bean:message key="BzComposer.configuration.default"/>
										</html:checkbox>
									</div>
								</td>
							</tr>
						</table> 
 					</div>
				</div>	
				<div id="RefundSettings">
					<div id="content1" class="tabPage">
						<html:checkbox property="isRefundAllowed" styleId="isRefundAllowed">
							<bean:message key="BzComposer.configuration.allowrefundforsaleorder"/>
						</html:checkbox>						
						<div id="refundDiv" style="display:block;">
   						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="4" align="left" style="font-size:12px; padding: 5px;">
									<bean:message key="BzComposer.configuration.refundsetting" /></th>
							</tr>
							<tr>
								<td style="font-size:12px;">
									<b><bean:message key="BzComposer.configuration.reason" /></b><br>
									<input type="text" id="refundReason" name="refundReason"><br><br>
									<!-- <input type="button" id="addRefundReason" name="addRefundReason" value="Add">&nbsp;&nbsp; -->
									<!-- <button type="submit" id="addRefundReason" name="addRefundReason" class="formbutton" 
									style="width: 60px; font-size: 1em;" onclick="addRefundReason()">Add
									</button> -->
									<button type="submit" class="formButton" id="AddRefundReason" name="AddRefundReason" onclick="addNewRefundReason()" 
									style="width:60px;font-size: 12px;">
										<bean:message key="BzComposer.global.add"/>
									</button>
									&nbsp;&nbsp;
									<button type="submit" id="updateRefundReason" name="updateRefundReason" class="formButton" 
									style="width: 80px; font-size: 12px;" onclick="updateExistingRefundReason()">
										<bean:message key="BzComposer.global.update"/>
									</button>&nbsp;&nbsp;
									<button type="submit" id="deleteRefundReason" name="deleteRefundReason" class="formbutton" 
									style="width: 60px; font-size: 12px;" onclick="deleteSelectedRefundReason()">
										<bean:message key="BzComposer.global.delete"/>
									</button>
									<!-- <input type="button" id="updateRefundReason" name="updateRefundReason" value="Update">&nbsp;&nbsp; -->
									<!-- <input type="button" id="deleteRefundReason" name="deleteRefundReason" value="Delete"> -->
								</td>
								<td rowspan="2" align="justify" style="font-size:12px;">
									<select id="refundReasonSel" name="refundReasonSel" style="display:block; width: 200px; height: 200px;" multiple="multiple">
									<option value="Default Reason" onclick="setReason()">
										<bean:message key="BzComposer.configuration.defaultreason"/>
									</option>
									<logic:present name="configurationForm" property="listOfExistingRefundReason"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingRefundReason" scope="session">
												<option id="<bean:write name='objList1' property='selectedRefundReasonId' />" 
												onclick="setReason()" name="<bean:write name="objList1" property="refundReason" />" value="<bean:write name='objList1' property='isDefaultRefundReason'/>">
													<bean:write name="objList1" property="refundReason" />
												</option>
											</logic:iterate>
										</logic:present>
									</select>
									<br>
									<button type="submit" id="defaultReason" name="defaultReason" onclick="setDefaultReason()" class="formButton">
										<bean:message key="BzComposer.configuration.setasdefaultreasonbtn"/>
									</button>
									<br><br>
									<bean:message key="BzComposer.configuration.defaultreasonnote"/>
								</td>
							</tr>
						</table> 
						</div>  
 					</div>
				</div>	
								<div id="InvoiceSaveOption">
					<div id="content1" class="tabPage">
   						<table class="table-notifications" width="100%">
							<tr>
								<td colspan="4" align="left" style="font-size:12px; padding: 5px;"><bean:message key="BzComposer.configuration.note" /></td>
							</tr>
							<tr>
								<td style="font-size:12px;">
									<bean:message key="BzComposer.configuration.selectlocation" /> :
								</td>
								<td style="font-size:12px;">
									<%-- <html:file property="invoiceLocation" styleId="invoiceLocation"></html:file> --%>
									<!-- <input type="file" id="invoiceLocation"> -->
								</td>
							</tr>
						</table> 
 					</div>
				</div>	
								<div id="Customer&Job">
					<div id="content1" class="tabPage">
   						 <div id="refundDiv" style="display:block;">
   						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="4" align="left" style="font-size:12px; padding: 5px;">
									<bean:message key="BzComposer.configuration.tab.customerjob" />
								</th>
							</tr>
							<tr>
								<td style="font-size:1em;">
									<b><bean:message key="BzComposer.configuration.jobcategory" /></b><br>
									<input type="text" id="txtJobCategory" name="txtJobCategory"><br><br>
									<button type="submit" id="addJobCategory" name="addJobCategory" onclick="addNewJobCategory()" class="formButton">
										<bean:message key="BzComposer.global.add"/>
									</button>&nbsp;&nbsp;
									<button type="submit" id="updateJobCategory" name="updateJobCategory" onclick="updateExistingJobCategory()" class="formButton">
										<bean:message key="BzComposer.global.update"/>
									</button>&nbsp;&nbsp;
									<button type="submit" id="deleteJobCategory" name="deleteJobCategory" onclick="deleteSelectedJobCategory()" class="formButton">
										<bean:message key="BzComposer.global.delete"/>
									</button>
									<!-- <input type="button" id="addJobCategory" name="addJobCategory" value="Add">&nbsp;&nbsp; 
									<input type="button" id="updateJobCategory" name="updateJobCategory" value="Update">&nbsp;&nbsp;
									<input type="button" id="deleteJobCategory" name="deleteJobCategory" value="Delete">-->
									
								</td>
								<td rowspan="2" align="justify">
									<select id="jobCategory" name="jobCategory" style="display:block; width: 200px; height: 200px;" multiple="multiple">
									<option value="Default Category" onclick="setCategory()">
										<bean:message key="BzComposer.configuration.defaultcategory"/>
									</option>
									<logic:present name="configurationForm" property="listOfExistingJobCategory"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingJobCategory" scope="session">
												<option id="<bean:write name='objList1' property='recurringServiceBill' />" value="<bean:write name='objList1' property='jobCategoryId' />" onclick="setCategory()"><bean:write name="objList1" property="jobCategory" /></option>
											</logic:iterate>
										</logic:present>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									
								</td>
							</tr>
							<tr>
								<th colspan="4" align="left" style="font-size:12px; padding: 5px;">
									<bean:message key="BzComposer.configuration.recurringservicebilling" />
								</th>
							</tr>
							<tr>
								<td style="font-size:12px;">
									<%-- <input type="checkbox" id="recurringServiceBill" checked="checked">
										<bean:message key="Bizcomposer.useRecurringServiceBill"/> --%>
									<html:checkbox property="recurringServiceBill" styleId="recurringServiceBill">
										<bean:message key="BzComposer.configuration.userecurringservicebill"/>
									</html:checkbox>
								</td>
							</tr>
							<tr>
								<td style="font-size:12px;">
									<bean:message key="BzComposer.configuration.recurringservicebillingname"/> :
								</td>
								<td style="font-size:12px;">
									<input type="text" id="serviceBillName" name="serviceBillName" value="Recurring Service Billing" style="width:200px;">
								</td>
							</tr>
							<tr>
								<td colspan="2" style="font-size:12px;">
									<bean:message key="BzComposer.configuration.recurringservicebillingnote"/>
								</td>
							</tr>
							<tr>
								<td></td>
								<td style="font-size:12px;">
									<!-- <input type="button" id="EditInfo" name="EditInfo" value="EditInfo"> -->
									<button type="submit" id="EditInfo" name="EditInfo" onclick="EditServiceBillInfo()" class="formButton">
										<bean:message key="BzComposer.configuration.editinfobtn"/>
									</button>
								</td>
							</tr>
						</table> 
						</div>   
 					</div>
				</div>
								<div id="Rma">
									<div id="content1" class="tabPage">
 										<!-- RMA Starts -->
										<div id="tabs2" style="height:450px;">
							  					<ul>
							    					<li style="font-size: 12px; padding: 5px;"><a href="#addModifyReason">
							    						<bean:message key="BzComposer.configuration.addmodifyreason" /></a>
							   						</li>
							    					<li style="font-size: 12px; padding: 5px;"><a href="#chargeForRMAItem" style="display:none;">
							    						<bean:message key="BzComposer.configuration.chargeforrma" /></a>
							   						</li>
							  					</ul>
							  					<div id="addModifyReason">
													<table class="table-notifications" width="100%">
														<tr>
															<th colspan="2" align="left" style="font-size: 12px; padding: 5px;">
																<b><bean:message key="BzComposer.configuration.addmodifyreason" /></b>
															</th>
														</tr>
														<tr>
															<td style="font-size: 12px;">
																<bean:message key="BzComposer.configuration.addReason"/> :
															</td>
															<td style="font-size: 12px;">
																<html:text property="reason" styleId="reason"></html:text> 
															</td>
														</tr>
														<tr>
															<td style="font-size: 12px;">
																<bean:message key="BzComposer.configuration.type"/> :
															</td>
															<td style="font-size: 12px;">
																<html:select property="reasonTypeId" styleId="availableReasons">
																	<logic:present name="configurationForm" property="listOfExistingReasonType"> 
																		<logic:iterate name="configurationForm" id="objList1" property="listOfExistingReasonType" scope="session">
																			<option value="<bean:write name='objList1' property='reasonTypeId' />"><bean:write name="objList1" property="reasonType" /></option>
																		</logic:iterate>
																	</logic:present>
																</html:select>
															</td>
														</tr>
														<tr>
															<td>
																<html:select property="parentReasonId"  styleId="parentReasonId" multiple="multiple" style="height:100px;" onchange="selectReason()">
																	<logic:present name="configurationForm" property="listOfExistingMasterReasonType"> 
																		<logic:iterate name="configurationForm" id="objList1" property="listOfExistingMasterReasonType" scope="session">
																			<option name="<bean:write name='objList1' property='reason' />" id="<bean:write name="objList1" property="parentReasonId" />" value="<bean:write name='objList1' property='reasonId' />">
																				<bean:write name="objList1" property="reason" />
																			</option>
																			<option id="<bean:write name="objList1" property="reason" />" value="<bean:write name='objList1' property='parentReasonId' />" style="display: none;">
																				<bean:write name="objList1" property="reasonType" />
																			</option>
																		</logic:iterate>
																	</logic:present>
																</html:select>
															</td>
															<td style="font-size: 12px;">
																<%-- <html:button property="Save" style="width:60px;class:formButton;">Add</html:button> --%>
																<input type="Submit" class="formButton" id="Save" name="Save" 
																value="<bean:message key='BzComposer.global.save'/>" style="width:70px;font-size:1em;" onclick="addNewReason()">
																<br>
																<%-- <html:button property="Save" style="width:60px;">Update</html:button> --%>
																<input type="Submit" class="formButton" id="Update" name="Update" 
																value="<bean:message key='BzComposer.global.update'/>" style="width:70px;font-size:1em;" onclick="updateRMAReason()">
																<br>
																<%-- <html:button property="Delete" style="width:60px;">Delete</html:button> --%>
																<input type="Submit" class="formButton" id="Delete" name="Delete" 
																value="<bean:message key='BzComposer.global.delete'/>" style="width:70px;font-size:1em;" onclick="deleteReason()">
																<br>
																<%-- <html:button property="reset" style="width:60px;">Clear</html:button> --%>
																<input type="button" class="formButton" id="Clear" name="Clear" 
																value="<bean:message key='BzComposer.global.clear'/>" style="width:70px;font-size:1em;" onclick="clearValues()"> 
															</td>
														</tr>
													</table>
													<table class="table-notifications" width="100%">
														<tr>
															<th colspan="2" align="left" style="font-size: 12px; padding: 5px;">
																<b><bean:message key="BzComposer.configuration.defaultbankforaction" /></b>
															</th>
														</tr>
														<tr>
															<td style="font-size: 12px;">
																<bean:message key="BzComposer.configuration.defaultbank"/>:
															</td>
															<td style="font-size: 12px;">
																<%-- <html:select property="selectedBankAccountId" styleId="selectedBankAccountId" onchange="showSelectedAccount()">> --%>
																<html:select property="selectedBankAccountId" styleId="selectedBankAccountId">
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
															<th colspan="2" align="left" style="font-size: 12px; padding: 5px;">
																<b><bean:message key="BzComposer.configuration.chargeforrma" /></b>
															</th>
														</tr>
														<tr>
															<td style="font-size: 12px;">
																<bean:message key="BzComposer.configuration.chargeforrmaitem"/> :
															</td>
															<td>
																<%-- <html:text property=""></html:text> --%>
															</td>
														</tr>
													</table>
												</div>
											</div>
										<!-- RMA Ends -->
 									</div>
								</div>		
							</div>
						</div>
						<!-- customerInvoice Ends -->
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
		
		<input type="hidden" name="selectedBankAccountId" id="selectedBankAccountId" value="" />
		<input type="hidden" name="selectedTermId" id="selectedTermId" value="" />
		<input type="hidden" name="selectedSalesRepId" id="selectedSalesRepId" value="" />
		<input type="hidden" name="selectedPaymentId" id="selectedPaymentId" value="" />
		
		<input type="hidden" name="selectedInvoiceStyleId" id="selectedInvoiceStyleId" value=""/>
		<input type="hidden" name="sortBy" id="sortBy" value=""/>
		<input type="hidden" name="custTaxable" id="custTaxable" value=""/>
		<input type="hidden" name="addressSettings" id="addressSettngs" value=""/>
		<input type="hidden" name="isSalesOrder" id="isSalesOrder" value=""/>
		
		<input type="hidden" name="Description" id="Description" value=""/>
		<input type="hidden" name="locationID" id="locationID" value=""/>
		<input type="hidden" name="isDefault" id="isDefault" value=""/>
		<input type="hidden" name="creditTermDays" id="creditTermDays" value=""/>
		
		<input type="hidden" name="saleShowCountry" id="saleShowCountry" value=""/>
		<input type="hidden" name="ratePriceChangable" id="ratePriceChangable" value=""/>
		<input type="hidden" name="saleShowTelephone" id="saleShowTelephone" value=""/>
		<input type="hidden" name="isSalePrefix" id="isSalePrefix" value=""/>
		<input type="hidden" name="extraChargeApplicable" id="extraChargeApplicable" value=""/>
	</div>
	</div>
	<div align="center">
		<input type="submit" name="Submit" style="font-size:1em;" onclick="SaveValues()" 
		value="<bean:message key="BzComposer.global.save"/>"/>
		<input type="reset" name="Cancel" onclick="RevokeValues()" style="font-size:1em;" 
		value="<bean:message key="BzComposer.global.cancel"/>"/>
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
function AddDescription1()
{

	var text = $('#description').val();
	var setup = $("#setupID option:selected").val();
	if(text == "" || text == " ")
	{
		alert("<bean:message key='BzComposer.configuration.customerinvoice.emptydata'/>");
	}
	else
	{
		if(setup == "Location")
		{
			document.getElementById('Description').value = text;
			document.getElementById('tabid').value="addDescription";
			/* document.forms[0].action = "Configuration.do";
			document.forms[0].submit(); */
			alert(text);
			var formData = $('form').serialize();
    		$.ajax({
    			type : "POST",
    			url : "Configuration.do?tabid=addDescription",
    			data : formData,
    			success : function(data) {
    				debugger;
    				alert(text);
    				 $("#showsaverecorddialog").dialog("close"); 
    				$("#showsuccessdialog").dialog({
    						resizable: false,
    				        height: 200,
    				        width: 500,
    				        modal: true,
    				        buttons: {
    				        	"<bean:message key='BzComposer.global.ok'/>": function () {
    				        		$(this).dialog("close");
    				                return false;
    				        	},
    				            "<bean:message key='BzComposer.global.cancel'/>": function () {
    				                $(this).dialog("close");
    				                return false;
    				            }
				        	}
    				});
    			},
    			error : function(data) {
    				alert("<bean:message key='BzComposer.common.erroroccurred'/>");
    			}
    		});
		}
		else if(setup == "Message")
		{
			document.getElementById('Description').value = text;
			document.getElementById('tabid').value="addNewMessage";
			document.forms[0].action = "Configuration.do";
			document.forms[0].submit();
		}
		else if(setup == "REP")
		{
			document.getElementById('Description').value = text;
			document.getElementById('tabid').value="addNewSalesRep";
			document.forms[0].action = "Configuration.do";
			document.forms[0].submit();
		}
		else if(setup == "Terms")
		{
			var days = $("#txtTerms").val();
			document.getElementById('Description').value = text;
			document.getElementById('locationID').value = days;
			document.getElementById('tabid').value="addNewTerms";
			document.forms[0].action = "Configuration.do";
			document.forms[0].submit();
		} 
		else if(setup == "SalesTax")
		{
			var tax = $("#txtTax").val();
			document.getElementById('Description').value = text;
			document.getElementById('locationID').value = tax;
			document.getElementById('tabid').value="addNewSalesTax";
			document.forms[0].action = "Configuration.do";
			document.forms[0].submit();
		}
		else
		{
			var days = $("#txtDays").val();
			document.configurationForm.isDefaultCreditTerm.value = document.configurationForm.isDefaultCreditTerm.value;
			document.getElementById('Description').value = text;
			document.getElementById('locationID').value = days;
			document.getElementById('isDefault').value = $("#isDefaultCreditTerm").val();
			document.getElementById('tabid').value="addNewCreditTerm";
			document.forms[0].action = "Configuration.do";
			document.forms[0].submit();
		}
	}
}
function SaveValues()
{
	/* if(confirm('<bean:message key="BzComposer.configuration.saveconfirm"/>'))
	{
		//Customer Panel
		debugger
		document.configurationForm.sortBy.value = document.configurationForm.sortBy.value;
		document.configurationForm.customerGroup.value = document.configurationForm.customerGroup.value;
		document.configurationForm.custDefaultCountryID.value = document.configurationForm.custDefaultCountryID.value;
		document.configurationForm.selectedStateId.value = document.configurationForm.selectedStateId.value;
		document.configurationForm.custTaxable.value = $("#custTaxable").val();
		document.configurationForm.customerProvince.value = document.configurationForm.customerProvince.value;
		document.configurationForm.customerShippingId.value = document.configurationForm.customerShippingId.value;
		document.configurationForm.selectedTermId.value = document.configurationForm.selectedTermId.value;
		document.configurationForm.selectedSalesRepId.value = document.configurationForm.selectedSalesRepId.value;
		document.configurationForm.selectedPaymentId.value = document.configurationForm.selectedPaymentId.value;
		document.configurationForm.addressSettings.value = $("#addressSettings").val();
		document.configurationForm.isSalesOrder.value = $("#isSalesOrder").val();
		debugger
		
		document.getElementById('custTaxable').value = $("#custTaxable").val();
		document.getElementById('addressSettings').value = $("#addressSettings").val();
		document.getElementById('isSalesOrder').value = $("#isSalesOrder").val();
		
		//Sales&Invoice Panel
		document.configurationForm.startInvoiceNo.value = document.configurationForm.startInvoiceNo.value;
		document.configurationForm.packingSlipTemplateId.value = document.configurationForm.packingSlipTemplateId.value;
		document.configurationForm.selectedInvoiceStyleId.value = document.configurationForm.selectedInvoiceStyleId.value;
		document.configurationForm.poNumPrefix.value = document.configurationForm.poNumPrefix.value;
		document.configurationForm.selectedMessageId.value = document.configurationForm.selectedMessageId.value;
		document.configurationForm.saleShowCountry.value = $("#saleShowCountry").val();
		document.configurationForm.ratePriceChangable.value = $("#ratePriceChangable").val();
		document.configurationForm.saleShowTelephone.value = $("#saleShowTelephone").val();
		document.configurationForm.isSalePrefix.value = $("#isSalePrefix").val();
		document.configurationForm.salesTaxCode.value = document.configurationForm.salesTaxCode.value;
		document.configurationForm.saleTaxRate.value = document.configurationForm.saleTaxRate.value;
		document.configurationForm.howOftenSalestax.value = document.configurationForm.howOftenSalestax.value;
		document.configurationForm.dropShipCharge.value = document.configurationForm.dropShipCharge.value;
		document.configurationForm.isShowDropShipItems.value = document.configurationForm.isShowDropShipItems.value;
		document.configurationForm.extraChargeApplicable.value = $("#extraChargeApplicable").val();
		document.configurationForm.chargeAmount.value = document.configurationForm.chargeAmount.value;
		document.configurationForm.orderAmount.value = document.configurationForm.orderAmount.value;
		
		//for Refund Settings panel
		document.configurationForm.isRefundAllowed.value =  $("#isRefundAllowed").val(); 
		
		//for Invoice Save Option
		debugger
		//document.configurationForm.invoiceLocation.value = document.configurationForm.invoiceLocation.value ; 
		
		document.getElementById('saleShowCountry').value = $("#saleShowCountry").val();
		document.getElementById('ratePriceChangable').value = $("#ratePriceChangable").val();
		document.getElementById('saleShowTelephone').value = $("#saleShowTelephone").val();
		document.getElementById('isSalePrefix').value = $("#isSalePrefix").val();
		document.getElementById('extraChargeApplicable').value = $("#extraChargeApplicable").val();
		document.getElementById('creditTermDays').value = $("#isRefundAllowed").val(); 
		
		document.getElementById('tabid').value="SaveCustomerInvocieSettings";
		document.forms[0].action = "Configuration.do";
		document.forms[0].submit();
	} */
	
	event.preventDefault();
	$("#showsaverecorddialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	        	"<bean:message key='BzComposer.global.ok'/>": function () {
	            	debugger;
	            	/*Customer Panel*/
	        		debugger
	        		document.configurationForm.sortBy.value = document.configurationForm.sortBy.value;
	        		document.configurationForm.customerGroup.value = document.configurationForm.customerGroup.value;
	        		document.configurationForm.custDefaultCountryID.value = document.configurationForm.custDefaultCountryID.value;
	        		document.configurationForm.selectedStateId.value = document.configurationForm.selectedStateId.value;
	        		debugger
	        		document.configurationForm.custTaxable.value = $("#custTaxable").val();
	        		debugger
	        		document.configurationForm.customerProvince.value = document.configurationForm.customerProvince.value;
	        		document.configurationForm.customerShippingId.value = document.configurationForm.customerShippingId.value;
	        		document.configurationForm.selectedTermId.value = document.configurationForm.selectedTermId.value;
	        		document.configurationForm.selectedSalesRepId.value = document.configurationForm.selectedSalesRepId.value;
	        		document.configurationForm.selectedPaymentId.value = document.configurationForm.selectedPaymentId.value;
	        		
	        		document.configurationForm.addressSettings.value = $("#addressSettings").val();
	        		document.configurationForm.isSalesOrder.value = $("#isSalesOrder").val();
	        		
	        		debugger
	        		document.getElementById('custTaxable').value = $("#custTaxable").val();
	        		debugger
	        		document.getElementById('addressSettings').value = $("#addressSettings").val();
	        		document.getElementById('isSalesOrder').value = $("#isSalesOrder").val();
	        		
	        		/*Sales&Invoice Panel*/
	        		document.configurationForm.startInvoiceNo.value = document.configurationForm.startInvoiceNo.value;
	        		document.configurationForm.packingSlipTemplateId.value = document.configurationForm.packingSlipTemplateId.value;
	        		document.configurationForm.selectedInvoiceStyleId.value = document.configurationForm.selectedInvoiceStyleId.value;
	        		document.configurationForm.poNumPrefix.value = document.configurationForm.poNumPrefix.value;
	        		document.configurationForm.selectedMessageId.value = document.configurationForm.selectedMessageId.value;
	        		
	        		document.configurationForm.saleShowCountry.value = $("#saleShowCountry").val();
	        		document.configurationForm.ratePriceChangable.value = $("#ratePriceChangable").val();
	        		document.configurationForm.saleShowTelephone.value = $("#saleShowTelephone").val();
	        		document.configurationForm.isSalePrefix.value = $("#isSalePrefix").val();
	        		
	        		document.configurationForm.salesTaxCode.value = document.configurationForm.salesTaxCode.value;
	        		document.configurationForm.saleTaxRate.value = document.configurationForm.saleTaxRate.value;
	        		document.configurationForm.howOftenSalestax.value = document.configurationForm.howOftenSalestax.value;
	        		document.configurationForm.dropShipCharge.value = document.configurationForm.dropShipCharge.value;
	        		document.configurationForm.isShowDropShipItems.value = document.configurationForm.isShowDropShipItems.value;
	        		document.configurationForm.extraChargeApplicable.value = $("#extraChargeApplicable").val();
	        		document.configurationForm.chargeAmount.value = document.configurationForm.chargeAmount.value;
	        		document.configurationForm.orderAmount.value = document.configurationForm.orderAmount.value;
	        		
	        		/*for Refund Settings panel*/
	        		document.configurationForm.isRefundAllowed.value =  $("#isRefundAllowed").val(); 
	        		
	        		/*for Invoice Save Option*/
	        		debugger
	        		//document.configurationForm.invoiceLocation.value = document.configurationForm.invoiceLocation.value ; 
	        		
	        		document.getElementById('saleShowCountry').value = $("#saleShowCountry").val();
	        		document.getElementById('ratePriceChangable').value = $("#ratePriceChangable").val();
	        		document.getElementById('saleShowTelephone').value = $("#saleShowTelephone").val();
	        		document.getElementById('isSalePrefix').value = $("#isSalePrefix").val();
	        		document.getElementById('extraChargeApplicable').value = $("#extraChargeApplicable").val();
	        		document.getElementById('creditTermDays').value = $("#isRefundAllowed").val();
	        		
	        		//Estimation value
	        		document.configurationForm.startingEstimationNumber.value = document.configurationForm.startingEstimationNumber.value;
	        		
	        		/* document.getElementById('tabid').value="SaveCustomerInvoiceSettings";
	        		document.forms["form"].action = "Configuration.do";
	        		document.forms["form"].submit(); */
	        		
	        		var formData = $('form').serialize();
	        		
	        		$.ajax({
	        			type : "POST",
	        			url : "Configuration.do?tabid=SaveCustomerInvoiceSettings",
	        			data : formData,
	        			success : function(data) {
	        				debugger
	        				$("#showsaverecorddialog").dialog("close");
	        				$("#showsuccessdialog").dialog({
	        						resizable: false,
	        				        height: 200,
	        				        width: 500,
	        				        modal: true,
	        				        buttons: {
	        				        	"<bean:message key='BzComposer.global.ok'/>": function () {
	        				        		$(this).dialog("close");
	        				                return false;
	        				        	},
	        				            "<bean:message key='BzComposer.global.cancel'/>": function () {
	        				                $(this).dialog("close");
	        				                return false;
	        				            }
        				        	}
	        				});
	        			},
	        			error : function(data) {
	        				alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	        			}
	        		});
	        		
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
function setDescription()
{
	var text = $('#location :selected').text();
	document.getElementById("description").value = text;
}

function setDescription1()
{
	var text = $('#message :selected').text();
	document.getElementById("description").value = text;
}

function setDescription2()
{
	var text = $('#rep :selected').text();
	document.getElementById("description").value = text;
}

function setDescription3()
{
	var text = $('#terms :selected').text();
	document.getElementById("description").value = text;
}

function setDescription4()
{
	var text = $('#salesTax :selected').text();
	var e = document.getElementById("salesTax");
	var strUser = e.options[e.selectedIndex].value;
	document.getElementById("description").value = text;
	document.getElementById("txtTerms1").value = strUser;
}

function setDescription5()
{
	
	var text = $('#creditTerm :selected').text();
	document.getElementById("description").value = text;
	
	var e = document.getElementById("creditTerm");
	var strUser = e.options[e.selectedIndex].value;
	document.getElementById("txtDays").value = strUser;
}
</script>
</html>
<!-- Dialog box used in this page -->
<div id="showsaverecorddialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.saveconfirm"/></p>
</div>
<!-- Dialog box used in this page -->
<div id="showsuccessdialog" style="display:none;">
	<p>Record updated</p>
</div>