<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<!-- <script> -->
<!-- 	self.moveTo(100,50); -->
<!-- </script> -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title><bean:message
	key="BzComposer.Purchase.PurchaseOrder.AddNewUserTitle" /></title>
	<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
  <script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
</head>
<body onload="init();">
<script type="text/javascript">
$(function() {
    $( "#tabs" ).tabs();
  });
var funsequence = 0;
var _1 = navigator.userAgent.toLowerCase();
var ___ = (_1.indexOf("msie") != -1);
var ___5 = (_1.indexOf("msie 5") != -1);
var _io = (_1.indexOf("opera") != -1);
var _im = (_1.indexOf("mac") != -1);
var ____gi = (_1.indexOf("gecko") != -1);
var i____s = (_1.indexOf("safari") != -1);
var o = null;
var o1 = null;
var o2 = null;
var o3 = null;
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
function writeSelect(){
   if (o.readyState != 4 || o.status != 200) { 
      return;
   }
    document.getElementById("t_statedata").innerHTML = o.responseText ;
}
function refreshItemsNow(val){
  o = c(writeSelect);
  oGET(o,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=state&Cid=' + val)
}
function writeSelect1(){
   if (o1.readyState != 4 || o1.status != 200) { 
      return;
    }
    document.getElementById("t_statedata1").innerHTML = o1.responseText ;
}
function refreshItemsNow1(val){
  o1 = c(writeSelect1);
  oGET(o1,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=bsstate&Cid=' + val)

}
function writeSelect2(){
   if (o2.readyState != 4 || o2.status != 200) { 
      return;
    }
   document.getElementById("t_statedata2").innerHTML = o2.responseText ;
}
function refreshItemsNow12(val,sval){
	 o2 = c(writeSelect2);
  oGET(o2,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=shstate&Cid=' + val+"&sval="+sval)
}
function refreshItemsNow2(val)
{
  o2 = c(writeSelect2);
  oGET(o2,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=shstate&Cid=' + val)
}
function setState(state_id,name){
	if(name == 'state'){
		document.VendorForm.state.value = state_id;
	}
	else if(name == 'bsstate'){
		document.VendorForm.bsstate.value = state_id;
		document.getElementById('bsst').value = state_id;
	}
	else if(name == 'shstate'){
		document.VendorForm.shstate.value = state_id;
	}
  }
</script>
<script type="text/javascript">
  function validate() {
  	var email = document.VendorForm.email.value;
  	var mail =String(email);
  	
  	if(email==""){
  	}
    else if (! isValidEmail(email)) {
        alert('<bean:message key="BzComposer.NewCustomer.Email.Validation" />');
        document.VendorForm.email.value="";
       	document.VendorForm.email.focus();
        return false;
    }
   	return true;
  }
</script>

<!-- begin shared/header -->


<html:form action="Vendor.do" method="post">
	<div id="cos">
	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">

	<div id="padding"><!-- begin Contents --> <!-- add the code for tab here -->
		<div><span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">Add New User</span></div>
	
	<div>
	<div id="tabs" style="height:400px;">
  <ul>
    <li><a href="#General-1"><bean:message key="BzComposer.Customer.General" /></a></li>
    <li><a href="#account-2"><bean:message key="BzComposer.Customer.Account" /></a></li>
    <li><a href="#service-3"><bean:message key="BzComposer.Customer.Service" /></a></li>
    <li><a href="#manageAddress-4"><bean:message key="BzComposer.Customer.ManageAddress" /></a></li>
    <li><a href="#finance-5"><bean:message key="BzComposer.Customer.FinanceCharges" /></a></li>
    
  </ul>
  <div id="General-1">
   <div id="content1" class="tabPage"><!-- add here the content of first tab -->
	
					<div id="table-negotiations">
					<table class="tabla-listados" cellspacing="0">
						<thead>
							<tr>
								<th colspan="10">Vendor Informations</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><bean:message key="BzComposer.Vendor.FirstName" /><span
									class="inputHighlighted"><bean:message
									key="BzComposer.CompulsoryField.Validation" /></span></td>
								<td><html:text property="firstName"  /></td>
								<td><bean:message key="BzComposer.Vendor.LastName" /><span
									class="inputHighlighted"><bean:message
									key="BzComposer.CompulsoryField.Validation" /></span></td>
								<td><html:text property="lastName"  /></td>
								<td><bean:message key="BzComposer.Vendor.StartDate" /></td>
								<td colspan="5"><html:text property="dateAdded" readonly="true" /> <img
									src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
									onclick="displayCalendar(document.VendorForm.dateAdded,'mm-dd-yyyy',this);">
								</td>
							</tr>
						
							<tr>
								<td><bean:message key="BzComposer.Vendor.Title" /></td>
								<td><html:select property="title">
									<html:options collection="titleList" property="value"
										labelProperty="label" />
								</html:select></td>
								<td  colspan="5">
							
							</tr>
						
							<tr>
							
								<td><bean:message key="BzComposer.Vendor.Company" /><span
									class="inputHighlighted"><bean:message
									key="BzComposer.CompulsoryField.Validation" /></span></td>
								<td colspan="2"><html:text property="cname" style="width: 80%;"/></span></td>
							
								<td  colspan="8">&nbsp;</td>
								
							</tr>
							<tr>
								<td><bean:message key="BzComposer.Vendor.Address1" /><span
									class="inputHighlighted"><bean:message
									key="BzComposer.CompulsoryField.Validation" /></span></td>
								<td colspan="2"><html:text property="address1" style="width:100%;" /></td>
						
								<td><bean:message key="BzComposer.Vendor.Address2" /></td>
								<td colspan="2"><html:text property="address2" style="width:100%;" /></td>
							
						
							<tr>
								<td id="t_country"><bean:message key="BzComposer.Vendor.Country" /></td>
								<td><html:select property="country"
									onchange="refreshItemsNow(this.value);"
									onblur="refreshItemsNow(this.value);">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="cList" property="value"
										labelProperty="label" />
								</html:select></td>
								<td id="t_state"><bean:message key="BzComposer.Vendor.State" /></td>
								<td id="t_statedata"></td>
							</tr>
							<script>
						        document.VendorForm.country.value="239";
						        refreshItemsNow("239");
							</script>
							
								<tr>
								<td><bean:message key="BzComposer.Vendor.City" /><span
									class="inputHighlighted"><bean:message
									key="BzComposer.CompulsoryField.Validation" /></span></td>
								<td><html:text property="city" /></td>
								<td><bean:message key="BzComposer.Vendor.ZipCode" /><span
									class="inputHighlighted"><bean:message
									key="BzComposer.CompulsoryField.Validation" /></span></td>
								<td><html:text onkeypress="return numbersonly(event,this.value)"
									property="zipCode"/></td>
							</tr>
							<tr>
								<td><bean:message key="BzComposer.Vendor.Province" /></td>
								<td><html:text property="province" /></td>
								<td><bean:message key="BzComposer.Vendor.Fax" /></td>
								<td><html:text property="fax"
									onkeypress="return numbersonly(event,this.value)" /></td>
							
								<td><bean:message key="BzComposer.Vendor.Phone" /></td>
								<td><html:text onkeypress="return numbersonly(event,this.value)"
									property="phone"  /></td>
								<td><bean:message key="BzComposer.Vendor.CellPhone" /></td>
								<td><html:text onkeypress="return numbersonly(event,this.value)"
									property="cellPhone" maxlength="16" /></td>
							</tr>
							<tr>
								<td><bean:message key="BzComposer.Vendor.HomePage" /></td>
								<td><html:text property="homePage" /></td>
								<td><bean:message key="BzComposer.Vendor.Email" /></td>
								<td><html:text property="email" /></td>
							
								<td><bean:message key="BzComposer.Vendor.Type" /></td>
								<td><html:select property="type">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="VendorCategoryList" property="value"
										labelProperty="label" />
								</html:select></td>
								<td><bean:message key="BzComposer.Customer.TaxID" /></td>
								<td colspan="3"><html:text property="texID" /></td>
							</tr>
							<tr>
								<td><bean:message key="BzComposer.Vendor.OppeningUnpaidBalance" /></td>
								<td><html:text property="openingUB" 
									onkeypress="return numbersonly(event,this.value)" /></td>
								<td ><input value="on" type="checkbox"
									name="isTaxable" id="chktax"> <bean:message
									key="BzComposer.Vendor.isTaxable" /></td>
							
							
								<td><input value="on" type="checkbox"
									name="isAlsoClient" id="chk_alsovendor"> <bean:message
									key="BzComposer.Customer.isAlsoClient" /></td>
										<td><bean:message key="BzComposer.Vendor.ExistingCredits" /></td>
								<td><html:text property="extCredit" 
									onkeypress="return numbersonly(event,this.value)" /></td>
	<td colspan="1" >&nbsp;</td>	                       <td colspan="1" >&nbsp;</td>
							</tr>
							<tr>
								<td><bean:message key="BzComposer.Vendor.Memo" /></td>
								<td colspan="3"><html:textarea style="width:100%;"  property="memo" /></td>
							</tr>
						</tbody>
					</table>
					</div>
					</div>  </div>
  <div id="account-2">
   <div id="content2" class="tabPage"><!-- add here the content of first tab -->


					<div id="table-negotiations" style="width:100%">
					<table class="tabla-listados" cellspacing="0">
						<thead>
							<tr>
								<th colspan="8"><bean:message
									key="BzComposer.Vendor.PrefrenceInformation" /></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><bean:message key="BzComposer.Vendor.term" /></td>
								<td ><html:select property="term">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="TermList" property="value"
										labelProperty="label" />
								</html:select></td>
							
								<td><bean:message key="BzComposer.Vendor.PayMethod" /></td>
								<td colspan="3"><html:select property="paymentType">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="PaymentList" property="value"
										labelProperty="label" />
								</html:select></td>
							</tr>
							<tr>
								<td><bean:message key="BzComposer.Vendor.Rep" /></td>
								<td ><html:select property="rep">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="RepList" property="value"
										labelProperty="label" />
								</html:select></td>
							
								<td><bean:message key="BzComposer.Vendor.ShippingVia" /></td>
								<td colspan="3"><html:select property="shipping">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="ShipCarrierList" property="value"
										labelProperty="label" />
								</html:select></td>
							</tr>
						</tbody>
					</table>
					</div>
					<div id="table-negotiations" >
					<table class="tabla-listados" cellspacing="0">
						<thead>
							<tr>
								<th colspan="7"><bean:message
									key="BzComposer.Vendor.CreditCardInformation" /></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><bean:message key="BzComposer.Vendor.CardType" /></td>
								<td ><html:select property="ccType">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="CreditCardList" property="value"
										labelProperty="label" />
								</html:select></td>
							<tr>
								<td><bean:message key="BzComposer.Vendor.CardNumber" /></td>
								<td ><html:text property="cardNo"
									onkeypress="return numbersonly(event,this.value);" /></td>
							
								<td><bean:message key="BzComposer.Vendor.ExpDate" /></td>
								<td ><html:text property="expDate" readonly="true" />
								<img
									src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
									onclick="displayCalendar(document.VendorForm.expDate,'mm/yyyy',this);">
								 <bean:message
									key="BzComposer.Vendor.mformate" /></td>
							</tr>
							<tr>

								<td><bean:message key="BzComposer.Vendor.CW2" /></td>
								<td ><html:text property="cw2" size="7" /></td>
						
								<td><bean:message key="BzComposer.Vendor.CardHolderName" /></td>
								<td><html:text property="cardHolderName" /></td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td><bean:message key="BzComposer.Vendor.BillingAddress" /></td>
								<td><html:text property="cardBillAddress" size="50" /></td>
							
						
								<td><bean:message key="BzComposer.Vendor.ZipCode" /></td>
								<td><html:text onkeypress="return numbersonly(event,this.value)"
									property="cardZip" /></td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>

						</tbody>
					</table>
					</div>
					</div>  </div>				

					
<div id="manageAddress-4">
					<div id="content3" class="tabPage"><!-- add here the content of first tab -->

					<div id="table-negotiations">
					<table align="center" style="width: 100%" class="tabla-listados">
					<thead>
							<tr>
								<th colspan="4">Manage Addresses</th>
							</tr>
							</thead>
							<thead>
						
							<tr>
						<td><input value="on"  checked="checked" type="checkbox" id="chk_setaddress"
									name="setdefaultaddress"
									onclick="hidebsaddress(this.form);">
									<input type="hidden" name="setdefaultbs" value="">
							<font size="2">
								Billing And Shipping Address should be the same as the Customer Information Address 	
							</font>
							
						</td>  
							<tr>
						</thead>
						<tr>
							<td>

							<table class="tabla-listados" cellspacing="0" width="300"
								align="left">
								<thead>
							<tr>
								<th colspan="4">Billing Address</th>
							</tr>
						</thead>
							
							
							
							
								<tbody>
									<tr>
										<td><bean:message key="BzComposer.Vendor.Company" /></td>
										<td><html:text property="bscname" disabled="true"/></td>
											<td>&nbsp;</td>
										<td>&nbsp;</td>									

									</tr>

									<tr>
										<td><bean:message key="BzComposer.Vendor.FirstName" /></td>
										<td><html:text property="bsfirstName" disabled="true"/></td>
								
										<td><bean:message key="BzComposer.Vendor.LastName" /></td>
										<td><html:text property="bslastName" disabled="true"/></td>
									</tr>
									<tr>
										<td><bean:message key="BzComposer.Vendor.Address1" /></td>
										<td><html:text property="bsaddress1" disabled="true"/></td>
								
										<td><bean:message key="BzComposer.Vendor.Address2" /></td>
										<td><html:text property="bsaddress2" disabled="true"/></td>
									</tr>

									<tr>
										<td><bean:message key="BzComposer.Vendor.City" /></td>
										<td><html:text property="bscity" disabled="true"/></td>
									
										<td><bean:message key="BzComposer.Vendor.ZipCode" /></td>
										<td><html:text
											onkeypress="return numbersonly(event,this.value)"
											property="bszipCode" disabled="true"/></td>
									</tr>

									<tr>

										<td id="t_country"><bean:message
											key="BzComposer.Vendor.Country" /></td>
										<td><html:select property="bscountry" disabled="true"
											onchange="refreshItemsNow1(this.value);"
											onblur="refreshItemsNow1(this.value);">

											<html:option value="0">
												<bean:message key="BzComposer.ComboBox.Select" />
											</html:option>
											<html:options collection="cList" property="value"
												labelProperty="label" />
										</html:select></td>
								
										<td id="t_state"><bean:message key="BzComposer.Vendor.State" /></td>
										<td id="t_statedata1"></td>

									</tr>
									<script>
 								        document.VendorForm.bscountry.value="239";
 								        refreshItemsNow1("239"); 
									</script> 

									<tr>
										<td><bean:message key="BzComposer.Vendor.Province" /></td>
										<td><html:text property="bsprovince" disabled="true" /></td>

									</tr>
									<tr>
										<td colspan="4" align="center"><input type="button" class="formbutton"
											name="ClearBillingBtn"
											value="<bean:message key="BzComposer.Vendor.ClearBillingAddress" />"
											onclick="clearBillingAdd();" title="Clear Billing Address"></td>
							</table>
							<td>
							
							</td>
								<td>				

							<table class="tabla-listados" cellspacing="0" width="300"
								align="left">
								<tbody>
							<thead>
								<tr>
									<th colspan="4">Shipping Address</th>
								</tr>
								</thead>
									<tr>
										<td><bean:message key="BzComposer.Vendor.Company" /></td>
										<td><html:text property="shcname" disabled="true" /></td>

									</tr>

									<tr>
										<td><bean:message key="BzComposer.Vendor.FirstName" /></td>
										<td><html:text property="shfirstName" disabled="true" /></td>
								
										<td><bean:message key="BzComposer.Vendor.LastName" /></td>
										<td><html:text property="shlastName" disabled="true" /></td>
									</tr>
									<tr>
										<td><bean:message key="BzComposer.Vendor.Address1" /></td>
										<td ><html:text property="shaddress1"  disabled="true"/></td>
								
										<td><bean:message key="BzComposer.Vendor.Address2" /></td>
										<td ><html:text property="shaddress2" disabled="true" /></td>
									</tr>

									<tr>
										<td><bean:message key="BzComposer.Vendor.City" /></td>
										<td><html:text property="shcity"  disabled="true"/></td>
								
										<td><bean:message key="BzComposer.Vendor.ZipCode" /></td>
										<td><html:text
											onkeypress="return numbersonly(event,this.value)"
											property="shzipCode"  disabled="true"/></td>
									</tr>

									<tr>

										<td id="t_country"><bean:message
											key="BzComposer.Vendor.Country" /></td>
										<td><html:select property="shcountry" disabled="true"
											onchange="refreshItemsNow2(this.value);"
											onblur="refreshItemsNow2(this.value);">

											<html:option value="0">
												<bean:message key="BzComposer.ComboBox.Select" />
											</html:option>
											<html:options collection="cList" property="value"
												labelProperty="label" />
										</html:select></td>
								
										<td id="t_state"><bean:message key="BzComposer.Vendor.State" /></td>
										<td id="t_statedata2"></td>

									</tr>
									<script>
 								        document.VendorForm.shcountry.value="239";
								        refreshItemsNow2("239");
										</script> 
									<tr>
										<td><bean:message key="BzComposer.Vendor.Province" /></td>
										<td><html:text property="shprovince"  disabled="true"/></td>

									</tr>
									<tr align="center">
										<td colspan="5"><input type="button" class="formbutton"
											name="ClearShippingBtn" onclick="clearShippingAdd();"
											value="<bean:message key="BzComposer.Vendor.ClearShippingAddress" />"
											title="Clear Shipping Address"></td>
									</tr>
								</tbody>
							</table>
							</td>
						</tr>
                                                <tr>
                                              	<td   colspan="3" align="center"><input type="button" name="CopyBtn" class="formbutton"
								onclick="CopyBilladdToShipAdd();"
								value="<bean:message key="BzComposer.Vendor.copy" />"
								title="Copy Address"></td>

                                          </tr>               
					</table>
					</div>
					</div>  </div>
					
					<div id="finance-5">
					<div id="content4" class="tabPage"><!-- add here the content of first tab -->
					<div id="table-negotiations" >

					<table class="tabla-listados" cellspacing="0">
						<thead>
							<tr>
								<th colspan="4"><bean:message key="BzComposer.Vendor.FinanceMsg" /></th>
							</tr>
						</thead>
						<thead>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td><input
									value="on" type="checkbox" id="chk_useind"
									name="UseIndividualFinanceCharges"
									onclick="hideother(this.form);"><font size="2"><bean:message
									key="BzComposer.Vendor.UseIndividualFinanceCharges" /></font></td>
							<tr>
							</thead>
							<tbody>
							<tr>
								<td>
								<div id="table-negotiations" style="width:48%;float: left;">
								<table class="tabla-listados" cellspacing="0">
									<thead>
										<tr>
											<th colspan="4"><bean:message
												key="BzComposer.Vendor.ChargeRate" /></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><bean:message key="BzComposer.Vendor.AnnualIntrestRate" /></td>
											<td colspan="3"><html:text
												onkeypress="return numbersonly(event,this.value)"
												property="annualIntrestRate" disabled="true" /></td>
										</tr>
										<tr>
											<td><bean:message
												key="BzComposer.Vendor.MinimumFinanaceCharge" /></td>
											<td colspan="3"><html:text
												onkeypress="return numbersonly(event,this.value)"
												disabled="true" property="minFCharges" /></td>
										</tr>

										<tr>
											<td><bean:message key="BzComposer.Vendor.GracePeriod" /></td>
											<td colspan="3"><html:text
												onkeypress="return numbersonly(event,this.value)"
												disabled="true" property="gracePrd" /></td>
										</tr>

									</tbody>
								</table>
								</div>
								<div id="table-negotiations" style="width:48%;float: right;">
								<table class="tabla-listados" cellspacing="0">
									<thead>
										<tr>
											<th colspan="4"><bean:message
												key="BzComposer.Vendor.ApplyingCharges" /></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="4">&nbsp;</td>
										</tr>
										<tr>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="4"><input value="on" type="checkbox" id="chk1"
												name="AssessFinanceChk" disabled="disabled"> <bean:message
												key="BzComposer.Vendor.AssessFinance" /></td>
										</tr>

									</tbody>
								</table>
								</div>
								</td>
							</tr>
					</table>
					</div>
					</div>
					</div>

	
				<!---------------------------  services   ------------------------------------------------------------------->
				<!-- ------------------------------------------------------------------------------- -->
		<script>
			count=0;
			cnt=0;
			var exist= new Array(10); 
			for (i=0; i<exist.length; i++){
				exist[i]=-1;
			}
		</script>
		<div id="service-3">
					<div id="content7" class="tabPage"><!------------------------------------------ add here the content of services tab ----------------------------------------------------->

<html:hidden
				property="table_serviceName" value="" /> <html:hidden
				property="table_defaultVal" value="0" /> <html:hidden
				property="table_size" value="0" /> <html:hidden
				property="table_invId" value="" /> <html:hidden
				property="table_bal" value="" /> <html:hidden
				property="table_serID" value="" /> <html:hidden
				property="table_DbDefSer" value="0" /> <bean:size
				name="ServiceList" id="SList" /> <input type="hidden" name="ssize"
				id="sSize" value='<bean:write name="SList"/>'> <logic:iterate
				name="ServiceList" id="objList1" indexId="index">
				<input type="hidden"
					value='<bean:write name="objList1" property="serviceID"/>'
					id='<bean:write name="index" />sid' />
				<input type="hidden"
					value='<bean:write name="objList1" property="serviceName"/>'
					id='<bean:write name="index" />sname' />
				<input type="hidden"
					value='<bean:write name="objList1" property="invoiceStyleId"/>'
					id='<bean:write name="index" />isid' />
			</logic:iterate> <bean:size name="InvoiceName" id="IName" /> <input
				type="hidden" name="isize" id="iSize"
				value='<bean:write name="IName"/>'> <logic:iterate
				name="InvoiceName" id="objList2" indexId="index">
				<input type="hidden"
					value='<bean:write name="objList2" property="invoiceStyleId"/>'
					id='<bean:write name="index" />invid' />
				<input type="hidden"
					value='<bean:write name="objList2" property="invoiceStyle"/>'
					id='<bean:write name="index" />iname' />
			</logic:iterate> <logic:present name="BalenceDetails" scope="request">
				<bean:size name="BalenceDetails" id="BDetails" />
				<input type="hidden" name="dsize" id="dSize"
					value='<bean:write name="BDetails"/>'>
				<logic:iterate name="BalenceDetails" id="objList3" indexId="index">
					<input type="hidden"
						value='<bean:write name="objList3" property="serviceBalance"/>'
						id='<bean:write name="index" />bal' />
					<input type="hidden"
						value='<bean:write name="objList3" property="defaultService"/>'
						id='<bean:write name="index" />dservice' />
					<input type="hidden"
						value='<bean:write name="objList3" property="serviceID"/>'
						id='<bean:write name="index" />srid' />
					<input type="hidden"
						value='<bean:write name="objList3" property="clientVendorID"/>'
						id='<bean:write name="index" />cvID' />
				</logic:iterate>
			</logic:present>
			<div id="table-negotiations" style="width:100%"><input type="hidden"
				value="1" id="hidn" />
			<table class="tabla-listados" cellspacing="0">
				<tbody>
					<thead>
					<tr>
						<th colspan="6"><bean:message key="BzComposer.Vendor.Service.Header" /></th>
					</tr>
					</thead>
					<tr>
						<td>Service</td>
						<td><html:select property="serviceID">
							<html:options collection="ServiceList" property="serviceID"
								labelProperty="serviceName"></html:options>
						</html:select></td>
						<td><input type="button" name="add"
							value="<bean:message
						key="BzComposer.Vendor.Service.Add" />"
							class="formbutton" onclick="addToTable(this.form);" /></td>
					</tr>
					<tr>
						<td><bean:message key="BzComposer.Vendor.Service.Service" /></td>
						
					</tr>
				</tbody>
			</table>
			<div id="table-negotiations"
				style="overflow:auto;height:400;width:100%;" class="section-border">
			<table class="tabla-listados" cellspacing="0">
				<thead>
					<tr>
						<th><bean:message key="BzComposer.Vendor.Service.ServiceName" /></th>
						<th><bean:message key="BzComposer.Vendor.Service.InvoiceStyle" /></th>
						<th><bean:message key="BzComposer.Vendor.Service.Balance" /></th>
						<th><bean:message key="BzComposer.Vendor.Service.Default" /></th>
						<th><bean:message key="BzComposer.Vendor.Service.Delete" /></th>
					</tr>
				</thead>
				<tr id="tr$$">
					<td align="center"></td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center"></td>
				</tr>
				<logic:present name="ServiceInfo" scope="request">
					<logic:empty name="ServiceInfo" scope="request">
						<input type="hidden" id="sIDSize" value="0" />
					</logic:empty>
				</logic:present>
			</table>
			<div>
			</div>
			</div>
			</div>
			</div>
			</div>
			</div>
				<table cellpadding="0" cellspacing="0" border="0" align=center  style="width: 100%;">
			<td align="center"><input type="button" class="formbutton"
				onclick="AddVendor();" name="Add"
				value="<bean:message
							key="BzComposer.Vendor.AddVendorButton" />"
				title="<bean:message
							key="BzComposer.Vendor.AddVendorToolTip" />">
			<input type="button" name="Close"
				value="<bean:message
							key="BzComposer.Vendor.CloseVendorButton" />"
				class="formbutton"
				title="<bean:message key="BzComposer.Vendor.CloseVendorToolTip" />"
				onclick="window.close();" /> <input type="hidden" name="stname"
				value="" id="stateId"></td>
				</table>
			</div>
			</div>
			</div></div>
	</div>
	</div>
	
	<div><input type="hidden" name="tabid" id="tab" value="VONODO" /> <input
		type="hidden" name="bst" id="bsst" value="0" /> <html:hidden
		property="state" value="0" /> <html:hidden property="bsstate"
		value="0" /> <html:hidden property="shstate" value="0" /></div>
</html:form>
<%@ include file="/include/footer.jsp"%>
</body>
</html>
<script>

function CopyBilladdToShipAdd(){
	document.VendorForm.shcname.value= document.VendorForm.bscname.value;
	document.VendorForm.shfirstName.value= document.VendorForm.bsfirstName.value;
	document.VendorForm.shlastName.value= document.VendorForm.bslastName.value;
	document.VendorForm.shaddress1.value= document.VendorForm.bsaddress1.value;
	document.VendorForm.shaddress2.value= document.VendorForm.bsaddress2.value;
	document.VendorForm.shcity.value= document.VendorForm.bscity.value;
	document.VendorForm.shzipCode.value = document.VendorForm.bszipCode.value;
	document.VendorForm.shprovince.value=document.VendorForm.bsprovince.value;
	document.VendorForm.shcountry.value= document.VendorForm.bscountry.value;
	document.VendorForm.shstate.value = document.getElementById('bsst').value;
	refreshItemsNow12(document.VendorForm.bscountry.value,document.getElementById('bsst').value);
}
function clearBillingAdd(){
	document.VendorForm.bscname.value="";
	document.VendorForm.bsfirstName.value="";
	document.VendorForm.bslastName.value="";
	document.VendorForm.bsaddress1.value="";
	document.VendorForm.bsaddress2.value="";
	document.VendorForm.bscity.value="";
	document.VendorForm.bszipCode.value="";
	document.VendorForm.bsprovince.value="";
	document.VendorForm.bscountry.value="0";
	document.VendorForm.bsstate.value="0";
	refreshItemsNow1(0);
}
function clearShippingAdd(){
	document.VendorForm.shcname.value="";
	document.VendorForm.shfirstName.value="";
	document.VendorForm.shlastName.value= "";
	document.VendorForm.shaddress1.value= "";
	document.VendorForm.shaddress2.value= "";
	document.VendorForm.shcity.value= "";
	document.VendorForm.shzipCode.value = "";
	document.VendorForm.shprovince.value="";
	document.VendorForm.shcountry.value= "0";
	document.VendorForm.shstate.value= "0";
	refreshItemsNow12(0,0);
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


function AddVendor(){
	if(trim(document.VendorForm.cname.value)==""){
		alert('<bean:message key="BzComposer.NewCustomer.Name.Validation" />');
		document.VendorForm.cname.focus();
	}
	else if(trim(document.VendorForm.firstName.value)==""){
		alert('<bean:message key="BzComposer.NewCustomer.FirstName.Validation" />');
		document.VendorForm.firstName.focus();
	}
	else if(trim(document.VendorForm.lastName.value)==""){
		alert('<bean:message key="BzComposer.NewCustomer.LastName.Validation" />');
		document.VendorForm.lastName.focus();
	}
	else if(trim(document.VendorForm.address1.value=="")){
		alert('<bean:message key="BzComposer.NewCustomer.Adderss1.Validation" />');
		document.VendorForm.address1.focus();
	}
	else if(trim(document.VendorForm.city.value=="")){
		alert('<bean:message key="BzComposer.NewCustomer.City.Validation" />');
		document.VendorForm.address1.focus();
	}
	else if(trim(document.VendorForm.zipCode.value=="")){
		alert('<bean:message key="BzComposer.NewCustomer.ZipCode.Validation" />');	
		document.VendorForm.zipCode.focus();
	}
	else {
		if(validate()){
			document.getElementById('tab').value="AddNewUser";
			document.forms[0].action = "AddNewUser.do" ;
			document.forms[0].submit();
		}
	}
}
function hideother(form){
	chbox=document.getElementById('chk_useind');
	if(chbox.checked){
		document.VendorForm.annualIntrestRate.disabled=false;
		document.VendorForm.minFCharges.disabled=false;
		document.VendorForm.gracePrd.disabled=false;
		document.getElementById('chk1').disabled=false;

	}
	else{
		document.VendorForm.annualIntrestRate.disabled=true;
		document.VendorForm.minFCharges.disabled=true;
		document.VendorForm.gracePrd.disabled=true;
		document.getElementById('chk1').disabled=true;

	}
}
function addToTable(form){	
	flag=0;
	flag1=0;
	invID=form.serviceID.value;
	SIDSize=document.getElementById('sIDSize') .value;
	SLSize=document.getElementById('sSize') .value;
	InvSize=document.getElementById('iSize') .value;
	DetailSize=document.getElementById('dSize') .value;
	
	var serviceName;
	var InvoiceStyle;
	var ServiceBalance="0.0";
	var DefaultService;
		for(t=0; t<exist.length; t++){	
			if(invID==exist[t]){				
				flag=1;
				break;
			}
		}
		if(flag==1){
			alert('<bean:message key="BzComposer.NewCustomer.Service.Validation" />');
			return;
		}
		else {
			flagx = 0;
				for(i=0;i<SLSize;i++)		{
					iinvID=document.getElementById(i+'sid').value;
					isID=document.getElementById(i+'isid').value;
					if(invID==iinvID) {
						serviceName=document.getElementById(i+'sname').value;
						for(j=0;j<InvSize;j++)	{
							isID2=document.getElementById(j+'invid').value;
							if(isID==isID2) {
								for (k=0; k<exist.length; k++){
									if (exist[k]==-1) {
										exist[k]=invID;
										break;
									}
								}
								InvoiceStyle=document.getElementById(j+'iname').value;		
								flagx = 1;
							}				
						}
					}
				}
		
				if(flagx==0){
					InvoiceStyle = "";
					for (k=0; k<exist.length; k++){
						if (exist[k]==-1) {
							exist[k]=invID;
							break;
						}
					}
				}
				
				hidn_val = document.getElementById('hidn').value;
				hidn_val1=hidn_val;
		
				var tr = document.createElement("tr");
				tr.setAttribute("id", "row"+invID);	
				
				var tr2 = document.getElementById('tr$$');
				var parentTr = tr2.parentNode;
				parentTr.insertBefore(tr, tr2);

				var td1 = document.createElement("td");
				td1.setAttribute("align", "center");
				tr.appendChild(td1);
				td1.innerHTML=serviceName;
				var td2 = document.createElement("td");
				td2.setAttribute("align", "center");
				tr.appendChild(td2);
				td2.innerHTML=InvoiceStyle;

				var td3 = document.createElement("td");
				td3.setAttribute("align", "center");
				tr.appendChild(td3);
				td3.innerHTML=ServiceBalance;
				var td4 = document.createElement("td");
				td4.setAttribute("align", "left");
				tr.appendChild(td4);
				var rd="<input type=radio id=setdisable name=defaultService onclick=setDefault("+invID+",this.form); />";
				td4.innerHTML=rd;
				var button='<img src="<bean:write name="path" property="pathvalue"/>/images/delete.png" alt="Deletable" onclick=removeFromTable('+invID+'); >';
				var td5 = document.createElement("td");
				td5.setAttribute("align", "left");
				tr.appendChild(td5);
				td5.innerHTML=button;
				document.VendorForm.table_size.value++;

				document.VendorForm.table_serID.value+=invID+";";

				document.VendorForm.table_serviceName.value+=serviceName+";";

				document.VendorForm.table_bal.value+=ServiceBalance+";";
				
				if(InvoiceStyle==""){
					form.table_invId.value+="0;";
				}
				else{
					for(p=0;p<InvSize;p++) {
						invoiceName=document.getElementById(p+'iname').value;
						if(invoiceName==InvoiceStyle) {
							document.VendorForm.table_invId.value+=document.getElementById(p+'invid').value+";";
						}				
					}
				}
				count = ((count)/1 + 1);
				document.getElementById('hidn').value=((hidn_val)/1 + 1);	
			}
		name=document.VendorForm.table_serviceName.value;
}
function setDefault(invID1,form){
	document.VendorForm.table_defaultVal.value=invID1;
}
function setDefaultToDb(invID1,form){
	document.VendorForm.table_DbDefSer.value=invID1;
}
function removeFromTable(idV){

	var str;
	var trid;
	trid="row"+idV;
	for(i=0; i<exist.length; i++){
		if(idV==exist[i]){

			var ttt=document.getElementById(trid);
				ttt.parentNode.removeChild(ttt);
			exist[i]=-1;			
			cnt--;
			removeStringValues(idV);
			break;
		}
	}
}
function removeStringValues(key){
	var str, str2, str3;
	var temp=new Array(20);
	var temp2=new Array(20);
	var temp3=new Array(20);				

	str= document.forms[0].table_serID.value;		
	str2=document.forms[0].table_bal.value;
	str3=document.forms[0].table_invId.value;
	
	temp=str.split(";");
	temp2=str2.split(";");
	temp3=str3.split(";");		
	
	str=str2=str3="";
	for (i=0; i<temp.length; i++){
		if (temp[i]!=key){
			k=0;
			for (k=0; k<i; k++){
				if (temp[i]==temp[k]){
					k=-1;
					break;
				}
			}
			if (k!=-1){
				str=str+temp[i]+";";
				str2=str2+temp2[i]+";"
				str3=str3+temp3[i]+";"					
			}
		}
	}
	str=str.substring(0,str.length-1);	//removes last semi-colon
	str2=str2.substring(0,str2.length-1);	//removes last semi-colon
	str3=str3.substring(0,str3.length-1);	//removes last semi-colon

	if (key==document.forms[0].table_defaultVal.value){
		document.forms[0].table_defaultVal.value="0";	//reset if no service is set to default
	}		

	document.forms[0].table_serID.value=str;
	document.forms[0].table_bal.value=str2;
	document.forms[0].table_invId.value=str3;
}
</script>
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
 function init(){
 	<logic:present name="Added">
 		alert('<bean:message key="BzComposer.Purchase.PurchaseOrder.AddNewUser.AddedSuccessfullyMsg"/>');
 	</logic:present>
 	newValues();
 }
 function hidebsaddress(form){
		chbox=document.getElementById('chk_setaddress');
		if(!chbox.checked)
		{		
			
			document.VendorForm.bscname.disabled=false;
			document.VendorForm.bsfirstName.disabled=false;
			document.VendorForm.bslastName.disabled=false;	
			document.VendorForm.bsaddress1.disabled=false;
			document.VendorForm.bsaddress2.disabled=false;
			document.VendorForm.bscity.disabled=false;
			document.VendorForm.bszipCode.disabled=false;
			document.VendorForm.bscountry.disabled=false;
			document.VendorForm.bsprovince.disabled=false;
					
			document.VendorForm.shcname.disabled=false;
			document.VendorForm.shfirstName.disabled=false;
			document.VendorForm.shlastName.disabled=false;	
			document.VendorForm.shaddress1.disabled=false;
			document.VendorForm.shaddress2.disabled=false;
			document.VendorForm.shcity.disabled=false;
			document.VendorForm.shzipCode.disabled=false;
			document.VendorForm.shcountry.disabled=false;
			document.VendorForm.shprovince.disabled=false;		
		    document.VendorForm.setdefaultbs.value="0";		
		}
		else
		{
			
			
			document.VendorForm.bscname.disabled=true;
			document.VendorForm.bsfirstName.disabled=true;
			document.VendorForm.bslastName.disabled=true;	
			document.VendorForm.bsaddress1.disabled=true;
			document.VendorForm.bsaddress2.disabled=true;
			document.VendorForm.bscity.disabled=true;
			document.VendorForm.bszipCode.disabled=true;
			document.VendorForm.bscountry.disabled=true;
			document.VendorForm.bsprovince.disabled=true;
			
			
			document.VendorForm.shcname.disabled=true;
			document.VendorForm.shfirstName.disabled=true;
			document.VendorForm.shlastName.disabled=true;	
			document.VendorForm.shaddress1.disabled=true;
			document.VendorForm.shaddress2.disabled=true;
			document.VendorForm.shcity.disabled=true;
			document.VendorForm.shzipCode.disabled=true;
			document.VendorForm.shcountry.disabled=true;
			document.VendorForm.shprovince.disabled=true;
		    document.VendorForm.setdefaultbs.value="";
		}
	}
function newValues(){
	//billing addressres/*
		document.VendorForm.bscname.value="";
		document.VendorForm.bsfirstName.value="";
		document.VendorForm.bslastName.value="";
		document.VendorForm.bsaddress1.value="";
		document.VendorForm.bsaddress2.value="";
		document.VendorForm.bscity.value="";
		document.VendorForm.bszipCode.value="";
		document.VendorForm.bsprovince.value="";
		document.VendorForm.bscountry.value="0";
	
	//shipping addresses
		document.VendorForm.shcname.value="";
		document.VendorForm.shfirstName.value="";
		document.VendorForm.shlastName.value= "";
		document.VendorForm.shaddress1.value= "";
		document.VendorForm.shaddress2.value= "";
		document.VendorForm.shcity.value= "";
		document.VendorForm.shzipCode.value = "";
		document.VendorForm.shprovince.value="";
		document.VendorForm.shcountry.value= "0";
	
	//genaral Tab
		document.VendorForm.firstName.value="";
		document.VendorForm.lastName.value="";
		document.VendorForm.address1.value="";
		document.VendorForm.address2.value="";
		document.VendorForm.city.value="";
		document.VendorForm.state.value="0";
		document.VendorForm.zipCode.value="";
		document.VendorForm.phone.value="";
		document.VendorForm.cellPhone.value="";
		document.VendorForm.fax.value="";
		document.VendorForm.email.value="";
		document.VendorForm.province.value="";
		document.VendorForm.country.value="0";
		document.VendorForm.homePage.value="";
		document.VendorForm.type.value="0";
		document.VendorForm.texID.value="";
		document.VendorForm.openingUB.value="";
		document.VendorForm.extCredit.value="";
		document.VendorForm.memo.value="";
	
	//Account Tab
		document.VendorForm.term.value="0";
		document.VendorForm.rep.value="0";
		document.VendorForm.paymentType.value="0";
		document.VendorForm.shipping.value="0";
		document.VendorForm.ccType.value="0";
		document.VendorForm.cardNo.value="";
		document.VendorForm.expDate.value="";
		document.VendorForm.cw2.value="";
		document.VendorForm.cardHolderName.value="";
		document.VendorForm.cardBillAddress.value="";
		document.VendorForm.cardZip.value="";
	
	//Finance Charges Tab
		document.VendorForm.annualIntrestRate.value="";
		document.VendorForm.minFCharges.value="";
		document.VendorForm.gracePrd.value="";
		document.VendorForm.dateAdded.value="";
		document.VendorForm.cname.value="";
		document.VendorForm.chktax.checked=false;
		document.VendorForm.chk_alsovendor.checked=false;
	
		document.VendorForm.chk_useind.checked=false;
		document.VendorForm.chk1.checked=false;
	
		document.VendorForm.annualIntrestRate.disabled=true;
		document.VendorForm.minFCharges.disabled=true;
		document.VendorForm.gracePrd.disabled=true;
		document.getElementById('chk1').disabled=true;
	
	// Services Tab
		document.VendorForm.serviceID.value="1";
		document.VendorForm.table_defaultVal.value="0";
		document.getElementById('hidn').value="1";
		count=0;
		for(index=1;index<=4;index++){
			removeFromTable(index);
		}
		for (i=0; i<exist.length; i++){
				exist[i]=-1;
		}
		document.VendorForm.state.value=0;
		document.VendorForm.bsstate.value=0;
		document.VendorForm.shstate.value=0;
		refreshItemsNow(0);
		refreshItemsNow1(0);
		refreshItemsNow2(0);
}

</script>
