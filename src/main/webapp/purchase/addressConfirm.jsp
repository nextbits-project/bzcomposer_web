<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<script>
	self.moveTo(190,150);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" language="JavaScript1.2"
	src="tree-menu/apytmenu.js"></script>
<script type="text/javascript" language="JavaScript1.2"
	src="tree-menu/apytmenu_add.js"></script>

<%@include file="/include/header.jsp"%>
<title><bean:message
	key="BzComposer.Purchase.PurchaseOrder.ConfirmAddressTitle" /></title>
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
var o22 = null;
var o33 = null;
var o1 = null;
var oT = null;

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
  } catch (ex) {
  }
}

function writeSelect()
{
  
   if (o.readyState != 4 || o.status != 200) { 
      return;
    }
     
    document.getElementById("t_statedata").innerHTML = o.responseText ;
}
function writeSelect33()
{
  
   if (o33.readyState != 4 || o33.status != 200) { 
      return;
    }
     
    document.getElementById("t_statedata").innerHTML = o33.responseText ;
}
	function refreshItemsNow(val){
	
	  o = c(writeSelect);
	  oGET(o,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=state&Cid=' + val)
	}
	function refreshItemsNow33(val,sval){
	  o33 = c(writeSelect33);
	  oGET(o33,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=state&Cid=' + val+"&sval="+sval)
	}
	
	function setState(value){

  }
	
	
</script>
</head>
<body onunload="getValues();">
<html:form action="Vendor.do" method="post">

	<div id="cos">

	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding">
	<div><span
		style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"></span>
	</div>
	<div align="center">
	<table>
		<tr>
			<td>
			<div align="center"><logic:present name="MSG">
				<font color="blue"> <bean:write name="MSG" /></font>
			</logic:present></div>
			</td>
		</tr>
		<tr>
			<td><logic:present name="ConfirmType">
				<logic:equal name="ConfirmType" value="bill">
					<div align="center"><bean:message
						key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.BillAddress" />
					</div>
				</logic:equal>
				<logic:notEqual name="ConfirmType" value="bill">
					<logic:equal name="ConfirmType" value="ship">
						<div align="center"><bean:message
							key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.ShipAddress" />
						</div>
					</logic:equal>
				</logic:notEqual>
			</logic:present></td>
		</tr>
		<tr>

			<td>
			<fieldset>
			<div align="center">
			<table>
				<tr>
					<td><bean:message
						key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.CompanyName" />
					</td>
					<td><html:text property="cname"></html:text></td>

				</tr>
				<tr>
					<td><bean:message
						key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.FirstName" />
					</td>
					<td><html:text property="firstName"></html:text></td>
				</tr>
				<tr>
					<td><bean:message
						key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.LastName" />
					</td>
					<td><html:text property="lastName"></html:text></td>
				</tr>
				<tr>
					<td><bean:message
						key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.Address1" />
					</td>
					<td><html:text property="address1"></html:text></td>
				</tr>
				<tr>
					<td><bean:message
						key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.Address2" />
					</td>
					<td><html:text property="address2"></html:text></td>
				</tr>
				<tr>
					<td><bean:message
						key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.City" /></td>
					<td><html:text property="city"></html:text></td>
				</tr>

				<tr>
					<td><bean:message
						key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.State" /></td>
					<td id="t_statedata"></td>
				</tr>
				<tr>
					<td><bean:message
						key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.ZipCode" />
					</td>
					<td><html:text property="zipCode"
						onkeypress="return numbersonly(event,this.value)"></html:text></td>
				</tr>
				<tr>
					<td><bean:message
						key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.Country" />
					</td>
					<td><html:select property="country"
						onchange="refreshItemsNow(this.value);" style="width:200px">
						<html:option value="0">
							<bean:message key="BzComposer.ComboBox.Select" />
						</html:option>
						<html:options collection="cList" property="value"
							labelProperty="label" />

					</html:select> <script>
									<logic:present name="state">
										 var contry=document.VendorForm.country.value;
									   	 refreshItemsNow33(contry,'<bean:write name="state" />');
									</logic:present>	    
								</script></td>

				</tr>


			</table>
			</div>
			</fieldset>
			</td>

		</tr>
		<tr>
			<td><bean:message
				key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.SureMessage" />
			</td>
		</tr>
		<tr align="center">
			<td><input type="button" class="formbutton" name="ok"
				value='<bean:message key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.OkButton" />'
				onclick="Update();"> <input type="button" class="formbutton"
				name="cancelB" onclick="cancel();"
				value='<bean:message key="BzComposer.Purchase.PurchaseOrder.ConfirmAddress.CloseButton" />'>
			</td>
		</tr>
	</table>
	</div>

	</div>
	</div>
	</div>
	</div>
	</div>

	<div><html:hidden property="clientVendorID" /> <html:hidden
		property="addressType" /> <html:hidden property="bsAddressID" /> <html:hidden
		property="billTo" /></div>
	<!-- end Contents -->
</html:form>
<%@ include file="/include/footer.jsp"%>

</body>
<script type="text/javascript">
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

function Update(){
	var ctypeValue="";
	if(document.VendorForm.addressType.value==1)
		ctypeValue="bill";
	else
		ctypeValue="ship";
	document.forms[0].action="ShowNewUser.do?tabid=Confirm&CType="+ctypeValue;
	document.forms[0].submit();
	
}
function cancel(){
	getValues();	
	window.close();
}

function getValues(){
	if(document.VendorForm.addressType.value==1){
		window.opener.document.forms[0].billAddrValue.value=document.VendorForm.bsAddressID.value;	
		window.opener.document.forms[0].billTo.value=document.VendorForm.billTo.value;
	}
	else{
		window.opener.document.forms[0].shipAddr.value=document.VendorForm.bsAddressID.value;	
		window.opener.document.forms[0].shipTo.value=document.VendorForm.billTo.value;
	}
}
</script>
</html>

