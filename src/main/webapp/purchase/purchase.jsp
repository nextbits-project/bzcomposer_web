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
<title>
	<bean:message key="BzComposer.purchaseorderboardtitle" />
</title>
<style type="text/css">
table.cart tbody tr td {
/*  border-bottom: 1px solid rgb(207, 207, 207); */
font-size: 14px;				/*Added on 20-09-2019  */
}
</style>
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

	var r = null;
	var flag1=false;
	var flag2=false;
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

function NewPurchaseOrder1(){
	window.location.href="PurchaseOrder.do?tabid=PurchaseOrder";
}
function FirstPurchaseOrder1(){
	window.location.href="PurchaseOrder.do?tabid=FirstPurchaseOrder";
}
function LastPurchaseOrder1(){
	window.location.href="PurchaseOrder.do?tabid=LastPurchaseOrder";
}

function NextPurchaseOrder1(){
	window.location.href="PurchaseOrder.do?tabid=NextPurchaseOrder";
}

function PreviousPurchaseOrder1(){
	window.location.href="PurchaseOrder.do?tabid=PreviousPurchaseOrder";
}

function writeSelect()
{
   if (o.readyState != 4 || o.status != 200){ 
       return;
   }
   var res=trim(o.responseText);
    document.getElementById("list").innerHTML = res;
   
 
}
function writeSelectDrop()
{
   if (o.readyState != 4 || o.status != 200){ 
       return;
   }
   var res = trim(o.responseText);
   document.getElementById("droplst").innerHTML = res;
}
var text="";
function writeSelectDropValue()
{
   if (o.readyState != 4 || o.status != 200){ 
       return;
    }
	text=trim(o.responseText);

	var records=text.split(";");
	var index=0;
	if(index< records.length){
		document.getElementById('dropvalue').value=records[index];
		index++;
		document.PurchaseOrderForm.shipTo.value=records[index];
		index++;
		document.PurchaseOrderForm.shipAddr.value=records[index];
		index++;
		document.PurchaseOrderForm.clientVendorID.value=records[index];
	}
}

var v="";
function writeSelect11()
{
   if (o.readyState != 4 || o.status != 200){ 
       return;
    }
	v=trim(o.responseText);
	split_response(v);
}

function split_response(my_colors)
{
	var col_array=my_colors.split(";");
	
	var part_num=0;
	if(part_num < col_array.length){
	
		document.PurchaseOrderForm.fullName.value=col_array[part_num];
	   part_num++;
	  if(col_array[part_num]=="true")
		  document.PurchaseOrderForm.taxable.checked=true;
	  else
		  document.PurchaseOrderForm.taxable.checked=false;
	  part_num++;
	  document.PurchaseOrderForm.billTo.value=col_array[part_num];
	   part_num++;
	  document.PurchaseOrderForm.via.value=col_array[part_num];
	  part_num++;
	  document.PurchaseOrderForm.payMethod.value=col_array[part_num];
	  part_num++;
	  document.PurchaseOrderForm.term.value=col_array[part_num];
	  part_num++;
	  document.PurchaseOrderForm.custID.value=col_array[part_num];
	  part_num++;
	  document.PurchaseOrderForm.billAddrValue.value=col_array[part_num];
	  part_num++;
	  document.PurchaseOrderForm.companyName.value=col_array[part_num];
		
		if(document.PurchaseOrderForm.company.checked){
			  document.getElementById('custNm').value=document.PurchaseOrderForm.companyName.value;
		}
		else{
			document.getElementById('custNm').value=document.PurchaseOrderForm.fullName.value;
		}
	  if(document.getElementById('dropship').checked==false){
	  		document.PurchaseOrderForm.shipTo.value=document.getElementById('ship').value;
	  		document.PurchaseOrderForm.shipAddr.value=0;
	  }
	}
}
var compvalue="";
function vendorName(obj)
{
 compvalue=document.PurchaseOrderForm.company.value;
 val=obj.value;
 d= new Date();
 o = c(writeSelect);
 oGET(o,'<bean:write name="path" property="pathvalue" />/purchase/vendorsInfo.jsp?Name='+ val+"&Company="+compvalue);
	document.getElementById('adduser').disabled=true;
	document.getElementById("droplst").innerHTML ="";
}

function DropList(obj)
{
 val=obj.value;
 d= new Date();
 o = c(writeSelectDrop);
 oGET(o,'<bean:write name="path" property="pathvalue" />/purchase/dropShipList.jsp?Name='+ val);
	document.getElementById("list").innerHTML ="";
}
function setDropList(clientid){
	o = c(writeSelectDropValue);
	oGET(o,'<bean:write name="path" property="pathvalue" />/purchase/dropShipToRecord.jsp?ClientID='+clientid);
	flag=1;
	document.getElementById("droplst").innerHTML ="";
	
	document.getElementById('adduser').disabled=true;
	
}

