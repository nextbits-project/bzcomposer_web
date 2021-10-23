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
<title><bean:message key="BzComposer.remindertitle" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<script type="text/javascript">
/* $(function() 
{
   
});
 */
$(document).ready(function()
{
	//var invoiceMemoDays = $("#invoiceMemoDays").val();
	debugger
	var invoiceMemo = document.configurationForm.invoiceMemo.value;
	var memorizeEstimation = document.configurationForm.memorizeEstimation.value;
	var overdueInvoice = document.configurationForm.overdueInvoice.value;
	var inventoryOrder = document.configurationForm.inventoryOrder.value;
	var serviceBilling = document.configurationForm.serviceBilling.value;
	var billsPay = document.configurationForm.billsToPay.value;
	var memorizeBill = document.configurationForm.memorizeBill.value;
	var purchaseOrder= memorizeBill;
	
	<%-- var showReminder = '<%= request.getAttribute("showReminderStatus")%>';
	
	alert("ShowReminder value:"+showReminder);
	
	if(showReminder == "on")
	{
		$("#showReminder").attr("checked",true);
	}
	else
	{
		$("#showReminder").attr("checked",false);
	} --%>
	 
	debugger
	
	if(invoiceMemo == 1)
	{
		$("#invoiceMenoDontRemindMe").prop("checked",true);
	}
	else
	{
		$("#invoiceMemoRemindMe").prop("checked",true);
	}
	
	//var memorizeEstimationDays = $("#memorizeEstimationDays").val();
	if(memorizeEstimation == 1)
	{
		$("#memorizeDontRemindMe").prop("checked",true);
	}
	else
	{
		$("#memorizeRemindMe").prop("checked",true);
	}
	
	//var overdueInvoiceDays = $("#overdueInvoiceDays").val();
	if(overdueInvoice == 1)
	{
		$("#overdueInvoiceDontRemindMe").prop("checked",true);
	}
	else
	{
		$("#overdueInvoiceRemindMe").prop("checked",true);
	}
	//var inventoryOrderDays = $("#inventoryOrderDays").val();
	if(inventoryOrder == 1)
	{
		$("#inventoryOrderDontRemindme").prop("checked",true);	
	}
	else
	{
		$("#inventoryOrderRemindMe").prop("checked",true);
	}
	
	//var serviceBillingDays = $("#serviceBillingDays").val();
	if(serviceBilling == 1)
	{
		$("#serviceBillingDontRemindMe").prop("checked",true);
	}
	else
	{
		$("#serviceBillingRemindMe").prop("checked",true);
	}
	
	//var billsToPayDays = $("#billsToPayDays").val();
	if(billsPay == 1)
	{
		$("#billsToPayDontRemindMe").prop("checked",true);
	}
	else
	{
		$("#billsToPayRemindMe").prop("checked",true);
	}
	
	//var memorizePurchaseOrderDays = $("#memorizePurchaseOrderDays").val();
	if(purchaseOrder == 1)
	{
		$("#memorizeBillRemindMe").prop("checked",true);
		$("#memorizePurchaseOrderDontRemindMe").prop("checked",false);
	}
	else
	{
		$("#memorizePurchaseOrderDontRemindMe").prop("checked",true);
		$("#memorizeBillRemindMe").prop("checked",false);
	}
	
	//var memorizeBillDays = $("#memorizeBillDays").val();
	if(memorizeBill == 1)
	{
		$("#memorizeBillDontRemindMe").prop("checked",true);
		$("#memorizePurchaseOrderRemindMe").prop("checked",false);
	}
	else
	{
		$("#memorizePurchaseOrderRemindMe").prop("checked",true);
		$("#memorizeBillDontRemindMe").prop("checked",false);
	}
	
	$("#invoiceMemoRemindMe").click(function()
	{

		debugger
		document.configurationForm.invoiceMemo.value = 1;
		debugger
	});
	
	$("#invoiceMenoDontRemindMe").click(function()
	{

		debugger
		document.configurationForm.invoiceMemo.value = 0;
		debugger
	});
	
	$('#invoiceMemoDays').change(function()
	{
		var inoviceMemoDays = $("#invoiceMemoDays").val();
		if(inoviceMemoDays > 180)
		{

			return invaliddaysdialog();
			$("#invoiceMemoDays").focus();
		}
	});		
	$('#memorizeEstimationDays').change(function()
	{
		var estimateDays = $("#memorizeEstimationDays").val();
		if(estimateDays > 180)
		{

			return invaliddaysdialog();
			$("#memorizeEstimationDays").focus();
		}
	});
	$('#overdueInvoiceDays').change(function()
	{
		var invoiceDays = $("#overdueInvoiceDays").val();
		if(invoiceDays > 180)
		{

			return invaliddaysdialog();
			$("#overdueInvoiceDays").focus();
		}
	});
	$('#inventoryOrderDays').change(function()
	{
		var inventoryOrderDays = $("#inventoryOrderDays").val();
		if(inventoryOrderDays > 180)
		{

			return invaliddaysdialog();
			$("#inventoryOrderDays").focus();
		}
	});
	$('#serviceBillingDays').change(function()
	{
		var serviceBillingDays = $("#serviceBillingDays").val();
		if(serviceBillingDays > 180)
		{

			return invaliddaysdialog();
			$("#serviceBillingDays").focus();
		}
	});
	$('#billsToPayDays').change(function()
	{
		var billPayDays = $("#billsToPayDays").val();
		if(billPayDays > 180)
		{

			return invaliddaysdialog();
			$("#billsToPayDays").focus();
		}
	});
	$('#memorizePurchaseOrderDays').change(function()
	{
		var purchaseOrderDays = $("#memorizePurchaseOrderDays").val();
		if(purchaseOrderDays > 180)
		{

			return invaliddaysdialog();
			$("#memorizePurchaseOrderDays").focus();
		}
	});
	$('#memorizeBillDays').change(function()
	{
		var memorizeBillDays = $("#memorizePurchaseOrderDays").val();
		if(memorizeBillDays > 180)
		{

			return invaliddaysdialog();
			$("#memorizePurchaseOrderDays").focus();
		}
	});
	
	$('#showReminder').change(function()
	{
		var isChecked = '<%= request.getAttribute("showReminderStatus")%>';
		debugger
		if($(this).prop("checked") == true)
		{

	        $("#showReminder").attr('checked', true);
	        debugger
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {

	        $("#showReminder").attr('checked', false);
	        debugger
	        isChecked = "off";
		}	
	    else
	    {

	        $("#showReminder").attr('checked', isChecked);
	        debugger
	    	document.configurationForm.showReminder.value = isChecked;
	    	debugger
	    }	
		$("#showReminder").val(isChecked);
	});
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
</script>
</head>
<!-- <body onload="init2();"> -->
<body onload="init();">
<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post">

<div id="ddcolortabsline">&nbsp;</div>
<div id="cos"></div>
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
	<span style="font-size: 12px; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
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
	<div id="table-negotiations">
		<table cellspacing="0"  style="width: 100%;overflow-y:scroll;" class="section-border">
			<tr>
				<td valign="top"  style="width: 20%;">
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
				<td valign="top" style="padding-top: 2%;padding-right: 4%;">
					<!--  Reminders Starts -->
					<div id="reminder">
						<table class="table-notifications" width="100%">
							<tr>
								<td style="font-size:12px;"> 
									<html:checkbox property="showReminder" styleId="showReminder">
										<bean:message key="BzComposer.configuration.showreminder" />
									</html:checkbox>
								</td>
							</tr>
							<tr>
								<th align="left" style="font-size:12px; padding: 5px;">
									<bean:message key="BzComposer.configuration.reminderlist" />
								</th>
							</tr>
							<tr>
								<td>
									<table>
										<tr>
											<td align="right" style="width:100px;font-size:12px;">
												<b><bean:message key="BzComposer.configuration.remindme" /></b>
											</td>
											<td style="width:100px;">&nbsp;&nbsp;</td>
											<td style="width:100px;">&nbsp;&nbsp;</td>
											<td align="left" style="width:150px;font-size:1em;">
												<b><bean:message key="BzComposer.configuration.dontremindme" /></b>
											</td>
										</tr>
						<tr>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.memorizeinvoice" />
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="invoiceMemo" value="1" styleId="invoiceMemoRemindMe"></html:radio> 
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="invoiceMemo" value="0" styleId="invoiceMenoDontRemindMe"></html:radio>
							</td>
							<td style="font-size:12px;">
								<html:text property="invoiceMemoDays" styleId="invoiceMemoDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);">
								</html:text> 
							</td>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.daysaftermemorizedate" />
							</td>
						</tr>
						<tr>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.memorizeestimation" />
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="memorizeEstimation" value="1" styleId="memorizeRemindMe"></html:radio>
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="memorizeEstimation" value="0" styleId="memorizeDontRemindMe"></html:radio> 
							</td>
							<td style="font-size:12px;">
								<html:text property="memorizeEstimationDays" styleId="memorizeEstimationDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);">
								</html:text>
							</td>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.daysaftermemorizedate" />
							</td>
						</tr>
						<tr>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.overdueinvoices" />
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="overdueInvoice" value="1" styleId="overdueInvoice" ></html:radio>
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="overdueInvoice" value="0" styleId="overdueInvoiceDontRemindMe"></html:radio>
							</td>
							<td style="font-size:12px;">
								<html:text property="overdueInvoiceDays" styleId="overdueInvoiceDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);">
								</html:text> 
							</td>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.daysbeforeduedate" />
							</td>
						</tr>
						<tr>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.inventorytoreorder" />
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="inventoryOrder" value="1" styleId="inventoryOrderRemindMe"></html:radio> 
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="inventoryOrder" value="0" styleId="inventoryOrderDontRemindme"></html:radio>
							</td>
							<td style="font-size:12px;">
								<html:text property="inventoryOrderDays" styleId="inventoryOrderDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);">
								</html:text> 
							</td>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.qtybeforereorderpoint" />
							</td>
						</tr>
						<tr>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.servicebilling" />
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="serviceBilling" value="1" styleId="serviceBillingRemindMe"></html:radio> 
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="serviceBilling" value="0" styleId="serviceBillingDontRemindMe"></html:radio>
							</td>
							<td style="font-size:12px;">
								<html:text property="serviceBillingDays" styleId="serviceBillingDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);">
								</html:text>
							</td>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.daysbeforeschedulebillingdate" />
							</td>
						</tr>
						<tr>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.billstopay" />
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="billsToPay" value="1" styleId="billsToPayRemindMe"></html:radio>
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="billsToPay" value="0" styleId="billsToPayDontRemindMe"></html:radio>
							</td>
							<td style="font-size:12px;">
								<html:text property="billsToPayDays" styleId="billsToPayDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);">
								</html:text>
							</td>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.daysbeforeduedate" />
							</td>
						</tr>
						<tr>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.memorizepurchaseorder" />
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="memorizePurchaseOrder" value="1" styleId="memorizePurchaseOrderRemindMe"></html:radio>
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="memorizePurchaseOrder" value="0" styleId="memorizePurchaseOrderDontRemindMe"></html:radio>
							</td>
							<td style="font-size:12px;">
								<html:text property="memorizePurchaseOrderDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);">
								</html:text>
							</td>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.daysaftermemorizedate" />
							</td>
						</tr>
						<tr>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.memorizebill" />
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="memorizeBill" value="1" styleId="memorizeBillRemindMe"></html:radio>
							</td>
							<td align="center" style="font-size:12px;">
								<html:radio property="memorizeBill" value="0" styleId="memorizeBillDontRemindMe"></html:radio>
							</td>
							<td style="font-size:12px;">
								<html:text property="memorizeBillDays" styleId="memorizeBillDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);">
								</html:text>
							</td>
							<td style="font-size:12px;">
								<bean:message key="BzComposer.configuration.daysaftermemorizedate" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
				<!-- Remainder Ends -->
			</td>
		</tr>
	</table>
	<div><html:hidden property="fileName" /></div>
	<div>
		<input type="hidden" name="tabid" id="tabid" value="" />
		<input type="hidden" name="showReminderStatus" id="showReminderStatus" value="" />	
	</div>
	</div>
	<div align="center">
		<%-- <center><html:button property="save" style="font-size:1em;">Save</html:button>
		<html:cancel style="font-size:1em;">Cancel</html:cancel></center> --%>
		<input type="Submit" name="Submit" onclick="SaveValues()" style="font-size:1em;" 
		value="<bean:message key='BzComposer.global.save'/>"/>
		<input type="reset" name="Cancel" onclick="RevokeValues()" style="font-size:1em;" 
		value="<bean:message key='BzComposer.global.cancel'/>"/>
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
	/* if(confirm('<bean:message key="BzComposer.configuration.saveconfirm"/>'))
	{
		debugger
		//first checkbox for showReminder
		document.configurationForm.showReminder.value = $("#showReminder").val();
		
		//Radio Button values- Either 0 or 1
		document.configurationForm.invoiceMemo.value = document.configurationForm.invoiceMemo.value;
		document.configurationForm.overdueInvoice.value = document.configurationForm.overdueInvoice.value;
		document.configurationForm.inventoryOrder.value = document.configurationForm.inventoryOrder.value;
		document.configurationForm.billsToPay.value = document.configurationForm.billsToPay.value;
		document.configurationForm.memorizeEstimation.value = document.configurationForm.memorizeEstimation.value;
		document.configurationForm.serviceBilling.value = document.configurationForm.serviceBilling.value;
		document.configurationForm.memorizeBill.value = document.configurationForm.memorizeBill.value;
		document.configurationForm.memorizePurchaseOrder.value = document.configurationForm.memorizePurchaseOrder.value;
		
		//All RadioButton Days value
		document.configurationForm.invoiceMemoDays.value = document.configurationForm.invoiceMemoDays.value;
		document.configurationForm.overdueInvoiceDays.value = document.configurationForm.overdueInvoiceDays.value;
		document.configurationForm.inventoryOrderDays.value = document.configurationForm.inventoryOrderDays.value;
		document.configurationForm.billsToPayDays.value = document.configurationForm.billsToPayDays.value;
		document.configurationForm.memorizeEstimationDays.value = document.configurationForm.memorizeEstimationDays.value;
		document.configurationForm.memorizePurchaseOrderDays.value = document.configurationForm.memorizePurchaseOrderDays.value;
		document.configurationForm.serviceBillingDays.value = document.configurationForm.serviceBillingDays.value;
		document.configurationForm.memorizeBillDays.value = document.configurationForm.memorizeBillDays.value;
		debugger
		

		//"\nOverDue Invoice:"+document.configurationForm.overdueInvoice.value+
		//"\nInventoryOrder:"+document.configurationForm.inventoryOrder.value+
		//"\nBillsToPay:"+document.configurationForm.billsToPay.value+
		//"\nMemorize Estimation:"+document.configurationForm.memorizeEstimation.value+
		//"\nMemorize Purchase Order:"+document.configurationForm.memorizePurchaseOrder.value+
		//"\nService Billing:"+document.configurationForm.serviceBilling.value+
		//"\nMemorize Billing:"+document.configurationForm.memorizeBill.value); 
		
		debugger
		document.getElementById('showReminderStatus').value = $("#showReminder").val();
		
		debugger
		document.getElementById('tabid').value="SaveReminderSetting";
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
	        		
	        		document.getElementById('tabid').value="SaveReminderSetting";
	        		document.forms[0].action = "Configuration.do";
	        		document.forms[0].submit();
					//$('form').submit();
	            },
	            <bean:message key='BzComposer.global.cancel'/>: function () {
	                $(this).dialog("close");
	                return false;
	            }
	        }
	    });
	    return false;
}
</script>
</html>
<script type="text/javascript">
function invaliddaysdialog()
{
	event.preventDefault();
	$("#invaliddaysdialog").dialog({
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
<!-- Dialog box used in this page -->
<div id="showsaverecorddialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.saveconfirm"/></p>
</div>
<div id="invaliddaysdialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.reminder.insertedvaluenotgreater"/></p>
</div>