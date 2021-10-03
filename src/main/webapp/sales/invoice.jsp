<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.invoicetitle" /></title>	
<style type="text/css">


/** Semibold */
@font-face {
  font-family: "SF Mono";
  font-weight: 600;
  src: url("https://sf.abarba.me/SFMono-Semibold.otf");
}

/** Semibold Italic */
@font-face {
  font-family: "SF Mono";
  font-weight: 600;
  font-style: italic;
  src: url("https://sf.abarba.me/SFMono-SemiboldItalic.otf");
}

body{
	/* font-family: "SF Mono"; */
	min-width: 1366px;
}
page-title{
	/* font-size: 18px;
	margin: 30px 0px 15px 0px;
	padding: 0 0 10px 0; */
}


.msgstyle{
font-size:18px;
color: #3D9EAC;
}
.showCustomer
{
	font: bold italic 100px;
	
}
table.cart tbody tr td {
/*  border-bottom: 1px solid rgb(207, 207, 207); */
font-size: 14px;				/*Added on 20-09-2019  */
}
</style>
<script type="text/javascript">
$(function() {
	var locale = "<%= request.getAttribute("selectedLocale")%>";
	$('select[id="locale"]').find('option[value="'+locale+'"]').attr("selected",true);
	$("#sortByLastName").change(function(){
	var checked = $("#sortByLastName").prop('checked');
	if(checked == true)
	{
		$.ajax({
			type: "POST",
			url:"Invoice.do?tabid=SortInvoice&SortBy=LastName",
			data:{sortBy : "LastName"},
			}).done(function(data){
			$(document).find('div#custDiv').replaceWith($(data).find('div#custDiv').html());
			});
	}
	else 
	{
		$.ajax({
			type: "POST",
			url:"Invoice.do?tabid=SortInvoice&SortBy=Name",
			data:{sortBy : "Name"},
			}).done(function(data){
			$(document).find('div#custDiv').replaceWith($(data).find('div#custDiv').html());
		});
	}
});
});
function saveItemName() 
{
	event.preventDefault();
	$("#SaveItemName").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                var itemName = $.trim(document.getElementById('pname_id').value);
            	var item = document.getElementById('itemID');
            	var itemId = item.options[item.selectedIndex].value;
            	window.location.href = "Invoice.do?tabid=saveItemName&itemName="+itemName+"&itemID="+itemId;
            },
            "<bean:message key='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}
function saveNewUnitPrice()
{
	event.preventDefault();
	$("#SaveUnitPrice").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                var price = document.getElementById('unitPrice_id').value;
				var item = document.getElementById('itemID');
				var itemId = item.options[item.selectedIndex].value;
				window.location.href = "Invoice.do?tabid=saveUnitPrice&price="+price+"&itemID="+itemId;
            },
            <bean:message key='BzComposer.global.cancel'/>: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}

function updateQuantityOfSelectedItem()
{
	event.preventDefault();
	$("#saveQuantity").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                var quantity = document.getElementById('qty_id').value;
				var item = document.getElementById('itemID');
				var itemId = item.options[item.selectedIndex].value;
				//window.location.href = "Invoice.do?tabid=saveQuantity&quantity="+price+"&itemID="+itemId;
            },
            <bean:message key='BzComposer.global.cancel'/>: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}

