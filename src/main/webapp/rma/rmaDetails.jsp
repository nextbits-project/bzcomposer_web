<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<script>
window.onload = initShowHideDivs;
</script>
<script type="text/javascript">
function cancelRMADialog() {
	debugger;
    $("#cancelRMADialog").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "Ok": function () {
                $(this).dialog("close");
                debugger
                RID=document.getElementById("RMAID").value ;
        		document.forms[0].action = "RMA.do?tabid=R0R0M0&RMAno="+RID;
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

function showRMAQuantityDialog() {
	debugger;
    $("#showRMAQuantityDialog").dialog({
    	resizable: false,
        height: 200,
        width: 550,
        modal: true,
        buttons: {
            "Ok": function () {
                $(this).dialog("close");
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

function RMADetailsDialog() {
	debugger;
    $("#RMADetailsDialog").dialog({
    	resizable: false,
        height: 200,
        width: 550,
        modal: true,
        buttons: {
            "Ok": function () {
                $(this).dialog("close");
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

function RMAQuantityDialog() {
	debugger;
    $("#RMAQuantityDialog").dialog({
    	resizable: false,
        height: 200,
        width: 550,
        modal: true,
        buttons: {
            "Ok": function () {
                $(this).dialog("close");
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
<title><bean:message key="BzComposer.RMA.RMADetails.RMADetailsTitle"/> </title>
</head>
<body onload="init();">
<!-- begin shared/header -->
<html:form action="RMA.do?tabid=R0S0C0" method="post">
	<div id="cos">

	<div class="statusquo ok">

	<div id="hoja">
	<div id="blanquito">
	<div id="padding"><!-- begin Contents --> <span id="waitMessage"> </span>

	<div id="table-negotiations">
	<table class="tabla-listados" cellspacing="0" width="90%">
	<tr>
		<td>
		<table class="tabla-listados" cellspacing="0" border="0" width="60%">
			<thead>
			<tr>
				<th class="emblem" colspan="2">
					<bean:message	key="BzComposer.rma.InvoiceInfo" />
				</th>
			</tr>
			</thead>
			<tbody>
				<tr>
					<td><bean:message key="BzComposer.RMA.LastName" /></td>
					<td><logic:notEmpty name="Lname">
						<input type="text" disabled="disabled"
							value="<bean:write name="Lname"  />">
						</logic:notEmpty> <logic:empty name="Lname">
						<input type="text" value="" disabled="disabled">
						</logic:empty></td>
				</tr>
				<tr>
					<td><bean:message key="BzComposer.RMA.FirstName" /></td>
					<td><logic:notEmpty name="Fname" >
						<input type="text" disabled="disabled"
							value="<bean:write name="Fname" />">
					</logic:notEmpty> <logic:empty name="Fname" >
						<input type="text" disabled="disabled" value="">
					</logic:empty></td>
				</tr>
				
				<tr>
					<td><bean:message key="BzComposer.RMA.Invoice" /></td>
					<td><logic:notEmpty name="OrderID">
						<input type="text" disabled="disabled"
							value="<bean:write name="OrderID"  />">
					</logic:notEmpty> <logic:empty name="OrderID" >
						<input type="text" disabled="disabled" value="">
					</logic:empty></td>
				</tr>
			</tbody>
			</table>
			
		</td>
	</tr>
	<tr>
		<td>
		<table class="section-border" style="padding: 4px;">
		<tr>
			<td>
			&nbsp;&nbsp;&nbsp;<bean:message	key="BzComposer.rma.InvoiceItem" />

			<div style="overflow:auto;height:200;width:425">
			
			<table cellspacing="0">
			<thead>
				<tr>
					<th><bean:message key="BzComposer.RMA.ItemCode" /></th>
					<th><bean:message key="BzComposer.RMA.ItemDescription" /></th>
					<th><bean:message key="BzComposer.RMA.RmaDetail.Qty" /></th>
					<th><bean:message key="BzComposer.RMA.UnitPrice" /></th>
					<th><bean:message key="BzComposer.RMA.UnitWeight" /></th>
				</tr>
			</thead>
			<tbody>
				<logic:present name="ItemDetails" scope="request">
					<logic:notEmpty name="ItemDetails" scope="request">
	
						<bean:size id="ItemDetailsID" name="ItemDetails" />
						<input type="hidden" name="RMADID" id="lSize"
							value='<bean:write name="ItemDetailsID" />'>
	
						<logic:iterate name="ItemDetails" id="objList" scope="request"
							indexId="indx">
							<tr id='$<bean:write name="indx" />$' 
								onclick="setItemId('<bean:write name="objList" property="cartID" />','$<bean:write name="indx" />$');">
								<td align="center" nowrap="nowrap"><bean:write name="objList" property="itemCode" /></td>
								<td><bean:write name="objList" property="itemDesc" />
								&nbsp;&nbsp;<bean:write name="objList" property="lname" /></td>
								<td><bean:write name="objList" property="qty" />
									</td>
								<td align="right"><bean:write name="objList"
									property="unitPrice" /></td>
								<td align="right"><bean:write name="objList"
									property="unitWeight" /></td>
							</tr>
						</logic:iterate>
					</logic:notEmpty>
				</logic:present>
			</tbody>	
			</table>
			
			</div>
		
			</td>

			<td >
			
			
			<table  class="tabla-listados" cellspacing="0" border="0">
			<thead>
				<tr>
					<th class="emblem" colspan="2">
						<bean:message	key="BzComposer.rma.RMAInfo" />			
					</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td nowrap="nowrap"><bean:message key="BzComposer.RMA.lastrma" />
					
									</td>
				<td> <logic:notEmpty name="LastRMA">
					<input type="text" disabled="disabled"
						value="<bean:write name="LastRMA"  />">
				</logic:notEmpty> <logic:empty name="LastRMA">
					<input type="text" disabled="disabled" value="">
				</logic:empty>
				
				</td>
				
			</tr>
			<tr>
				<td colspan="2">
					<hr>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><bean:message key="BzComposer.RMA.rma" /></td>
				<td><html:text property="rma"  maxlength="30" /></td>
			</tr>
			<tr>
				<td><bean:message key="BzComposer.RMA.Reason" /></td>
				<td><html:text property="reason" value="" maxlength="45"/></td>
			</tr>
			<tr>
				<td><bean:message key="BzComposer.RMA.RmaQty" /></td>
				<td><html:text property="qty" maxlength="6"
				onkeypress="return numbersonly(event,this.value)" value="" /></td>
			</tr>

			<tr>
				<td></td>
				<td><input type="button"  disabled="disabled" id="approveId" class="formButton"
					onclick="approveRMA();" name="findBtn" value="Approve RMA"
					title="Select an Item from Invoice">
					
				</td>
				
			</tr>
			</tbody>
		</table>
		</td>
	</tr>
	</table>
	<tr align="center">
		<td >
			<bean:message key="BzComposer.rma.RmaItem" />
		</td>
	</tr>
	<tr>
	<td>	



		<div id="table-negotiations" style="overflow:auto;height:350" class="section-border">
			<table class="tabla-listados" cellspacing="0">
				<thead>
					<tr>
						<th><bean:message key="BzComposer.RMA.rma" /></th>
						<th><bean:message key="BzComposer.RMA.ItemCode" /></th>
						<th><bean:message key="BzComposer.RMA.ItemDescription" /></th>
						<th><bean:message key="BzComposer.RMA.Reason" /></th>
						<th align="right"><bean:message key="BzComposer.RMA.RmaQty" /></th>
						<th align="right"><bean:message key="BzComposer.RMA.UnitPrice" /></th>
						<th align="right"><bean:message key="BzComposer.RMA.UnitWeight" /></th>

					</tr>
					<logic:present name="RMADetails" scope="request">
						<logic:notEmpty name="RMADetails" scope="request">
							<bean:size id="RMADetailsID" name="RMADetails" />
							<input type="hidden" name="RMALID" id="l2Size"
								value='<bean:write name="RMADetailsID" />'>
								<logic:iterate name="RMADetails" id="RobjList" scope="request"
									indexId="ndx">
								<tr id="<bean:write name="ndx" />$$"
									onclick="setRMAId('<bean:write name="RobjList" property="rma" />','<bean:write name="ndx" />$$');">
									<td><bean:write name="RobjList" property="rma" /></td>
									<td nowrap="nowrap"><bean:write name="RobjList" property="itemCode" /></td>
									<td nowrap="nowrap" width="250"><bean:write name="RobjList" property="itemDesc" /></td>
									<td nowrap="nowrap"><bean:write name="RobjList" property="reason" /></td>
									<td align="right"><bean:write name="RobjList" property="qty" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td align="right"><bean:write name="RobjList" property="unitPrice" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td align="right"><bean:write name="RobjList" property="unitWeight" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								</tr>
							</logic:iterate>
						</logic:notEmpty>
					</logic:present>

				</thead>
				<tbody>
					<tr>
						<td></td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
		<tr>
			<td><input type="hidden" id="RMAID" name="RMAVal"> <input
				type="hidden" id="cartID" name="ItemVal"></td>
		</tr>
		<tr>
			<td align="center"><input type="button" disabled="disabled"
				id="RMACancel" onclick="CancelRMA();" class="formButton"
				title='<bean:message key="BzComposer.RMA.RmaDetails.CancelRMAToolTip" />' name="findBtn" value='<bean:message key="BzComposer.RMA.RmaDetails.CancelRMA" />'>&nbsp;&nbsp;<input
				type="button" onclick="closeme();" name="findBtn" value='<bean:message key="BzComposer.RMA.RmaDetails.Close" />'' class="formButton"
				title="Close">
			</td>
			
		</tr>
	</table>
	</div>
	</div>

	<!-- end Contents --></div>
	</div>
	</div>
	</div>
	<div class="clear"></div>	
</html:form>
<%@ include file="/include/footer.jsp"%>
</body>
</html>
<script>
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

function approveRMA()
{
	cartID=document.getElementById("cartID").value ;
	if(trim(document.RMAForm.rma.value)==""){
		//alert('<bean:message key="BzComposer.RMA.rmano.Validation" />')
		return RMADetailsDialog();
		document.RMAForm.rma.focus();
	}
	else if(parseInt(document.RMAForm.qty.value)==0 || document.RMAForm.qty.value==""){
		//alert('<bean:message key="BzComposer.RMA.qty.Validation" />');
		return showRMAQuantityDialog();
		document.RMAForm.qty.focus();
	}
	else if((!IsNumeric(document.RMAForm.qty.value))){
		//alert('<bean:message key="BzComposer.RMA.qty.InNumber.Validation" />');
		return RMAQuantityDialog();
		document.RMAForm.qty.focus();
	}
	else{
		document.RMAForm.qty.value = parseInt(document.RMAForm.qty.value);
		document.forms[0].action = "RMA.do?tabid=R0A0D0&cartID="+cartID ;
		document.forms[0].submit();
	}
}	

	function IsNumeric(stext){
	   var validchars = "0123456789";
	   var isnumber=true;
	   var ch;
	   for (i = 0; i < stext.length && isnumber == true; i++){ 
	      ch = stext.charAt(i); 
    	  if (validchars.indexOf(ch) == -1){
	         isnumber = false;
    	  }
       }
	   return isnumber;
   }
   
function CancelRMA()
{	
	debugger;
	return cancelRMADialog();
	/* if(confirm('<bean:message key="BzComposer.RMA.CancelRMA.Confirm" />'))
	{
		RID=document.getElementById("RMAID").value ;
		document.forms[0].action = "RMA.do?tabid=R0R0M0&RMAno="+RID;
		document.forms[0].submit();
	} */
}	

function setItemId(Ino,rid)
{

size=document.getElementById("lSize").value;
for(i=0;i<size;i++){
var row1=document.getElementById("$"+i+"$");
row1.className="";
}
var rd=document.getElementById(rid);
rd.className='draft';

document.getElementById("cartID").value=Ino;
document.getElementById("approveId").disabled=false;
}

function setRMAId(Rno,rid)
{

size=document.getElementById("l2Size").value;
for(i=0;i<size;i++){
var row1=document.getElementById(i+"$$");
row1.className="";
}
var rd=document.getElementById(rid);
rd.className='draft';
document.getElementById("RMAID").value=Rno;
document.getElementById("RMACancel").disabled=false;
}

function closeme()
{
window.close();
}

function init(){
	debugger;
	<logic:present name="msg">
		alert('<bean:write name="msg" />');
		
	</logic:present>
	document.RMAForm.rma.value="";
}

</script>
<!-- Dialog box used in rmadetails page -->
<div id="cancelRMADialog" title = "Cancel RMA" style="display:none;">
	<p><bean:message key="BzComposer.RMA.CancelRMA.Confirm" /></p>
</div>
<div id="RMADetailsDialog" title = "Select First Name and Last Name" style="display:none;">
	<p><bean:message key="BzComposer.RMA.rmano.Validation" /></p>
</div>
<div id="showRMAQuantityDialog" title = "Enter Quantity greater than 0" style="display:none;">
	<p><bean:message key="BzComposer.RMA.qty.Validation" /></p>
</div>
<div id="RMAQuantityDialog" title = "Enter Quantity in only digits" style="display:none;">
	<p><bean:message key="BzComposer.RMA.qty.InNumber.Validation" /></p>
</div>