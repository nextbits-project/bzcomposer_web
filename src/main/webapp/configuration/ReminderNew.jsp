<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
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
		//alert("invoiceMemoRemindMe is checked");
		debugger
		document.configurationForm.invoiceMemo.value = 1;
		debugger
	});
	
	$("#invoiceMenoDontRemindMe").click(function()
	{
		//alert("invoiceMemoDon'tRemindMe is checked");
		debugger
		document.configurationForm.invoiceMemo.value = 0;
		debugger
	});
	
	$('#invoiceMemoDays').change(function()
	{
		var inoviceMemoDays = $("#invoiceMemoDays").val();
		if(inoviceMemoDays > 180)
		{
			//alert("<bean:message key='BzComposer.configuration.reminder.insertedvaluenotgreater'/>");
			return invaliddaysdialog();
			$("#invoiceMemoDays").focus();
		}
	});		
	$('#memorizeEstimationDays').change(function()
	{
		var estimateDays = $("#memorizeEstimationDays").val();
		if(estimateDays > 180)
		{
			//alert("<bean:message key='BzComposer.configuration.reminder.insertedvaluenotgreater'/>");
			return invaliddaysdialog();
			$("#memorizeEstimationDays").focus();
		}
	});
	$('#overdueInvoiceDays').change(function()
	{
		var invoiceDays = $("#overdueInvoiceDays").val();
		if(invoiceDays > 180)
		{
			//alert("<bean:message key='BzComposer.configuration.reminder.insertedvaluenotgreater'/>");
			return invaliddaysdialog();
			$("#overdueInvoiceDays").focus();
		}
	});
	$('#inventoryOrderDays').change(function()
	{
		var inventoryOrderDays = $("#inventoryOrderDays").val();
		if(inventoryOrderDays > 180)
		{
			//alert("<bean:message key='BzComposer.configuration.reminder.insertedvaluenotgreater'/>");
			return invaliddaysdialog();
			$("#inventoryOrderDays").focus();
		}
	});
	$('#serviceBillingDays').change(function()
	{
		var serviceBillingDays = $("#serviceBillingDays").val();
		if(serviceBillingDays > 180)
		{
			//alert("<bean:message key='BzComposer.configuration.reminder.insertedvaluenotgreater'/>");
			return invaliddaysdialog();
			$("#serviceBillingDays").focus();
		}
	});
	$('#billsToPayDays').change(function()
	{
		var billPayDays = $("#billsToPayDays").val();
		if(billPayDays > 180)
		{
			//alert("<bean:message key='BzComposer.configuration.reminder.insertedvaluenotgreater'/>");
			return invaliddaysdialog();
			$("#billsToPayDays").focus();
		}
	});
	$('#memorizePurchaseOrderDays').change(function()
	{
		var purchaseOrderDays = $("#memorizePurchaseOrderDays").val();
		if(purchaseOrderDays > 180)
		{
			//alert("<bean:message key='BzComposer.configuration.reminder.insertedvaluenotgreater'/>");
			return invaliddaysdialog();
			$("#memorizePurchaseOrderDays").focus();
		}
	});
	$('#memorizeBillDays').change(function()
	{
		var memorizeBillDays = $("#memorizePurchaseOrderDays").val();
		if(memorizeBillDays > 180)
		{
			//alert("<bean:message key='BzComposer.configuration.reminder.insertedvaluenotgreater'/>");
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
			//alert("showReminder is checked.");
	        $("#showReminder").attr('checked', true);
	        debugger
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {
			//alert("showReminder is unchecked.");
	        $("#showReminder").attr('checked', false);
	        debugger
	        isChecked = "off";
		}	
	    else
	    {
	    	//alert("showReminder is unchecked.");
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
					<td align="left" style="width:150px;font-size:12px;">
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
<div>
	<input type="hidden" name="showReminderStatus" id="showReminderStatus" value="" />	
</div>
<div id="invaliddaysdialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.reminder.insertedvaluenotgreater"/></p>
</div>