function showItemOrderNumberDialog()
{
	event.preventDefault();
	$("#showItemOrderNumberDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showValidationDialog()
{
	event.preventDefault();
	$("#showValidationDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showSelectItemDialog()
{
	event.preventDefault();
	$("#showSelectItemDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function deleteInvoiceDialog()
{
	event.preventDefault();
	$("#deleteInvoiceDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                window.location="Invoice.do?tabid=DeleteInvoice&&CustomerID="+cid;
            },
            <bean:message key='BzComposer.global.cancel'/>: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}

function updateBillingAddressDialog(form)
{
	event.preventDefault();
	$("#updateBillingAddressDialog").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                cid = form.custID.value;
    			bill = form.billTo.value;
    			var addressId = form.bsAddressID.value;
    			var res = bill.split("\n");
    			//alert("Inside updateBillToAddress method\ncustomerId is:"+cid+"\n addressId="+addressId+"\n after converting in array data will be:"+res);
    			window.location.href="Invoice.do?tabid=updateBillingAddress&&customerID="+cid+"&&billingAddress="+res+"&&billAddressId="+addressId;
    			
    			/* debugger
				$.ajax({
					type: "POST",
					url:"Invoice.do?tabid=updateBillingAddress&&customerID="+cid+"&&billingAddress="+res+"&&billAddressId="+addressId,
					//contentType: "application/json", 
					//dataType:'json',
					data:{billingAddress : res},
					}).done(function(data){
					//$(document).find('div#custDiv').replaceWith($(data).find('div#custDiv').html());
					});
				*/
    				
            },
            <bean:message key='BzComposer.global.cancel'/>: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}

function updateShippingAddressDialog(form)
{
	event.preventDefault();
	$("#updateShippingAddressDialog").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                
                cid = form.custID.value;
    			ship = form.shipTo.value;
    			var addressId = form.shAddressID.value;
    			var res = ship.split("\n");
    			window.location.href="Invoice.do?tabid=updateShippingAddress&&customerID="+cid+"&&shippingAddress="+res+"&&shipAddressId="+addressId;
    			
    			/* $.ajax({
    					type: "POST",
    					url:"Invoice.do?tabid=updateShippingAddress&&customerID="+cid+"&&shippingAddress="+res+"&&shipAddressId="+addressId,
    					//contentType: "application/json",
    					//dataType:'json',
    					data:{billingAddress : res},
    					}).done(function(data){
    						debugger
    						$(document).find('div#custDiv').replaceWith($(data).find('div#custDiv').html());
    						debugger
    					}); */
    				
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
</head>
<body onload="Init();">

<!-- begin shared/header -->

<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">   
<div class="statusquo ok">		
<div id="hoja">
<div id="blanquito">
<div id="padding">
<html:form styleId="frmInvoice" action="Invoice.do?" enctype="multipart/form-data" method="post">
	<input type="hidden" name="isInvoice" value="1">
	<input type="hidden" name="isSalestype" value="1">
	<html:errors />
	<div style="float: left; width: 100%;">
		<span class="page-title">
			<bean:message key="BzComposer.invoice.invoicetitle" />
		</span>
	</div>
	<!-- <div> <h3 class="page-title" style="color: #05A9C5;">Invoice</h3> </div> -->
	<div id="table-negotiations" style="margin-left: auto;margin-right: auto;">
		<div id="table-negotiations">
			<div id="CustomerDtailsInfo">
				<bean:size id="cstSize" name="CustDetails" />
					<input type="hidden" name="CustDetails" id="custSize" value='<bean:write name="cstSize" />'> 
					<logic:iterate name="CustDetails" id="objList" indexId="index">
						<input type="hidden" name='<bean:write name="index" />clientID' value='<bean:write name="objList" property="clientVendorID"/>'
							id='a<bean:write name="index" />clvndid' />
						<input type="hidden" name='<bean:write name="index" />v' value='<bean:write name="objList" property="via" />'
							id='<bean:write name="index" />va' />
						<input type="hidden" name='<bean:write name="index" />pa' value='<bean:write name="objList"  property="payMethod" />'
							id='<bean:write name="index" />paym' />
						<input type="hidden" name='<bean:write name="index" />tm' value='<bean:write name="objList"  property="term" />'
							id='<bean:write name="index" />trm' />
						<input type="hidden" name='<bean:write name="index" />rp' value='<bean:write name="objList"  property="rep" />'
							id='<bean:write name="index" />rp' />
						<input type="hidden" name='<bean:write name="index" />tx' value='<bean:write name="objList"  property="taxable" />'
							id='a<bean:write name="index" />txable' />
						<input type="hidden" name='<bean:write name="index" />tx' value='<bean:write name="objList"  property="firstName" />'
							id='<bean:write name="index" />firstName' />
						<input type="hidden" name='<bean:write name="index" />tx' value='<bean:write name="objList"  property="lastName" />'
							id='<bean:write name="index" />lastName' />
					</logic:iterate>
				</div>
					
				<div id="BillShipAddrDetails">
					<bean:size id="blSize" name="BillAddr" />
							<input type="hidden" name="BLSize" id="bSize" value='<bean:write name="blSize" />'>
								<logic:iterate name="BillAddr" id="objList" indexId="index">
									<input type="hidden" value='<bean:write name="objList" property="clientVendorID"/>' id='<bean:write name="index" />clvid' />
									<input type="hidden" value='<bean:write name="objList" property="billTo" />' id='<bean:write name="index" />bl' />
									<input type="hidden" value='<bean:write name="objList"  property="companyID" />' id='<bean:write name="index" />cid' />
									<input type="hidden" value='<bean:write name="objList"  property="bsAddressID" />' id='<bean:write name="index" />bsaddr' />
								</logic:iterate> 
	
						<bean:size id="ShSize" name="ShAddr" /> 
							<input type="hidden" name="LSize" id="sSize" value='<bean:write name="ShSize" />'>
								<logic:iterate name="ShAddr" id="objList" indexId="index">
									<input type="hidden" value='<bean:write name="objList" property="clientVendorID"/>' id='<bean:write name="index" />sh_id' />
									<input type="hidden" value='<bean:write name="objList" property="shipTo"/>' id='<bean:write name="index" />sh' />
									<input type="hidden" value='<bean:write name="objList"  property="shAddressID" />' id='<bean:write name="index" />shaddr' />
								</logic:iterate>
				</div>
					
					<div id="ItemDetails">
						<bean:size id="iSize" name="ItemList" /> 
							<input type="hidden" name="ItemSize" id="itemSize" value='<bean:write name="iSize" />'> 
								<logic:iterate name="ItemList" id="objList" indexId="index">
									<input type="hidden" value='<bean:write name="objList" property="invID" />' id='<bean:write name="index" />inv' />
									<input type="hidden" value='<bean:write name="objList" property="qty"/>' id='<bean:write name="index" />q' />
									<input type="hidden" value='<bean:write name="objList" property="invCode" filter="false" />' id='<bean:write name="index" />code' />

									<input type="hidden" value='<bean:write name="objList" property="invDesc"/>' id='<bean:write name="index" />desc' />
									<input type="hidden" value='<bean:write name="objList" property="inventoryName"/>' id='<bean:write name="index" />pname' />
									<input type="hidden" value='<bean:write name="objList" property="salePrice"/>' id='<bean:write name="index" />price' />
									<input type="hidden" value='<bean:write name="objList" property="weight"/>' id='<bean:write name="index" />wt' />
									<input type="hidden" value='<bean:write name="objList" property="isCategory"/>' id='<bean:write name="index" />cat' />
									<input type="hidden" value='<bean:write name="objList" property="itemTypeID"/>' id='<bean:write name="index" />itmId' />
									<input type="hidden" value='<bean:write name="objList" property="serialNo"/>' id='<bean:write name="index" />serial' />
								</logic:iterate>
					</div>
					
					<table class="tabla-listados" cellspacing="0" style="margin-top: -1px;">
	
						<thead>
							<tr>
								<th colspan="12" style="font-size: 14px;">
									<bean:message key="BzComposer.invoice.customerinfo" />
								</th>
							</tr>
						</thead>
						
						<logic:present name="Status">
							<tr>
								<td colspan="12" align="left">
									<span class="msgstyle">*<bean:write name="Status" />
									</span>
								</td>
							</tr>
						</logic:present>
						<logic:present name="SaveStatus">
							<tr>
								<td colspan="12">
									<span class="msgstyle">*<bean:write name="SaveStatus" /></span>
								</td>
							</tr>
						</logic:present>	
						<tr>
							<td colspan="2" width="30%">
								<table>
									<tr>
										<td colspan="2" style="font-size: 14px;">
											<bean:message key="BzComposer.invoice.customertitle" />
										</td>
										<td colspan="4" style="font-size: 14px;" align="left" width="50%">
											<!-- Sort By -->
											<bean:message key="BzComposer.invoice.sortby"/>
										</td>
										<td>&nbsp;</td>
										<td style="font-size: 14px;">
											<bean:message key="BzComposer.invoice.taxable" />
										</td>
										<td style="font-size: 14px;">
											<bean:message key="BzComposer.invoice.pending" />
										</td>
									</tr>
									<tr>
										<td colspan="2" style="font-size:14px;">
											<div id="custDiv">
												<div id="custDiv">
													<html:select styleId="custID"  property="custID" onchange="Assignment(this.value,this.form);" onkeydown="Assignment(this.value,this.form);" onkeyup="Assignment(this.value,this.form);" style="width: 300px;">
														<html:option value="0" >
															<bean:message key="BzComposer.ComboBox.Select" />
														</html:option>
														<html:option value="1111">
															<bean:message key="BzComposer.invoice.addcustomer"/>
														</html:option>
														<html:options collection="CDetails" property="value" labelProperty="label" />
													</html:select>
												</div>
											</div>
										</td>
										<td style="font-size: 14px;">
											<input type="checkbox" id="sortByLastName" name="sortByLastName" value="sortByLastName"/>
										</td>
										<td colspan="3" style="font-size:14px;" width="50%">
											<bean:message key="BzComposer.invoice.sortbylastname"/>
										</td>
										<td>&nbsp;</td>
										<!-- <td align="center" style="font-size: 14px;">
											<input type="checkbox" id="sortByCompanyName" name="sortByCompanyName" value="sortByCompanyName"/>
										</td>
										<td colspan="3" style="font-size:14px;">
											Company Name
										</td> -->
										<td align="center" style="font-size: 14px;">
											<html:checkbox property="taxable" onclick="TaxaValue(this.form);"></html:checkbox>
										</td>									
										<td align="center" style="font-size: 14px;">
											<html:checkbox property="isPending" onclick="Pending_Value(this.form);toggle_visibility('pending');"></html:checkbox>
										</td>
									</tr>
								</table>
							</td>
							<td colspan="5" align="center" width="40%" style="font-size: 14px;">
								<html:button styleId="firstInvoice"  property="First" styleClass="formbutton" title="First Invoice Record" onclick="FirstInvoice();" style="padding: 8px 10px 8px 10px; font-size: 16px;">
									<bean:message key="BzComposer.invoice.first" />
								</html:button>
								<html:button  styleId="lastInvoice" property="Last" styleClass="formbutton" onclick="LastInvoice();" style="padding: 8px 10px 8px 10px; font-size: 16px;">
									<bean:message key="BzComposer.invoice.last" />
								</html:button>
								<html:button styleId="previousInvoice" property="Previous" styleClass="formbutton" title="Previous Invoice Record" onclick="PreviousInvoice();" style="padding: 8px 10px 8px 10px; font-size: 16px;">
									<bean:message key="BzComposer.Invoice.Previous" />
								</html:button>
								<html:button styleId="nextInvoice" property="Next" styleClass="formbutton" title="Next Invoice Record" onclick="NextInvoice();" style="padding: 8px 10px 8px 10px; font-size: 16px;">
									<bean:message key="BzComposer.Invoice.Next" />
								</html:button>
								<html:button styleId="newInvoice" property="New" title="New Invoice" styleClass="formbutton" onclick="NewInvoice();" style="padding: 8px 10px 8px 10px; font-size: 16px;">
									<bean:message key="BzComposer.global.new" />
								</html:button>
								<br>
								<html:button property="payHistory" styleClass="formbutton" title="Payment History" onclick="paymentHistory(this.form);" style="padding: 8px 40px 8px 44px; font-size: 16px;">
									<%-- <bean:message key="BzComposer.Invoice.PayHistory" /> --%>
									<bean:message key="BzComposer.Invoice.balance" />
								</html:button>
								<logic:present name="Enable">
									<html:button styleId="sendMailEnabled" property="sendMail" styleClass="formbutton" title="Send Mail to..." onclick="SendMail(this.form);" disabled="false" style="padding: 8px 40px 8px 40px; font-size: 16px;">
										<bean:message key="BzComposer.Invoice.SendMail" />
									</html:button>
								</logic:present> 
								<logic:notPresent name="Enable">
									<html:button styleId="sendMailDisabled" property="sendMail" styleClass="formbutton" title="Send Mail to..." onclick="SendMail(this.form);" disabled="true" style="padding: 8px 40px 8px 40px; font-size: 16px;">
										<bean:message key="BzComposer.Invoice.SendMail" />
									</html:button>
								</logic:notPresent>
							</td>
							<td colspan="4" align="right" width="30%">
								<table>
									<tr>
										<td style="font-size:14px;">
											<input type="hidden" name="Ivhidden" id="InvStyle" />		
												<%-- <bean:message key="BzComposer.Orders.OrderStyle" /> --%>
										</td>
										<td align="left" style="font-size: 14px;" colspan="3">
											<bean:message key="BzComposer.Invoice.Date" />
										</td>
										<td align="left" style="font-size: 14px;">
											<bean:message key="BzComposer.Invoice.InvoiceNo" />
										</td>
									</tr>
									<tr>
										<td style="font-size: 14px;">
											<html:select styleId="inoiceStyle" property="invoiceStyle" onchange="StyleChange(this.value);" 
											onkeydown="StyleChange(this.value);" onkeyup="StyleChange(this.value);">
												<html:option value="0">
													<bean:message key="BzComposer.ComboBox.Select" />
												</html:option>
												<html:options collection="InvoiceStyle" property="value" labelProperty="label" />
											</html:select>
										</td>
										<td style="font-size: 14px;" colspan="3">
											<html:text property="orderDate" readonly="true" size="10" />
												<!-- &nbsp; -->
												<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
												onclick="displayCalendar(document.InvoiceForm.orderDate,'mm-dd-yyyy',this);">
										</td>	
										<td align="right" style="font-size: 14px;">
											<html:text property="orderNo" style="text-align: right;" size="10" onkeydown="return numbersonly(event,this.value);" />
										</td>
									</tr>
								</table>
							</td>
								<td>
								</td>
							</tr>
							<tr>
								<!-- <script type="text/javascript"></script> -->				
								<td align="center" colspan="6">
									<div id="pending" style="display:none;">
										<font size="10">
											<bean:message key="BizComposer.Invoice.Pending" /> 
										</font>
									</div>
								</td>
							</tr>
							<tr align="left">
								<td align="center" colspan="6">
									<table style="width: 100%;">
										<tr>
											<td id="bill_label">
											</td>
										</tr>
									</table>
								</td>
								<td id="ship_label">
								</td>
							</tr>
							<tr>
								<td width="25%" align="left" colspan="6">
									<table>
										<tr>
											<td id="bill_id" style="font-size: 14px;">
												<bean:message key="BzComposer.Invoice.BillTo" />
												<br/>				
												<html:textarea property="billTo" rows="6" cols="25" onchange=" return updateBillingAddressDialog(this.form)" style="resize: none; width: 300px;">
												</html:textarea>
											</td>
											<td id="td2" align="center">
											</td>
										</tr>
									</table>
								</td>
								<td align="right" colspan="5">
									<table>
										<tr>
											<td id="ship_id" style="visibility: visible;padding-left:74px;font-size: 14px;">
												<bean:message key="BzComposer.Invoice.ShipTo" />
												<br/>	 
												<html:textarea property="shipTo" rows="6" cols="25" onchange="return updateShippingAddressDialog(this.form)" style="resize: none; width: 370px;">
												</html:textarea>
											</td>
										</tr>
									</table>
								</td>
								<td></td>
							</tr>
							<tr>
								<td colspan="4">
									<!-- asasass -->
									<table align="left" width="800">
										<tr>
											<td id="po_num_label" style="font-size: 14px;">
												<bean:message key="BzComposer.Invoice.PONum" />
											</td>
											<td id="sh_date_label" style="font-size: 14px;">
												<bean:message key="BzComposer.Invoice.ShipDateLower" />
											</td>
											<td id="rep_label" style="font-size: 14px;">
												<bean:message key="BzComposer.Invoice.Rep" />
											</td>	
											<td style="font-size: 14px;">
												<bean:message key="BzComposer.Invoice.Term" />
											</td>
											<td style="font-size: 14px;">
												<bean:message key="BzComposer.Invoice.PayMethod" />
											</td>
											<td id="via_label" style="font-size: 14px;">
												<bean:message key="BzComposer.Invoice.Via" />
											</td>
										</tr>
										<tr>
											<td id="po_num_id" style="font-size: 14px;">
												<html:text property="poNum" size="5" style="text-align: right;" onkeydown="return numbersonly(event,this.value)">
												</html:text>
											</td>
											<td id="sh_date_id" style="font-size: 14px;">
												<html:text property="shipDate" readonly="true" size="11" /> 
												<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" onclick="displayCalendar(document.InvoiceForm.shipDate,'mm-dd-yyyy',this);">
											</td>
											<td id="rep_id" style="font-size: 14px;">
												<html:select property="rep">
													<html:option value="0">
														<bean:message key="BzComposer.ComboBox.Select" />
													</html:option>
													<html:options collection="Rep" property="value" labelProperty="label" />
												<td style="font-size: 14px;">
													<html:select property="term">
														<html:option value="0">
															<bean:message key="BzComposer.ComboBox.Select" />
														</html:option>
														<html:options collection="Term" property="value" labelProperty="label" />
													</html:select>
												</td>
												<td style="font-size: 14px;" style="font-size: 14px;">
													<html:select property="payMethod">
														<logic:present name="PayMethod">
															<html:option value="0">
																<bean:message key="BzComposer.ComboBox.Select" />
															</html:option>
															<html:options collection="PayMethod" property="value" labelProperty="label" />
														</logic:present>
													</html:select>
												</td>
												</html:select>
											</td>
											<td id="via_id" style="font-size: 14px;">
												<html:select property="via" style="width:110px;">
													<html:option value="0">
														<bean:message key="BzComposer.ComboBox.Select" />
													</html:option>
													<html:options collection="Via" property="value" labelProperty="label" />
												</html:select>
											</td>
										</tr>
									</table>
								</td>
								<td align="right" colspan="7">
								</td>
								<td>
								</td>
							</tr>
							<tr>
								<td colspan="12"></td>
							</tr>
					</table>
					
					<div id="product">
						<table class="tabla-listados" cellspacing="0">
							<thead>
								<tr>
									<th colspan="12" style="font-size: 14px;">
										<bean:message key="BizComposer.Estimaion.Header.ItemInfo" />
									</th>
								</tr>
							</thead>				
							<tr>
								<td id="td1" style="padding-left: 30px;font-size: 14px;">
									<bean:message key="BzComposer.Invoice.ItemID" />
								</td>
								<td style="font-size: 14px;">
									<div id="td3">	
										<bean:message key="BzComposer.Invoice.Qty" />
									</div>
									
									<%-- <div id="td4">
										<bean:message key="BzComposer.Invoice.Rate" />
									</div> --%>
								</td>
								<td style="font-size: 14px;">
									<div id="td10" style="display:block;">
										<bean:message key="BzComposer.Invoice.UnitPrice" />
									</div>
									<div id="td11" style="display:none;">
										<bean:message key="BzComposer.Invoice.RatePrice" />
									</div>
								</td>	
								<td style="font-size: 14px;">
									<div>
										<bean:message key="BzComposer.Invoice.ItemName" />
									</div>
								</td>
								<td style="font-size: 14px;">
									<div id="td6" style="display:none;">
										<bean:message key="BzComposer.Invoice.SerialNo" />
									</div>
								</td>
								<td style="font-size: 14px;">	
									<div id="td13" style="display:block;">
										<bean:message key="BzComposer.Invoice.Amt" />
									</div>
								</td>
								<td style="font-size: 14px;">
									<div id="td15" style="display:block;">
										<bean:message key="BzComposer.Invoice.Weight" />
									</div>
								</td>
								<td style="font-size: 14px;">	
									<div id="td17" style="display:block;">
										<bean:message key="BzComposer.Invoice.Tax" />
									</div>
								</td>
								<td colspan="4"></td>
							</tr>
							<tr>
								<td id="td2" style="padding-left: 30px;font-size: 14px;">
									<div id="itemDiv">
									<div id="itemDiv">
									<html:select property="itemID" onchange="ItemChange(this.value);" styleId="itemID">
										<html:option value="0">
											<bean:message key="BzComposer.ComboBox.Select" />
										</html:option>		
										<logic:iterate name="ItemDetails" id="itmList">
											<logic:equal name="itmList" property="isCategory" value="0">
												<html:option value='${itmList.invID}'>
													&nbsp;&nbsp;&nbsp;&nbsp;
													<bean:write name="itmList" property="invCode" filter="false" />
												</html:option>
											</logic:equal>
											<logic:equal name="itmList" property="isCategory" value="1">
												<html:option value='01'>
													<bean:write name="itmList" property="invCode" filter="false" />
												</html:option>
											</logic:equal>
										</logic:iterate>
									</html:select>
									</div>
									</div>
								</td>
								<td style="font-size: 14px;">
									<div style="padding-top: 0px;" style="display:block;" id="td5">
										<input class="minutesInput" style="text-align: right;" min="1" type="text" size="10" id="qty_id" onkeydown="return numbersonly(event,this.value)" onchange="Multiplication();"/>
									</div>
									<div id="saveQuantity" title="Update quantity" style="display:none;">
				        				<p><bean:message key="BzComposer.invoice.saveItemQuantity"/></p>
				   					</div>
								</td>
								<td style="font-size: 14px;">	
									<div style="padding-top: 0px;" id="td12">
										<input type="text" size="10"  style="text-align: right;" readonly="readonly" id="unitPrice_id" onkeydown="return numbersonly(event,this.value)" onchange="return saveNewUnitPrice();"/>
									</div>
									<div id="SaveUnitPrice" title="Update unit price" style="display:none;">
				        				<p><bean:message key="BzComposer.invoice.saveItemUnitPrice"/></p>
				   					</div>	
								</td>
								<td style="font-size: 14px;">
									<div>
										<input type="text" size="50" readonly="readonly" id="pname_id" onchange="return saveItemName();"/>				
									</div>
									<div id="SaveItemName" title="Update item name" style="display:none;">
				       					<p><bean:message key="BzComposer.invoice.saveItemName"/></p>
				   					</div>
								</td>
								<td style="font-size: 14px;">
									<div id="td7" >
										<input type="hidden" size="10" id="serialNo_id" readonly="readonly" />
									</div>
								</td>
								<td style="font-size: 14px;">				
									<div id="td14" style="display:block;">
										<input type="text" size="10" style="text-align: right;" readonly="true" id="amount_id"/>
									</div>
								</td>
								<td style="font-size: 14px;">
									<div id="td16" style="display:block;">
										<input type="text"  name="itemWeight" style="text-align: right;" size="10" readonly="true" id="weight_id" onkeydown="return numbersonly(event,this.value)" />
									</div>
								</td>				
								<td style="font-size: 14px;">
									<div id="td18" style="display:block;">
										<select id="tax_id">
											<option value="0">No</option>
											<option value="1">Yes</option>
										</select>
									</div>
								</td>
								<td style="padding-right:5px;font-size: 14px;">
									<div>
										<input type="button" class="formbutton" name="addItem" title="To add item click it" onclick="AddItem(this.form);" value='<bean:message key="BzComposer.Invoice.AddItem"/>'  style="padding: 8px 20px 8px 20px; font-size: 16px; margin-top: 0;" />
									</div>
								</td>
								<td colspan="3"></td>
							</tr>
						</table>
						<table class="tabla-listados cart" cellspacing="0">
							<thead>
								<tr>
									<th style="font-size: 14px;">
										<div id="it1">
											<bean:message key="BzComposer.Invoice.ItemID" />
										</div>
									</th>
									<th style="font-size: 14px;">
										<div id="it2">
											<bean:message key="BzComposer.Invoice.Qty" />
										</div>
										<%-- <div id="it22">
											<bean:message key="BzComposer.Invoice.Rate" />
										</div> --%>
									</th>
									<th style="font-size: 14px;">
										<div id="it8">
											<bean:message key="BzComposer.Invoice.SerialNo" />
										</div>
									</th>
									<th style="font-size: 14px;">
										<div id="it3">
											<bean:message key="BzComposer.Invoice.ItemName" />
										</div>
									</th>
									<th style="font-size: 14px;">
										<div id="it4">
											<bean:message key="BzComposer.Invoice.UnitPrice" />
										</div>
										<div id="it42" style="display:none;">
											<bean:message key="BzComposer.Invoice.RatePrice" />
										</div>
									</th>
									<th style="font-size: 14px;">
										<div id="it5">
											<bean:message key="BzComposer.Invoice.Amt" />
										</div>
									</th>
									<th style="font-size: 14px;">
										<div id="it6">
											<bean:message key="BzComposer.Invoice.Weight" />
										</div>
									</th>
									<th style="font-size: 14px;">
										<div id="it7">
											<bean:message key="BzComposer.Invoice.Tax" />
										</div>
									</th>
									<th style="font-size: 14px;">
										<bean:message key="BzComposer.Invoice.DeleteOption" />
									</th>
									<th colspan="3">
									</th>
								</tr>
							</thead>
							<logic:present name="Cart">
								<bean:size id="ctSize" name="Cart" />
									<input type="hidden" name="hdncsize" id="CartSize" value='<bean:write name="ctSize" />'>
									<logic:iterate name="Cart" id="cart" indexId="indx">
										<tr id='<bean:write name="indx" />row'>
											<td align="left" style="font-size: 14px;">
												<div id='<bean:write name="indx" />icode'>
													<bean:write name="cart" property="invCode" />
												</div>
											</td>
											<td align="left" style="font-size: 14px;">
												<div id='<bean:write name="indx" />qt'>
													<bean:write name="cart" property="qty" />
												</div>
											</td>
											<td align="left" style="font-size: 14px;">
												<div id='<bean:write name="indx" />iserial' style="font-size: 14px;">
													<bean:write name="cart" property="serialNo" />
												</div>
											</td>
											<td style="font-size: 14px;">
												<div id='<bean:write name="indx" />desc' style="font-size: 14px;">
													<bean:write name="cart" property="invDesc" />
												</div>
											</td>
											<td align="left" style="font-size: 14px;">
												<div id='<bean:write name="indx" />iprice' style="font-size: 14px;">
													<bean:write name="cart" property="uprice" />
												</div>
											</td>
											<td align="left" style="font-size: 14px;">
												<div id='<bean:write name="indx" />amt' style="font-size: 14px;">
													<bean:write name="cart" property="amount" />
												</div>
											</td>
											<td align="left" style="font-size: 14px;">
												<div id='<bean:write name="indx" />wgt' style="font-size: 14px;">
													<bean:write name="cart" property="weight" />
												</div>
											</td>
											<td align="left" style="font-size: 14px;">
												<div id='<bean:write name="indx" />itax' style="font-size: 14px;">
													<bean:write name="cart" property="tax" />
												</div>
											</td>
											<td align="left" style="font-size: 14px;" colspan="4">
												<img onclick="return DeleteRow('<bean:write name="indx" />row',this.form);" src="<bean:write name="path" property="pathvalue"/>/images/delete.png"
													title="Delete this Item" size="8" width="12"/>
											</td>
										</tr>
											<input type="hidden" id='<bean:write name="indx" />delt' value="0" style="font-size: 14px;"/>
											<input type="hidden" id='<bean:write name="indx" />rowVal' value='<bean:write name="indx" />row' />
											<input type="hidden" id='<bean:write name="indx" />invCode' value='<bean:write name="cart" property="invCode" />' />
											<input type="hidden" id='<bean:write name="indx" />qty' value='<bean:write name="cart" property="qty" />' />
											<input type="hidden" id='<bean:write name="indx" />invDesc' value='<bean:write name="cart" property="invDesc" />' />
											<input type="hidden" id='<bean:write name="indx" />uprice' value='<bean:write name="cart" property="uprice" />' />
											<input type="hidden" id='<bean:write name="indx" />weight' value='<bean:write name="cart" property="weight" />' />
											<input type="hidden" id='<bean:write name="indx" />tax' value='<bean:write name="cart" property="tax" />' />
											<input type="hidden" id='<bean:write name="indx" />serial' value='<bean:write name="cart" property="serialNo" />' />
											<input type="hidden" id='<bean:write name="indx" />itId11' value='<bean:write name="cart" property="itemTypeID" />' />
											<input type="hidden" id='<bean:write name="indx" />invID11' value='<bean:write name="cart" property="inventoryID" />' />
									</logic:iterate>
							</logic:present>
							<logic:notPresent name="Cart">
								<input type="hidden" name="hdncsize" id="CartSize" value="0">
							</logic:notPresent>
							<tr id="tr##">
								<td align="center" style="font-size: 14px;"></td>
								<td align="center" style="font-size: 14px;"></td>
								<td align="center" style="font-size: 14px;"></td>
								<td align="center" style="font-size: 14px;"></td>
								<td align="center" style="font-size: 14px;"></td>
								<td align="center" style="font-size: 14px;"></td>
								<td align="center" style="font-size: 14px;"></td>
								<td align="center" style="font-size: 14px;"></td>
								<td colspan="4"></td>
							</tr>
						</table>
					</div>
				</div>
				<div>
					<bean:size id="txSize" name="Tax" /> <input type="hidden" name="LstSize" id="tSize" value='<bean:write name="txSize" />'> 
						<logic:iterate name="Tax" id="objList" indexId="index">
							<input type="hidden" value='<bean:write name="objList" property="salesTaxID"/>' id='<bean:write name="index" />tx_id' />
							<input type="hidden" value='<bean:write name="objList" property="state"/>' id='<bean:write name="index" />tx' />
							<input type="hidden" value='<bean:write name="objList" property="rate"/>' id='<bean:write name="index" />tx_rt' />
						</logic:iterate>
				</div>
					<table class="tabla-listados" cellspacing="0">
						<thead>
							<tr>
								<th colspan="12" style="font-size: 14px;">
									<bean:message key="BzComposer.Invoice.Summary" />
								</th>
							</tr>
						</thead>
						<tr>
							<td>
							<table>
								<tr>
									<td style="padding-top: 5px;">
										<bean:message key="BzComposer.Invoice.Message" />
									</td>
									<td>
										<html:select property="message" style="width: 400px;">
											<html:option value="0"><bean:message key="BzComposer.ComboBox.Select" /></html:option>
											<html:options collection="Message" property="value" labelProperty="label" />
										</html:select>
									</td>
								</tr>
								<tr>
									<td>
										<bean:message key="BzComposer.Invoice.Memo" />
									</td>
									<td>
										<html:textarea property="memo" rows="3" cols="40" style="width: 400px;">
										</html:textarea>
									</td>
								</tr>
							</table>
							</td>
							<td align="right" style="font-size: 14px;" colspan="3">
								<table>
								
									<tr>
										<td align="right" style="font-size: 14px;">
											<bean:message key="BzComposer.Invoice.Tx" />
										</td>
										<td style="font-size: 14px;">
											<html:select property="taxID" onchange="TaxValue(this.value,this.form);" styleId="taxID" style="width: 120px;">
												<html:option value="0">
													<bean:message key="BzComposer.ComboBox.Select" />
												</html:option>
												<html:options collection="Tax" property="salesTaxID" labelProperty="state" />
											</html:select> 
											<logic:notEmpty name="Tax">
												<input type="hidden" value="" />
											</logic:notEmpty>
										</td>
									</tr>
									<tr>
										<td align="right" style="font-size: 14px;">
											<bean:message key="BzComposer.Invoice.Wght" />
										</td>
										<td align="left" style="font-size: 14px;">
											<html:text property="weight" size="13" onkeydown="return numbersonly(event,this.value)" style="width: 120px; text-align: right;" readonly="true" />
										</td>
									</tr>
									<tr>
										<td style="font-size: 14px;">
											<html:checkbox property="paid">
												&nbsp;<bean:message key="BizComposer.Invoice.Paid" />
											</html:checkbox>
										</td>
										<td nowrap style="font-size: 14px;">
											<html:checkbox property="itemShipped" onclick="ShippedItem(this.form);">
												&nbsp;<bean:message key="BizComposer.Invoice.ItemShippped" />
											</html:checkbox>
										</td>
									</tr>	
								</table>
							</td>
							<td style="font-size: 14px;" colspan="3">
								<table>
									
									<tr>
										<td align="right" style="font-size: 14px;">
											<div id="tax_field">
												<bean:message key="BizComposer.Invoice.TaxField" />
											</div>
										</td>
										<td style="font-size: 14px;">
											<html:text property="tax" style="text-align: right;" readonly="true" />
										</td>
									</tr>
									<tr>
										<td align="right" style="font-size: 14px;">
											<bean:message key="BzComposer.Invoice.Shipping" />
										</td>
										<td style="font-size: 14px;"> 
											<html:text property="shipping" onkeydown="return numbersonly(event,this.value)" onclick="clearShippingCol()" onchange="sumShippingTotal()" style="width: 167px; text-align: right;"/>
										</td>
									</tr>
									<tr>
										<td align="right" style="font-size: 14px;">
											<bean:message key="BzComposer.Invoice.Balanc" />
										</td>
										<td style="font-size: 14px;">
											<html:text property="balance" style="text-align: right;" onclick="clearDiscountCol()" onchange="calDiscountTotal()">
											</html:text>
										</td>
									</tr>			
								</table>
							</td>						
							<td style="font-size: 14px;" colspan="3">
								<table>			
									<tr>
										<td align="right" style="font-size: 14px;">
											<bean:message key="BzComposer.Invoice.Subtotal" />
										</td>
										<td style="font-size: 14px;">
											<html:text property="subtotal" style="text-align: right;" readonly="true"  />
										</td>
									</tr>
									<tr>
										<td align="right" style="font-size: 14px;">
											<bean:message key="BzComposer.Invoice.Tot" />
										</td>
										<td style="font-size: 14px;">
											<html:text property="total" style="text-align: right;" readonly="true" />
										</td>
									</tr>
									<tr>
										<td align="right" style="font-size: 14px;">
											<bean:message key="BzComposer.Invoice.AdjustedTotal" />
										</td>
										<td style="font-size: 14px;">
											<html:text property="adjustedtotal" onkeydown="return numbersonly(event,this.value)" style="text-align: right;" readonly="true"/>
										</td>
										<td>
											<input type="hidden" size="15" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<br>
					<div>
						<input type="hidden" value="0" id="hidn" /> 
						<input type="hidden" value="" id="code11" /> 
						<input type="hidden" value="" id="invStyle" />
						<input type="hidden" value="0" id="amt_id" /> 
						<input type="hidden" value="0" id="tax_val" /> 
						<input type="hidden" value="0" id="itmId" />
						<input type="hidden" value="0" id="itmVal" /> 
						<input type="hidden" value="" id="cid" /> 
						<html:hidden value="0" property="wt" /> 
						<html:hidden property="companyID" /> 
						<html:hidden property="bsAddressID" />
						<html:hidden property="shAddressID"/>
					</div>
					<div>
						<html:hidden property="size" value="" /> 
						<html:hidden property="item" value="" /> 
						<html:hidden property="qty" value="" />
						<html:hidden property="serialNo" value="" /> 
						<html:hidden property="desc" value="" />  
						<html:hidden property="pname" value="" />
						<html:hidden property="unitWeight" value="" /> 
						<html:hidden property="wgt" value="" /> 
						<html:hidden property="uprice" value="" /> 
						<html:hidden property="code" value="" />
						<html:hidden property="isTaxable" value="" /> 
						<html:hidden property="itemTypeID" value="" /> 
						<html:hidden property="itemOrder" value="" />
					</div>
					<!-- end Contents -->
				</div>
		<div class="container">
			<div class="row">
				<div class="col-md-12" style="font-size: 16px;" align="center">
					<html:button styleId="btnNewInvoice" property="New" title="New Invoice" styleClass="formbutton" onclick="NewInvoice();" style="padding: 8px 20px 8px 20px;">
						<bean:message key="BzComposer.global.new" />
					</html:button>
					<html:submit styleId="btnSaveInvoice" property="Save" title="Save Invoice" styleClass="formbutton" onclick="onSave(this.form);"  style="padding: 8px 20px 8px 20px;">
						<bean:message key="BzComposer.global.saveUpdate" />
					</html:submit>
					<html:submit styleId="btnDeleteInvoice"  property="Delete" title="Delete Invoice" styleClass="formbutton" onclick="onDelete(this.form);"  style="padding: 8px 20px 8px 20px;">
						<bean:message key="BzComposer.Invoice.DeleteBtn" />
					</html:submit>
					<html:submit styleId="btnUpdateInvoice" property="Update" styleClass="formbutton" title="Update Customer information" onclick="ShowUpdate(this.form);"  style="padding: 8px 20px 8px 20px;">
						<bean:message key="BzComposer.Invoice.Update" />
					</html:submit>
				</div>
			</div>
		</div>
		<div>
			<input type="hidden" id="tabid" name="tabid" value=""/>
			<input type="hidden" id="request_locale" name="request_locale" value=""/>
		</div>
	</html:form>
</div>
</div>
</div>
</div>
</div>

<%@ include file="/include/footer.jsp"%>

</body>
</html>
<script type="text/javascript">
// this function clear input value,
function clearShippingCol(){
	var convertSubData  =  parseFloat(document.InvoiceForm.total.value) -  parseFloat(document.InvoiceForm.shipping.value);
	document.InvoiceForm.total.value = parseFloat(convertSubData).toFixed(2);
	document.InvoiceForm.shipping.value = 0;
}
// this function sum Shipping value in total
function sumShippingTotal() {
	var convertSubData  =  parseFloat(document.InvoiceForm.total.value) +  parseFloat(document.InvoiceForm.shipping.value);
	document.InvoiceForm.total.value = parseFloat(convertSubData).toFixed(2);
}

//this function clear input value, 
function clearDiscountCol(){
	document.InvoiceForm.adjustedtotal.value = 0;
	var convertSubData  =  parseFloat(document.InvoiceForm.total.value) + parseFloat(document.InvoiceForm.balance.value);
	document.InvoiceForm.balance.value = "";
}
//this function for calculat discount amount 
function calDiscountTotal() {
	var convertSubData  =  parseFloat(document.InvoiceForm.total.value) -  parseFloat(document.InvoiceForm.balance.value);
	document.InvoiceForm.adjustedtotal.value = parseFloat(convertSubData).toFixed(2);
}

	isItemExist=0;
	var wghtArr = new Array(100);
	var itemArr = new Array(100);
	var qtyArr = new Array(100);
	var upriceArr = new Array(100);
	var codeArr = new Array(100);
	var taxArr = new Array(100);
	var descArr = new Array(100);
	var uwghtArr = new Array(100);
	var serialArr = new Array(100);
	var itmIDArr = new Array(100);
	var itmOrdArr = new Array(100);
	
	deleted = 0;
	index1=0;
	cnt=0;
	count=0;
	yestax=0;
	tax_rate=0;

	function Pending_Value(form)
	{
		if(form.isPending.checked==true)
		{
			form.isPending.value="on";
		}
		else
		{
			form.isPending.value="off";
		}	
	}
	
	function TaxaValue(form)
	{
		if(form.taxable.checked==true)
		{
			form.taxable.value="on";
		}
		else
		{
			form.taxable.value="off";
		}
	}
		
	function ShippedItem(form)
	{
		if(form.itemShipped.checked==true)
		{
			form.itemShipped.value="on";
		}
		else
		{
			form.itemShipped.value="off";
		}
	}

	function Assignment(value,form)
	{
		debugger;
		if(value==0)
		{
			debugger;
			document.InvoiceForm.billTo.value="";
			document.InvoiceForm.shipTo.value="";
			document.InvoiceForm.via.value="0"
			document.InvoiceForm.payMethod.value="0";
			document.InvoiceForm.rep.value="0";
			document.InvoiceForm.term.value="0";
			document.InvoiceForm.taxable.checked=false;
		}
		else if(value==1111)
		{
			window.location.href="Customer.do?tabid=NewCutomer";
		}
		else
		{	
			debugger;
			size=document.getElementById("bSize").value;
			shsize=document.getElementById("sSize").value;
			var i;
			for(i=0;i<size;i++)
			{
				var field1 = document.getElementById(i+"clvid").value;
				if(value==field1)
				{
					document.getElementById('cid').value=value;
					form.custID.value=document.getElementById('cid').value;
					form.companyID.value=document.getElementById(i+"cid").value;
					form.bsAddressID.value=document.getElementById(i+"bsaddr").value;
					form.shAddressID.value=document.getElementById(i+"shaddr").value;
					document.InvoiceForm.billTo.value=document.getElementById(i+"bl").value;
						
					break;		
				}
			}
			for(i=0;i<shsize;i++)
			{
				var field2 = document.getElementById(i+"sh_id").value;
				if(value==field2)
				{
					document.InvoiceForm.shipTo.value=document.getElementById(i+"sh").value;
					break;		
				}
			}
			sz = document.getElementById('custSize').value; 
			if(value==0)
			{
					
			}
			for(i=0;i<sz;i++)
			{
				var field11 = document.getElementById("a"+i+"clvndid").value;
				if(value==field11)
				{
					viaitem = document.getElementById(i+"va").value;
					if(viaitem=="")
					{
						document.InvoiceForm.via.value="0";
					}
					else
						document.InvoiceForm.via.value=viaitem;
						repitem=document.getElementById(i+"rp").value;
						if(repitem=="")
							document.InvoiceForm.rep.value="0";
						else
							document.InvoiceForm.rep.value=repitem;
						payitem = document.getElementById(i+"paym").value;
						if(payitem=="")
							document.InvoiceForm.payMethod.value="0";
						else
							document.InvoiceForm.payMethod.value=payitem;
						trmitem = document.getElementById(i+"trm").value;
						if(trmitem=="")
							document.InvoiceForm.term.value="0";
						else
							document.InvoiceForm.term.value=trmitem;
						txid=document.getElementById("a"+i+"txable").value;
						if(txid=="1")
						{
							document.InvoiceForm.taxable.checked=true;	
						}
						else
						{
							document.InvoiceForm.taxable.checked=false;	
						}
						break;
				}
			}
		}
	}
	
	function StyleChange(value)
	{
		document.getElementById('invStyle').value=value;
		size=document.getElementById('CartSize').value;
		hidn_val= document.getElementById('hidn').value;
		if(value==0)
		{
			product();
			/*QTY */
			document.getElementById('td4').style.display='none';
			document.getElementById('td3').style.display='block';		
			document.getElementById('td5').style.display='block';
			/*Serial No */
			document.getElementById('td6').style.display='none';
			document.getElementById('td7').style.display='none';
			/* DESC */	
			//document.getElementById('td8').style.display='block';
			//document.getElementById('td9').style.display='block';
					
			/* Unit Price/RatePrice*/		
			document.getElementById('td11').style.display='none';
			document.getElementById('td10').style.display='block';
			document.getElementById('td12').style.display='block';
			/* Amount*/
			document.getElementById('td13').style.display='block';		
			document.getElementById('td14').style.display='block';
			/* Weight*/	
			document.getElementById('td15').style.display='block';		
			document.getElementById('td16').style.display='block';
			/* Tax */	
			document.getElementById('td17').style.display='block';
			document.getElementById('td18').style.display='block';
				
			productTable(size);
			for(x=0;x<hidn_val;x++)
				productItem(x);					
		}
		if(value!=0)
		{
			document.getElementById('InvStyle').value=value;
			if(value==1)
			{
				service();
				/*QTY */
				document.getElementById('td4').style.display='block';
				document.getElementById('td3').style.display='none';		
				document.getElementById('td5').style.display='block';
				/*Serial No */
				document.getElementById('td6').style.display='none';
				document.getElementById('td7').style.display='none';
				/* DESC */	
				//document.getElementById('td8').style.display='block';
				//document.getElementById('td9').style.display='block';
					
				/* Unit Price/RatePrice*/		
				document.getElementById('td11').style.display='block';
				document.getElementById('td10').style.display='none';
				document.getElementById('td12').style.display='block';
				/* Amount*/
				document.getElementById('td13').style.display='none';		
				document.getElementById('td14').style.display='none';
				/* Weight*/	
				document.getElementById('td15').style.display='none';		
				document.getElementById('td16').style.display='none';
				/* Tax */	
				document.getElementById('td17').style.display='block';
				document.getElementById('td18').style.display='block';
				
				/* item in table */
				var i;
				for(i=0;i<size;i++)
				{
					document.getElementById(i+"icode").style.visibility='visible';
					document.getElementById(i+"qty").style.visibility='visible';
					document.getElementById(i+"desc").style.visibility='visible';
					document.getElementById(i+"iprice").style.visibility='visible';
					document.getElementById(i+"amt").style.visibility='hidden';
					document.getElementById(i+"wgt").style.visibility='hidden';
					document.getElementById(i+"itax").style.visibility='visible';
					document.getElementById(i+"serial").style.visibility='hidden';
				}
				
				document.getElementById("it1").style.visibility='visible';
				document.getElementById("it2").style.display='none';
				document.getElementById("it3").style.visibility='visible';
				document.getElementById("it4").style.display='none';
				document.getElementById("it5").style.visibility='hidden';
				document.getElementById("it6").style.visibility='hidden';
				document.getElementById("it7").style.visibility='visible';
				document.getElementById("it8").style.visibility='hidden';
				document.getElementById("it22").style.display='block';
				document.getElementById("it42").style.display='block';
					
				for(x=0;x<hidn_val;x++)
					serviceItem(x);
			}
			else if(value==2)
			{
				quick(size);
				for(x=0;x<hidn_val;x++)
					quickItem(x);
			}
			else if(value==3)
			{
				manufacture(size)
				for(x=0;x<hidn_val;x++)
					manufactureItem(x);
			}
			else if(value==4)
			{
				product();
				productTable(size);
				for(x=0;x<hidn_val;x++)
					productItem(x);
				
				/*QTY */
				document.getElementById('td4').style.display='none';
				document.getElementById('td3').style.display='block';		
				document.getElementById('td5').style.display='block';
				/*Serial No */
				document.getElementById('td6').style.display='none';
				document.getElementById('td7').style.display='none';
				/* DESC */	
				//document.getElementById('td8').style.display='block';
				//document.getElementById('td9').style.display='block';
					
				/* Unit Price/RatePrice*/		
				document.getElementById('td11').style.display='none';
				document.getElementById('td10').style.display='block';
				document.getElementById('td12').style.display='block';
				/* Amount*/
				document.getElementById('td13').style.display='block';		
				document.getElementById('td14').style.display='block';
				/* Weight*/	
				document.getElementById('td15').style.display='block';		
				document.getElementById('td16').style.display='block';
				/* Tax */	
				document.getElementById('td17').style.display='block';
				document.getElementById('td18').style.display='block';
			}
			else if(value==5)
			{
				finance(size);
				for(x=0;x<hidn_val;x++)
					financeItem(x);
			}
			else if(value==6)
			{
				professional(size);
				for(x=0;x<hidn_val;x++)
				{
					quickItem(x);
				}
			}
			else if(value==7)
			{
				ebusiness(size);
				for(x=0;x<hidn_val;x++)
				{
					ebusinessItem(x);
				}
			}
		}
	}
		
	function service()
	{
		/* hidden field for ship to */
		document.getElementById('ship_label').style.visibility="hidden";
		document.getElementById('ship_id').style.visibility="hidden";
				
		/* hidden field for P.O. Num */
		document.getElementById('po_num_label').style.visibility="hidden";
		document.getElementById('po_num_id').style.visibility="hidden";
				
		/* hidden field for ship date */
		document.getElementById('sh_date_label').style.visibility="hidden";
		document.getElementById('sh_date_id').style.visibility="hidden";
				
		/* hidden field for  rep */
		document.getElementById('rep_label').style.visibility="hidden";
		document.getElementById('rep_id').style.visibility="hidden";
		
		/* hidden field for via */
		document.getElementById('via_label').style.visibility="hidden";
		document.getElementById('via_id').style.visibility="hidden";
		
		/* Visible field for bill to */
		document.getElementById('bill_label').style.visibility="visible";
		document.getElementById('bill_id').style.visibility="visible";
		
		/* Visible field for Term & Payment */
		document.getElementById('td2').style.visibility="visible";		
				
	}
		
	function quick(size)
	{
		/* hidden field for ship to */
		document.getElementById('ship_label').style.visibility="hidden";
		document.getElementById('ship_id').style.visibility="hidden";
		
		/* hidden field for P.O. Num */
		document.getElementById('po_num_label').style.visibility="hidden";
		document.getElementById('po_num_id').style.visibility="hidden";
		
		/* hidden field for ship date */
		document.getElementById('sh_date_label').style.visibility="hidden";
		document.getElementById('sh_date_id').style.visibility="hidden";
		
		/* hidden field for  rep */
		document.getElementById('rep_label').style.visibility="hidden";
		document.getElementById('rep_id').style.visibility="hidden";
		
		/* hidden field for via */
		document.getElementById('via_label').style.visibility="hidden";
		document.getElementById('via_id').style.visibility="hidden";
		
		/* hidden field for bill to */
		document.getElementById('bill_label').style.visibility="hidden";
		document.getElementById('bill_id').style.visibility="hidden";
		
		/* hidden field for Term & Payment */
		document.getElementById('td2').style.visibility="hidden";
				
		/*QTY */
		document.getElementById('td4').style.display='none';
		document.getElementById('td3').style.display='block';		
		document.getElementById('td5').style.display='block';
		
		/*Serial No */
		document.getElementById('td6').style.display='none';
		document.getElementById('td7').style.display='none';
		
		/* DESC */	
		//document.getElementById('td8').style.display='block';
		//document.getElementById('td9').style.display='block';
					
		/* Unit Price/RatePrice*/		
		document.getElementById('td11').style.display='none';
		document.getElementById('td10').style.display='block';
		document.getElementById('td12').style.display='block';
				
		/* Amount*/
		document.getElementById('td13').style.display='block';		
		document.getElementById('td14').style.display='block';
		
		/* Weight*/	
		document.getElementById('td15').style.display='none';		
		document.getElementById('td16').style.display='none';
		
		/* Tax */	
		document.getElementById('td17').style.display='block';
		document.getElementById('td18').style.display='block';
				
		/* Item in Table  */
		quickTable(size);
						
	}
		
	function manufacture(size)
	{
		product();
		
		/*QTY */
		document.getElementById('td4').style.display='none';
		document.getElementById('td3').style.display='block';		
		document.getElementById('td5').style.display='block';
		
		/*Serial No */
		document.getElementById('td6').style.display='block';
		document.getElementById('td7').style.display='block';
			
		/* DESC */	
		//document.getElementById('td8').style.display='block';
		//document.getElementById('td9').style.display='block';
				
		/* Unit Price/RatePrice*/		
		document.getElementById('td11').style.display='none';
		document.getElementById('td10').style.display='block';
		document.getElementById('td12').style.display='block';
			
		/* Amount*/
		document.getElementById('td13').style.display='block';		
		document.getElementById('td14').style.display='block';
			
		/* Weight*/	
		document.getElementById('td15').style.display='none';		
		document.getElementById('td16').style.display='none';
			
		/* Tax */	
		document.getElementById('td17').style.display='block';
		document.getElementById('td18').style.display='block';
					
		/* Item in Table  */
		var i;
		for(i=0;i<size;i++)
		{
			document.getElementById(i+"icode").style.visibility='visible';
			document.getElementById(i+"qty").style.visibility='visible';
			document.getElementById(i+"desc").style.visibility='visible';
			document.getElementById(i+"iprice").style.visibility='visible';
			document.getElementById(i+"amt").style.visibility='visible';
			document.getElementById(i+"wgt").style.visibility='hidden';
			document.getElementById(i+"itax").style.visibility='visible';
			document.getElementById(i+"serial").style.visibility='visible';
		}
		document.getElementById("it1").style.visibility='visible';
		document.getElementById("it2").style.display='block';
		document.getElementById("it3").style.visibility='visible';
		document.getElementById("it4").style.display='block';
		document.getElementById("it5").style.visibility='visible';
		document.getElementById("it6").style.visibility='hidden';
		document.getElementById("it7").style.visibility='visible';
		document.getElementById("it8").style.visibility='visible';
			
		document.getElementById("it22").style.display='none';
		document.getElementById("it42").style.display='none';
				
	}
		
	function product()
	{
		/* visible field for ship to */
		document.getElementById('ship_label').style.visibility="visible";
		document.getElementById('ship_id').style.visibility="visible";
				
		/* visible field for P.O. Num */
		document.getElementById('po_num_label').style.visibility="visible";
		document.getElementById('po_num_id').style.visibility="visible";
				
		/* visible field for ship date */
		document.getElementById('sh_date_label').style.visibility="visible";
		document.getElementById('sh_date_id').style.visibility="visible";
				
		/* Visible field for bill to */
		document.getElementById('bill_label').style.visibility="visible";
		document.getElementById('bill_id').style.visibility="visible";
				
		/* Visible field for Term & Payment */
		document.getElementById('td2').style.visibility="visible";	
				
		/* hidden field for  rep */
		document.getElementById('rep_label').style.visibility="visible";
		document.getElementById('rep_id').style.visibility="visible";
				
		/* hidden field for via */
		document.getElementById('via_label').style.visibility="visible";
		document.getElementById('via_id').style.visibility="visible";
					
	}
		
	function productTable(size)
	{
		var i;
		for(i=0;i<size;i++)
		{
			document.getElementById(i+"icode").style.visibility='visible';
			document.getElementById(i+"qty").style.visibility='visible';
			document.getElementById(i+"desc").style.visibility='visible';
			document.getElementById(i+"iprice").style.visibility='visible';
			document.getElementById(i+"amt").style.visibility='visible';
			document.getElementById(i+"wgt").style.visibility='visible';
			document.getElementById(i+"itax").style.visibility='visible';
			document.getElementById(i+"serial").style.visibility='hidden';
		}
		document.getElementById("it1").style.visibility='visible';
		document.getElementById("it2").style.display='block';
		document.getElementById("it3").style.visibility='visible';
		document.getElementById("it4").style.display='block';
		document.getElementById("it5").style.visibility='visible';
		document.getElementById("it6").style.visibility='visible';
		document.getElementById("it7").style.visibility='visible';
		document.getElementById("it8").style.visibility='hidden';
		document.getElementById("it22").style.display='none';
		document.getElementById("it42").style.display='none';
		
		value=document.getElementById('hidn').value;
		var j;
		for(j=0;j<value;j++)
		{
			document.getElementById(j+'1').style.visibility='visible';
			document.getElementById(j+'2').style.visibility='visible';
			document.getElementById(j+'3').style.visibility='hidden';
			document.getElementById(j+'4').style.visibility='visible';
			document.getElementById(j+'5').style.visibility='visible';
			document.getElementById(j+'6').style.visibility='visible';
			document.getElementById(j+'7').style.visibility='visible';
			document.getElementById(j+'8').style.visibility='visible';
		}
	}
		
	function finance(size)
	{
		service();
		
		/*QTY */
		document.getElementById('td4').style.display='none';
		document.getElementById('td3').style.display='none';		
		document.getElementById('td5').style.display='none';
		
		/*Serial No */
		document.getElementById('td6').style.display='none';
		document.getElementById('td7').style.display='none';
		
		/* DESC */	
		//document.getElementById('td8').style.display='block';
		//document.getElementById('td9').style.display='block';
					
		/* Unit Price/RatePrice*/		
		document.getElementById('td11').style.display='none';
		document.getElementById('td10').style.display='none';
		document.getElementById('td12').style.display='none';
				
		/* Amount*/
		document.getElementById('td13').style.display='block';		
		document.getElementById('td14').style.display='block';
				
		/* Weight*/	
		document.getElementById('td15').style.display='none';		
		document.getElementById('td16').style.display='none';
				
		/* Tax */	
		document.getElementById('td17').style.display='block';
		document.getElementById('td18').style.display='block';
				
		/* Item in Table  */
		var i;
		for(i=0;i<size;i++)
		{
			document.getElementById(i+"icode").style.visibility='visible';
			document.getElementById(i+"qty").style.visibility='hidden';
			document.getElementById(i+"desc").style.visibility='visible';
			document.getElementById(i+"iprice").style.visibility='hidden';
			document.getElementById(i+"amt").style.visibility='visible';
			document.getElementById(i+"wgt").style.visibility='hidden';
			document.getElementById(i+"itax").style.visibility='visible';
			document.getElementById(i+"serial").style.visibility='hidden';
		}
		document.getElementById("it1").style.visibility='visible';
		document.getElementById("it2").style.display='none';
		document.getElementById("it3").style.visibility='visible';
		document.getElementById("it4").style.display='none';
		document.getElementById("it5").style.visibility='visible';
		document.getElementById("it6").style.visibility='hidden';
		document.getElementById("it7").style.visibility='visible';
		document.getElementById("it8").style.visibility='hidden';
		
		document.getElementById("it22").style.display='none';
		document.getElementById("it42").style.display='none';
						
	}
		
	function professional(size){
			service();
			/*QTY */
				document.getElementById('td4').style.display='none';
				document.getElementById('td3').style.display='block';		
				document.getElementById('td5').style.display='block';
				/*Serial No */
				document.getElementById('td6').style.display='none';
				document.getElementById('td7').style.display='none';
				/* DESC */	
// 				document.getElementById('td8').style.display='block';
// 				document.getElementById('td9').style.display='block';
					
				/* Unit Price/RatePrice*/		
				document.getElementById('td11').style.display='none';
				document.getElementById('td10').style.display='block';
				document.getElementById('td12').style.display='block';
				/* Amount*/
				document.getElementById('td13').style.display='block';		
				document.getElementById('td14').style.display='block';
				/* Weight*/	
				document.getElementById('td15').style.display='none';		
				document.getElementById('td16').style.display='none';
				/* Tax */	
				document.getElementById('td17').style.display='block';
				document.getElementById('td18').style.display='block';
				
				quickTable(size);
				
		}
		
		function quickTable(size){
			/* Item in Table  */
				 var i;
				for(i=0;i<size;i++){
					document.getElementById(i+"icode").style.visibility='visible';
					document.getElementById(i+"qty").style.visibility='visible';
					document.getElementById(i+"desc").style.visibility='visible';
					document.getElementById(i+"iprice").style.visibility='visible';
					document.getElementById(i+"amt").style.visibility='visible';
					document.getElementById(i+"wgt").style.visibility='hidden';
					document.getElementById(i+"itax").style.visibility='visible';
					document.getElementById(i+"serial").style.visibility='hidden';
				}
					document.getElementById("it1").style.visibility='visible';
					document.getElementById("it2").style.display='block';
					document.getElementById("it3").style.visibility='visible';
					document.getElementById("it4").style.display='block';
					document.getElementById("it5").style.visibility='visible';
					document.getElementById("it6").style.visibility='hidden';
					document.getElementById("it7").style.visibility='visible';
					document.getElementById("it8").style.visibility='hidden';
					document.getElementById("it22").style.display='none';
					document.getElementById("it42").style.display='none';
				
				value=document.getElementById('hidn').value;
				var j;
				for(j=0;j<value;j++){
					document.getElementById(j+'1').style.visibility='visible';//code
					document.getElementById(j+'2').style.visibility='visible';//qty
					document.getElementById(j+'3').style.visibility='hidden';//serial No
					document.getElementById(j+'4').style.visibility='visible';//desc
					document.getElementById(j+'5').style.visibility='visible';//unit price
					document.getElementById(j+'6').style.visibility='visible';//amount
					document.getElementById(j+'7').style.visibility='hidden';//weight
					document.getElementById(j+'8').style.visibility='visible';//tax
				}
		}
		function ebusiness(size){
			/* visible field for ship to */
				document.getElementById('ship_label').style.visibility="visible";
				document.getElementById('ship_id').style.visibility="visible";
				
				/* visible field for ship date */
				document.getElementById('sh_date_label').style.visibility="visible";
				document.getElementById('sh_date_id').style.visibility="visible";
				
				/* hidden field for  rep */
				document.getElementById('rep_label').style.visibility="visible";
				document.getElementById('rep_id').style.visibility="visible";
				
				/* hidden field for via */
				document.getElementById('via_label').style.visibility="visible";
				document.getElementById('via_id').style.visibility="visible";
				
				
				/*hidden field for P.O. Num */
				document.getElementById('po_num_label').style.visibility="hidden";
				document.getElementById('po_num_id').style.visibility="hidden";
								
				/* hidden field for bill to */
				document.getElementById('bill_label').style.visibility="hidden";
				document.getElementById('bill_id').style.visibility="hidden";
				
				/*QTY */
				document.getElementById('td4').style.display='none';
				document.getElementById('td3').style.display='block';		
				document.getElementById('td5').style.display='block';
				/*Serial No */
				document.getElementById('td6').style.display='none';
				document.getElementById('td7').style.display='none';
				/* DESC */	
// 				document.getElementById('td8').style.display='block';
// 				document.getElementById('td9').style.display='block';
					
				/* Unit Price/RatePrice*/		
				document.getElementById('td11').style.display='none';
				document.getElementById('td10').style.display='none';
				document.getElementById('td12').style.display='none';
				/* Amount*/
				document.getElementById('td13').style.display='block';		
				document.getElementById('td14').style.display='block';
				/* Weight*/	
				document.getElementById('td15').style.display='none';		
				document.getElementById('td16').style.display='none';
				/* Tax */	
				document.getElementById('td17').style.display='none';
				document.getElementById('td18').style.display='none';
				
				/* Item in Table  */
				 var i;
				for(i=0;i<size;i++){
					document.getElementById(i+"icode").style.visibility='visible';
					document.getElementById(i+"qty").style.visibility='visible';
					document.getElementById(i+"desc").style.visibility='visible';
					document.getElementById(i+"iprice").style.visibility='hidden';
					document.getElementById(i+"amt").style.visibility='visible';
					document.getElementById(i+"wgt").style.visibility='hidden';
					document.getElementById(i+"itax").style.visibility='hidden';
					document.getElementById(i+"serial").style.visibility='hidden';
				}
					document.getElementById("it1").style.visibility='visible';
					document.getElementById("it2").style.display='block';
					document.getElementById("it3").style.visibility='visible';
					document.getElementById("it4").style.display='none';
					document.getElementById("it5").style.visibility='visible';
					document.getElementById("it6").style.visibility='hidden';
					document.getElementById("it7").style.visibility='hidden';
					document.getElementById("it8").style.visibility='hidden';
				
					document.getElementById("it22").style.display='none';
					document.getElementById("it42").style.display='none';
					
		}
		function TaxValue1(value){
			debugger;
			size=document.getElementById("tSize").value;
			if(value==0){
				document.getElementById('tax_field').innerHTML="0.0 %";
				rate = 0;
				tax_rate=0;
				document.getElementById('tax_val').value=rate;
			}
			else{
				for(i=0;i<size;i++){
					var field = document.getElementById(i+"tx_id").value;
					if(value==field){
						rt = document.getElementById(i+"tx_rt").value;
						document.getElementById('tax_field').innerHTML=rt+" %";
						rate = ( ((yestax/1 ) * (rt/1)) / 100 ).toFixed(2);	
						document.getElementById('tax_val').value=rate;		
						tax_rate=rt;
						break;		
					}
				}
			}
			}
		function TaxValue(value,form){
			
			tot = form.shipping.value;
			subtotal = form.subtotal.value;
			
   			
			size=document.getElementById("tSize").value;
			if(value==0){
				document.getElementById('tax_field').innerHTML="0.0 %";
				rate = 0;
				tax_rate=0;
				document.getElementById('tax_val').value=rate;
			}
			else{
				for(i=0;i<size;i++){
					var field = document.getElementById(i+"tx_id").value;
					if(value==field){
						rt = document.getElementById(i+"tx_rt").value;
						document.getElementById('tax_field').innerHTML=rt+" %";
						rate = ( ((yestax/1 ) * (rt/1)) / 100 ).toFixed(2);	
						document.getElementById('tax_val').value=rate;		
						tax_rate=rt;
						break;		
					}
				}
			}
			
			document.InvoiceForm.tax.value=rate;
			total = ((tot/1) + (subtotal/1)+(rate)/1);
			document.InvoiceForm.total.value=total.toFixed(2);
		}
		
		function AddItem(form){
			if(form.itemID.value==0 ||form.itemID.value==01){
				document.getElementById('serialNo_id').value="";
				document.getElementById('qty_id').value="";
			
				document.getElementById('unitPrice_id').value="";
				document.getElementById('amount_id').value="";
				document.getElementById('weight_id').value="";
				document.getElementById('pname_id').value="";
				return showSelectItemDialog();			
			}
			else{
				isItemExist++;
				style = document.getElementById('invStyle').value;
				/* var wtft = form.weight.value;
				var wtf = wtft.tiFixed(2); */
				wt =  form.weight.value;
				hidn_val= document.getElementById('hidn').value;
				
				var tr = document.createElement("tr");
				tr.setAttribute("id", "tr"+hidn_val);
			
				var tr2 = document.getElementById('tr##');
				var parentTr = tr2.parentNode;
				parentTr.insertBefore(tr, tr2);
				
				serialNo = document.getElementById('serialNo_id').value;

				var desc = document.getElementById('pname_id').value;
				weight = document.getElementById('weight_id').value;
				tax = document.getElementById('tax_id').value;
				ivcode = document.getElementById('code11').value;
				
				qty=document.getElementById('qty_id').value;
				uprice=document.getElementById('unitPrice_id').value;
				
				var td1 = document.createElement("td");
				td1.setAttribute("align", "left");
				td1.setAttribute("id",hidn_val+"1");
				tr.appendChild(td1);
   				td1.innerHTML=ivcode;
   				
   				var td2 = document.createElement("td");
				td2.setAttribute("align", "left");
				td2.setAttribute("id",hidn_val+"2");
				tr.appendChild(td2);
   				td2.innerHTML=qty;
								
				var td3 = document.createElement("td");
				td3.setAttribute("align", "left");
				td3.setAttribute("id",hidn_val+"3");
				tr.appendChild(td3);
				td3.innerHTML=serialNo;
				
				var td4 = document.createElement("td");
				td4.setAttribute("align", "left");
				td4.setAttribute("id",hidn_val+"4");
				tr.appendChild(td4);
   				td4.innerHTML=desc;   				
   				
   				var td5 = document.createElement("td");
				td5.setAttribute("align", "left");
				td5.setAttribute("id",hidn_val+"5");
				tr.appendChild(td5);
   				td5.innerHTML=uprice;
			
				amt=( (qty/1) * (uprice/1) );
				document.getElementById('amount_id').value=amt.toFixed(2);
				
				var td6 = document.createElement("td");
				td6.setAttribute("align", "left");
				td6.setAttribute("id",hidn_val+"6");
				tr.appendChild(td6);
   				td6.innerHTML=amt.toFixed(2);;
   			
	   			var td7 = document.createElement("td");
				td7.setAttribute("align", "left");
				td7.setAttribute("id",hidn_val+"7");
				tr.appendChild(td7);
   				td7.innerHTML=weight;
   			
				var t="";
				if(tax==0){
					t="No";
				}
				else{
					t="Yes";
					yestax = ((yestax/1) + (amt/1)).toFixed(2);
				}
   				
   				subtotal= form.subtotal.value;
				subtotal = ((subtotal/1) + (amt/1)).toFixed(2);;
				form.subtotal.value=subtotal;
				tax_val=((yestax * tax_rate) / 100 ).toFixed(2);	
				
				document.InvoiceForm.tax.value=tax_val;
				
				tot=(form.shipping.value);
				total = ((tot/1) + (subtotal/1) + (tax_val/1)).toFixed(2);
				form.total.value=total;
   				
   				form.subtotal.value=subtotal;
				document.getElementById('amt_id').value=subtotal;
				
   				var td8 = document.createElement("td");
				td8.setAttribute("align", "left");
				td8.setAttribute("id",hidn_val+"8");
				tr.appendChild(td8);
				td8.innerHTML=t;
				
				var button='<img onclick="DeleteRow1('+hidn_val+',this.form);" width="12" src="<bean:write name="path" property="pathvalue"/>/images/delete.png" title="Delete" size="8"/>';
				
				var td9 = document.createElement("td");
				td9.setAttribute("align", "left");
				td9.setAttribute("colspan","4");
				tr.appendChild(td9);
				td9.innerHTML=button;
							
				val=(( wt / 1 ) + (weight/1) );
				
				itemVal=document.getElementById('itmVal').value;
				//wghtArr[indx]=val;
				itemArr[index1]=itemVal;
				qtyArr[index1]=qty;
				upriceArr[index1]=uprice;

				codeArr[index1]=ivcode;
				taxArr[index1]=tax;
				descArr[index1]=desc;
				uwghtArr[index1]=weight;
				serialArr[index1]=serialNo;
				itmIDArr[index1]=document.getElementById('itmId').value;
				
				index1++;
				
				form.weight.value=val;
				form.wt.value=val;
				if(style==0 || style==4){//Product/select
					
					productItem(hidn_val);
				}
				if(style==1){//service
					serviceItem(hidn_val);
	
				}
				if(style==2 || style==6){//Quick/Professional
					quickItem(hidn_val);
				}
				
				if(style==3){
					manufactureItem(hidn_val);
				}
				
				if(style==5){//Finance
					financeItem(hidn_val);
				}
				
				if(style==7){//Ebusinness
					ebusinessItem(hidn_val);
				}
				//form.amount.value+=amt+";"
				
				hidn_val=( (hidn_val/1) + 1);
				//alert("DDD" +hidn_val);
				document.getElementById('hidn').value=hidn_val;
				
   			}	
		}
		
		function productItem(hidn_val){
					document.getElementById(hidn_val+"3").style.visibility='hidden';
					document.getElementById(hidn_val+"1").style.visibility='visible';
					document.getElementById(hidn_val+"2").style.visibility='visible';
					document.getElementById(hidn_val+"4").style.visibility='visible';
					document.getElementById(hidn_val+"5").style.visibility='visible';
					document.getElementById(hidn_val+"6").style.visibility='visible';
					document.getElementById(hidn_val+"7").style.visibility='visible';
					document.getElementById(hidn_val+"8").style.visibility='visible';
					
					document.getElementById("it1").style.visibility='visible';
					document.getElementById("it2").style.display='block';
					document.getElementById("it3").style.visibility='visible';
					document.getElementById("it4").style.display='block';
					document.getElementById("it5").style.visibility='visible';
					document.getElementById("it6").style.visibility='visible';
					document.getElementById("it7").style.visibility='visible';
					document.getElementById("it8").style.visibility='hidden';
					document.getElementById("it22").style.display='none';
					document.getElementById("it42").style.display='none';
		}
		
		function serviceItem(hidn_val){
					document.getElementById(hidn_val+"3").style.visibility='hidden';
					document.getElementById(hidn_val+"1").style.visibility='visible';
					document.getElementById(hidn_val+"2").style.visibility='visible';
					document.getElementById(hidn_val+"4").style.visibility='visible';
					document.getElementById(hidn_val+"5").style.visibility='visible';
					document.getElementById(hidn_val+"6").style.visibility='hidden';
					document.getElementById(hidn_val+"7").style.visibility='hidden';
					document.getElementById(hidn_val+"8").style.visibility='visible';
					
					document.getElementById("it1").style.visibility='visible';
					document.getElementById("it2").style.display='none';
					document.getElementById("it3").style.visibility='visible';
					document.getElementById("it4").style.display='none';
					document.getElementById("it5").style.visibility='hidden';
					document.getElementById("it6").style.visibility='hidden';
					document.getElementById("it7").style.visibility='visible';
					document.getElementById("it8").style.visibility='hidden';
					document.getElementById("it22").style.display='block';
					document.getElementById("it42").style.display='block';
		}
		
		function quickItem(hidn_val){
					document.getElementById(hidn_val+"3").style.visibility='hidden';
					document.getElementById(hidn_val+"1").style.visibility='visible';
					document.getElementById(hidn_val+"2").style.visibility='visible';
					document.getElementById(hidn_val+"4").style.visibility='visible';
					document.getElementById(hidn_val+"5").style.visibility='visible';
					document.getElementById(hidn_val+"6").style.visibility='visible';
					document.getElementById(hidn_val+"7").style.visibility='hidden';
					document.getElementById(hidn_val+"8").style.visibility='visible';
					
					document.getElementById("it1").style.visibility='visible';
					document.getElementById("it2").style.display='block';
					document.getElementById("it3").style.visibility='visible';
					document.getElementById("it4").style.display='block';
					document.getElementById("it5").style.visibility='visible';
					document.getElementById("it6").style.visibility='hidden';
					document.getElementById("it7").style.visibility='visible';
					document.getElementById("it8").style.visibility='hidden';
					document.getElementById("it22").style.display='none';
					document.getElementById("it42").style.display='none';
		}
		
		function manufactureItem(hidn_val){
					document.getElementById(hidn_val+"3").style.visibility='visible';
					document.getElementById(hidn_val+"1").style.visibility='visible';
					document.getElementById(hidn_val+"2").style.visibility='visible';
					document.getElementById(hidn_val+"4").style.visibility='visible';
					document.getElementById(hidn_val+"5").style.visibility='visible';
					document.getElementById(hidn_val+"6").style.visibility='visible';
					document.getElementById(hidn_val+"7").style.visibility='hidden';
					document.getElementById(hidn_val+"8").style.visibility='visible';
					
					document.getElementById("it1").style.visibility='visible';
					document.getElementById("it2").style.display='block';
					document.getElementById("it3").style.visibility='visible';
					document.getElementById("it4").style.display='block';
					document.getElementById("it5").style.visibility='visible';
					document.getElementById("it6").style.visibility='hidden';
					document.getElementById("it7").style.visibility='visible';
					document.getElementById("it8").style.visibility='visible';
				
					document.getElementById("it22").style.display='none';
					document.getElementById("it42").style.display='none';
		}
		
		function financeItem(hidn_val){
					document.getElementById(hidn_val+"3").style.visibility='hidden';
					document.getElementById(hidn_val+"1").style.visibility='visible';
					document.getElementById(hidn_val+"2").style.visibility='hidden';
					document.getElementById(hidn_val+"4").style.visibility='visible';
					document.getElementById(hidn_val+"5").style.visibility='hidden';
					document.getElementById(hidn_val+"6").style.visibility='visible';
					document.getElementById(hidn_val+"7").style.visibility='hidden';
					document.getElementById(hidn_val+"8").style.visibility='visible';
					
					document.getElementById("it1").style.visibility='visible';
					document.getElementById("it2").style.display='none';
					document.getElementById("it3").style.visibility='visible';
					document.getElementById("it4").style.display='none';
					document.getElementById("it5").style.visibility='visible';
					document.getElementById("it6").style.visibility='hidden';
					document.getElementById("it7").style.visibility='visible';
					document.getElementById("it8").style.visibility='hidden';
					
					document.getElementById("it22").style.display='none';
					document.getElementById("it42").style.display='none';
		}
		
		function ebusinessItem(hidn_val){
					document.getElementById(hidn_val+"3").style.visibility='hidden';
					document.getElementById(hidn_val+"1").style.visibility='visible';
					document.getElementById(hidn_val+"2").style.visibility='visible';
					document.getElementById(hidn_val+"4").style.visibility='visible';
					document.getElementById(hidn_val+"5").style.visibility='hidden';
					document.getElementById(hidn_val+"6").style.visibility='visible';
					document.getElementById(hidn_val+"7").style.visibility='hidden';
					document.getElementById(hidn_val+"8").style.visibility='hidden';
					
					document.getElementById("it1").style.visibility='visible';
					document.getElementById("it2").style.display='block';
					document.getElementById("it3").style.visibility='visible';
					document.getElementById("it4").style.display='none';
					document.getElementById("it5").style.visibility='visible';
					document.getElementById("it6").style.visibility='hidden';
					document.getElementById("it7").style.visibility='hidden';
					document.getElementById("it8").style.visibility='hidden';
				
					document.getElementById("it22").style.display='none';
					document.getElementById("it42").style.display='none';
			
		}
			
		function ItemChange(value){					
			if(value == '01')
			{
				document.getElementById('qty_id').value="";

				document.getElementById('unitPrice_id').value="";
				document.getElementById('amount_id').value="";
				document.getElementById('weight_id').value="";
				document.getElementById('tax_id').value="";
				document.getElementById('pname_id').value="";
				
				document.getElementById('qty_id').readonly="true";
				document.getElementById('unitPrice_id').readonly="true";
				document.getElementById('weight_id').readonly="true";
				document.getElementById('code11').value=document.getElementById(count+'code').value;								
			}
			var size = document.getElementById('itemSize').value;
			var count;
			for(count=0;count<size;count++){
				var invID = document.getElementById(count+'inv').value;
				if(value==invID){
					
					var category = document.getElementById(count+'cat').value;
					if(category==1){
						//document.getElementById('serialNo_id').value="";
						document.getElementById('qty_id').value="";
// 						document.getElementById('desc_id').value="";
						document.getElementById('unitPrice_id').value="";
						document.getElementById('amount_id').value="";
						document.getElementById('weight_id').value="";
						document.getElementById('tax_id').value="";
						
						document.getElementById('qty_id').readonly="true";
						document.getElementById('unitPrice_id').readonly="true";
						document.getElementById('weight_id').readonly="true";
						document.getElementById('code11').value=document.getElementById(count+'code').value;
					}
					else{
						var qty = 1;

						//	You can not enter more then your available stock using this function
						var qtyVal = document.getElementById(count+'q').value;
						document.getElementById('qty_id').max = qtyVal;
						var qtyMax = document.getElementById('qty_id').max;
						var qtyMin = 1;
						//you can replace eventListner like keyup keypress blur change

						$(".minutesInput").on('keyup', function(e) {
							debugger;
						    var num = parseInt(this.value, 10),
						        min = qtyMin,
						        max = qtyMax;

						    if (isNaN(num)) {
						        this.value = "";
						        return;
						    }

						    this.value = Math.max(num, min);
						    this.value = Math.min(num, max);
						});
						
						var uprice = document.getElementById(count+'price').value;
						var serialNo = document.getElementById(count+'serial').value;
						document.getElementById('serialNo_id').readonly="false";
						document.getElementById('qty_id').readonly="false";
						document.getElementById('unitPrice_id').readonly="false";
						document.getElementById('weight_id').readonly="false";
						
						document.getElementById('serialNo_id').value=serialNo;
						document.getElementById('qty_id').value=qty;
// 						document.getElementById('desc_id').value=document.getElementById(count+'desc').value;
						document.getElementById('pname_id').value=document.getElementById(count+'pname').value;
						document.getElementById('unitPrice_id').value=uprice;
						amt=((qty/1)*(uprice/1)).toFixed(2);;
						document.getElementById('amount_id').value=amt;
						document.getElementById('weight_id').value=document.getElementById(count+'wt').value;
						document.getElementById('code11').value=document.getElementById(count+'code').value;
						document.getElementById('itmId').value=document.getElementById(count+'itmId').value;
						document.getElementById('itmVal').value=value;
					}
				}				
			}
		}
		
		function Multiplication(){
			var qty=document.getElementById('qty_id').value;
			var uprice = document.getElementById('unitPrice_id').value;
			
			var amount=qty*uprice;
			document.getElementById('amount_id').value=amount.toFixed(2);	
			
			return updateQuantityOfSelectedItem();
		}
		
		function AddTotal(form){
			value=prompt("Enter Adjusted Amount","");
			alert(value);
			form.adjustedtotal.value=value;
		}
				
		function Init(){
			var sortId = '<%= request.getAttribute("sortById")%>';
			debugger
			
			$('select[id="taxID"]').find('option[value="13"]').attr("selected",true);
			TaxValue1(13);
			var field = document.getElementById(i+"tx_id").value;
			document.getElementById('tax_val').value=rate;
            $('select[id="itemID"]').find('option[value="0"]').attr("selected",true);
            isItemExist=document.getElementById('CartSize').value;		
			var initPending='<bean:write name="InvoiceForm" property="isPending"/>';
			if(initPending == 'true'){	
				toggle_visibility('pending');
			}
			<logic:present name="Style">
				    StyleChange(<bean:write name="Style"/>);
			</logic:present>
			<logic:notPresent name="Style">
					StyleChange(document.InvoiceForm.invoiceStyle.value);
			</logic:notPresent>
			var i;
			for(i=0;i<100;i++){
				deleted[i]=0;
			}
			for(j=0;j<100;j++){
				wghtArr[j]=0;
				itemArr[j]=0;
				qtyArr[j]=0;
				upriceArr[j]=0;
				codeArr[j]=0;
				taxArr[j]=0;
				descArr[j]=0;
				uwghtArr[j]=0;
				serialArr[j]=0;
				itmIDArr[j]=0;				
			}
			<logic:present name="TaxValue">
				yestax = <bean:write name="TaxValue" property="taxValue"/>;
				val = document.InvoiceForm.taxID.value;
				if(value!=0){
					for(i=0;i<size;i++){
						var field = document.getElementById(i+"tx_id").value;
						if(val==field){
							rt = document.getElementById(i+"tx_rt").value;
							document.getElementById('tax_field').innerHTML=rt+" %";
							rate = ( ((yestax/1 ) * (rt/1)) / 100 ).toFixed(2);	
							document.getElementById('tax_val').value=rate;		
							tax_rate=rt;
							break;		
						}
					}
				}
			</logic:present>
			/*To display data either in readonly or not*/
			var readOnly = <%= request.getAttribute("readData") %>
			//alert("ReadData value:"+readOnly);
			if(readOnly)
			{
				$('#newInvoice').prop('disabled', true);
				$('#btnNewInvoice').prop('disabled', true);
				$('#btnSaveInvoice').prop('disabled', true);
				$('#btnUpdateInvoice').prop('disabled', true);
				$('#btnDeleteInvoice').prop('disabled', true);
				$(':input[type="text"]').prop('disabled', false);
				$('input[type=text],textarea').prop('readonly', true);
				$('#custID').prop('readonly', true);
				$('#invoiceStyle').prop('readonly',true);
				$("#sortByLastName").prop('checked',false);
			}
			else
			{
				$('#newInvoice').prop('disabled', false);
				$('#btnNewInvoice').prop('disabled', false);
				$('#btnSaveInvoice').prop('disabled', false);
				$('#btnUpdateInvoice').prop('disabled', false);
				$('#btnDeleteInvoice').prop('disabled', false);
				$('input[type=text],textarea').prop('readonly', false);
				$('#custID').prop('readonly', true);
				$('#invoiceStyle').prop('readonly',true);
				$("#sortByLastName").prop('checked',false);
			}
		}
		
		function onSave(form)
		{
			debugger;
			No=form.orderNo.value;
			debugger;
			var bill=form.billTo.value;
			debugger;
			if(form.custID.value==0)
			{							
				return showValidationDialog();
			}
			else if(isItemExist <=0)
			{
				return showSelectItemDialog();
			}
			else
			{
				if(No.length==0 || No==0)
				{
					return showItemOrderNumberDialog();
				}
				else
				{
					event.preventDefault();
					$("#saveInvoice").dialog({
					    	resizable: false,
					        height: 200,
					        width: 500,
					        modal: true,
					        buttons: {
					            "<bean:message key='BzComposer.global.ok'/>": function () {
					                
					            	$(this).dialog("close");
					            	debugger;
					                subtotal=form.subtotal.value;
					                debugger;
									value = form.taxID.value;
									debugger;
									sze=document.getElementById("tSize").value;
									debugger;
									var rt=0;
									for(i=0;i<sze;i++)
									{
										var field = document.getElementById(i+"tx_id").value;
										if(value==field)
										{
											rt = document.getElementById(i+"tx_rt").value;
											document.getElementById('tax_field').innerHTML=rt+" %";
											rt = ((((yestax)/1 ) * (rt/1)) / 100 ).toFixed(2);
											document.getElementById('tax_val').value=rt;
											
											break;		
										}
									}
									debugger;
									subtotal = form.subtotal.value;
									debugger;
									shipping = form.shipping.value;
									debugger;
									total = ( (rt/1) + (subtotal/1) + (shipping/1)).toFixed(2);
									debugger;
									form.total.value=total;
									debugger;
									form.tax.value=rt;
									debugger;
									val1 = document.getElementById('hidn').value;
									val =((val1)/1 - (deleted)/1);
									form.size.value=val/1;
									var x;
									
									var idV=0;
									for(x=0;x<val1;x++)
									{
										value = itemArr[x];
										if(value!=-1)
										{
										
											form.item.value+=itemArr[x]+";";
											form.qty.value+=qtyArr[x]+";";
											form.uprice.value+=upriceArr[x]+";";
											form.code.value+=codeArr[x]+";";
											form.isTaxable.value+=taxArr[x]+";";
											form.desc.value+=descArr[x]+";";
											form.unitWeight.value+=uwghtArr[x]+";";
											form.wgt.value+="0"+";";
											form.serialNo.value+=serialArr[x]+";";
								
											form.itemTypeID.value+=itmIDArr[x]+";";
											form.itemOrder.value+=idV+";";
											idV++;
										}
									}
									debugger;
									csize = document.getElementById('CartSize').value		
									debugger;				
									if(csize!=0)
									{
										val=((csize/1) + (val)/1) ;
										var i;
										ordVal = ( ((document.getElementById('hidn').value)/1) + 1 );
								 		for(i=0;i<csize;i++)
										{
											rowid=document.getElementById(i+'delt').value
											if(rowid=="del")
											{
												cnt++;
											}
											else if(rowid=="0")
											{
												form.code.value+=document.getElementById(i+"invCode").value+";";
												form.qty.value+= document.getElementById(i+"qty").value+";";
												form.desc.value+= document.getElementById(i+"invDesc").value+";";
												form.uprice.value+= document.getElementById(i+"uprice").value+";";
												form.unitWeight.value+= document.getElementById(i+"weight").value+";";
												form.wgt.value+="0"+";";
									
												form.serialNo.value+=document.getElementById(i+"serial").value+";";
									
												itid=document.getElementById(i+'itId11').value;
												form.itemTypeID.value+=itid+";";
												form.itemOrder.value+=idV+";";
												valTax=document.getElementById(i+"tax").value;
												if(valTax=="Yes")
												{
													form.isTaxable.value+="1"+";";
												}
												else
												{
													form.isTaxable.value+="0"+";";
												}
												idV++;
									
												itemVal=document.getElementById(i+'invID11').value;
									
												form.item.value+=itemVal+";";
											}
										}
										val=((((val)/1 - (cnt)/1)));
										form.size.value=val;
									}
									debugger;
									var amount = document.getElementById("amount_id").value;
									debugger;
									var custID = form.custID.value;
									debugger;
									var bsAddressID = form.bsAddressID.value;
									debugger;
									var shAddressID = form.shAddressID.value;
									debugger;
									//debugger;
									document.forms["frmInvoice"].action = "Invoice.do?tabid=SaveInvoice&custID="+custID;
									//debugger;
									//document.getElementById('tabid').value="SaveInvoice";
									//debugger;
									document.forms["frmInvoice"].submit();
									debugger;
									//window.location = "Invoice.do?tabid=SaveInvoice&custID="+custID;			//Commented on 17-10-2019
									debugger;
									//document.forms[0].submit();
					            },
					            <bean:message key='BzComposer.global.cancel'/>: function () {
					                $(this).dialog("close");
					                return false;
					            }
					        }
					    });
					    return false;
				}
			}	
		}
		
		function NewInvoice(){
			window.location.href="Invoice.do?tabid=NewInvoice";
		}
		
		function onDelete(form){
			
			No=form.orderNo.value;
			cid = form.custID.value;
			if(cid==0){
				return showValidationDialog();
			}
			else{
				if(No.length==0 || No==0){
					return showItemOrderNumberDialog();
				}
				else{
					return deleteInvoiceDialog();
				}
			}
		}
		function ShowUpdate(form){
			cid=form.custID.value;
			if(cid==0){
				return showValidationDialog();
			}
			else{
				window.open("EditCustomer.do?tabid=editCustomer&cvId="+cid,null,"scrollbars=yes,height=600,width=1225,status=yes,toolbar=no,menubar=no,location=no" );
			}
		}
		function FirstInvoice(){
			window.location.href="Invoice.do?tabid=FirstInvoice";
		}
		function LastInvoice(){
			window.location.href="Invoice.do?tabid=LastInvoice";
		}
		
		function PreviousInvoice(){
			window.location.href="Invoice.do?tabid=PreviousInvoice";
		}
		
		function NextInvoice(){
			window.location.href="Invoice.do?tabid=NextInvoice";
		}
		
		function paymentHistory(form){
			cid=form.custID.value;
			if(cid==0){
				return showValidationDialog();
			}
			else{
				window.open("Invoice.do?tabid=PaymentHistory&CustId="+cid,null,"scrollbars=yes,height=500,width=900,status=yes,toolbar=no,menubar=no,location=no" );
			}
		}
			
		function numbersonly(e,val){
			
		var temp=val.indexOf(".");
		var key=e.charCode? e.charCode : e.keyCode;
		if(window.event){
               	if(window.event.ctrlKey)
                        isCtrl = true;
                else
                    isCtrl = false;
        }
        else{
                if(e.ctrlKey)
                        isCtrl = true;
                else
                        isCtrl = false;
        }
        if(isCtrl){ 
	        if("v" == String.fromCharCode(key).toLowerCase()) {
	        	return false;
            }
            if("x" == String.fromCharCode(key).toLowerCase()) {
                return false;
            }
        }
		else if (key!=8){
			var str =String(val);
			var temp=val.indexOf(".");
			index=0;		
			for(i=0;i<str.length;i++){
				if(str.charAt(i)=='.'){
					index=1;
					break;
				}
			}
			if(key==46 && temp==-1){
				 return true;
			} 
			else if(key==37 || key==39){
				return true; 	
			}
			else if(key==110 && index==0){
				return true;
			}
			else if(key==190 && index==0){
				return true;
			}
			else if(key>=96 && key<=105){
				return true; 	
			}
			else if (key<48||key>57) //if not a number
				return false; //disable key press
		}
		}
					
		function SendMail(form)
		{
			cid=form.orderNo.value;
			window.open("Invoice.do?tabid=ShowEmail&OrderNo="+cid,null,"scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no" );
		}
		
		function DeleteRow(d,form)
		{
			event.preventDefault();
			$("#deleteRowDialog").dialog({
			    	resizable: false,
			        height: 200,
			        width: 300,
			        modal: true,
			        buttons: {
			            "<bean:message key='BzComposer.global.ok'/>": function () {
			            	
			            	$(this).dialog("close");
			                
			                size=document.getElementById('CartSize').value;
							isItemExist--;
							for(jj=0;jj<size;jj++)
							{
								rowId=document.getElementById(jj+'rowVal').value;
								if(d==rowId)
								{
									debugger;
									var rt=0;
									document.getElementById(d).style.display='none';
									
									document.getElementById(jj+'delt').value="del";
												
									qty1=document.getElementById(jj+'qty').value;
									
									uprice1=document.getElementById(jj+'uprice').value;
									
									amt = ((qty1)/1 * (uprice1)/1);
									
									wegt=document.getElementById(jj+'weight').value;
									w=document.InvoiceForm.weight.value;
									wg=( (w)/1 - (wegt)/1);
									document.InvoiceForm.weight.value=wg.toFixed(2);
										
									subtotal= document.InvoiceForm.subtotal.value;
									
									subtotal = ((subtotal/1) - (amt/1));
									valu=document.InvoiceForm.taxID.value;
									subtotal=subtotal.toFixed(2);
									document.InvoiceForm.subtotal.value=subtotal;
									sze=document.getElementById("tSize").value;	  	
									var taxid = document.getElementById(jj+"tax").value;					
										
				   					for(i=0;i<sze;i++)
				   					{
				   						var field = document.getElementById(i+"tx_id").value;
										if(valu==field)
										{
											if(taxid=="Yes")
											{
												rt = document.getElementById(i+"tx_rt").value;
												document.getElementById('tax_field').innerHTML=rt+" %";
													
												yestax = (yestax - (amt/1)).toFixed(2);
												tax_rate=rt;
												rt = (yestax * (rt/1))/100;
												document.getElementById('tax_val').value=rt;
												break;		
											}
										}
									}
									rt = (yestax * (tax_rate/1))/100;
									shipping = document.InvoiceForm.shipping.value;
									total = ( (rt/1) + (subtotal/1) + (shipping/1));
									document.InvoiceForm.total.value=total.toFixed(2);
									document.InvoiceForm.tax.value=rt;
									break;
								}
							}
			            },
			            <bean:message key='BzComposer.global.cancel'/>: function () {
			                $(this).dialog("close");
			                return false;
			            }
			        }
			    });
			    return false;
			}
		
	function DeleteRow1(d,form)
	{
		
		event.preventDefault();
		 $("#deleteRowDialog").dialog({
		    	resizable: false,
		        height: 200,
		        width: 350,
		        modal: true,
		        buttons: {
		            "<bean:message key='BzComposer.global.ok'/>": function () {
		            	$(this).dialog("close");
		            	
						document.getElementById('tr'+d).style.display='none';
						isItemExist--;
						for(jj=0;jj<=index1;jj++)
						{
							if(d==jj)
							{
								itemArr[jj]=-1;
								qty1=qtyArr[jj];
								uprice1=upriceArr[jj];
								t = taxArr[jj];
								qtyArr[jj]=-1;
								upriceArr[jj]=-1;
								codeArr[jj]=-1;
								taxArr[jj]=-1;
								descArr[jj]=-1;
								wegt=uwghtArr[jj];
								uwghtArr[jj]=-1;
								serialArr[jj]=-1;
								itmIDArr[jj]=-1;
							
								amt = ((qty1)/1 * (uprice1)/1).toFixed(2);

								w=document.InvoiceForm.weight.value;
								wg=( (w)/1 - (wegt)/1);
								document.InvoiceForm.weight.value=wg.toFixed(2);
						
								subtotal= document.InvoiceForm.subtotal.value;
					
								subtotal = ((subtotal/1) - (amt/1));
								document.InvoiceForm.subtotal.value=subtotal.toFixed(2);
								tot=(document.InvoiceForm.shipping.value);
								tx = document.InvoiceForm.tax.value;
								if(t==1)
								{
									yestax = (yestax - amt).toFixed(2);
									tx=(yestax * tax_rate)/100;
									document.InvoiceForm.tax.value=tx;
								}
								
								total = ((tot/1) + (subtotal/1) + (tx/1));
								document.InvoiceForm.total.value=total.toFixed(2);
								deleted++;
							}
						}
		            },
		            <bean:message key='BzComposer.global.cancel'/>: function () {
		                $(this).dialog("close");
		                return false;
		            }
		        }
		    });
		    return false;
		}
			
		
		function truncate(num) {
			string = "" + num;
			if (string.indexOf('.') == -1)
				return string + '.00';
			seperation = string.length - string.indexOf('.');
			if (seperation > 3)
				return string.substring(0,string.length-seperation+3);
			else if (seperation == 2)
				return string + '0';
			return string;
		} 
		
		function PrintInvoice(form){
			orderNo=document.InvoiceForm.orderNo.value;
			if(orderNo==""){
				return showItemOrderNumberDialog();
			}
			else{
				window.open("Invoice.do?tabid=ShowPrint&OrderNo="+orderNo,null,"scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=yes,location=no" );
			}
		}
</script>
<!-- dialog box that used in this page -->
<div id="saveInvoice" style="display:none;">
	<p><bean:message key="BizComposer.Invoice.SaveUpdate" /></p>
</div>
<div id="showValidationDialog" style="display:none;">
	<p><bean:message key="BzComposer.Estimaion.cName.Validation" /></p>
</div>
<div id="showSelectItemDialog" style="display:none;">
	<p><bean:message key="BzComposer.invoice.selectItemFirst"/></p>
</div>
<div id="showItemOrderNumberDialog" style="display:none;">
	<p><bean:message key="BizComposer.Invoice.OrderNo.Validation" /></p>
</div>
<div id="deleteInvoiceDialog" style="display:none;">
	<p><bean:message key="BzComposer.Invoice.Delete" /></p>
</div>
<div id="updateBillingAddressDialog" style="display:none;">
	<p><bean:message key="BzComposer.invoice.saveBillingAddress"/></p>
</div>
<div id="updateShippingAddressDialog" style="display:none;">
	<p><bean:message key="BzComposer.invoice.saveShippingAddress"/></p>
</div>
<div id="deleteRowDialog" style="display:none;">
	<p><bean:message key="BzComposer.Estimaion.DeleteItem" /></p>
</div>