function setTxtval(){
	vendorid = document.getElementById("vendorlist").value;
	o = c(writeSelect11);
	oGET(o,'<bean:write name="path" property="pathvalue" />/purchase/purchaseOrderRecord.jsp?ClientID='+vendorid+"&Company="+compvalue);
	flag=1;
	document.getElementById("list").innerHTML ="";
	document.getElementById('adduser').disabled=true;
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
	
function paymentHistory(form){
	cid=form.custID.value;
	if(cid==0){

		return showValidationDialog();
	}
	else{
		window.open("Invoice.do?tabid=PaymentHistory&CustId="+cid,null,"scrollbars=yes,height=500,width=900,status=yes,toolbar=no,menubar=no,location=no" );
	}
}

function showSelectItemDialog()
{
	debugger;
	event.preventDefault();
	debugger;
    $("#showSelectItemDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "Ok": function () {
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
            "Ok": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showShipInfoValidationDialog()
{
	debugger;
	event.preventDefault();
	$("#showShipInfoValidationDialog").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "Ok": function () {
                $(this).dialog("close");
            }
        }
    });
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
            "Ok": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function showSavePurchaseOrderDialog()
{
	debugger
	event.preventDefault();
	$("#showItemOrderNumberDialog").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "Ok": function () {
                $(this).dialog("close");
            },
            Cancel: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}

function updatePurchaseOrderDialog(form)
{
	debugger
	event.preventDefault();
	$("#updatePurchaseOrderDialog").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "Ok": function () {
                $(this).dialog("close");
                debugger
				total=form.total.value;
				form.total.value=total;
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
				debugger
				csize = document.getElementById('CartSize').value		
				debugger				
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
							debugger
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
				debugger
				document.getElementById("purchaseOrderForm").submit();
				debugger
            },
            Cancel: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}
</script>
</head>
<body onload="init();">
<!-- begin shared/header -->
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<!-- begin Contents --> 
<html:form styleId="purchaseOrderForm" action="PurchaseOrder.do?tabid=SavePurchaseOrder" enctype="multipart/form-data" method="post">
	<input type="hidden" name="isInvoice" value="">
	<input type="hidden" name="isSalestype" value="">
	
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
		</logic:iterate>
	</div>
	<div>
		<span style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<bean:message key="BzComposer.purchaseorder.purchaseorderheader" />
		</span>
	</div>
	
	<div id="table-negotiations" style="margin-left: auto;margin-right: auto;" >
	<div id="table-negotiations">
	<div id="ShipAddress">
		<logic:present name="ShipAddr">
			<input type="hidden" name="shipToAddr" id="ship" value="<bean:write name="ShipAddr"/>" />
		</logic:present>
	</div>

	<div id="ItemDetails">
		<bean:size id="iSize" name="ItemList" /> 
		<input type="hidden" name="ItemSize" id="itemSize" value='<bean:write name="iSize" />'> 
		<logic:iterate name="ItemList" id="objList" indexId="index">
			<input type="hidden" value='<bean:write name="objList" property="invID" />' id='<bean:write name="index" />inv' 
			name='ii<bean:write name="index" />inv' />
			<input type="hidden" value='<bean:write name="objList" property="qty"/>' id='<bean:write name="index" />q' 
			name='ii<bean:write name="index" />q' />
			<input type="hidden" value='<bean:write name="objList" property="invCode" filter="false" />' id='<bean:write name="index" />code' 
			name='ii<bean:write name="index" />code' />
			<input type="hidden" value='<bean:write name="objList" property="invDesc"  />' id='<bean:write name="index" />desc'
			name='ii<bean:write name="index" />desc' />
			<input type="hidden" value='<bean:write name="objList" property="inventoryName"/>' id='<bean:write name="index" />pname' />
			<input type="hidden" value='<bean:write name="objList" property="salePrice"/>' id='<bean:write name="index" />price'
			name='ii<bean:write name="index" />price' />
			<input type="hidden" value='<bean:write name="objList" property="weight"/>' id='<bean:write name="index" />wt'
			name='ii<bean:write name="index" />wt' />
			<input type="hidden" value='<bean:write name="objList" property="isCategory"/>' id='<bean:write name="index" />cat'
			name='ii<bean:write name="index" />cat' />
			<input type="hidden" value='<bean:write name="objList" property="itemTypeID"/>' id='<bean:write name="index" />itmId'
			name='ii<bean:write name="index" />itmId' />
			<input type="hidden" value='<bean:write name="objList" property="serialNo"/>' id='<bean:write name="index" />serial' />
		</logic:iterate>
	</div>
	<table class="tabla-listados" cellspacing="0" style="margin-top: -1px;">
		<logic:present name="Status">
			<tr>
				<td colspan="12">
					<span class="msgstyle">*<bean:write name="Status" /></span>
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
		<thead>
			<tr>
				<th colspan="12" style="font-size: 14px;">
					<bean:message key="BzComposer.purchaseorder.customerinformation" />
				</th>
			</tr>
		</thead>
			<tr>
				<td colspan="3" align="left">
					<table>
						<tr>
							<td align="left" style="font-size: 14px;" colspan="2">
								<bean:message key="BzComposer.purchaseorder.vendor" />
							</td>
						 	<td style="font-size:14px;" colspan="1">
						 		<bean:message key="BzComposer.purchaseorder.company" />
					 		</td>
						 	<td style="font-size:14px;" colspan="1">
						 		<bean:message key="BzComposer.purchaseorder.taxable" />
					 		</td>
							<td align="center" style="font-size:14px;">
								<input type="checkbox" id="dropship" name="useDropShip" onclick="DropShipValue(this);">
								<bean:message key="BzComposer.purchaseorder.usedropshipping" />
							</td>
						</tr>
						<tr>
							<td style="font-size:14px;" colspan="2">
								<html:select property="custID" styleId="custID" onchange="Assignment(this.value,this.form); " onkeydown="Assignment(this.value,this.form);"  onkeyup="Assignment(this.value,this.form);">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="VendorList" property="value" labelProperty="label" />
								</html:select>
	                   			<input type="hidden" id="custNm" />
									<%--<logic:present name="VendorName"> --%>
										<!--<input type="text" size="30" onkeyup="vendorName(this);" -->
										<!--style="width:180px;" id="custNm" -->
										<%--value='<bean:write name="VendorName" />' --%>
										<!--ondblclick="vendorName(this);" /> -->
									<%--</logic:present> --%>
									<%--<logic:notPresent name="VendorName"> --%>
										<!--<input type="text" size="30" onkeyup="vendorName(this);" -->
										<!--style="width:180px;" id="custNm" ondblclick="vendorName(this);" /> -->
									<%--</logic:notPresent>  --%>
								<%--<html:hidden property="custID" /> --%>
							<!--<div id="list"></div> -->
							</td>
							<td align="center" style="font-size: 14px;" colspan="1">
								<html:checkbox property="company" value="off" onclick="ComapanyValue(this);">				
								</html:checkbox>
							</td>
							<td align="center" style="font-size: 14px;" colspan="1">
								<html:checkbox	property="taxable" onclick="TaxaValue(this.form);">
								</html:checkbox>
							</td>
							<td align="center">
							<table>
						<tr>
							<td align="center" id="droplabel" style="font-size: 14px;" colspan="4">
								<bean:message key="BzComposer.purchaseorder.dropshippingto" />
							</td>
						</tr>
						<tr>					
							<td style="font-size: 14px;" align="center" colspan="4">					
								<html:select property="venID" styleId="dropvalue" onchange="Assignment1(this.value,this.form);" onkeydown="Assignment1(this.value,this.form);"
						    	onkeyup="Assignment1(this.value,this.form);">
						 			<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
						 			</html:option>
						 			<html:options collection="CDetails" property="value" labelProperty="label" />
								</html:select>					
								<logic:present name="CustomerName">
							<!--<input type="text" onkeyup="DropList(this);" ondblclick="DropList(this);" size="25" id="dropvalue1" -->
							<%--value='<bean:write name="CustomerName" />' /> --%>
						 			<script>
										document.getElementById('dropship').checked=true;
									</script>
								</logic:present>
					 			<logic:notPresent name="CustomerName">
								<!--<input type="text" onkeyup="DropList(this);" ondblclick="DropList(this);" size="20" id="dropvalue1" disabled="disabled" /> -->
									<script>
										//document.PurchaseOrderForm.dropvalue.value
					      				document.getElementById('dropvalue').disabled=true;
										document.getElementById('dropship').checked=false;
									</script>
								</logic:notPresent> 
								<div id="droplst"></div>
								<html:hidden property="clientVendorID" />
							</td>
						</tr>
					</table>
				</td>
						</tr>				
					</table>
				</td>
				<td colspan="5" align="center">
					<div>
						<table>
							<tr>
								<td colspan="12" align="center">
									<table style="padding-left: 120px;width: 100%s">
										<tr>
											<td align="right" style="font-size:14px;" colspan="12">
												<html:button styleId="FirstPurchaseOrder" property="First" styleClass="formbutton" title="First Purchase Order Record" onclick="FirstPurchaseOrder1();" style="padding: 8px 10px 8px 10px; font-size: 16px;">
													<bean:message key="BzComposer.global.first" />
												</html:button>
												<html:button  styleId="LastPurchaseOrder" property="Last" styleClass="formbutton" onclick="LastPurchaseOrder1();" style="padding: 8px 10px 8px 10px; font-size: 16px;">
													<bean:message key="BzComposer.global.last" />
												</html:button>
												<html:button styleId="PreviousPurchaseOrder" property="Previous" styleClass="formbutton" title="Previous Purchase Order Record" onclick="PreviousPurchaseOrder1();" style="padding: 8px 10px 8px 10px; font-size: 16px;">
													<bean:message key="BzComposer.global.previous" />
												</html:button>
												<html:button styleId="NextPurchaseOrder" property="Next" styleClass="formbutton" title="Next Purchase Order Record" onclick="NextPurchaseOrder1();" style="padding: 8px 10px 8px 10px; font-size: 16px;">
													<bean:message key="BzComposer.global.next" />
												</html:button>
												<html:button styleId="newInvoice" property="New" title="New Invoice" styleClass="formbutton" onclick="NewPurchaseOrder1();" style="padding: 8px 10px 8px 10px; font-size: 16px;">
													<bean:message key="BzComposer.global.new" />
												</html:button>
											</td>
										</tr>
										<tr>
											<td colspan="6" align="center" style="font-size:14px;">
										<!--<td width="5%" align="right" style="padding-right: 433px;"> -->
												<logic:present name="Enable">
													<html:button property="sendMail" styleClass="formbutton" title="Send Mail to..." disabled="true">
														<bean:message key="BzComposer.global.sendmail" />
													</html:button>
												</logic:present> 
												<logic:notPresent name="Enable">
													<html:button property="sendMail" styleClass="formbutton" title="Send Mail to..." disabled="true">
														<bean:message key="BzComposer.global.sendmail" />
													</html:button>
												</logic:notPresent>
										<!--</td>-->
											</td>
											<td colspan="6" align="center" style="font-size:14px;">
										<!--<td width="5%" align="right" style="padding-right: 433px;"> -->
												<logic:present name="Enable">
													<html:button property="payHistory" styleClass="formbutton" title="Payment History" onclick="paymentHistory(this.form);">
														<bean:message key="BzComposer.global.balance" />
													</html:button>
												</logic:present> 
												<logic:notPresent name="Enable">
													<html:button property="payHistory" styleClass="formbutton" title="Payment History" onclick="paymentHistory(this.form);">
														<bean:message key="BzComposer.global.balance" />
													</html:button>
												</logic:notPresent>
										<!--</td>-->
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</td>
				<td colspan="3" align="right">
					<table style="width:100%;">
            			<tr>
            				<input type="hidden" name="Ivhidden" id="InvStyle" />
							<td align="center" style="font-size: 14px;">
								<bean:message key="BzComposer.purchaseorder.orderstyle" />
							</td>
							<td align="center" style="font-size: 14px;">
								<bean:message key="BzComposer.purchaseorder.date" />
							</td>
        	    			<td align="center" style="font-size: 14px;">
            					<bean:message key="BzComposer.purchaseorder.purchaseordernumber" />
           					</td>
           					<td colspan="1">
           					</td>	
            			</tr>
            			<tr>
							<td style="font-size: 14px;" align="center">
								<html:select property="invoiceStyle" styleId="invoiceStyle" onchange="StyleChange(this.value);" onkeydown="StyleChange(this.value);"
								onkeyup="StyleChange(this.value);" onclick="setIds();">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="InvoiceStyle" property="value" labelProperty="label" />
								</html:select>
							</td>		
							<td style="font-size: 14px;" align="center"> 
								<html:text property="orderDate" readonly="true" size="12" /> 
								<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" onclick="displayCalendar(document.PurchaseOrderForm.orderDate,'mm-dd-yyyy',this);"
								onmouseover="setIds();">
							</td>		
							<td style="font-size: 14px;" align="center">
								<html:text property="orderNo" size="10" onkeypress="return numbersonly(event,this.value);"
								onfocus="setLastPO();" ondblclick="SeeInvoice();" />
							</td>
							<td colspan="1">
							</td>
            			</tr>
            		</table>
           		</td>
           		<td colspan="1"></td>
			</tr>
			<%-- <tr>
				<!-- <td>&nbsp;</td> -->
				<td colspan="12" align="center" style="font-size:14px;">
					<input type="checkbox" id="dropship" name="useDropShip" onclick="DropShipValue(this);">
						<bean:message key="BzComposer.Purchase.PurchaseOrder.UseDropShipping" />
				</td>
				<!-- <td>&nbsp;</td> -->
			</tr> --%>
			<tr>
				<%-- <td colspan="5">
					<table>
						<tr>
							<td align="left" style="font-size: 14px;" colspan="2">
								<bean:message key="BzComposer.Purchase.PurchaseOrder.vendor" />
							</td>
						 	<td style="font-size:14px;" colspan="1">
						 		<bean:message key="BzComposer.Purchase.PurchaseOrder.Company" />
					 		</td>
						 	<td style="font-size:14px;" colspan="1">
						 		<bean:message key="BzComposer.Purchase.PurchaseOrder.Taxable" />
					 		</td>
							<td colspan="1"></td>
						</tr>
						<tr>
							<td style="font-size:14px;" colspan="2">
								<html:select property="custID" styleId="custID" onchange="Assignment(this.value,this.form); " onkeydown="Assignment(this.value,this.form);"  onkeyup="Assignment(this.value,this.form);">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="VendorList" property="value" labelProperty="label" />
								</html:select>
	                   			<input type="hidden" id="custNm" />
									<logic:present name="VendorName">
										<!--<input type="text" size="30" onkeyup="vendorName(this);" -->
										<!--style="width:180px;" id="custNm" -->
										value='<bean:write name="VendorName" />'
										<!--ondblclick="vendorName(this);" /> -->
									</logic:present>
									<logic:notPresent name="VendorName">
										<!--<input type="text" size="30" onkeyup="vendorName(this);" -->
										<!--style="width:180px;" id="custNm" ondblclick="vendorName(this);" /> -->
									</logic:notPresent> 
								<html:hidden property="custID" />
							<!--<div id="list"></div> -->
							</td>
							<td align="center" style="font-size: 14px;" colspan="1">
								<html:checkbox property="company" value="off" onclick="ComapanyValue(this);">				
								</html:checkbox>
							</td>
							<td align="center" style="font-size: 14px;" colspan="1">
								<html:checkbox	property="taxable" onclick="TaxaValue(this.form);">
								</html:checkbox>
							</td>
							<td colspan="1"></td>
						</tr>				
					</table>
				</td> --%>
				<%-- <td colspan="3" align="center">
					<table>
						<tr>
							<td align="center" id="droplabel" style="font-size: 14px;" colspan="4">
								<bean:message key="BzComposer.Purchase.PurchaseOrder.DropShippingTo" />
							</td>
						</tr>
						<tr>					
							<td style="font-size: 14px;" align="center" colspan="4">					
								<html:select property="venID" styleId="dropvalue" onchange="Assignment1(this.value,this.form);" onkeydown="Assignment1(this.value,this.form);"
						    	onkeyup="Assignment1(this.value,this.form);">
						 			<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
						 			</html:option>
						 			<html:options collection="CDetails" property="value" labelProperty="label" />
								</html:select>					
								<logic:present name="CustomerName">
							<!--<input type="text" onkeyup="DropList(this);" ondblclick="DropList(this);" size="25" id="dropvalue1" -->
							value='<bean:write name="CustomerName" />' />
						 			<script>
										document.getElementById('dropship').checked=true;
									</script>
								</logic:present>
					 			<logic:notPresent name="CustomerName">
								<!--<input type="text" onkeyup="DropList(this);" ondblclick="DropList(this);" size="20" id="dropvalue1" disabled="disabled" /> -->
									<script>
										//document.PurchaseOrderForm.dropvalue.value
					      				document.getElementById('dropvalue').disabled=true;
										document.getElementById('dropship').checked=false;
									</script>
								</logic:notPresent> 
								<div id="droplst"></div>
								<html:hidden property="clientVendorID" />
							</td>
						</tr>
					</table>
				</td> --%>
            	<%-- <td align="center" colspan="4">
            		<table style="width:100%;">
            			<tr>
            				<input type="hidden" name="Ivhidden" id="InvStyle" />
							<td align="center" style="font-size: 14px;">
								<bean:message key="BzComposer.Orders.OrderStyle" />
							</td>
							<td align="center" style="font-size: 14px;">
								<bean:message key="BzComposer.Purchase.PurchaseOrder.Date" />
							</td>
        	    			<td align="center" style="font-size: 14px;">
            					<bean:message key="BzComposer.Purchase.PurchaseOrder.PurchaseOrder" />
           					</td>
           					<td colspan="1">
           					</td>	
            			</tr>
            			<tr>
							<td style="font-size: 14px;" align="center">
								<html:select property="invoiceStyle" onchange="StyleChange(this.value);" onkeydown="StyleChange(this.value);"
								onkeyup="StyleChange(this.value);" onclick="setIds();">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="InvoiceStyle" property="value" labelProperty="label" />
								</html:select>
							</td>		
							<td style="font-size: 14px;" align="center"> 
								<html:text property="orderDate" readonly="true" size="12" /> 
								<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" onclick="displayCalendar(document.PurchaseOrderForm.orderDate,'mm-dd-yyyy',this);"
								onmouseover="setIds();">
							</td>		
							<td style="font-size: 14px;" align="center">
								<html:text property="orderNo" size="10" onkeypress="return numbersonly(event,this.value);"
								onfocus="setLastPO();" ondblclick="SeeInvoice();" />
							</td>
							<td colspan="1">
							</td>
            			</tr>
            		</table>
           		</td> --%>
			</tr>
			<tr align="left">
				<td align="center" >				
					<table style="width: 100%;">
						<tr>
							<td id="bill_label"></td>			
						</tr>				
					</table>
				</td>
				<td id="ship_label"></td>
			</tr>
			<tr>
				<td colspan="6">
					<table>
						<tr>
							<td align="left" id="bill_id" style="font-size: 14px;">
								<bean:message key="BzComposer.purchaseorder.vendor" />
								<br>
								<html:textarea property="billTo" rows="4" cols="35" readonly="true" onclick="BillConfirmAddress();" onfocus="setIds();">
								</html:textarea>
							</td>
						</tr>
					</table>
				</td>
				<td colspan="1">
				</td>
				<td align="right"  colspan="5" style="padding-right: 37px;">
					<table>
						<tr>
							<td id="ship_id" style="font-size: 14px;">
								<bean:message key="BzComposer.purchaseorder.shipto" />
								<br/>	 
								<html:textarea property="shipTo" rows="4" cols="35" readonly="true" onclick="ShipConfirmAddress();" onfocus="setIds();">
								</html:textarea>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="font-size: 14px;" colspan="10">
					<table align="left" width="400">
						<tr>
							<td align="left" id="term_label" style="font-size: 14px;">
								<bean:message key="BzComposer.purchaseorder.term" />
							</td>
							<td id="pay_label" style="font-size: 14px;">
								<bean:message key="BzComposer.purchaseorder.paymethod" />
							</td>
							<td align="left" id="via_label" style="font-size: 14px;">
								<bean:message key="BzComposer.purchaseorder.via" />
							</td>
						</tr>
						<tr>
							<td id="term_id" style="font-size: 14px;">
								<html:select property="term" onchange="setFlag();" onclick="setIds();">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="Term" property="value" labelProperty="label" />
								</html:select>
							</td>
							<td id="pay_id" style="font-size: 14px;">
								<html:select property="payMethod" onchange="setFlag();" onclick="setIds();">
								<logic:present name="PayMethod">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="PayMethod" property="value" labelProperty="label" />
								</logic:present>
								</html:select>
							</td>
							<td id="via_id" style="font-size: 14px;">
								<html:select property="via" onchange="setFlag();" onclick="setIds();">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="Via" property="value" labelProperty="label" />
								</html:select>
							</td>
						</tr>
					</table>
				</td>
				<td colspan="2">&nbsp;</td>
			</tr>
		</table>
		<%-- <div align="center">
				<font size="3"><strong> 
					<bean:message key="BizComposer.Estimaion.Header.ItemInfo" /> 
				</strong></font>
		</div> --%>
		<div id="product">
			<table class="tabla-listados" cellspacing="0">
				<thead>
					<tr>
						<th colspan="10" style="font-size: 14px;">
							<bean:message key="BzComposer.purchaseorder.iteminformation" />
						</th>
					</tr>
				</thead>
				<tr>
					<td id="td1" style="padding-left: 30px;font-size:14px;">
						<bean:message key="BzComposer.purchaseorder.itemid" />
					</td>
					<td style="font-size: 14px;">
						<div id="td3">	
							<bean:message key="BzComposer.purchaseorder.quantity" />
						</div>
			 			<div id="td4">
			 				<bean:message key="BzComposer.purchaseorder.rate" />
		 				</div>
	 				</td>
					<td style="font-size: 14px;">
						<div id="td10" style="display:block;">
							<bean:message key="BzComposer.purchaseorder.unitprice" />
						</div>
						<div id="td11" style="display:none;">
							<bean:message key="BzComposer.purchaseorder.rateprice" />
						</div>
					</td>	
					<td style="font-size: 14px;">
             			<div>
							<bean:message key="BzComposer.purchaseorder.itemname" />
						</div>
					</td>
				<!--<td> -->
					<%--<div id="td8"><bean:message key="BzComposer.Invoice.Desc" /></div></td> --%>
					<td style="font-size: 14px;">
						<div id="td6" style="display:none;">
							<bean:message key="BzComposer.purchaseorder.serialnumber" />
						</div>
					</td>
					<td style="font-size: 14px;">	
						<div id="td13" style="display:block;">
							<bean:message key="BzComposer.purchaseorder.amount" />
						</div>
					</td>
					<td style="font-size: 14px;">
						<div  id="td15" style="display:block;">
							<bean:message key="BzComposer.purchaseorder.weight" />
						</div>
					</td>
					<td style="font-size: 14px;">	
						<div id="td17" style="display:block;">
							<bean:message key="BzComposer.purchaseorder.tax" />
						</div>
					</td>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td id="td2" style="padding-left: 30px;font-size:14px;">
						<html:select property="itemID" onchange="ItemChange(this.value);">
							<html:option value="0">
								<bean:message key="BzComposer.ComboBox.Select" />
							</html:option>
							<logic:iterate name="ItemList" id="itmList">
								<logic:equal name="itmList" property="isCategory" value="0">
									<html:option value='${itmList.invID}'>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<bean:write name="itmList" property="invCode" filter="false" />
									</html:option>
								</logic:equal>
								<logic:equal name="itmList" property="isCategory" value="1">
								<%--<html:option value='${itmList.invID}'> --%>
									<html:option value='01'>
										<bean:write name="itmList" property="invCode" filter="false" />
									</html:option>
								</logic:equal>
							</logic:iterate>
						</html:select>
					</td>
					<td style="font-size: 14px;">
						<div style="padding-top: 0px;" style="display:block;" id="td5">
							<input type="text" size="10" id="qty_id" onkeydown="return numbersonly(event,this.value)" />
						</div>
					</td>
					<td style="font-size: 14px;">	
						<div style="padding-top: 0px;" id="td12">
							<input type="text" size="10"  readonly="readonly" id="unitPrice_id" onkeydown="return numbersonly(event,this.value)" />
						</div>	
					</td>
					<td style="font-size: 14px;">
						<div>
							<input type="text" size="50" readonly="readonly" id="pname_id"/>				
						</div>
					</td>
				<!--<td><div id="td9"> -->
					<!--<textarea rows="4" cols="33" readonly="readonly" id="desc_id"></textarea> -->
					<!--</div> -->
				<!--</td>-->
					<td style="font-size: 14px;">
						<div id="td7">
							<input type="text" size="10" id="serialNo_id" readonly="readonly" />
						</div>
					</td>
					<td style="font-size: 14px;">				
						<div id="td14" style="display:block;">
							<input type="text" size="10" readonly="true" id="amount_id" onfocus="Multiplication();" />
						</div>
					</td>
					<td style="font-size: 14px;">
						<div id="td16" style="display:block;">
							<input type="text" name="itemWeight" size="10" readonly="true" id="weight_id"
							onkeydown="return numbersonly(event,this.value)" />
						</div>
					</td>				
					<td style="font-size: 14px;">
						<div id="td18" style="display:block;">
							<select id="tax_id">
								<option value="0"><bean:message key="BzComposer.purchaseorder.tax.no"/></option>
								<option value="1"><bean:message key="BzComposer.purchaseorder.tax.yes"/></option>
							</select>
						</div>
					</td>
					<td style="padding-right:5px;font-size:14px;" colspan="3">
						<div>
							<input type="button" class="formbutton" name="addItem" title="To add item click it" onclick="AddItem(this.form);"
							value='<bean:message key="BzComposer.purchaseorder.additem"/>' />
						</div>
					</td>
				</tr>
			<!-- <tr> -->
				<%-- <td id="td8" colspan="8" style="padding-left: 30px;"><bean:message key="BzComposer.Invoice.Desc" /></td> --%>
			<!-- </tr> -->
			<!-- <tr> -->
				<!-- <td style="padding-top: 0px;padding-left: 30px;" id="td9" colspan="8" > -->
					<!--<textarea rows="3" cols="80" readonly="readonly" id="desc_id"></textarea> -->
				<!--</td> -->
			<!-- </tr> -->
			</table>
			<table class="tabla-listados cart" cellspacing="0">
				<thead>
					<tr>
						<th style="font-size: 14px;">
							<div id="it1">
								<bean:message key="BzComposer.purchaseorder.itemid" />
							</div>
						</th>
						<th style="font-size: 14px;">
							<div id="it2">
								<bean:message key="BzComposer.purchaseorder.quantity" />
							</div>
							<div id="it22" style="display:none;">
								<bean:message key="BzComposer.purchaseorder.rate" />
							</div>
						</th>
						<th style="font-size: 14px;">
							<div id="it8">
								<bean:message key="BzComposer.purchaseorder.serialnumber" />
							</div>
						</th>
						<th style="font-size: 14px;">
							<div id="it3">
								<bean:message key="BzComposer.purchaseorder.itemname" />
							</div>
						</th>
						<th style="font-size: 14px;">
							<div id="it4">
								<bean:message key="BzComposer.purchaseorder.unitprice" />
							</div>
							<div id="it42" style="display:none;">
								<bean:message key="BzComposer.purchaseorder.rateprice" />
							</div>
						</th>
						<th style="font-size: 14px;">
							<div id="it5">
								<bean:message key="BzComposer.purchaseorder.amount" />
							</div>
						</th>
						<th style="font-size: 14px;">
							<div id="it6">
								<bean:message key="BzComposer.purchaseorder.weight" />
							</div>
						</th>
						<th style="font-size: 14px;">
							<div id="it7">
								<bean:message key="BzComposer.purchaseorder.tax" />
							</div>
						</th>
						<th style="font-size: 14px;">
							<bean:message key="BzComposer.global.delete" />
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
									<div id='<bean:write name="indx" />iserial'>
										<bean:write name="cart" property="serialNo" />
									</div>
								</td>
								<td style="font-size: 14px;">
									<div id='<bean:write name="indx" />desc'>
										<bean:write name="cart" property="invDesc" />
									</div>
								</td>
								<td align="left" style="font-size: 14px;">
									<div id='<bean:write name="indx" />iprice'>
										<bean:write name="cart" property="uprice" />
									</div>
								</td>
								<td align="left" style="font-size: 14px;">
									<div id='<bean:write name="indx" />amt'>
										<bean:write name="cart" property="amount" />
									</div>
								</td>
								<td align="left" style="font-size: 14px;">
									<div id='<bean:write name="indx" />wgt'>
										<bean:write name="cart" property="weight" />
									</div>
								</td>
								<td align="left" style="font-size: 14px;">
									<div id='<bean:write name="indx" />itax'>
										<bean:write name="cart" property="tax" />
									</div>
								</td>
								<td align="left" style="font-size: 14px;" colspan="3">
									<img onclick="DeleteRow('<bean:write name="indx" />row',this.form);"
									src="<bean:write name="path" property="pathvalue"/>/images/delete.png"
									title="Delete this Item" size="8" width="12"/>
								</td>
							</tr>
							<input type="hidden" id='<bean:write name="indx" />delt' value="0" />
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
					<td align="center"></td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center" colspan="3"></td>
				</tr>
			</table>
		</div>
	</div>
	<table class="tabla-listados" cellspacing="0">
		<thead>
			<tr>
				<th colspan="12" style="font-size: 14px;">
					<bean:message key="BzComposer.purchaseorder.summary" />
				</th>
			</tr>
		</thead>
		<tr>
			<td nowrap="nowrap" style="font-size: 14px;" colspan="6">
				<bean:message key="BzComposer.Invoice.Message" /> 
				<html:select property="message">
					<html:option value="0">
						<bean:message key="BzComposer.ComboBox.Select" />
					</html:option>
					<html:options collection="Message" property="value" labelProperty="label" />
				</html:select>
				<br/>
				<bean:message key="BzComposer.Invoice.Memo" />
				&nbsp;&nbsp;&nbsp;
				<html:textarea property="memo" rows="3" cols="47" ></html:textarea>
			</td>
			<td style="font-size: 14px;">
				<table align="right">
					<tr>
						<td align="right" style="font-size: 14px;padding-top: 5px;">
							<bean:message key="BzComposer.purchaseorder.totalindollers" />
						</td>
						<td style="font-size: 14px;">
							<html:text property="total" readonly="true" style="width: 200px;"/>
						</td>
					</tr>
				</table>
			</td>
			<!-- <td colspan="1"></td> -->
		</tr>
	</table>
	<br>
	<html:hidden property="bsAddressID" />
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
		<html:hidden property="billAddrValue" /> 
		<html:hidden property="shipAddr" />
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
		<html:hidden property="companyName" /> 
		<html:hidden property="fullName" /> 
		<html:hidden property="previousPoNum" />
	</div>
	<!-- end Contents -->
	</div>
		
		<div class="container">
			<div class="row">
				<div class="col-md-12" style="font-size: 16px;" align="center">
					<html:button property="New" title="New PurchaseOrder" styleClass="formbutton" onclick="NewPurchaseOrder(this.form);" style="padding: 8px 20px 8px 20px;">
						<bean:message key="BzComposer.global.new" />
					</html:button>
					<html:submit property="Save" title="Save PurchaseOrder" styleClass="formbutton" onclick="onSave(this.form);" style="padding: 8px 20px 8px 20px;">
						<bean:message key="BzComposer.global.save" />
					</html:submit>
					<logic:present name="AddUser">
						<html:button property="Delete" title="Delete Purchase Order" styleClass="formbutton" disabled="true" style="padding: 8px 20px 8px 20px;">
							<bean:message key="BzComposer.global.delete" />
						</html:button>
					</logic:present> 
					<logic:notPresent name="AddUser">
						<html:button property="Delete" title="Delete Purchase Order" styleClass="formbutton" onclick="DeletePurchaseOrder();"
						disabled="false" style="padding: 8px 20px 8px 20px;">
						<bean:message key="BzComposer.global.delete" />
						</html:button>
					</logic:notPresent>
					<logic:present name="AddUser">
						<input type="button" name="AddNewUser" id="adduser" class="formbutton"
							title="<bean:message key="BzComposer.Purchase.PurchaseOrder.AddNewUserToolTip" />" onclick="ShowAddNewUser();"
							value='<bean:message key="BzComposer.Purchase.PurchaseOrder.AddNewUser" />' style="padding: 8px 20px 8px 20px;"/>
					</logic:present> 
					<logic:notPresent name="AddUser">
						<input type="button" name="AddNewUser" id="adduser" disabled="disabled" class="formbutton"
						value='<bean:message key="BzComposer.Purchase.PurchaseOrder.AddNewUser" />' style="padding: 8px 20px 8px 20px;"/>
					</logic:notPresent>
				</div>
			</div>
		</div>
	
	</html:form> <!-- end Contents -->
	</div>
	<div>
		<!-- <input type="hidden" name="tabid" id="tab" value="ReceivedItm" /> -->
		<input type="hidden" name="tabid" id="tabid" value="" />
		<input type="hidden" name="DShipValue" id="dsvalue" />
	</div>
</div>
</div>
</div>
</div>
<%@ include file="/include/footer.jsp"%>
</body>
<script type="text/javascript">
isItemExist=0;
var wghtArr = new Array();
var itemArr = new Array();
var qtyArr = new Array();
var upriceArr = new Array();
var codeArr = new Array();
var taxArr = new Array();
var descArr = new Array();
var uwghtArr = new Array();
var serialArr = new Array();
var itmIDArr = new Array();
var itmOrdArr = new Array();

isship=0;
flag=0;
deleted = 0;
index1=0;
cnt=0;
count=0;
yestax=0;
	
function setLastPO()
{
	document.PurchaseOrderForm.previousPoNum.value=document.PurchaseOrderForm.orderNo.value;
	setIds();
} 
	
function ComapanyValue(chbox)
{
	if(chbox.checked)
	{
		document.getElementById('custNm').value=document.PurchaseOrderForm.companyName.value;
		chbox.value="on";
	}
	else
	{
		document.getElementById('custNm').value=document.PurchaseOrderForm.fullName.value;
		chbox.value="off";
	}
	setIds();
}
	
	function DropShipValue(chbox){
		if(chbox.checked){
			document.getElementById('dropvalue').disabled=false;
			document.getElementById('droplabel').disabled=false;
			isship=1;
		}
		else{
		
			document.getElementById('droplabel').disabled=true;
			document.getElementById('dropvalue').value="";
			document.getElementById('dropvalue').disabled=true;
			document.PurchaseOrderForm.shipTo.value=document.getElementById('ship').value;
			document.PurchaseOrderForm.shipAddr.value=0;
		}
		 setIds();
	}
	
	function SeeInvoice(){
		document.getElementById('tab').value="IsPoNumExist";
		document.forms[0].action="PurchaseOrder.do";
		document.forms[0].submit();
	}
	
	function StyleChange(value){
			document.getElementById('invStyle').value=value;
			size=document.getElementById('CartSize').value;
			hidn_val= document.getElementById('hidn').value;
			
			if(value==0){
				product();
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
				document.getElementById('td15').style.display='block';		
				document.getElementById('td16').style.display='block';
				/* Tax */	
				document.getElementById('td17').style.display='block';
				document.getElementById('td18').style.display='block';
				
				productTable(size);
				for(x=0;x<hidn_val;x++)
					productItem(x);	
			}
			if(value!=0){
				document.getElementById('InvStyle').value=value;
				if(value==1){
					service();
					/*QTY */
				document.getElementById('td4').style.display='block';
				document.getElementById('td3').style.display='none';		
				document.getElementById('td5').style.display='block';
				
				/*Serial No */
				document.getElementById('td6').style.display='none';
				document.getElementById('td7').style.display='none';
				
				/* DESC */	
// 				document.getElementById('td8').style.display='block';
// 				document.getElementById('td9').style.display='block';
					
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
				
				var i;
				for(i=0;i<size;i++){
					document.getElementById(i+"icode").style.visibility='visible';
					document.getElementById(i+"qty").style.visibility='visible';
					document.getElementById(i+"desc").style.visibility='visible';
					document.getElementById(i+"iprice").style.visibility='visible';
					document.getElementById(i+"amt").style.visibility='hidden';
					document.getElementById(i+"wgt").style.visibility='hidden';
					document.getElementById(i+"itax").style.visibility='visible';
					document.getElementById(i+"serial").style.visibility='hidden';
				}
				for(x=0;x<hidn_val;x++)
						serviceItem(x);
				}
				else if(value==2){
					quick(size);
					for(x=0;x<hidn_val;x++)
						quickItem(x);
				}
				else if(value==3){
					manufacture(size)
					for(x=0;x<hidn_val;x++)
						manufactureItem(x);
				}		
				else if(value==4){
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
				document.getElementById('td15').style.display='block';		
				document.getElementById('td16').style.display='block';
				/* Tax */	
				document.getElementById('td17').style.display='block';
				document.getElementById('td18').style.display='block';
				}
				else if(value==5){
					finance(size);
					for(x=0;x<hidn_val;x++)
						financeItem(x);
				}
				
				else if(value==6){
				professional(size);
					for(x=0;x<hidn_val;x++){
						quickItem(x);
					}
				}
				
				else if(value==7){
					ebusiness(size);
					for(x=0;x<hidn_val;x++){
						ebusinessItem(x);
					}
				}
			}
		}
		
		function service(){
			/* hidden field for ship to */
				document.getElementById('ship_label').style.visibility="hidden";
				document.getElementById('ship_id').style.visibility="hidden";
				
				
				/* hidden field for via & rep */
				document.getElementById('via_label').style.visibility="hidden";
				document.getElementById('via_id').style.visibility="hidden";
				/* Visible field for bill to */
				document.getElementById('bill_label').style.visibility="visible";
				document.getElementById('bill_id').style.visibility="visible";
				
				/* Visible field for Term & Payment */
				document.getElementById('term_label').style.visibility="visible";		
				document.getElementById('term_id').style.visibility="visible";
				
				/* Visible field for Payment */
				document.getElementById('pay_label').style.visibility="visible";
				document.getElementById('pay_id').style.visibility="visible";
		}

		function quick(size){
			/* hidden field for ship to */
				document.getElementById('ship_label').style.visibility="hidden";
				document.getElementById('ship_id').style.visibility="hidden";
				
				/* hidden field for via & rep */
				document.getElementById('via_label').style.visibility="hidden";
				document.getElementById('via_id').style.visibility="hidden";
				
				/* hidden field for bill to */
				document.getElementById('bill_label').style.visibility="hidden";
				document.getElementById('bill_id').style.visibility="hidden";
				
			
				/* Visible field for Term & Payment */
				document.getElementById('term_label').style.visibility="hidden";		
				document.getElementById('term_id').style.visibility="hidden";
				
				/* Visible field for Payment */
				document.getElementById('pay_label').style.visibility="hidden";
				document.getElementById('pay_id').style.visibility="hidden";
				
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
				
				/* Item in Table  */
				quickTable(size);
		}
		
		function manufacture(size){
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
				for(i=0;i<size;i++){
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
		
		function product(){
			/* visible field for ship to */
				document.getElementById('ship_label').style.visibility="visible";
				document.getElementById('ship_id').style.visibility="visible";
				
				/* Visible field for bill to */
				document.getElementById('bill_label').style.visibility="visible";
				document.getElementById('bill_id').style.visibility="visible";
				
				/* visible field for via & rep */
				document.getElementById('via_label').style.visibility="visible";
				document.getElementById('via_id').style.visibility="visible";
				
				/* Visible field for Term & Payment */
				document.getElementById('term_label').style.visibility="visible";		
				document.getElementById('term_id').style.visibility="visible";
				
				/* Visible field for Payment */
				document.getElementById('pay_label').style.visibility="visible";
				document.getElementById('pay_id').style.visibility="visible";
					
		}
		
		function productTable(size){
			var i;
			for(i=0;i<size;i++){
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
			for(j=0;j<value;j++){
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
		
		function finance(size){
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
				for(i=0;i<size;i++){
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
				
				/* visible field for via & rep */
				document.getElementById('via_label').style.visibility="visible";
				document.getElementById('via_id').style.visibility="visible";
				
				/* Visible field for Term & Payment */
				document.getElementById('term_label').style.visibility="visible";		
				document.getElementById('term_id').style.visibility="visible";
				
				/* Visible field for Payment */
				document.getElementById('pay_label').style.visibility="visible";
				document.getElementById('pay_id').style.visibility="visible";
				
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
	
		function AddItem(form){
			if(form.itemID.value==0 ||form.itemID.value==01){
				document.getElementById('serialNo_id').value="";
				document.getElementById('qty_id').value="";
			//	document.getElementById('desc_id').value="";
				document.getElementById('unitPrice_id').value="";
				document.getElementById('amount_id').value="";
				document.getElementById('weight_id').value="";
				document.getElementById('pname_id').value="";

				return showSelectItemDialog();
				form.itemID.focus();					
			}
			else{
				isItemExist++;
				flag=1;
				style = document.getElementById('invStyle').value;
				
				hidn_val= document.getElementById('hidn').value;
				
				
				var tr = document.createElement("tr");
				tr.setAttribute("id", "tr"+hidn_val);
			
				var tr2 = document.getElementById('tr##');
				var parentTr = tr2.parentNode;
				parentTr.insertBefore(tr, tr2);
				
				serialNo = document.getElementById('serialNo_id').value;
		
				var desc = document.getElementById('pname_id').value;
				if(document.getElementById('weight_id').value==""){
					document.getElementById('weight_id').value = 0;
				}	
				weight = parseInt(document.getElementById('weight_id').value);
				tax = document.getElementById('tax_id').value;
				ivcode = document.getElementById('code11').value;
				
				if(document.getElementById('qty_id').value==""){
					document.getElementById('qty_id').value = 1;
				}	
				qty=parseInt(document.getElementById('qty_id').value);
				
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
   				
   				total= form.total.value;
				total = ((total/1) + (amt/1)).toFixed(2);;
				form.total.value=total;

				document.getElementById('amt_id').value=total;
				
   				var td8 = document.createElement("td");
				td8.setAttribute("align", "left");
				td8.setAttribute("id",hidn_val+"8");
				tr.appendChild(td8);
				td8.innerHTML=t;
				
				var button='<img onclick="DeleteRow1('+hidn_val+',this.form);" width="12"  src="<bean:write name="path" property="pathvalue"/>/images/delete.png" title="Delete" size="8"/>';
				
				var td9 = document.createElement("td");
				td9.setAttribute("align", "left");
				td9.setAttribute("colspan","3")
				tr.appendChild(td9);
				td9.innerHTML=button;
			
				
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
								
				hidn_val=( (hidn_val/1) + 1);
				document.getElementById('hidn').value=hidn_val;
				
   			}	
		}
		function Assignment(value,form){
			if(value==0){
				document.PurchaseOrderForm.billTo.value="";
				document.PurchaseOrderForm.shipTo.value="";
// 				document.InvoiceForm.via.value="0"
// 				document.InvoiceForm.payMethod.value="0";
// 				document.InvoiceForm.rep.value="0";
// 				document.InvoiceForm.term.value="0";
// 				document.InvoiceForm.taxable.checked=false;
			}
			else{

				document.PurchaseOrderForm.custID.value=value;
				document.PurchaseOrderForm.custNm.value=value;
				//document.getElementById('custId').value=value;
				size=document.getElementById("bSize").value;
				document.PurchaseOrderForm.shipTo.value=document.getElementById('ship').value;
				//shsize=document.getElementById("sSize").value;
				var i;
				for(i=0;i<size;i++){
					var field1 = document.getElementById(i+"clvid").value;
					if(value == field1){						
						document.getElementById('cid').value=value;
						form.companyID.value = document.getElementById(i+"cid").value;
						form.bsAddressID.value = document.getElementById(i+"bsaddr").value; //set Billing Address Id
						form.billAddrValue.value = document.getElementById(i+"bsaddr").value; 
						document.PurchaseOrderForm.billTo.value = document.getElementById(i+"bl").value;								

						break;		
					}
				}
// 				for(i=0;i<shsize;i++){
// 					var field2 = document.getElementById(i+"sh_id").value;
// 					if(value==field2){
// 						document.InvoiceForm.shipTo.value=document.getElementById(i+"sh").value;
// 						break;		
// 					}
// 				}
// 				sz = document.getElementById('custSize').value; 
// 				if(value == 0){
					
// 				}
// 				 for(i=0;i<sz;i++){
// 					var field11 = document.getElementById("a"+i+"clvndid").value;
// 					if(value==field11){
						
// 						viaitem = document.getElementById(i+"va").value;
						
// 						if(viaitem==""){
							
// 							document.InvoiceForm.via.value="0";
// 						}
// 						else
// 							document.InvoiceForm.via.value=viaitem;
// 						repitem=document.getElementById(i+"rp").value;
// 						if(repitem=="")
// 							document.InvoiceForm.rep.value="0";
// 						else
// 							document.InvoiceForm.rep.value=repitem;
// 						payitem = document.getElementById(i+"paym").value;
// 						if(payitem=="")
// 							document.InvoiceForm.payMethod.value="0";
// 						else
// 							document.InvoiceForm.payMethod.value=payitem;
// 						trmitem = document.getElementById(i+"trm").value;
// 						if(trmitem=="")
// 							document.InvoiceForm.term.value="0";
// 						else
// 							document.InvoiceForm.term.value=trmitem;
// 						txid=document.getElementById("a"+i+"txable").value;
// 						if(txid=="1"){
// 							document.InvoiceForm.taxable.checked=true;	
// 						}
// 						else{
// 							document.InvoiceForm.taxable.checked=false;	
// 						}
// 						break;
// 					}
// 				 }
			}
		}
		function Assignment1(value,form){
			if(value==0){
				//document.InvoiceForm.billTo.value="";
 				document.PurchaseOrderForm.shipTo.value="";
// 				document.InvoiceForm.via.value="0"
// 				document.InvoiceForm.payMethod.value="0";
// 				document.InvoiceForm.rep.value="0";
// 				document.InvoiceForm.term.value="0";
// 				document.InvoiceForm.taxable.checked=false;
			}
			else{		
				//size=document.getElementById("bSize").value;
				shsize=document.getElementById("sSize").value;
				var i;
// 				for(i=0;i<size;i++){
// 					var field1 = document.getElementById(i+"clvid").value;
// 					if(value == field1){						
// 						document.getElementById('cid').value=value;
// 						form.companyID.value = document.getElementById(i+"cid").value;
// 						form.bsAddressID.value = document.getElementById(i+"bsaddr").value; //set Billing Address Id
// 						document.PurchaseOrderForm.billTo.value = document.getElementById(i+"bl").value;								

// 						break;		
// 					}
// 				}
				for(i=0;i<shsize;i++){
					var field2 = document.getElementById(i+"sh_id").value;
					if(value==field2){
						document.PurchaseOrderForm.shipTo.value = document.getElementById(i+"sh").value;
						form.shipAddr.value = document.getElementById(i+"sh_id").value; //set Shipping Address Id

						break;		
					}
				}
// 				sz = document.getElementById('custSize').value; 
// 				if(value == 0){
					
// 				}
// 				 for(i=0;i<sz;i++){
// 					var field11 = document.getElementById("a"+i+"clvndid").value;
// 					if(value==field11){
						
// 						viaitem = document.getElementById(i+"va").value;
						
// 						if(viaitem==""){
							
// 							document.InvoiceForm.via.value="0";
// 						}
// 						else
// 							document.InvoiceForm.via.value=viaitem;
// 						repitem=document.getElementById(i+"rp").value;
// 						if(repitem=="")
// 							document.InvoiceForm.rep.value="0";
// 						else
// 							document.InvoiceForm.rep.value=repitem;
// 						payitem = document.getElementById(i+"paym").value;
// 						if(payitem=="")
// 							document.InvoiceForm.payMethod.value="0";
// 						else
// 							document.InvoiceForm.payMethod.value=payitem;
// 						trmitem = document.getElementById(i+"trm").value;
// 						if(trmitem=="")
// 							document.InvoiceForm.term.value="0";
// 						else
// 							document.InvoiceForm.term.value=trmitem;
// 						txid=document.getElementById("a"+i+"txable").value;
// 						if(txid=="1"){
// 							document.InvoiceForm.taxable.checked=true;	
// 						}
// 						else{
// 							document.InvoiceForm.taxable.checked=false;	
// 						}
// 						break;
// 					}
// 				 }
			}
		}
		function productItem(hidn_val)
		{
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
		
		function serviceItem(hidn_val)
		{
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
		
		function quickItem(hidn_val)
		{
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
		
		function manufactureItem(hidn_val)
		{
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
			setFlag();	
			for(count=0;count<size;count++){
				var invID = document.getElementById(count+'inv').value;
				if(value==invID){
					var category = document.getElementById(count+'cat').value;
					if(category==1){
						//document.getElementById('serialNo_id').value="";
						document.getElementById('qty_id').value="";
					
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
						var qty=1;
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

	function DeleteRow(d,form)
	{
		event.preventDefault();
		$("#deleteRowDialog").dialog({
		    	resizable: false,
		        height: 200,
		        width: 400,
		        modal: true,
		        buttons: {
		            "Ok": function () {
		            	debugger;
		                $(this).dialog("close");
		                flag=1;
		    			size=document.getElementById('CartSize').value;
		    			isItemExist--;
		    			for(jj=0;jj<size;jj++)
		    			{
		    				rowId=document.getElementById(jj+'rowVal').value;
		    				if(d==rowId)
		    				{
		    					var rt=0;
		    					document.getElementById(d).style.display='none';
		    					document.getElementById(jj+'delt').value="del";
		    					qty1=document.getElementById(jj+'qty').value;
		    					uprice1=document.getElementById(jj+'uprice').value;
		    					amt = ((qty1)/1 * (uprice1)/1);
		    					total= document.PurchaseOrderForm.total.value;
		    					total = ((total/1) - (amt/1));
		    					total=total.toFixed(2);;
		    					document.PurchaseOrderForm.total.value=total;
		    					break;
		       				}
		    			}
		            },
		            Cancel: function () {
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
		        width: 400,
		        modal: true,
		        buttons: {
	            "Ok": function () 
	            {
	            	debugger;
	                $(this).dialog("close");
	                
	                flag=1;
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
	    					total= document.PurchaseOrderForm.total.value;
	    					total = ((total/1) - (amt/1));
	    					document.PurchaseOrderForm.total.value=total.toFixed(2);
	    					deleted++;
	    				}
	    			}
	            },
				Cancel: function () 
				{
					$(this).dialog("close");
		            return false;
				}
			}
		});
		return false;
	}
		/*Code for buttons*/
		
		function NewPurchaseOrder(form)
		{
			debugger
			if(flag==1)
			{
				//if(window.confirm('<bean:message key="BizComposer.PurchaseOrder.SaveConfirm" />'))
				if(showSavePurchaseOrderDialog())
				{
					SaveConfirm(form);
				 }
				 else
				 {
				 	/* NewPurchase(); */
					 window.location.href="PurchaseOrder.do?tabid=PurchaseOrder";
				 }
			}
			else
			{
				/* NewPurchase(); */
				window.location.href="PurchaseOrder.do?tabid=PurchaseOrder";
			}
		}
		
		function NewPurchase()
		{
			/* document.getElementById('tab').value="PurchaseOrder";
			document.forms[0].action="PurchaseOrder.do";
			document.forms[0].submit(); */
			window.location.href="PurchaseOrder.do?tabid=PurchaseOrder";
		}
		
	function trim(inputString) 
	{
	   // Removes the spaces  return from the passed string. 
	   var retValue = inputString;
	   var ch = retValue.substring(0, 1);
	   while (ch == "\n" || ch == "\r" || ch==" " || ch=="\t" ) 
	   { 
    	  retValue = retValue.substring(1, retValue.length);
	      ch = retValue.substring(0, 1);
	   }
	   return retValue; 
	}
		
		function onSave(form)
		{
			debugger
			shipinfo();
			No=form.orderNo.value;
			debugger
			custnm=trim(document.getElementById('custNm').value);
			debugger
			cid=form.custID.value;
			debugger
			//if(isship==2 || (document.getElementById('dropship').checked==true && document.PurchaseOrderForm.shipAddr.value==0 )){

			//}
			/* commented on 01-10-2019 for testing purpose
			if(document.getElementById('dropship').checked==true && document.PurchaseOrderForm.shipAddr.value==0 )
			{

				return showShipInfoValidationDialog();
			} */
			if(cid==0)
			{

				return showValidationDialog();
				document.getElementById('custNm').value="";
				document.getElementById('custNm').focus();
				
			}else if(isItemExist <=0)
			{

				return showSelectItemDialog();
			}
			else if(custnm=="")
			{

				return showValidationDialog();
				document.getElementById('custNm').focus();
			}
			else
			{
				if(No.length==0 || No==0)
				{

					return showItemOrderNumberDialog();
					form.orderNo.focus();
				}
				else
				{
					//var x="";
					<logic:present name="Enable">
						//x=window.confirm('<bean:message key="BizComposer.PO.Update" />');
						return updatePurchaseOrderDialog(form);
					</logic:present>
					<logic:notPresent name="Enable">
						//x=window.confirm('<bean:message key="BizComposer.PO.Insert" />');
						debugger;
						return savePurchaseOrderDialog();
						debugger
					</logic:notPresent>
					
					event.preventDefault();
					$("#savePurchaseOrderDialog").dialog({
				    	resizable: false,
				        height: 200,
				        width: 500,
				        modal: true,
				        buttons: {
				            "Ok": function () {
				                
				            	$(this).dialog("close");
				            	debugger
								total=form.total.value;
								form.total.value=total;
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
								debugger
								csize = document.getElementById('CartSize').value		
								debugger				
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
											debugger
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
								debugger
								document.getElementById("purchaseOrderForm").submit();
								debugger
								/* document.forms[0].action="PurchaseOrder.do?tabid=SavePurchaseOrder";
								debugger
								document.getElementById("tabid").value="SavePurchaseOrder";
								debugger
								document.forms[0].submit();
								event.preventDefault(); */
								/* debugger
								document.getElementById("tabid").value="SavePurchaseOrder";
								debugger
								window.location = "PurchaseOrder.do?tabid=SavePurchaseOrder";
								debugger */
				            },
				            Cancel: function () {
				                $(this).dialog("close");
				                return false;
				            }
						}
					});
					return false;
				}
			}	
		}
		
		function shipinfo(){
			<logic:present name="Enable">
				if(document.getElementById('dropship').checked==false){
					isship=2;
				}
			</logic:present>
		}
		
		function FirstPurchaseOrder(form)
		{
			debugger;
			if(flag==1)
			{
				 //if(window.confirm('<bean:message key="BizComposer.PurchaseOrder.SaveConfirm" />'))
				 if(showSavePurchaseOrderDialog())
				 {
				 	SaveConfirm(form);
				 }
				else
				{
					FirstPurchase();
				}	 
			}
			else
			{
				FirstPurchase();
			}
		}
		
		function FirstPurchase()
		{
			/* document.getElementById('tab').value="FirstPurchaseOrder";
			document.forms[0].action="PurchaseOrder.do";
			document.forms[0].submit(); */
			window.location.href="PurchaseOrder.do?tabid=FirstPurchaseOrder";
		}
		
		function LastPurchaseOrder(form)
		{
			if(flag==1)
			{
				 //if(window.confirm('<bean:message key="BizComposer.PurchaseOrder.SaveConfirm" />'))
				 if(showSavePurchaseOrderDialog())
				 {
					SaveConfirm(form);
				}
				else
				{
					window.location.href="PurchaseOrder.do?tabid=LastPurchaseOrder";
				}	 
			}
			else
			{
				window.location.href="PurchaseOrder.do?tabid=LastPurchaseOrder";
			}
		}
		
		function LastPurchase(){
			/* document.getElementById('tab').value="LastPurchaseOrder";
			document.forms[0].action="PurchaseOrder.do";
			document.forms[0].submit(); */
			window.location.href="PurchaseOrder.do?tabid=LastPurchaseOrder";
		}
		
		function NextPurchaseOrder(form)
		{
			if(flag==1)
			{
				 //if(window.confirm('<bean:message key="BizComposer.PurchaseOrder.SaveConfirm" />'))
				 if(showSavePurchaseOrderDialog())
				 {
				 	SaveConfirm(form);
				 }
				 else
				 {
				 	/* NextPurchase(); */
					 window.location.href="PurchaseOrder.do?tabid=NextPurchaseOrder";
				 }
			}
			else
			{
				/* NextPurchase(); */
				window.location.href="PurchaseOrder.do?tabid=NextPurchaseOrder";
			}
		}
		
		function NextPurchase()
		{
			/* document.getElementById('tab').value="NextPurchaseOrder";
			document.forms[0].action="PurchaseOrder.do";
			document.forms[0].submit(); */
			window.location.href="PurchaseOrder.do?tabid=NextPurchaseOrder";
		}
		
		function PreviousPurchaseOrder(form)
		{
			if(flag==1){
				 //if(window.confirm('<bean:message key="BizComposer.PurchaseOrder.SaveConfirm" />')){
				 if(showSavePurchaseOrderDialog())
				 {
				 	SaveConfirm(form);
				 }
				 else
				 {
				 	//PreviousPurchase();
					 window.location.href="PurchaseOrder.do?tabid=PreviousPurchaseOrder";
				 }
			}
			else
			{
				//PreviousPurchase();
				window.location.href="PurchaseOrder.do?tabid=PreviousPurchaseOrder";
			}
		}
		
		function PreviousPurchase()
		{
			/* document.getElementById('tab').value="PreviousPurchaseOrder";
			document.forms[0].action="PurchaseOrder.do";
			document.forms[0].submit(); */
			window.location.href="PurchaseOrder.do?tabid=PreviousPurchaseOrder";
		}
		
		function DeletePurchaseOrder()
		{
			debugger;
			ponum=document.PurchaseOrderForm.orderNo.value;
			if(ponum.length==0 || ponum==0)
			{

				return showItemOrderNumberDialog();
				document.PurchaseOrderForm.orderNo.focus();
			}
			/* else if(confirm('<bean:message key="BizComposer.PurchaseOrder.Delete.Validation" />')) */
			else
			{
				debugger;
				event.preventDefault();
				$("#deletePurchaseOrderDialog").dialog({
				    	resizable: false,
				        height: 200,
				        width: 500,
				        modal: true,
				        buttons: {
				            "Ok": function () {
				            	debugger;
				                $(this).dialog("close");
				                debugger;
				                //else if(confirm('<bean:message key="BizComposer.PurchaseOrder.Delete.Validation" />'))
				    			/* document.getElementById('tab').value="DeletePurchaseOrder"; */
				    			/* document.forms[0].action="PurchaseOrder.do?tabid=DeletePurchaseOrder";
				    			document.getElementById('tabid').value="DeletePurchaseOrder";
				    			document.forms[0].submit(); */
				    			window.location = "PurchaseOrder.do?tabid=DeletePurchaseOrder";
				            },
				            Cancel: function () {
				                $(this).dialog("close");
				                return false;
				            }
				        }
				    });
				    return false;
			}
		}
		
function init()
{
	debugger;
	var invoiceStyleID = "<%= request.getAttribute("Invoicestyleid")%>";
	$('select[id="invoiceStyle"]').find('option[value="'+invoiceStyleID+'"]').attr("selected",true);


	isItemExist=document.getElementById('CartSize').value;
	chbox=document.PurchaseOrderForm.company;
	if(chbox.checked){
		document.getElementById('custNm').value=document.PurchaseOrderForm.companyName.value;
		chbox.value="on";
	}
	else{

		document.getElementById('custNm').value=document.PurchaseOrderForm.fullName.value;

		chbox.value="off";
	}
	<logic:present name="Style">
		StyleChange(<bean:write name="Style"/>);
	</logic:present>
	<logic:notPresent name="Style">
		StyleChange(document.PurchaseOrderForm.invoiceStyle.value);
	</logic:notPresent>

	<logic:present name="IsUpdated">
		//DropShipInvoice();
	</logic:present>

	<logic:present name="Exists">
		<logic:equal name="Exists" value="true">
			/* if(confirm("An P.O having same number already exists.\n Would you like to see the invoice?")){
				PurchaseInfo();
			}
			else
			{
				document.PurchaseOrderForm.orderNo.value=document.PurchaseOrderForm.previousPoNum.value;
				PurchaseInfo();
			} */
			debugger;
			event.preventDefault();
			$("#poNumberExist").dialog({
					resizable: false,
					height: 200,
					width: 500,
					modal: true,
					buttons: {
						"Ok": function () {
							debugger;
							$(this).dialog("close");
							debugger;
							PurchaseInfo();
						},
						Cancel: function () {
							$(this).dialog("close");
							document.PurchaseOrderForm.orderNo.value=document.PurchaseOrderForm.previousPoNum.value;
							PurchaseInfo();
						}
					}
				});
				return false;
		</logic:equal>
		<logic:equal name="Exists" value="false">
			document.getElementById('tab').value="NotExist";
			document.forms[0].action="PurchaseOrder.do";
			document.forms[0].submit();
		</logic:equal>
	</logic:present>
	<logic:present name="Flag">
		setFlag();
	</logic:present>
}
		
		function PurchaseInfo(){
			document.getElementById('tab').value="InvoiceData";
			document.forms[0].action="PurchaseOrder.do";
			document.forms[0].submit();
		}
		
		function DropShipInvoice()
		{
			return dropShipInvoiceDialog();
			debugger;
			event.preventDefault();
			$("#dropShipInvoiceDialog").dialog({
			    	resizable: false,
			        height: 200,
			        width: 500,
			        modal: true,
			        buttons: {
			            "Ok": function () {
			            	//<bean:message key="BizComposer.PurchaseOrder.DropShipInvoice.Validation" />
			            	debugger;
			                $(this).dialog("close");
			                debugger;
			                document.getElementById('dsvalue').value=document.PurchaseOrderForm.orderNo.value;
							document.getElementById('tab').value="DropShipInvoice";
							document.forms[0].action="Invoice.do";
							document.forms[0].submit();
			            },
			            Cancel: function () {
			                $(this).dialog("close");
			                NewPurchase();
			                return false;
			            }
			        }
			    });
			    return false;
			/* if(confirm('')){
				
			}
			else
			{
				
			} */
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
			setFlag();
		}
		function Multiplication()
		{
			if(document.getElementById('qty_id').value==""){
				document.getElementById('qty_id').value=1;
			}
			qty=parseInt(document.getElementById('qty_id').value);
			var uprice = document.getElementById('unitPrice_id').value;
			
			var amount=qty*uprice;
			document.getElementById('amount_id').value=amount.toFixed(2);;				
		}

		function SaveConfirm(form)
		{
			shipinfo();
			No=form.orderNo.value;
			custnm=trim(document.getElementById('custNm').value);
			cid=form.custID.value;
			if(isship==2)
			{

				return showShipInfoValidationDialog();
			}
			else if(cid==0)
			{

				return showValidationDialog();
				document.getElementById('custNm').value="";
				document.getElementById('custNm').focus();
			}
			else if(custnm=="")
			{

				return showValidationDialog();
				document.getElementById('custNm').focus();
			}
			else
			{
				if(No.length==0 || No==0)
				{

					return showItemOrderNumberDialog();
					form.orderNo.focus();
				}
				else
				{
					event.preventDefault();
					$("#savePurchaseOrderDialog").dialog({
				    	resizable: false,
				        height: 200,
				        width: 500,
				        modal: true,
				        buttons: {
				            "Ok": function () {
				                
				            	$(this).dialog("close");
				 				total=form.total.value;
								form.total.value=total;
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
								csize = document.getElementById('CartSize').value		
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
								document.getElementById('tab').value="SavePurchaseOrder";
								document.forms[0].action="PurchaseOrder.do";
								document.forms[0].submit();
				            },
				            Cancel: function () {
				                $(this).dialog("close");
				                return false;
				            }
				        }
				    });
				    return false;
				}
			}
		}
		
function setFlag()
{
	flag=1;
	setIds();
}
		
function setIds()
{
	//document.getElementById("droplst").innerHTML ="";
	//document.getElementById("list").innerHTML ="";
}
		
function ShowAddNewUser()
{
	if(document.PurchaseOrderForm.custID.value==0)
	{			
		window.open("ShowNewUser.do?tabid=ShowUser",null,"scrollbars=yes,height=600,width=1250,status=yes,toolbar=no,menubar=no,location=no,modal=yes");
	}
}
		
function BillConfirmAddress()
{
	if(document.PurchaseOrderForm.custID.value!=0)
	{
		window.open("ShowNewUser.do?tabid=AddressConfirm&CType=bill&custID="+document.PurchaseOrderForm.custID.value,null,"scrollbars=yes,height=450,width=600,status=no,toolbar=no,menubar=no,location=no");
	}
}
function ShipConfirmAddress()
{
	if(document.PurchaseOrderForm.shipAddr.value!=0)
	{
		window.open("ShowNewUser.do?tabid=AddressConfirm&CType=ship&custID="+document.PurchaseOrderForm.clientVendorID.value,null,"scrollbars=yes,height=450,width=600,status=yes,toolbar=no,menubar=no,location=no");
	}
}
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
</html>
<!-- dialog box that used in this page -->
<div id="showSelectItemDialog" style="display:none;">
	<p><bean:message key="BzComposer.purchaseorder.selectitemfirst"/></p>
</div>
<div id="showValidationDialog" style="display:none;">
	<p><bean:message key="BzComposer.purchaseorder.selectcustomervalidation" /></p>
</div>
<div id="showShipInfoValidationDialog" style="display:none;">
	<p><bean:message key="BzComposer.purchaseorder.shippinginformationvalidation" /></p>
</div>
<div id="showItemOrderNumberDialog" style="display:none;">
	<p><bean:message key="BzComposer.purchaseorder.ponumvalidation" /></p>
</div>
<div id="savePurchaseOrderDialog" style="display:none;">
	<p><bean:message key="BzComposer.purchaseorder.updatepo" /></p>
</div>
<div id="deleteRowDialog" style="display:none;">
	<p><bean:message key="BzComposer.purchaseorder.deleteitem" /></p>
</div>
<div id="showSavePurchaseOrderDialog" style="display:none;">
	<p><bean:message key="BzComposer.purchaseorder.savechangedinformation" /></p>
</div>
<div id="updatePurchaseOrderDialog" style="display:none;">
	<p><bean:message key="BzComposer.purchaseorder.savepurchaseorder" /></p>
</div>
<div id="deletePurchaseOrderDialog" style="display:none;">
	<p><bean:message key="BzComposer.purchaseorder.deleterecordvalidation" /></p>
</div>
<div id="dropShipInvoiceDialog" style="display:none;">
	<p><bean:message key="BzComposer.purchaseorder.createinvoicefordropshippingvalidation" /></p>
</div>
<div id="poNumberExist" style="display:none;">
	<p><bean:message key="BzComposer.purchaseorder.pohavesamenumber" />
	\n <bean:message key="BzComposer.purchaseorder.seetheinvoice" /></p>
</div>