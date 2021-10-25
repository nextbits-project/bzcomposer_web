<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<script>
	/* self.moveTo(30,30); */
	window.moveTo((screen.width - 800) / 2, (screen.height - 600) / 2);
	/* self.moveTo(130,130); */
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title><bean:message key="BzComposer.updatecustomertitle" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
  <script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
</head>
<body onload="initialize();">
<script type="text/javascript">
$(function() {
    $( "#tabs" ).tabs();
    <%-- var state = "<%= request.getAttribute("state")%>";
	$("#sid").find('option[id="'+state+'"]').attr("selected",true); --%>
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
var o22 = null;
var o33 = null;
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
function refreshItemsNow(val)
{
  o = c(writeSelect);
  oGET(o,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=state&Cid=' + val)
}

function refreshItemsNow33(val,sval)
{
  o33 = c(writeSelect33);
  oGET(o33,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=state&Cid=' + val+"&sval="+sval)
}

function writeSelect33()
{
  
   if (o33.readyState != 4 || o33.status != 200) { 
      return;
    }
     
    document.getElementById("t_statedata").innerHTML = o33.responseText ;
}

function writeSelect1()
{
  
   if (o.readyState != 4 || o.status != 200) { 
      return;
    }
     
    document.getElementById("t_statedata1").innerHTML = o.responseText ;
}
function refreshItemsNow1(val)
{
  o = c(writeSelect1);
  oGET(o,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=bsstate&Cid=' + val)
}

function refreshItemsNow12(val,sval)
{
  o = c(writeSelect2);
  oGET(o,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=shstate&Cid=' + val+"&sval="+sval)
}


function refreshItemsNow22(val,sval)
{
  o22 = c(writeSelect22);
  oGET(o22,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=bsstate&Cid=' + val+"&sval="+sval)
}

function writeSelect22()
{
  
   if (o22.readyState != 4 || o22.status != 200) { 
      return;
    }
     
    document.getElementById("t_statedata1").innerHTML = o22.responseText ;
}

function writeSelect2()
{
  
   if (o.readyState != 4 || o.status != 200) { 
      return;
    }
     
    document.getElementById("t_statedata2").innerHTML = o.responseText ;
}
function refreshItemsNow2(val){
  o = c(writeSelect2);
  oGET(o,'<bean:write name="path" property="pathvalue"/>/include/GetStates.jsp?st=shstate&Cid=' + val)
}
function writeSelectTH(){
   if (oT.readyState != 4 || oT.status != 200) {
     return;
   }
   document.getElementById("t_history").innerHTML = o.responseText ;
}
function refreshTransationNow(radio_val,custid,dfrom,dto){
       oT = c(writeSelectTH);
       oGET(oT,'<bean:write name="path" property="pathvalue"/>/sales/addTransactionHistory.jsp?custId=' + custid+'&cond='+radio_val+'&pfrom='+dfrom+'&pto='+dto)
}
</script>
<script type="text/javascript">
  function validate() {
  	var email = document.CustomerForm.email.value;
  	var mail =String(email);
  	var pattern=/^[_0-9a-zA-z]+(\.[_A-Za-z0-9]+)*@[A-Za-z0-9]+(\.[A-Za-z]+)+$/;
  	if(email==""){
  		return enterEmailValidationDialog();
  	}
    else if (!pattern.test(email)) {

        return showEmailValidationDialog();
        document.CustomerForm.email.focus();
        return false;
    }
   if(mail.length>=50){

    	return showEmailLengthValidationDialog();
    	document.CustomerForm.email.value="";
    	document.CustomerForm.email.focus();
        return false;
    }
  
   	return true;
  }
</script>
<html:form action="updateEditedCustomer.do?" method="post" onsubmit="return validate();">
	<html:hidden property="custId" value='<%= request.getParameter("cvId")%>'/>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">

<div id="padding">
	<!-- begin Contents --> 
	<!-- add the code for tab here -->
	<div>
		<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<bean:message key="BzComposer.updatecustomer.editcustomerinformation"/>
		</span>
	</div>
	<div>
		<logic:present name="SaveStatus">
			<span class="msgstyle">
				<bean:write name="SaveStatus" />
			</span>
		</logic:present>
	</div>
	<div>
	<!-- <div id="tabs" style="height:450px;width:1150px;"> -->
	<div id="tabs" style="height:450px;width:1550px;">
  		<ul>
		    <li><a href="#General-1"><bean:message key="BzComposer.updatecustomer.tabs.general" /></a></li>
		    <li><a href="#account-2"><bean:message key="BzComposer.updatecustomer.tabs.account" /></a></li>
		    <li><a href="#service-3"><bean:message key="BzComposer.updatecustomer.tabs.service" /></a></li>
		    <li><a href="#manageAddress-4"><bean:message key="BzComposer.updatecustomer.tabs.manageaddress" /></a></li>
		    <li><a href="#finance-5"><bean:message key="BzComposer.updatecustomer.tabs.financecharges" /></a></li>
		    <li><a href="#Transactional-6"><bean:message key="BzComposer.updatecustomer.tabs.transactionhistory" /></a></li>
  		</ul>
	<div id="General-1">
		<div id="content1" class="tabPage">
		<!-- add here the content of first tab -->
		<div id="table-negotiations">
			<table class="tabla-listados" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th colspan="10" style="font-size:1.6em;">
							<bean:message key="BzComposer.updatecustomer.customerinformation"/>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.firstname" /> 
							<span class="inputHighlighted">
								<bean:message key="BzComposer.CompulsoryField.Validation" />
							</span>
						</td>
						<td style="font-size:1em;">
							<html:text property="firstName" name="CustomerDetails" />
						</td>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.lastname" /> 
							<span class="inputHighlighted">
								<bean:message key="BzComposer.CompulsoryField.Validation" />
							</span>
						</td>
						<td style="font-size:1em;">
							<html:text property="lastName" name="CustomerDetails" />
						</td>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.startdate" />
						</td>
						<td style="font-size:1em;">
							<html:text property="dateAdded" readonly="true" name="CustomerDetails" /> 
							<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" 
							onclick="displayCalendar(document.CustomerForm.dateAdded,'mm-dd-yyyy',this);">
						</td>
						<td colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.titlename" />
						</td>
						<td style="font-size:1em;">
							<html:select property="title" name="CustomerDetails" style="width:215px;">
								<html:options collection="titleList" property="value" labelProperty="label" />
							</html:select>
						</td>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.company" /> 
							<span class="inputHighlighted">
								<bean:message key="BzComposer.CompulsoryField.Validation" />
							</span>
						</td>
						<td style="font-size:1em;">
							<html:text property="cname" name="CustomerDetails"  size="20"/>
						</td>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.province" />
						</td>
						<td style="font-size:1em;">
							<html:text property="province" name="CustomerDetails" />
						</td>
						<td colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.address1" /> 
							<span class="inputHighlighted">
								<bean:message key="BzComposer.CompulsoryField.Validation" />
							</span>
						</td>
						<td style="font-size:1em;">
							<html:text property="address1" name="CustomerDetails" size="20" />
						</td>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.address2" />
						</td>
						<td style="font-size:1em;">
							<html:text property="address2" name="CustomerDetails" size="20" />
						</td>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.zipcode" /> 
							<span class="inputHighlighted">
								<bean:message key="BzComposer.CompulsoryField.Validation" />
							</span>
						</td>
						<td style="font-size:1em;">
							<html:text onkeydown="return numbersonly(event,this.value)" property="zipCode" name="CustomerDetails" />
						</td>
						<td colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.city" /> 
							<span class="inputHighlighted">
								<bean:message key="BzComposer.CompulsoryField.Validation" />
							</span>
						</td>
						<td style="font-size:1em;">
							<html:text property="city" name="CustomerDetails" />
						</td>
						<td id="t_state" style="font-size:1em;">
							<bean:message key="BzComposer.global.state" />
						</td>
						<td id="t_statedata" style="font-size:1em;">
						</td>
						<td id="t_country" style="font-size:1em;">
							<bean:message key="BzComposer.global.country" />
						</td>
						<td style="font-size:1em;">
							<html:select property="country" onchange="refreshItemsNow(this.value);" name="CustomerDetails">
								<html:option value="0">
									<bean:message key="BzComposer.ComboBox.Select" />
								</html:option>
								<html:options collection="cList" property="value" labelProperty="label" />
							</html:select>
						</td>
						<td colspan="4">&nbsp;</td>
					</tr>
					<script>
						<logic:present name="state_gen">
							var contry=document.CustomerForm.country.value;

							refreshItemsNow33(contry,'<bean:write name="state_gen" />');
						</logic:present>	    
						<logic:notPresent name="state_gen">

						</logic:notPresent>
					</script>
					<tr>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.fax" />
						</td>
						<td style="font-size:1em;">
							<html:text property="fax" name="CustomerDetails" onkeydown="return numbersonly(event,this.value);" />
						</td>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.phone" />
						</td>
						<td style="font-size:1em;">
							<html:text onkeydown="return numbersonly(event,this.value)" property="phone" name="CustomerDetails" />
						</td>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.cellphone" />
						</td>
						<td style="font-size:1em;">
							<html:text onkeydown="return numbersonly(event,this.value)" property="cellPhone" name="CustomerDetails" />
						</td>
						<td colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.homepage" />
						</td>
						<td style="font-size:1em;">
							<html:text property="homePage" name="CustomerDetails" />
						</td>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.email" />
							<span class="inputHighlighted">
								<bean:message key="BzComposer.CompulsoryField.Validation" />
							</span>
						</td>
						<td style="font-size:1em;">
							<html:text property="email" name="CustomerDetails" />
						</td>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.type" />
						</td>
						<td style="font-size:1em;">
							<html:select property="type" name="CustomerDetails" style="width:215px;">
								<html:option value="0">
									<bean:message key="BzComposer.ComboBox.Select" />
								</html:option>
								<html:options collection="VendorCategoryList" property="value" labelProperty="label" />
							</html:select>
						</td>
						<td colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.taxid" />
						</td>
						<td style="font-size:1em;">
							<html:text property="texID" name="CustomerDetails" />
						</td>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.oppeningunpaidbalance" />
						</td>
						<td style="font-size:1em;">
							<html:text property="openingUB" name="CustomerDetails" onkeydown="return numbersonly(event,this.value);" />
						</td>
						<td style="font-size:1em;">
							<logic:equal name="CustomerDetails" property="taxAble" value="1">
								<input value="on" type="checkbox" name="isTaxable" name="CustomerDetails" checked="checked">
							</logic:equal> 
							<logic:notEqual name="CustomerDetails" property="taxAble" value="1">
								<input value="on" type="checkbox" name="isTaxable" name="CustomerDetails">
							</logic:notEqual> 
							<bean:message key="BzComposer.global.istaxable" />
						</td>
						<td style="font-size:1em;">		
							<logic:equal name="CustomerDetails" property="isclient" value="1">
								<input value="on" type="checkbox" name="isAlsoClient" name="CustomerDetails" checked="checked">
							</logic:equal> 
							<logic:notEqual name="CustomerDetails" property="isclient" value="1">
								<input value="on" type="checkbox" name="isAlsoClient" name="CustomerDetails">
							</logic:notEqual> 
							<bean:message key="BzComposer.global.isalsovendor" />
						</td>
						<td colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.existingcredits" />
						<td style="font-size:1em;">
							<html:text property="extCredit" name="CustomerDetails" onkeydown="return numbersonly(event,this.value);" />
						</td>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.global.memo" />
						</td>
						<td style="font-size:1em;">
							<html:textarea  property="memo" name="CustomerDetails" cols="20" />
						</td>
						<td colspan="6">&nbsp;</td>
					</tr>
				</tbody>
			</table>
		</div>
		</div>  
	</div>
  	<div id="account-2">
		<div id="content2" class="tabPage">
			<!-- add here the content of second tab -->
			<div id="table-negotiations" style="width:100%">
				<table class="tabla-listados" cellspacing="0">
					<thead>
						<tr>
							<th colspan="8" style="font-size:1.2em;">
								<bean:message key="BzComposer.updatecustomer.prefrenceinfo" />
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="font-size:1em;">
								<bean:message key="BzComposer.global.term" />
							</td>
							<td style="font-size:1em;">
								<html:select property="term" name="CustomerDetails">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="TermList" property="value" labelProperty="label" />
								</html:select>
							</td>
							<td style="font-size:1em;">
								<bean:message key="BzComposer.global.paymentmethod" />
							</td>
							<td style="font-size:1em;">
								<html:select property="paymentType" name="CustomerDetails">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="PaymentList" property="value" labelProperty="label" />
								</html:select>
							</td>
							<td colspan="4">&nbsp;</td>
						</tr>
						<tr>
							<td style="font-size:1em;">
								<bean:message key="BzComposer.global.representative" />
							</td>	
							<td style="font-size:1em;">
								<html:select property="rep" name="CustomerDetails">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="RepList" property="value" labelProperty="label" />
								</html:select>
							</td>
							<td style="font-size:1em;">
								<bean:message key="BzComposer.global.shippingvia" />
							</td>
							<td style="font-size:1em;">
								<html:select property="shipping" name="CustomerDetails">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="ShipCarrierList" property="value" labelProperty="label" />
								</html:select>
							</td>
							<td colspan="4">&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="table-negotiations">
				<table class="tabla-listados" cellspacing="0">
					<thead>
						<tr>
							<th colspan="7" style="font-size:1.2em;">
								<bean:message key="BzComposer.updatecustomer.creditcardinfo" />
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="font-size:1em;">
								<bean:message key="BzComposer.global.cardtype" />
							</td>
							<td style="font-size:1em;">
								<html:select property="ccType" name="CustomerDetails">
									<html:option value="0">
										<bean:message key="BzComposer.ComboBox.Select" />
									</html:option>
									<html:options collection="CreditCardList" property="value" labelProperty="label" />
								</html:select>
							</td>
							<td colspan="5">&nbsp;</td>
						</tr>
						<tr>
							<td style="font-size:1em;">
								<bean:message key="BzComposer.global.cardnumber" />
							</td>
							<td style="font-size:1em;">
								<html:text property="cardNo" name="CustomerDetails" />
							</td>
							<td style="font-size:1em;">
								<bean:message key="BzComposer.global.expdate" />
							</td>
							<td style="font-size:1em;">
								<html:text property="expDate" name="CustomerDetails" readonly="true" /> 
								<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
								onclick="displayCalendar(document.CustomerForm.expDate,'mm/yyyy',this);">
								<bean:message key="BzComposer.Customer.mformate" />
							</td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<td style="font-size:1em;">
								<bean:message key="BzComposer.global.CW2" />
							</td>
							<td style="font-size:1em;">
								<html:text property="cw2" name="CustomerDetails" size="7" />
							</td>
							<td style="font-size:1em;">
								<bean:message key="BzComposer.global.cardholdername" />
							</td>
							<td style="font-size:1em;">
								<html:text property="cardHolderName" name="CustomerDetails" />
							</td>
								<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<td style="font-size:1em;">
								<bean:message key="BzComposer.updatecustomer.billingaddress" />
							</td>
							<td style="font-size:1em;">
								<html:text property="cardBillAddress" name="CustomerDetails" size="30" />
							</td>
							<td style="font-size:1em;">
								<bean:message key="BzComposer.global.zipcode" />
							</td>
							<td style="font-size:1em;">
								<html:text onkeydown="return numbersonly(event,this.value)"
								property="cardZip" name="CustomerDetails" />
							</td>
							<td colspan="3">&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</div>
			</div>  
		</div>							
		<div id="manageAddress-4">
			<div id="content3" class="tabPage">
				<!-- add here the content of fourth tab -->
				<div id="table-negotiations">
					<table align="center" style="width: 100%" class="tabla-listados">
						<thead>
							<tr>
								<th colspan="4" style="font-size:1.4em;">
									<bean:message key="BzComposer.updatecustomer.manageaddresses"/>
								</th>
							</tr>
						</thead>
						<!-- <thead>
							<tr>
							<td style="font-size:1em;">
									<input value="on"  checked="checked" type="checkbox" id="chk_setaddress"
									name="setdefaultaddress" onclick="hidebsaddress(this.form);">
									<input type="hidden" name="setdefaultbs" value="">
									<font size="2">
										Billing And Shipping Address should be the same as the Customer Information Address 	
									</font>
								</td> 
							<tr>
						</thead> -->
						<tr>
							<td>
								<table class="tabla-listados" cellspacing="0" width="200" align="left">
									<thead>
										<tr>
											<th colspan="5" style="font-size:1.2em;">
												<bean:message key="BzComposer.updatecustomer.billingaddress"/>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="font-size:1em;"><bean:message key="BzComposer.global.company" /></td>
											<td style="font-size:1em;"><html:text property="bscname" name="CustomerDetails" /></td>
											<td colspan="3">&nbsp;</td>
										</tr>
										<tr>
											<td style="font-size:1em;"><bean:message key="BzComposer.global.firstname" /></td>
											<td style="font-size:1em;"><html:text property="bsfirstName" name="CustomerDetails" /></td>
									
											<td style="font-size:1em;"><bean:message key="BzComposer.global.lastname" /></td>
											<td style="font-size:1em;"><html:text property="bslastName" name="CustomerDetails" /></td>
											
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="font-size:1em;"><bean:message key="BzComposer.global.address1" /></td>
											<td style="font-size:1em;"><html:text property="bsaddress1" name="CustomerDetails" /></td>
									
											<td style="font-size:1em;"><bean:message key="BzComposer.global.address2" /></td>
											<td style="font-size:1em;"><html:text property="bsaddress2" name="CustomerDetails" /></td>
											
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="font-size:1em;"><bean:message key="BzComposer.global.city" /></td>
											<td style="font-size:1em;"><html:text property="bscity" name="CustomerDetails" /></td>
									
											<td style="font-size:1em;"><bean:message key="BzComposer.global.zipcode" /></td>
											<td style="font-size:1em;"><html:text onkeydown="return numbersonly(event,this.value)" property="bszipCode" name="CustomerDetails" />
											</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td id="t_country" style="font-size:1em;">
												<bean:message key="BzComposer.global.country" />
											</td>
											<td style="font-size:1em;">
												<html:select property="bscountry" onchange="refreshItemsNow1(this.value);"
												onblur="refreshItemsNow1(this.value);" name="CustomerDetails">
													<html:option value="0">
														<bean:message key="BzComposer.ComboBox.Select" />
													</html:option>
													<html:options collection="cList" property="value" labelProperty="label" />
												</html:select>
											</td>
											<td id="t_state" style="font-size:1em;">
												<bean:message key="BzComposer.global.state" />
											</td>
											<td id="t_statedata1" style="font-size:1em;"></td>
											<td>&nbsp;</td>
										</tr>
										<logic:present name="state_bt">
											<script>
   												var scountry=document.CustomerForm.bscountry.value;
   												refreshItemsNow22(scountry,'<bean:write name="state_bt" />');
								    		</script>
										</logic:present>
										<tr>
											<td style="font-size:1em;"><bean:message key="BzComposer.global.province" /></td>
											<td style="font-size:1em;"><html:text property="bsprovince" name="CustomerDetails" /></td>
											<td colspan="3">&nbsp;</td>
										</tr>
										<tr>
											<td colspan="5" align="center" style="font-size:1em;"> 
												<input type="button" class="formbutton" name="ClearBillingBtn" 
												value="<bean:message key='BzComposer.updatecustomer.clearbillingaddress'/>" onclick="clearBillingAdd();" title="Clear Billing Address">
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td style="vertical-align: inherit;font-size:1em;">
								<input type="button" name="CopyBtn" class="formbutton"
								onclick="CopyBilladdToShipAdd();" value="<bean:message key='BzComposer.updatecustomer.copyto'/>" title="Copy Address">
							</td>
							<td>
								<table class="tabla-listados" cellspacing="0" width="200" align="left">
									<thead>
										<tr>
											<th colspan="5" style="font-size:1.2em;">
												<bean:message key="BzComposer.updatecustomer.shippingaddress"/>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="font-size:1em;"><bean:message key="BzComposer.global.company" /></td>
											<td style="font-size:1em;"><html:text property="shcname" name="CustomerDetails" /></td>
											<td colspan="3">&nbsp;</td>
										</tr>
										<tr>
											<td style="font-size:1em;"><bean:message key="BzComposer.global.firstname" /></td>
											<td style="font-size:1em;"><html:text property="shfirstName" name="CustomerDetails" /></td>
								
											<td style="font-size:1em;"><bean:message key="BzComposer.global.lastname" /></td>
											<td style="font-size:1em;"><html:text property="shlastName" name="CustomerDetails" /></td>
											
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="font-size:1em;"><bean:message key="BzComposer.global.address1" /></td>
											<td style="font-size:1em;"><html:text property="shaddress1" name="CustomerDetails" /></td>
								
											<td style="font-size:1em;"><bean:message key="BzComposer.global.address2" /></td>
											<td style="font-size:1em;"><html:text property="shaddress2" name="CustomerDetails" /></td>
											
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="font-size:1em;"><bean:message key="BzComposer.global.city" /></td>
											<td style="font-size:1em;"><html:text property="shcity" name="CustomerDetails" /></td>
								
											<td style="font-size:1em;"><bean:message key="BzComposer.global.zipcode" /></td>
											<td style="font-size:1em;"><html:text onkeydown="return numbersonly(event,this.value)"
												property="shzipCode" name="CustomerDetails" /></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td id="t_country" style="font-size:1em;">
												<bean:message key="BzComposer.global.country" />
											</td>
											<td style="font-size:1em;">
												<html:select property="shcountry" onchange="refreshItemsNow2(this.value);" name="CustomerDetails">
												<!-- onblur="refreshItemsNow2(this.value);" -->
													<html:option value="0">
														<bean:message key="BzComposer.ComboBox.Select" />
													</html:option>
													<html:options collection="cList" property="value" labelProperty="label" />
												</html:select>
											</td>
											<td id="t_state" style="font-size:1em;">
												<bean:message key="BzComposer.global.state" />
											</td>
											<td id="t_statedata2" style="font-size:1em;"></td>
											<td>&nbsp;</td>
										</tr>
										<script>
											<logic:present name="state_st">
								       			var scountry=document.CustomerForm.shcountry.value;
												refreshItemsNow12(scountry,'<bean:write name="state_st" />');
											</logic:present>
								       	</script>
										<tr>
											<td style="font-size:1em;"><bean:message key="BzComposer.global.province" /></td>
											<td style="font-size:1em;"><html:text property="shprovince" name="CustomerDetails" /></td>
											
											<td colspan="3">&nbsp;</td>
										</tr>
										<tr align="center">
											<td colspan="5" style="font-size:1em;">
												<input type="button" class="formbutton" name="ClearShippingBtn" onclick="clearShippingAdd();"
												value="<bean:message key='BzComposer.updatecustomer.clearshippingaddress'/>" title="Clear Shipping Address">
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="4">&nbsp;</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
					
		<div id="finance-5">
			<div id="content4" class="tabPage">
			<!-- add here the content of fifth tab -->
				<div id="table-negotiations" >
					<table class="tabla-listados" cellspacing="0">
						<thead>
							<tr>
								<th colspan="4" style="font-size:1.2em;"><bean:message key="BzComposer.updatecustomer.financemsg" /></th>
							</tr>
						</thead>
						<thead>
							<tr>
								<td colspan="4">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="4" style="font-size:1em;">
									<logic:equal name="CustomerDetails" property="fsUseIndividual" value="true">
										&nbsp;<input value="on" type="checkbox" name="UseIndividualFinanceCharges" checked="checked"
										onclick="enableDisableFinanceCharges();" id="chbox">
									</logic:equal> 
									<logic:notEqual name="CustomerDetails" property="fsUseIndividual" value="true">
										&nbsp;<input value="on" type="checkbox" name="UseIndividualFinanceCharges"
										onclick="enableDisableFinanceCharges();" id="chbox">
									</logic:notEqual> 
									<font style="font-size:1em;">
										<bean:message key="BzComposer.updatecustomer.useindividualfinancecharges" />
									</font>
								</td>
							<tr>
						</thead>
						<tbody>
							<tr>
								<td style="font-size:1em;">
									<div>
										<div id="table-negotiations" style="width:48%;float: left;">
											<table class="tabla-listados" cellspacing="0">
											<thead>
												<tr>
													<th colspan="4" style="font-size:1.2em;">
														<bean:message key="BzComposer.updatecustomer.chargerate" />
													</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td style="font-size:1em;">
														<bean:message key="BzComposer.updatecustomer.annualintrestrate" />
													</td>
													<td colspan="3" style="font-size:1em;">
														<html:text onkeypress="return numbersonly(event,this.value)"
														property="annualIntrestRate" name="CustomerDetails" disabled="true" />
													</td>
												</tr>
												<tr>
													<td style="font-size:1em;">
														<bean:message key="BzComposer.updatecustomer.minimumfinanacecharge" />
													</td>
													<td colspan="3" style="font-size:1em;">
														<html:text onkeypress="return numbersonly(event,this.value)"
														property="minFCharges" name="CustomerDetails" disabled="true" />
													</td>
												</tr>
												<tr>
													<td style="font-size:1em;">
														<bean:message key="BzComposer.updatecustomer.graceperiod" />
													</td>
													<td colspan="3" style="font-size:1em;">
														<html:text onkeypress="return numbersonly(event,this.value)"
														property="gracePrd" name="CustomerDetails" disabled="true" />
													</td>
												</tr>					
											</tbody>									
											</table>
										</div>
										<div id="table-negotiations" style="width:48%;float: right;">
											<table class="tabla-listados" cellspacing="0">
												<thead>
													<tr>
														<th colspan="4" style="font-size:1.2em;">
															<bean:message key="BzComposer.updatecustomer.applyingcharges" />
														</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td colspan="4">&nbsp;</td>
													</tr>											
													<tr>
														<td colspan="4" style="font-size:1em;">
															<logic:equal name="CustomerDetails" property="fsAssessFinanceCharge" value="true">
																<input value="on" type="checkbox" name="AssessFinanceChk"
																id="chk1" name="CustomerDetails" checked="checked" disabled="disabled" />
															</logic:equal> 
															<logic:notEqual name="CustomerDetails" property="fsAssessFinanceCharge" value="true">
																<input type="checkbox" name="AssessFinanceChk" id="chk1"
																name="CustomerDetails" disabled="disabled">
															</logic:notEqual> 
															<bean:message key="BzComposer.updatecustomer.assessfinance" />
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</td>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="4">&nbsp;</td>
							</tr>
						</tbody>
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
					<div id="content7" class="tabPage">
						<!------------------------------------------ add here the content of services tab ----------------------------------------------------->
						<html:hidden property="table_serviceName" value="" /> <html:hidden
						property="table_defaultVal" value="0" /> <html:hidden
						property="table_size" value="0" /> <html:hidden
						property="table_invId" value="" /> <html:hidden
						property="table_bal" value="" /> <html:hidden
						property="table_serID" value="" /> <html:hidden
						property="table_DbDefSer" value="0" /> <bean:size
						name="ServiceList" id="SList" /> <input type="hidden"
						name="ssize" id="sSize" value='<bean:write name="SList"/>'> 
						<logic:iterate name="ServiceList" id="objList1" indexId="index">

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

					</logic:iterate> <bean:size name="BalenceDetails" id="BDetails" />
					<input type="hidden" name="dsize" id="dSize"
						value='<bean:write name="BDetails"/>'> <logic:iterate
						name="BalenceDetails" id="objList3" indexId="index">

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

					<div id="table-negotiations" style="width:100%">
						<input type="hidden" value="1" id="hidn" />
						<table class="tabla-listados" cellspacing="0">
							<tbody>
								<thead>
									<tr>
										<th colspan="6" style="font-size:1.2em;">
											<bean:message key="BzComposer.updatecustomer.defaultservice" />
										</th>
										<!-- <td id="sername"></td> -->
									</tr>
								</thead>
								<tr>
									<td style="font-size:1em;">
										<bean:message key="BzComposer.updatecustomer.service"/>
									</td>
									<td style="font-size:1em;">
										<html:select property="serviceID">
											<html:options collection="ServiceList" property="serviceID" labelProperty="serviceName" />
										</html:select>
									</td>
									<td style="font-size:1em;"><input type="button" class="formbutton" name="add"
									value="<bean:message key='BzComposer.global.add'/>" onclick="addToTable(this.form);" /></td>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr>
									<td colspan="6" style="font-size:1em;">
										<bean:message key="BzComposer.updatecustomer.selectedservice" />
									</td>
								</tr>
							</tbody>
						</table>
					<div >

					<table class="tabla-listados" cellspacing="0">
						<thead>
							<tr>
								<th style="font-size:1em;">
									<bean:message key="BzComposer.updatecustomer.servicename" />
								</th>
								<th style="font-size:1em;">
									<bean:message key="BzComposer.updatecustomer.invoicestyle" />
								</th>
								<th align="center" style="font-size:1em;">
									<bean:message key="BzComposer.updatecustomer.balance" />
								</th>
								<th align="center" style="font-size:1em;">
									<bean:message key="BzComposer.updatecustomer.default" />
								</th>
								<th align="center" style="font-size:1em;">
									<bean:message key="BzComposer.updatecustomer.remove" />
								</th>
							</tr>
						</thead>
						<tr id="tr$$">
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
						</tr>

						<logic:present name="ServiceInfo" scope="request">
							<logic:empty name="ServiceInfo">
								<script type="text/javascript">
										default_sid=0;
										default_sid=<bean:write name="DefaultService"/>;
									</script>
							</logic:empty>
							<logic:present name="DefaultService">
								<script type="text/javascript">
										default_sid=<bean:write name="DefaultService"/>;
								</script>
							</logic:present>
							<logic:notPresent name="DefaultService">
								<script type="text/javascript">
										default_sid=0;
								</script>
							</logic:notPresent>

							<logic:notEmpty name="ServiceInfo" scope="request">

								<bean:size id="ServiceInfoSize" name="ServiceInfo" />

								<input type="hidden" name="serviceSize" id="sIDSize"
									value='<bean:write name="ServiceInfoSize" />' />

								<logic:iterate name="ServiceInfo" id="objList" indexId="ndx">
									<input type="hidden" id='<bean:write name="ndx" />_ser'
										value='<bean:write name="objList" property="serviceID" />' />
									<tr id='row<bean:write name="objList" property="serviceID" />'>
										<!-- id='tr<bean:write name="ndx" />' -->

										<td style="font-size:1em;"><bean:write name="objList" property="serviceName" /></td>
										<td style="font-size:1em;"><bean:write name="objList" property="invoiceStyle" /></td>
										<td align="center"><bean:write name="objList"
											property="serviceBalance" /></td>

										<logic:equal name="objList" property="defaultService"
											value="1">
											<td align="left"><input type="radio" name=defaultService
												id="default"
												value='<bean:write name="objList" property="defaultService" />'
												onclick="setDefault('<bean:write name="objList" property="serviceID" />',this.form);"
												checked="checked" /> <script type="text/javascript">
													default_sid=<bean:write name="objList" property="serviceID" />
													document.getElementById("sername").innerHTML = '<bean:write name="objList" property="serviceName" />';
												</script></td>
										</logic:equal>

										<logic:notEqual name="objList" property="defaultService"
											value="1">
											<td align="left"><input type="radio" name=defaultService
												id="default"
												value='<bean:write name="objList" property="defaultService" />'
												onclick="setDefault('<bean:write name="objList" property="serviceID" />',this.form);" /></td>

										</logic:notEqual>

										<td align="left"><img
											src="<bean:write name="path" property="pathvalue"/>/images/delete.png"
											alt="Deletable"
											onclick="removeFromTable('<bean:write name="objList" property="serviceID" />');" />
										<!-- onclick="removeFromTable('<bean:write name="ndx" />');" -->
										</td>


										<td align="center"><input type="hidden"
											value='<bean:write name="objList" property="serviceID"/>'
											id='<bean:write name="ndx" />id' /></td>
									</tr>
									<script>
											var temp;
											flagy = 0;
											var defService="0";
											exist[cnt++]='<bean:write name="objList" property="serviceID"/>';
											invStyleName='<bean:write name="objList" property="invoiceStyle" />';	
											InvSize=document.getElementById('iSize').value;
											for (i=0; i<InvSize; i++){
												temp=document.getElementById(i+'iname').value;
												if (temp==invStyleName){							//invstyle found...
													temp=document.getElementById(i+'invid').value;
													//defService=document.getElementById(i+'dservice').value;
													flagy =1;
													break;
												}
											}
							
											if(flagy==0 && invStyleName==""){
												temp="0";
											}
													
											document.forms[0].table_serID.value+='<bean:write name="objList" property="serviceID"/>;';
											document.forms[0].table_bal.value+='<bean:write name="objList" property="serviceBalance"/>;';
											document.forms[0].table_invId.value+=temp+";";
											document.forms[0].table_defaultVal.value=defService;
											
									</script>

								</logic:iterate>

							</logic:notEmpty>
						</logic:present>
						<logic:present name="ServiceInfo" scope="request">
							<logic:empty name="ServiceInfo" scope="request">
								<input type="hidden" id="sIDSize" value="0" />
							</logic:empty>
						</logic:present>

					</table>
					<div>
					<table>
					</table>
					</div>
					</div>
					</div>
					</div>
					</div>

				<!--  Transactional History-->
				<div id="Transactional-6">
					<div id="content5" class="tabPage">
					<!-- add here the content of sixth tab -->
					<div id="table-negotiations">
					<table class="tabla-listados" cellspacing="0">
						<thead>
							<tr>
								<th colspan="4" style="font-size:1.2em;">
									<bean:message key="BzComposer.updatecustomer.displayoption" />
								</th>
							</tr>
						</thead>
						<tr>
							<td colspan="4" style="font-size:1em;"><html:radio property="dispay_info"
								value="ShowAll" onclick="hide_details(this.value);" /><bean:message
								key="BzComposer.updatecustomer.showall" /> <script
								type="text/javascript">
                                    radio_val = document.CustomerForm.dispay_info.value;
                                </script></td>
						</tr>

						<tr>
							<td style="font-size:1em;"><html:radio property="dispay_info" value="ByVal"
								onclick="hide_details(this.value);" /><bean:message
								key="BzComposer.updatecustomer.byval" /></td>
							<td style="font-size:1em;">
								<bean:message key="BzComposer.updatecustomer.from"/>
								<html:text property="periodFrom" readonly="true"
								size="15" disabled="true" /> <img
								src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
								onclick="displayCalendar(document.CustomerForm.periodFrom,'mm-dd-yyyy',this);"
								id="imgfrm"></td>
							<td style="font-size:1em;">
								<bean:message key="BzComposer.updatecustomer.to"/> 
								<html:text property="periodTo" readonly="true" size="15"
								disabled="true" /><img
								src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
								onclick="displayCalendar(document.CustomerForm.periodTo,'mm-dd-yyyy',this);"
								id="imgto"></td>
							<td style="font-size:1em;"><input type="button" class="formbutton" name="Look up"
								value="<bean:message key='BzComposer.updatecustomer.lookhistory'/>" id="lookBtn" onclick="lookUpHistory();" /></td>

						</tr>


					</table>
					<div id="t_history" ></div>


					</div>

					</div>
					
						
	
				<!--  Periodic Billing -->
			
		
					
<!-- 							<tr> -->
<!-- 							<td style="font-size:1em;"><input type="hidden" value="0" -->
<!-- 						id="hidnId"> <input type="hidden" value="" id="code1"> -->
<!-- 								<div id="table-negotiations" style="width:100%;"> -->
<!-- 								<table class="tabla-listados" cellspacing="0"> -->
<!-- 									<thead> -->
<!-- 										<tr> -->
<%-- 											<th colspan="4"><bean:message --%>
<!-- 												key="BzComposer.UpdateCustomer.PeriodicBilling.MonthlyBillingDay" /></th> -->
<!-- 										</tr> -->
<!-- 									</thead> -->
<!-- 									<tbody> -->
<!-- 										<tr> -->
<%-- 									<td align="left"><html:select property="monthlyBilling"> --%>
<%-- 										<html:option value="1"></html:option> --%>
<%-- 										<html:option value="2"></html:option> --%>
<%-- 										<html:option value="3"></html:option> --%>
<%-- 										<html:option value="4"></html:option> --%>
<%-- 										<html:option value="5"></html:option> --%>
<%-- 										<html:option value="6"></html:option> --%>
<%-- 										<html:option value="7"></html:option> --%>
<%-- 										<html:option value="8"></html:option> --%>
<%-- 										<html:option value="9"></html:option> --%>
<%-- 										<html:option value="10"></html:option> --%>
<%-- 										<html:option value="11"></html:option> --%>
<%-- 										<html:option value="12"></html:option> --%>
<%-- 										<html:option value="13"></html:option> --%>
<%-- 										<html:option value="14"></html:option> --%>
<%-- 										<html:option value="15"></html:option> --%>
<%-- 										<html:option value="16"></html:option> --%>
<%-- 										<html:option value="17"></html:option> --%>
<%-- 										<html:option value="18"></html:option> --%>
<%-- 										<html:option value="19"></html:option> --%>
<%-- 										<html:option value="20"></html:option> --%>
<%-- 										<html:option value="21"></html:option> --%>
<%-- 										<html:option value="22"></html:option> --%>
<%-- 										<html:option value="23"></html:option> --%>
<%-- 										<html:option value="24"></html:option> --%>
<%-- 										<html:option value="25"></html:option> --%>
<%-- 										<html:option value="26"></html:option> --%>
<%-- 										<html:option value="27"></html:option> --%>
<%-- 										<html:option value="28"></html:option> --%>
<%-- 										<html:option value="29"></html:option> --%>
<%-- 										<html:option value="30"></html:option> --%>
<%-- 										<html:option value="31"></html:option> --%>
<%-- 									</html:select></td> --%>
								
<!-- 											</tr> -->
<!-- 											</tbody> -->
<!-- 								</table> -->
<!-- 								</div> -->
<!-- 								</td> -->
<!-- 								</tr>			 -->
<!-- 						<tr> -->
<!-- 								<td style="font-size:1em;"> -->
<!-- 								<div id="table-negotiations" style="width:100%;"> -->
<!-- 								<table class="tabla-listados" cellspacing="0"> -->
<!-- 									<thead> -->
<!-- 										<tr> -->
<%-- 											<th colspan="4"><bean:message --%>
<!-- 												key="BizComposer.Estimaion.Header.ItemInfo" /></th> -->
<!-- 										</tr> -->
<!-- 									</thead> -->
<!-- 									<tbody> -->
<!-- 										<tr> -->
<!-- 											<td colspan="4">&nbsp; -->
<!-- 											<table> -->
<!-- 								<tr> -->
<!-- 									<td style="font-size:1em;"> -->
									
<!-- 										<tr> -->
<%-- 											<td align="right" id="td1"><bean:message --%>
<!-- 												key="BzComposer.Invoice.ItemID" /></td> -->
<%-- 											<td id="td2"><html:select property="itemID" --%>
<!-- 												onchange="ItemChange(this.value);"> -->
<%-- 												<html:option value="0"> --%>
<%-- 													<bean:message key="BzComposer.ComboBox.Select" /> --%>
<%-- 												</html:option> --%>
<%-- 							<html:options collection="ItemList" property="invID" --%>
<!-- labelProperty="invCode" />				 -->
<%-- 				<logic:iterate name="ItemList" id="itmList"> --%>
<%-- 					<logic:equal name="itmList" property="isCategory" value="0"> --%>
<%-- 						<html:option value='${itmList.invID}'>&nbsp;&nbsp;&nbsp;&nbsp;<bean:write --%>
<!-- 								name="itmList" property="invCode" filter="false" /> -->
<%-- 						</html:option> --%>
<%-- 					</logic:equal> --%>
<%-- 					<logic:equal name="itmList" property="isCategory" value="1"> --%>
<%-- 						<html:option value='${itmList.invID}'> --%>
<%-- 							<bean:write name="itmList" property="invCode" filter="false" /> --%>
<%-- 						</html:option> --%>
<%-- 					</logic:equal> --%>
<%-- 				</logic:iterate> --%>
<%-- 			</html:select></td>		 --%>
										

<!-- 											<td align="right"><div id="td3" style="display:block;"> -->
<%-- 											<bean:message key="BzComposer.Invoice.Qty" /> --%>
<!-- 											</div> -->
<!-- 											</td> -->
<!-- 											<td style="font-size:1em;"><input type="text" size="10" id="qty_id" -->
<!-- 												onkeydown="return numbersonly(event,this.value)" /></td> -->
<%-- 											<td align="right"><bean:message --%>
<!-- 												key="BzComposer.Invoice.SerialNo" /></td> -->
<!-- 											<td style="font-size:1em;"><input type="text" size="10" id="serialNo_id" -->
<!-- 												readonly="readonly" /></td> -->
<%-- 											<td align="center"><bean:message --%>
<!-- 												key="BzComposer.Invoice.Desc" /></td> -->
<!-- 											<td style="font-size:1em;"><textarea rows="1" cols="25" readonly="readonly" -->
<!-- 												id="desc_id"></textarea></td> -->
											
<!-- 										</tr> -->
<!-- 										<tr id="tr2" > -->
<%-- 											<td align="right"><bean:message --%>
<!-- 												key="BzComposer.Invoice.UnitPrice" /></td> -->
<!-- 											<td style="font-size:1em;"><input type="text" size="10" id="unitPrice_id" -->
<!-- 												onkeydown="return numbersonly(event,this.value)" /></td> -->
<%-- 											<td align="right"><bean:message --%>
<!-- 												key="BzComposer.Invoice.Amount" /></td> -->

<!-- 											<td style="font-size:1em;"><input type="text" size="10" readonly="true" -->
<!-- 												id="amount_id" onfocus="Multiplication();" /></td> -->

<%-- 											<td align="right"><bean:message --%>
<!-- 												key="BzComposer.Invoice.Weight" /></td> -->
<!-- 											<td style="font-size:1em;"><input type="text" name="itemWeight" size="10" -->
<!-- 												id="weight_id" -->
<!-- 												onkeydown="return numbersonly(event,this.value)" /></td> -->
<%-- 											<td align="right"><bean:message key="BzComposer.Invoice.Tax" /> --%>
<!-- 											</td> -->
<!-- 											<td style="font-size:1em;"><select id="tax_id"> -->
<%-- 												<option value="0"><bean:message --%>
<!-- 													key="BizComposer.Estimaion.Tax.Yes" /></option> -->
<%-- 												<option value="1"><bean:message --%>
<!-- 													key="BizComposer.Estimaion.Tax.No" /></option> -->
<!-- 											</select></td> -->

<!-- 										</tr> -->

<!-- 										<tr> -->
<!-- 											<td style="font-size:1em;"></td> -->
<!-- 											<td style="font-size:1em;"></td> -->
<!-- 											<td style="font-size:1em;"></td> -->
<!-- 											<td style="font-size:1em;"></td> -->
<!-- 											<td style="font-size:1em;"></td> -->
<!-- 											<td style="font-size:1em;"></td> -->
<!-- 											<td style="font-size:1em;"><br> -->
<!-- 											<input type="button" class="formbutton" name="addItem" -->
<!-- 												title="To add item click it" onclick="AddItem(this.form);" -->
<%-- 												value='<bean:message key="BzComposer.Invoice.AddItem"/>' /> --%>
<!-- 											</td> -->
<!-- 											<td style="font-size:1em;"></td> -->
<!-- 											<td style="font-size:1em;"></td> -->
<!-- 										</tr> -->
<!-- 									</table> -->
								
<!-- 									</td> -->
<!-- 								</tr> -->

<!-- 							</tbody> -->
<!-- 							</table> -->
<!-- 							</div> -->
<!-- 							</td> -->
<!-- 							</tr>		 -->
								
<!-- 								<tr> -->
					
<!-- 									<td style="font-size:1em;"> -->

<%-- 									<div id="ItemDetails"><bean:size id="iSize" name="ItemList" /> --%>
<!-- 									<input type="hidden" name="ItemSize" id="itmSize" -->
<%-- 										value='<bean:write name="iSize" />'> <logic:iterate --%>
<!-- 										name="ItemList" id="objList" indexId="index"> -->
<!-- 										<input type="hidden" -->
<%-- 											value='<bean:write name="objList" property="invID"/>' --%>
<%-- 											id='<bean:write name="index" />inv' /> --%>
<!-- 										<input type="hidden" -->
<%-- 											value='<bean:write name="objList" property="qty"/>' --%>
<%-- 											id='<bean:write name="index" />q' /> --%>
<!-- 										<input type="hidden" -->
<%-- 											value='<bean:write name="objList" property="invCode"/>' --%>
<%-- 											id='<bean:write name="index" />code' /> --%>

<!-- 										<input type="hidden" -->
<%-- 											value='<bean:write name="objList" property="invDesc"/>' --%>
<%-- 											id='<bean:write name="index" />desc' /> --%>
<!-- 										<input type="hidden" -->
<%-- 											value='<bean:write name="objList" property="salePrice"/>' --%>
<%-- 											id='<bean:write name="index" />price' /> --%>
<!-- 										<input type="hidden" -->
<%-- 											value='<bean:write name="objList" property="weight"/>' --%>
<%-- 											id='<bean:write name="index" />wt' /> --%>
<!-- 										<input type="hidden" -->
<%-- 											value='<bean:write name="objList" property="isCategory"/>' --%>
<%-- 											id='<bean:write name="index" />cat' /> --%>
<!-- 										<input type="hidden" -->
<%-- 											value='<bean:write name="objList" property="itemTypeID"/>' --%>
<%-- 											id='<bean:write name="index" />itmId' /> --%>
<!-- 										<input type="hidden" -->
<%-- 											value='<bean:write name="objList" property="serialNo"/>' --%>
<%-- 											id='<bean:write name="index" />serial' /> --%>

<%-- 									</logic:iterate></div> --%>
									
<!-- 									<div id="table-negotiations" -->
<!-- 										style="overflow:auto;height:400;width:100%";" class="section-border"> -->

<!-- 									<table class="tabla-listados" cellspacing="0"> -->

<!-- 										<thead> -->
<!-- 											<tr> -->
<%-- 												<th><bean:message --%>
<!-- 													key="BzComposer.UpdateCustomer.PeriodicBilling.ItemId" /></th> -->
<%-- 												<th><bean:message --%>
<!-- 													key="BzComposer.UpdateCustomer.PeriodicBilling.Qty" /></th> -->
<%-- 												<th><bean:message --%>
<!-- 													key="BzComposer.UpdateCustomer.PeriodicBilling.Description" /></th> -->
<%-- 												<th><bean:message --%>
<!-- 													key="BzComposer.UpdateCustomer.PeriodicBilling.UnitePrice" /></th> -->
<%-- 												<th><bean:message --%>
<!-- 													key="BzComposer.UpdateCustomer.PeriodicBilling.Amount" /></th> -->
<%-- 												<th><bean:message --%>
<!-- 													key="BzComposer.UpdateCustomer.PeriodicBilling.Weight" /></th> -->
<%-- 												<th><bean:message --%>
<!-- 													key="BzComposer.UpdateCustomer.PeriodicBilling.Tax" /></th> -->
<%-- 												<th><bean:message --%>
<!-- 													key="BzComposer.UpdateCustomer.PeriodicBilling.SerialNo" /></th> -->
<!-- 											</tr> -->
<!-- 										</thead> -->
<!-- 										<tbody> -->
<!-- 											<tr id="tr##"> -->
<!-- 												<td align="center"></td> -->
<!-- 												<td align="center"></td> -->
<!-- 												<td align="center"></td> -->
<!-- 												<td align="center"></td> -->
<!-- 												<td align="center"></td> -->
<!-- 												<td align="center"></td> -->
<!-- 												<td align="center"></td> -->
<!-- 												<td align="center"></td> -->
<!-- 											</tr> -->
<!-- 										</tbody> -->
<!-- 									</table> -->
<!-- 									</div> -->

<!-- 									</td> -->
<!-- 								</tr> -->

					

					</div>
					</div>
	</div></div>
				<!--  finance Charges -->

			<table cellpadding="0" cellspacing="0" border="0" align=center  style="width: 100%;">
		<tr>
			<td align="center"><input type="button" class="formbutton"
				name="Update" value="<bean:message key='BzComposer.global.update'/>" title="Update Customer Information"
				onclick="UpdateCust();"> <input type="button" class="formbutton"
				onclick="closeme();" name="Close" value="<bean:message key='BzComposer.global.close'/>" title="Customer"> <input
				type="hidden" name="stname" value="" id="stateId"></td>
		</tr>
	</table>

	
	<div><input type="hidden" name="AnualRate" id="arate"> <input
		type="hidden" name="MinFinance" id="mfinance"> <input type="hidden"
		name="GracePeriod" id="gperiod" /> <input type="hidden" name="Flag"
		id="flagId" value="0" /> <input type="hidden" name="tabid" id="tabid"
		value="" /> <input type="hidden" name="bst" id="bsst" value="0" /> <html:hidden
		property="state" value="0" /> <html:hidden property="bsstate"
		value="0" /> <html:hidden property="shstate" value="0" /></div>
		
		</div>
		</div>
		</div>
		</div>
		
</html:form>
<%@ include file="/include/footer.jsp"%>

</body>
</html>
<script>
	
var radio_val;
function validateEntry(str) {
	var p = str.charAt("/");
	if (p < 0)
		document.getElementsByName("expDate").value="";
}

function enterEmailValidationDialog()
{
	event.preventDefault();
	$("#enterEmailValidationDialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showNameDialog()
{
	event.preventDefault();
	$("#showNameDialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showFirstNameDialog()
{
	event.preventDefault();
	$("#showFirstNameDialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showLastNameDialog()
{
	event.preventDefault();
	$("#showLastNameDialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showAddress1Dialog()
{
	event.preventDefault();
	$("#showAddress1Dialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showCityDialog()
{
	event.preventDefault();
	$("#showCityDialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showZipCodeDialog()
{
	event.preventDefault();
	$("#showZipCodeDialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showEmailLengthValidationDialog()
{
	event.preventDefault();
	$("#showEmailLengthValidationDialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showCellPhoneDialog()
{
	event.preventDefault();
	$("#showCellPhoneDialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<bean:message key='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showServiceValidationDialog()
{
	event.preventDefault();
	$("#showServiceValidationDialog").dialog({
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

function showselectitemdialog()
{
	event.preventDefault();
	$("#showselectitemdialog").dialog({
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

function UpdateCust(){
	if(document.CustomerForm.cname.value==""){

		return showNameDialog();
		document.CustomerForm.cname.focus();
	}
	else if(document.CustomerForm.firstName.value==""){

		return showFirstNameDialog();
		document.CustomerForm.firstName.focus();
	}
	else if(document.CustomerForm.lastName.value==""){

		return showLastNameDialog();
		document.CustomerForm.lastName.focus();
	}
	else if(document.CustomerForm.address1.value==""  ){

		return showAddress1Dialog();
		document.CustomerForm.address1.focus();
	}
	else if(document.CustomerForm.city.value==""){

		return showCityDialog();
		document.CustomerForm.address1.focus();
	}
	else if(document.CustomerForm.zipCode.value==""){

		return showZipCodeDialog();
		document.CustomerForm.zipCode.focus();
	}
	else if(String(document.CustomerForm.cellPhone.value).length>16){

		return showCellPhoneDialog();
		document.CustomerForm.cellPhone.value="";	
		document.CustomerForm.cellPhone.focus();
	}
	else {
		if(validate())
		{
			event.preventDefault();
			$("#updateCustomerDialog").dialog({
			    	resizable: false,
			        height: 200,
			        width: 500,
			        modal: true,
			        buttons: {
			            "<bean:message key='BzComposer.global.ok'/>": function () {
			            	document.getElementById('chk1').disabled=false;
							if(document.getElementById('chk1').checked==true)
							{
								document.getElementById('chk1').value="on";
							}
							else
							{
								document.getElementById('chk1').value="off";
							}
								
							document.getElementById('arate').value=document.CustomerForm.annualIntrestRate.value;
							document.getElementById('mfinance').value=document.CustomerForm.minFCharges.value;
							document.getElementById('gperiod').value=document.CustomerForm.gracePrd.value;
							document.CustomerForm.table_defaultVal.value=default_sid;
							document.getElementById('tabid').value="edit";
							document.forms[0].action="updateEditedCustomer.do";
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
			
			/* if(confirm('<bean:message key="BzComposer.updatecustomer.updatecustomerinformation"/>'))
			{
				document.getElementById('chk1').disabled=false;
				if(document.getElementById('chk1').checked==true)
				{
					document.getElementById('chk1').value="on";
				}
				else
				{
					document.getElementById('chk1').value="off";
				}
					
				document.getElementById('arate').value=document.CustomerForm.annualIntrestRate.value;
				document.getElementById('mfinance').value=document.CustomerForm.minFCharges.value;
				document.getElementById('gperiod').value=document.CustomerForm.gracePrd.value;
				document.CustomerForm.table_defaultVal.value=default_sid;
				document.getElementById('tabid').value="edit";
				document.forms[0].action="updateEditedCustomer.do";
				document.forms[0].submit();
			} */
		}
	}
}

function addToTable(form)
{	

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

/*
	for(i=0; i<SIDSize; i++)
	{
		sid=document.getElementById(i+'_ser').value;		
		
		exist[i]=sid;
		alert("ARR"+exist[i]);
		cnt++;
	}
*/

		for(t=0; t<exist.length; t++){	//limit=cnt
			if(invID==exist[t])		{				
				flag=1;
				break;
			}
		}

	/*	for(z=0;z<SIDSize;z++)
		{
			sid=document.getElementById(z+'id').value;
			if(exist[z]==sid)
			{
				flag1=1;
			}
		}
*/
		
	
/***********************************************************************************************************	
	for(i=0;i<SLSize;i++)
	{
		iinvID=document.getElementById(i+'sid').value;
		isID=document.getElementById(i+'isid').value;
		if(invID==iinvID)
		{

		 
				serviceName=document.getElementById(i+'sname').value;
		

	
			for(j=0;j<InvSize;j++)
			{
				isID2=document.getElementById(j+'invid').value;
					if(isID==isID2)
					{
							exist[cnt]=invID;
							
							
							InvoiceStyle=document.getElementById(j+'iname').value;		
							cnt++;
					}				
			}
		}
	}
*************************************************************************************************************/	
		if(flag==1)		{

			return showServiceValidationDialog();
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
				tr.setAttribute("id", "row"+invID);	//tr.setAttribute("id", "row"+hidn_val); 
				
				var tr2 = document.getElementById('tr$$');
				var parentTr = tr2.parentNode;
				parentTr.insertBefore(tr, tr2);

	
				var td1 = document.createElement("td");
				td1.setAttribute("align", "left");
				tr.appendChild(td1);
				td1.innerHTML=serviceName;
				
				var td2 = document.createElement("td");
				td2.setAttribute("align", "left");
				tr.appendChild(td2);
				td2.innerHTML=InvoiceStyle;


				var td3 = document.createElement("td");
				td3.setAttribute("align", "left");
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
				
				form.table_size.value++;

				
				form.table_serID.value+=invID+";";


				form.table_serviceName.value+=serviceName+";";
				
				//form.table_invId.value+=InvoiceStyle+";";
				
				form.table_bal.value+=ServiceBalance+";";

	
				if(InvoiceStyle==""){
					form.table_invId.value+=invID+";";
				}
				else{
					for(p=0;p<InvSize;p++) {
						invoiceName=document.getElementById(p+'iname').value;
						if(invoiceName==InvoiceStyle) {
							form.table_invId.value+=document.getElementById(p+'invid').value+";";
						}				
					}
				}
				count = ((count)/1 + 1);
				document.getElementById('hidn').value=((hidn_val)/1 + 1);	
				
			
			}
			name=form.table_serviceName.value;
}

function AddItem(form)
{

	if(form.itemID.value==0){
				document.getElementById('serialNo_id').value="";
				document.getElementById('qty_id').value="";
				document.getElementById('desc_id').value="";
				document.getElementById('unitPrice_id').value="";
				document.getElementById('amount_id').value="";
				document.getElementById('weight_id').value="";

				return showselectitemdialog();
		}
		else
		{
				hidn_Id = document.getElementById('hidnId').value;

				ivcode = document.getElementById('code1').value;
				qty=document.getElementById('qty_id').value;
				serialNo = document.getElementById('serialNo_id').value;
				var desc = document.getElementById('desc_id').value;
				weight = document.getElementById('weight_id').value;
				tax = document.getElementById('tax_id').value;
				uprice=document.getElementById('unitPrice_id').value;
				
				var tr = document.createElement("tr");
				tr.setAttribute("id", "tr"+hidn_Id);

				var tr2 = document.getElementById('tr##');
				var parentTr = tr2.parentNode;
				parentTr.insertBefore(tr, tr2);
	
				var td1 = document.createElement("td");
				td1.setAttribute("align", "center");
				tr.appendChild(td1);
				td1.innerHTML=ivcode;

				var td2 = document.createElement("td");
				td2.setAttribute("align", "center");
				tr.appendChild(td2);
				td2.innerHTML=qty;

				var td3 = document.createElement("td");
				td3.setAttribute("align", "center");
				tr.appendChild(td3);
				td3.innerHTML=desc;
	
				var td4 = document.createElement("td");
				td4.setAttribute("align", "left");
				tr.appendChild(td4);
				td4.innerHTML=uprice;

				amt=( (qty/1) * (uprice/1) );
				document.getElementById('amount_id').value=amt;
	
				var td5 = document.createElement("td");
				td5.setAttribute("align","center");
				tr.appendChild(td5);
				td5.innerHTML=amt;
	
				var td6 = document.createElement("td");
				td6.setAttribute("align","center");
				tr.appendChild(td6);
				td6.innerHTML=weight;
	
				var t="";
				if(tax==0)
					t="Yes";
				else
					t="No";
	
				var td6 = document.createElement("td");
				td6.setAttribute("align","center");			
				tr.appendChild(td6);
				td6.innerHTML=t;
	
				var td7 = document.createElement("td");
				td7.setAttribute("align","center");	
				tr.appendChild(td7);
				td7.innerHTML=serialNo;
				
				hidn_Id++;
	}
			
}

	
	function setDefault(invID1,form)
	{
		form.table_defaultVal.value=invID1;
		default_sid=invID1;
	}

	
	function setDefaultToDb(invID1,form)
	{
		form.table_DbDefSer.value=invID1;
		default_sid=invID1;
	}



	function removeFromTable(idV)
	{
		if(idV==default_sid){
			default_sid=0;
		}

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


	function removeStringValues(key){	//from one string('str'), a substring 'key' will be removed

		var str, str2, str3;
		var temp=new Array(20);
		var temp2=new Array(20);
		var temp3=new Array(20);				
		
		str=str2=str3="";
		
		str= document.forms[0].table_serID.value;		
		str2=document.forms[0].table_bal.value;
		str3=document.forms[0].table_invId.value;
		
		if (str!="" && str2!="" && str3!="") {
			temp=str.split(";");
			temp2=str2.split(";");
			temp3=str3.split(";");		
		}
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

	
function lookUpHistory(){
	val=document.getElementById('hidn').value;
    var dfrom=document.CustomerForm.periodFrom.value;
    var dto=document.CustomerForm.periodTo.value;
    document.getElementById('flagId').value='1';
    <logic:present name="ClientID">
    	refreshTransationNow(radio_val,'<bean:write name="ClientID"/>',dfrom,dto);
    </logic:present>
    <logic:notPresent name="ClientID">
	    custid=document.CustomerForm.custId.value;
    	refreshTransationNow(radio_val,custid,dfrom,dto);
    </logic:notPresent>
}
function setRowId(rowId,rid){
	size=document.getElementById("lSize").value;
	for(i=0;i<size;i++){
		var row1=document.getElementById(i+"$$");
		row1.className = "";
	}
	var rd=document.getElementById(rid);
	rd.className = "draft";
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

</script>
<script>
	flag_state = 0;
function initialize(){
	<logic:equal name="CustomerDetails"	property="fsUseIndividual" value="true">
		enableDisableFinanceCharges();
	</logic:equal>
	<logic:present name="RadioVal">
		<logic:equal name="RadioVal" value="1">
			hide_details("ShowAll");
			radio_val="ShowAll";
			<logic:present name="ClientID">
				lookUpHistory();	
			</logic:present>
		</logic:equal>
		<logic:equal name="RadioVal" value="2">
			hide_details("ByVal");
			radio_val="ByVal";
			<logic:present name="FlagValue">
				lookUpHistory();	
			</logic:present>
		</logic:equal>
	</logic:present>
	<logic:notPresent name="RadioVal">
		hide_details("ShowAll");
	</logic:notPresent>
	document.getElementById('tid').value="";
}

	function setState(state_id,name){
	if(name == 'state'){
		document.CustomerForm.state.value = state_id;
	}
	else if(name == 'bsstate'){
		flag_state = 1;
		document.CustomerForm.bsstate.value = state_id;
		document.getElementById('bsst').value = state_id;
	}
	else if(name == 'shstate'){
		document.CustomerForm.shstate.value = state_id;
	}
  }
 
function CopyBilladdToShipAdd(){
	document.CustomerForm.shcname.value= document.CustomerForm.bscname.value;
	document.CustomerForm.shfirstName.value= document.CustomerForm.bsfirstName.value;
	document.CustomerForm.shlastName.value= document.CustomerForm.bslastName.value;
	document.CustomerForm.shaddress1.value= document.CustomerForm.bsaddress1.value;
	document.CustomerForm.shaddress2.value= document.CustomerForm.bsaddress2.value;
	document.CustomerForm.shcity.value= document.CustomerForm.bscity.value;
	document.CustomerForm.shzipCode.value = document.CustomerForm.bszipCode.value;
	document.CustomerForm.shprovince.value=document.CustomerForm.bsprovince.value;
	document.CustomerForm.shcountry.value= document.CustomerForm.bscountry.value;
// 	<logic:present name="state_bt">
// 		document.CustomerForm.bsstate.value = '<bean:write name="state_bt" />';
// 	</logic:present>
// 	if(flag_state == 1){
// 		document.CustomerForm.bsstate.value = document.getElementById('bsst').value;	
// 	}
// 	document.CustomerForm.shstate.value = document.CustomerForm.bsstate.value;
// 	refreshItemsNow12(document.CustomerForm.bscountry.value,document.CustomerForm.bsstate.value);
	document.CustomerForm.shstate.value = document.getElementById('bsst').value;
	refreshItemsNow12(document.CustomerForm.bscountry.value,document.getElementById('bsst').value);
}
function clearBillingAdd(){
	document.CustomerForm.bscname.value="";
	document.CustomerForm.bsfirstName.value="";
	document.CustomerForm.bslastName.value="";
	document.CustomerForm.bsaddress1.value="";
	document.CustomerForm.bsaddress2.value="";
	document.CustomerForm.bscity.value="";
	document.CustomerForm.bszipCode.value="";
	document.CustomerForm.bsprovince.value="";
	document.CustomerForm.bscountry.value="0";
	document.CustomerForm.bsstate.value="0";
	refreshItemsNow22(0,0);
}
	
	function clearShippingAdd(){
	document.CustomerForm.shcname.value="";
	document.CustomerForm.shfirstName.value="";
	document.CustomerForm.shlastName.value= "";
	document.CustomerForm.shaddress1.value= "";
	document.CustomerForm.shaddress2.value= "";
	document.CustomerForm.shcity.value= "";
	document.CustomerForm.shzipCode.value = "";
	document.CustomerForm.shprovince.value="";
	document.CustomerForm.shcountry.value= "0";
	document.CustomerForm.shstate.value="0";
	refreshItemsNow12(0,0);
	}
	
	function UpdateCustomer(){
	
		val=document.getElementById('hidn_custID').value;
		document.forms[0].action = "UpdateInvoice";
		document.forms[0].submit();
		window.close();
	
	}
	
	
	function hidebsaddress(form){
		chbox=document.getElementById('chk_setaddress');
		if(!chbox.checked)
		{		
			
			document.CustomerForm.bscname.disabled=false;
			document.CustomerForm.bsfirstName.disabled=false;
			document.CustomerForm.bslastName.disabled=false;	
			document.CustomerForm.bsaddress1.disabled=false;
			document.CustomerForm.bsaddress2.disabled=false;
			document.CustomerForm.bscity.disabled=false;
			document.CustomerForm.bszipCode.disabled=false;
			document.CustomerForm.bscountry.disabled=false;
			document.CustomerForm.bsprovince.disabled=false;
					
			document.CustomerForm.shcname.disabled=false;
			document.CustomerForm.shfirstName.disabled=false;
			document.CustomerForm.shlastName.disabled=false;	
			document.CustomerForm.shaddress1.disabled=false;
			document.CustomerForm.shaddress2.disabled=false;
			document.CustomerForm.shcity.disabled=false;
			document.CustomerForm.shzipCode.disabled=false;
			document.CustomerForm.shcountry.disabled=false;
			document.CustomerForm.shprovince.disabled=false;		
		    document.CustomerForm.setdefaultbs.value="0";		
		}
		else
		{
			
			
			document.CustomerForm.bscname.disabled=true;
			document.CustomerForm.bsfirstName.disabled=true;
			document.CustomerForm.bslastName.disabled=true;	
			document.CustomerForm.bsaddress1.disabled=true;
			document.CustomerForm.bsaddress2.disabled=true;
			document.CustomerForm.bscity.disabled=true;
			document.CustomerForm.bszipCode.disabled=true;
			document.CustomerForm.bscountry.disabled=true;
			document.CustomerForm.bsprovince.disabled=true;
			
			
			document.CustomerForm.shcname.disabled=true;
			document.CustomerForm.shfirstName.disabled=true;
			document.CustomerForm.shlastName.disabled=true;	
			document.CustomerForm.shaddress1.disabled=true;
			document.CustomerForm.shaddress2.disabled=true;
			document.CustomerForm.shcity.disabled=true;
			document.CustomerForm.shzipCode.disabled=true;
			document.CustomerForm.shcountry.disabled=true;
			document.CustomerForm.shprovince.disabled=true;
		    document.CustomerForm.setdefaultbs.value="";
		}
	}

function hide_details(val)
{
	if(val=="ShowAll"){
		document.getElementById('imgfrm').style.visibility='hidden';
		document.getElementById('imgto').style.visibility='hidden';
		document.CustomerForm.periodFrom.disabled=true;
		document.CustomerForm.periodTo.disabled=true;
	}
	if(val=="ByVal"){
		document.getElementById('imgfrm').style.visibility='visible';
		document.getElementById('imgto').style.visibility='visible';
		document.CustomerForm.periodFrom.disabled=false;
		document.CustomerForm.periodTo.disabled=false;
	}
	radio_val=val;
}

function closeme(){
	this.window.close();
}
function fun(val){

}
function ItemChange(value){
	var size = document.getElementById('itmSize').value;
	var count;
	for(count=0;count<size;count++){
		var invID = document.getElementById(count+'inv').value;
		if(value==invID){
			var category = document.getElementById(count+'cat').value;
			if(category==1){
				document.getElementById('qty_id').value="";
				document.getElementById('desc_id').value="";
				document.getElementById('unitPrice_id').value="";
				document.getElementById('amount_id').value="";
				document.getElementById('weight_id').value="";
				document.getElementById('tax_id').value="";
				document.getElementById('serialNo_id').value="";
				
				document.getElementById('qty_id').readonly="true";
				document.getElementById('unitPrice_id').readonly="true";
				document.getElementById('weight_id').readonly="true";
				document.getElementById('code1').value=document.getElementById(count+'code').value;
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
				document.getElementById('desc_id').value=document.getElementById(count+'desc').value;
				document.getElementById('unitPrice_id').value=uprice;
				document.getElementById('amount_id').value=qty*uprice;
				document.getElementById('weight_id').value=document.getElementById(count+'wt').value;
				document.getElementById('code1').value=document.getElementById(count+'code').value;
				document.getElementById('tax_id').value="0";
				//document.getElementById('itmId').value=document.getElementById(count+'itmId').value;
			//	document.getElementById('itmVal').value=value;
			}
		}				
	}
}
function DeleteItem(rowId){
}

function enableDisableFinanceCharges(){
	ch_box=document.getElementById('chbox');
	
	if (ch_box.checked) {
		document.CustomerForm.annualIntrestRate.disabled=false;
		document.CustomerForm.minFCharges.disabled=false;
		document.CustomerForm.gracePrd.disabled=false;
		document.getElementById('chk1').disabled=false;
	}
	else {
		document.CustomerForm.annualIntrestRate.disabled=true;
		document.CustomerForm.minFCharges.disabled=true;
		document.CustomerForm.gracePrd.disabled=true;
		
		document.getElementById('chk1').disabled=true;
	}
}
</script>
<!-- dialog box used in this page -->
<div id="showNameDialog" style="display:none;">
	<p><bean:message key="BzComposer.updatecustomer.entercompanyname" /></p>
</div>
<div id="showFirstNameDialog" style="display:none;">
	<p><bean:message key="BzComposer.updatecustomer.enterfirstname" /></p>
</div>
<div id="showLastNameDialog" style="display:none;">
	<p><bean:message key="BzComposer.updatecustomer.enterlastname"/></p>
</div>
<div id="showAddress1Dialog" style="display:none;">
	<p><bean:message key="BzComposer.updatecustomer.enteradderss1"/></p>
</div>
<div id="showCityDialog" style="display:none;">
	<p><bean:message key="BzComposer.updatecustomer.entercity"/></p>
</div>
<div id="showZipCodeDialog" style="display:none;">
	<p><bean:message key="BzComposer.updatecustomer.enterzipcode"/></p>
</div>
<div id="showEmailValidationDialog" style="display:none;">
	<p><bean:message key="BzComposer.updatevendor.enteremailvalidation" /></p>
</div>
<div id="enterEmailValidationDialog" style="display:none;">
	<p><bean:message key="Bzcomposer.updatevendor.enteremailaddress"/></p>
</div>
<div id="showEmailLengthValidationDialog" style="display:none;">
	<p><bean:message key="BzComposer.updatecustomer.entervalidemaillength" /></p>
</div>
<div id="updateCustomerDialog" style="display:none;">
	<p><bean:message key="BzComposer.updatecustomer.updatecustomerinformation"/></p>
</div>
<div id="showCellPhoneDialog" style="display:none;">
	<p><bean:message key="BzComposer.updatecustomer.cellphonenumberistoolarge"/></p>
</div>
<div id="showServiceValidationDialog" style="display:none;">
	<p><bean:message key="BzComposer.updatecustomer.serviceexist"/></p>
</div>
<div id="showselectitemdialog" style="display:none;">
	<p><bean:message key="BzComposer.updatecustomer.selectitemfirst" /></p>
</div>