<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%-- <%@include file="/include/menu.jsp"%> --%> 
<%@include file="/include/header.jsp"%>
<title>BzComposer-Add New Supplier</title>
<link href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function () { 
    $("#tabs").tabs();
    $("#tabsAddress").tabs(); 
    
    
    var addStatus = "<%= request.getAttribute("addressStatus")%>";
	var addName = "<%= request.getAttribute("addressName")%>";
	var f_Name = "<%= request.getAttribute("fName")%>";
	var l_Name = "<%= request.getAttribute("lName")%>";
	var add_1 = "<%= request.getAttribute("add1")%>";
	var add_2 = "<%= request.getAttribute("add2")%>";
	
	//old address data
	var addStatusOld = "<%= request.getAttribute("newAddressStatus")%>";
	var addNameOld = "<%= request.getAttribute("newAddressName")%>";
	var f_NameOld = "<%= request.getAttribute("newfName")%>";
	var l_NameOld = "<%= request.getAttribute("newlName")%>";
	var add_1Old = "<%= request.getAttribute("newAdd1")%>";
	var add_2Old = "<%= request.getAttribute("newAdd2")%>";
	

	$('#addAddress').click(function(){
		/* var myWindow = window.open("Customer.do?tabid=addAddress&chkStatus=Active","_blank","scrollbars=No,height=900,width=1400,status=yes,toolbar=no,menubar=no,location=no");
		
		myWindow.moveTo(90,90); */
		
		var rows = document.getElementById("billingAddress").getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
		if(rows>=2)
		{
			alert("<spring:message code='BzComposer.common.cantAddMoreAddresses'/>");
			event.preventDefault();
		}
		else
		{
			var fname = $("#fname").text();
			var lname = $("#lname").text();
			var add1 = $("#add1").text();
			var add2 = $("#add2").text();
			var status = $("#status").text();
			var st = "Active";
			window.location = "Customer.do?tabid=addAddress&chkStatus="+st+"&fname="+fname+"&lname="+lname+"&address1="+add1+"&address2="+add2+"&status="+status;
		}
		/*event.preventDefault(); */
		/* 
		$.ajax({
			type: "POST",
	     	url: "Customer.do?tabid=addAddress",
	     	data: { chkStatus : "Active"},
			success: function(data)
	        {

	        }
		}); */
		
	});
	/*  */
	$('#editAddress').click(function(event){
		var isChecked = $('#selectAddress').prop("checked");
		
		var rows = document.getElementById("billingAddress").getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
		if(isChecked== true)
		{
			var f = $("#fname").text();
			var l = $("#lname").text();
			var ad1 = $("#add1").text();
			var ad2 = $("#add2").text();
			var stat = $("#status").text();
			
			window.location = "Customer.do?tabid=editAddress&chkStatus=Default&fName="+f+"&lName="+l+"&add1="+ad1+"&add2="+ad2+"&status="+stat;
				/* var url = "Customer.do?tabid=editAddress&chkStatus=Default&fName="+f+"&lName="+l+"&add1="+ad1+"&add2="+ad2+"&status="+stat;
				var result = window.open(url,"_blank","scrollbars=No,height=900,width=1100,status=yes,toolbar=no,menubar=no,location=no");
				result.moveTo(90,90); */
				/* $.ajax({
					type: "POST",
			     	url: result,
		     		data: { chkStatus : "Default" , fName : f , lName : l , add1 : ad1 , add2 : ad2 , status : stat},
					success: function(response)
	            	{

	    	        }
				}); */
		}
		else if(rows>=2)
		{
			alert("<spring:message code='BzComposer.common.cantAddMoreAddresses'/>");
			event.preventDefault();
		}
		else
		{
			event.preventDefault();
			alert("<spring:message code='BzComposer.common.selectAddress'/>");
		}
	});
	$('#deleteAddress').click(function(){
		var isChecked = $('#selectAddress').prop("checked");
		var status = $('#status').text();
		alert("Status:"+status);
		if(isChecked== true)
		{
			alert("<spring:message code='BzComposer.common.defaultAddressCantDelete'/>");
		}
		else
		{
			if(status == "Default")
			{
				alert("<spring:message code='BzComposer.common.selectAddress'/>");
			}
			else if(confirm("<spring:message code='BzComposer.common.wantToDeleteAddress'/>"))
			{
				alert("<spring:message code='BzComposer.common.defaultAddressWillBeDeleted'/>");
				$(this).remove();
			}
			else
			{
				alert("<spring:message code='BzComposer.common.selectedAddressDeleted'/>");
				$(this).remove();
			}
		}
	});
});
</script>
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
      alert("<spring:message code='BzComposer.common.needToEnableActiveXObject'/> ts.." + ex);
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
  oGET(o,'${pageContext.request.contextPath}/include/GetStates.jsp?st=state&Cid=' + val)
}

function showPanel() 
{
	
	var selectedTab = $("#tabs").tabs('option','active');
	
	if(selectedTab == 3)
    {
    	//these values comes from textbox of General tab.
    	
    	var fName = $("#firstName").val();
		var lName = $("#lastName").val();
    	var address1 = $("#address1").val();
    	var address2 = $("#address2").val();
    	
    	var isAvailable = $('#billingAddress tr > td:contains('+fName+')').length;
    	
    	
    	//new address data
    	var addStatus = "<%= request.getAttribute("addressStatus")%>";
    	var addName = "<%= request.getAttribute("addressName")%>";
    	var f_Name = "<%= request.getAttribute("fName")%>";
    	var l_Name = "<%= request.getAttribute("lName")%>";
    	var add_1 = "<%= request.getAttribute("add1")%>";
    	var add_2 = "<%= request.getAttribute("add2")%>";
    	
    	
    	//old address data
    	var addStatusOld = "<%= request.getAttribute("newAddressStatus")%>";
    	var addNameOld = "<%= request.getAttribute("newAddressName")%>";
    	var f_NameOld = "<%= request.getAttribute("newfName")%>";
    	var l_NameOld = "<%= request.getAttribute("newlName")%>";
    	var add_1Old = "<%= request.getAttribute("newAdd1")%>";
    	var add_2Old = "<%= request.getAttribute("newAdd2")%>";
    	
    	
    	var isAvailable1 = $('#billingAddress tr > td:contains('+f_NameOld+')').length;
    	
    	/*condition 1:check whether firstname,lastname and address1 had values or not?*/
    	if(fName == "" || lName == "")
    	{
    		
    	    alert("<spring:message code='BzComposer.common.insertFirstOrLastname'/>");
    	    $( "#tabs" ).tabs( "option", "active", 0 );
    	}
    	else if(address1 == "")
    	{
    		alert("<spring:message code='BzComposer.updatecustomer.enteradderss1'/>");
    	    $( "#tabs" ).tabs( "option", "active", 0 );
    	}
    	/*condition 2(A):if firstName,lastName and address1 had values then check whether is it old address value or new address value.if new values are there then add old and new values.*/
    	else if(fName == f_Name && lName == l_Name && address1 == add_1 && f_Name != "null" && l_Name != "null" && add_1 != "null" && add_2 != "null" && addName != "null" && addStatus != "null" && f_NameOld != "null" && l_NameOld != "null" && add_1Old != "null" && add_2Old != "null" && addNameOld != "null" && addStatusOld != "null")
		{
    		
			$('#billingAddress').append("<tr id="+f_NameOld+"><td><input type='radio' id='selectAddress' name='selectAddress' value='checked'/></td><td style='font-size: 1.1em;' id='status'>"+addNameOld+"</td><td style='font-size: 1.1em;' id='fname'>"+f_NameOld+"</td><td style='font-size: 1.1em;' id='lname'>"+l_NameOld+"</td><td style='font-size: 1.1em;' id='add1'>"+add_1Old+"</td><td style='font-size: 1.1em;' id='add2'>"+add_2Old+"</td><td style='font-size: 1.1em;' id='status'>"+addStatusOld+"</td></tr>");
    		$('#billingAddress').append("<tr id="+f_Name+"><td><input type='radio' id='selectAddress' name='selectAddress' value='checked'/></td><td style='font-size: 1.1em;' id='status'>"+addName+"</td><td style='font-size: 1.1em;' id='fname'>"+f_Name+"</td><td style='font-size: 1.1em;' id='lname'>"+l_Name+"</td><td style='font-size: 1.1em;' id='add1'>"+add_1+"</td><td style='font-size: 1.1em;' id='add2'>"+add_2+"</td><td style='font-size: 1.1em;' id='status'>"+addStatus+"</td></tr>");

			addName = "null";
			f_Name = "null";
			l_Name = "null";
			add_1 = "null";
			add_2 = "null";
			addStatus = "null";
			addStatusOld = "null";
			addNameOld = "null";
			f_NameOld = "null";
			l_NameOld = "null";
			add_1Old = "null";
			add_2Old = "null";
		}
    	/*condition 2(B):if firstName,lastName and address1 had values then check whether is it old address value or new address value.if old values are there then add only old values.*/
    	else if(addStatusOld != "null" && addNameOld != "null" && f_NameOld != "null" && l_NameOld != "null" && add_1Old != "null" && add_2Old != "null")
		{
			

			$('#billingAddress').append("<tr id="+f_NameOld+"><td><input type='radio' id='selectAddress' name='selectAddress' value='checked'/></td><td style='font-size: 1.1em;' id='status'>"+addNameOld+"</td><td style='font-size: 1.1em;' id='fname'>"+f_NameOld+"</td><td style='font-size: 1.1em;' id='lname'>"+l_NameOld+"</td><td style='font-size: 1.1em;' id='add1'>"+add_1Old+"</td><td style='font-size: 1.1em;' id='add2'>"+add_2Old+"</td><td style='font-size: 1.1em;' id='status'>"+addStatusOld+"</td></tr>");
			addStatusOld = "null";
			addNameOld = "null";
			f_NameOld = "null";
			l_NameOld = "null";
			add_1Old = "null";
			add_2Old = "null";
		}
    	/*condition 3:check whether value is already available or not?if yes then not added and if no then add as new record*/
    	else if(isAvailable1 == 0 && fName == f_Name && lName == l_Name && address1 == add_1 && f_Name != "null" && l_Name != "null" && add_1 != "null" && add_2 != "null")
		{
			
			$('#billingAddress').append("<tr id="+f_Name+"><td><input type='radio' id='selectAddress' name='selectAddress' value='checked'/></td><td style='font-size: 1.1em;' id='status'>"+addName+"</td><td style='font-size: 1.1em;' id='fname'>"+f_Name+"</td><td style='font-size: 1.1em;' id='lname'>"+l_Name+"</td><td style='font-size: 1.1em;' id='add1'>"+add_1+"</td><td style='font-size: 1.1em;' id='add2'>"+add_2+"</td><td style='font-size: 1.1em;' id='status'>"+addStatus+"</td></tr>");
			addStatusOld = "null";
			addNameOld = "null";
			f_NameOld = "null";
			l_NameOld = "null";
			add_1Old = "null";
			add_2Old = "null";
		}
    	/*condition 4:check whether value is already available or not?if yes then not added and if no then add as new record*/
		else if(isAvailable == 0)
		{
			
			$('#billingAddress').append("<tr id="+fName+"><td><input type='radio' id='selectAddress' name='selectAddress' value='checked'/></td><td style='font-size: 1.1em;' id='status'>Default</td><td style='font-size: 1.1em;' id='fname'>"+fName+"</td><td style='font-size: 1.1em;' id='lname'>"+lName+"</td><td style='font-size: 1.1em;' id='add1'>"+address1+"</td><td style='font-size: 1.1em;' id='add2'>"+address2+"</td><td style='font-size: 1.1em;' id='status'>Default</td></tr>");    	
		}
    	else
    	{
    		alert("<spring:message code='Bzcomposer.additem.notadditem'/>");
        	
        	$( "#tabs" ).tabs( "option", "active", 3 );
    	}
    }
	
	/*After satisfy all condition now we'll remove data so that it can't add twice when we redirect to again General tab and Manage Muliple Address tab*/
	
	addStatusOld = "null";
	addNameOld = "null";
	f_NameOld = "null";
	l_NameOld = "null";
	add_1Old = "null";
	add_2Old = "null";
	
	
	addName = "null";
	addStatus = "null";
	f_Name = "null";
	l_Name = "null";
	add_1 = "null";
	add_2 = "null";
	
	
}

/* function checkCheckbox()
{
    $(this).siblings('input:checkbox').prop('checked', false);
} */
function setState(state_id,name){
	if(name == 'state'){
		document.CustomerForm.state.value = state_id;
	}
	else if(name == 'bsstate'){
		document.CustomerForm.bsstate.value = state_id;
		document.getElementById('bsst').value = state_id;
	}
	else if(name == 'shstate'){
		document.CustomerForm.shstate.value = state_id;
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

function onlyAlphabets(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
</script>
</head>
<body>
<div id="ddcolortabsline">
&nbsp;
</div>
<form:form action="Item" method="post" enctype="MULTIPART/FORM-DATA" id="frmAddSupplier" name="frmAddSupplier">
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
	<span style="font-size:1.1em;font-weight:normal;color:#838383;margin:30px 0px 15px 0px;border-bottom:1px dotted #333;padding:0 0 .3em 0;">
		<%-- <spring:message code="BzComposer.Item.AddItem"/> --%>Add New Supplier
	</span>
</div>
<br/>
<table cellpadding="0" cellspacing="0" border="0" align=center  style="width: 100%;">	
	<logic:present name="Status">
		<tr>
			<td colspan="12">
				<span class="msgstyle">*
					<bean:write name="Status" />
				</span>
			</td>
		</tr>
	</logic:present>
	<logic:present name="SaveStatus">
		<tr>
			<td colspan="12">
				<span class="msgstyle">*
					<bean:write name="SaveStatus"/>
				</span>
			</td>
		</tr>
	</logic:present>
	<tr>
	<td colspan="12">
		<div id="table-negotiations" style="overflow:auto;width:100%">
			<table class="tabla-listados" cellspacing="0" align="left">
				<tr>
					<td colspan="12">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="12" style="padding-right: 14px;">
						<div id="tabs" style="height:600px;">
			  				<ul id="tabs">
  								<li style="font-size: 1.1em;" onclick="showPanel();"><a href="#general-1">General</a></li>
    							<li style="font-size: 1.1em;" onclick="showPanel();"><a href="#account-2">Account</a></li>
    							<li style="font-size: 1.1em;" onclick="showPanel();"><a href="#services-3">Service</a></li>
    							<li style="font-size: 1.1em;" onclick="showPanel();"><a href="#manageAddress-4">Manage Multiple Address</a></li>
							</ul>
									
							<!-- general tab starts -->
							<div id="general-1">
	   							<div id="content1" class="tabPage">
	   								<!-- add here the content of first tab -->
									<div id="table-negotiations">
										<table class="tabla-listados" cellspacing="0" style="font-size: 1em;">
											<tbody>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="MultiUserForm.firstName"/>
													</td>
													<td style="font-size: 1em;">
														<form:input type="text" path="firstName" onkeypress="return onlyAlphabets(event,this)"/>
													</td>
													<td style="font-size: 1em;">
														<spring:message code="MultiUserForm.lastName"/>
													</td>
													<td style="font-size: 1em;">
														<input type="text" path="lastName" id="lastName" onkeypress="return onlyAlphabets(event,this)">
													</td>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Vendor.StartDate"/>
													</td>
													<td style="font-size: 1em;">
														<input type="text" path="fromDate" id="fromDate">
														<img src="${pageContext.request.contextPath}/images/cal.gif"
														onclick="displayCalendar(document.CustomerForm.fromDate,'dd-mm-yyyy',this);">
													</td>
													<td colspan="6">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Vendor.Title"/>
													</td>
													<td style="font-size: 1em;">
													
													
														<form:select path="titleID">
															<option value="0">
																<spring:message code="BzComposer.ComboBox.Select" />
															</option>
															<form:options items="${titleList}" itemValue="value" itemLabel="label" />
														</form:select>
													</td>
													<td colspan="10">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Vendor.Company"/>
														<span class="highlighted">*</span>
													</td>
													<td style="font-size: 1em;">
														<html:text property="cname" size="10"></html:text>
													</td>
													<td colspan="10">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.Address1"/>
														<span class="highlighted">*</span>
													</td>
													<td style="font-size: 1em;">
														<!-- <input type="text" id="address1" size="30"/> -->
														<html:text property="address1" size="30" styleId="address1"/>
													</td>
													<td colspan="10">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.Address2"/>
													</td>
													<td style="font-size: 1em;">
														<!-- <input type="text" id="address2" size="30"/> -->
														<html:text property="address2" styleId="address2" size="30"/>
													</td>
													<td colspan="10">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.City"/>
														<span class="highlighted">*</span>
													</td>
													<td style="font-size: 1em;">
														<html:text property="city"></html:text>
													</td>
													<td id="t_state" style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.State" />
														<span class="highlighted">*</span>
													</td>
													<td id="t_statedata" style="font-size: 1em;">
													</td>
													<!-- <script>
								        				document.CustomerForm.shcountry.value="239";
								        				refreshItemsNow("239");
													</script> -->
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.ZipCode"/>
														<span class="highlighted">*</span>
													</td>
													<td style="font-size: 1em;">
														<html:text onkeypress="return numbersonly(event,this.value)" property="zipCode" />
													</td>
													<td colspan="6">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.Country"/>
													</td>
													<td style="font-size: 1em;">
														<html:select property="country" onchange="refreshItemsNow(this.value);" onblur="refreshItemsNow(this.value);">
															<html:option value="0">
																<spring:message code="BzComposer.ComboBox.Select" />
															</html:option>
															<html:options collection="cList" property="value" labelProperty="label" />
														</html:select>
													</td>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.Province"/>
													</td>
													<td>
														<html:text property="province"/>
													</td>
													<td colspan="8">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.Phone"/>
													</td>
													<td>
														<html:text onkeypress="return numbersonly(event,this.value)" property="phone" />
													</td>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.Mobile"/>
														<span class="highlighted">*</span>
													</td>
													<td>
														<html:text onkeypress="return numbersonly(event,this.value)" property="cellPhone" />
													</td>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.Fax"/>
													</td>
													<td>
														<html:text property="fax" onkeypress="return numbersonly(event,this.value)" />
													</td>
													<td colspan="6">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.HomePage"/>
													</td>
													<td>
														<html:text property="homePage" />
													</td>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.Email"/>
													</td>
													<td>
														<html:text property="email" />
													</td>
													<td colspan="8">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.OppeningUnpaidBalance"/>
													</td>
													<td>
														<html:text property="openingUB" onkeypress="return numbersonly(event,this.value)" />
													</td>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.TaxID"/>
													</td>
													<td>
														<html:text property="texID" />
													</td>
													<td colspan="8">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.Type"/>
													</td>
													<td style="font-size: 1em;">
														<html:checkbox property="taxAble" styleId="taxable" value="<spring:message code='BzComposer.Customer.billVendor'/>">
															<spring:message code="BzComposer.Customer.billVendor"/>
														</html:checkbox>
														&nbsp;&nbsp;
														<html:checkbox property="purchaseVendor" styleId="purchaseVendor" value="<spring:message code='BzComposer.Customer.billVendor'/>">
															<spring:message code="BzComposer.Customer.purchaseVendor"/>
														</html:checkbox>
													</td>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.ExistingCredits"/>
													</td>
													<td>
														<html:text property="extCredit"></html:text>
													</td>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.remainingCredit"/>
													</td>
													<td>
														<html:text property="remCredit"></html:text>
													</td>
													<td colspan="6">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Report.ReservedInventoryList.Category"/>
														<span class="highlighted">*</span>
													</td>
													<td style="font-size: 1em;">
														<html:select property="categoryId">
															<html:option value="0">
																<spring:message code="BzComposer.ComboBox.Select" />
															</html:option>
															<html:options collection="AccountList" property="value" labelProperty="label"></html:options>
														</html:select>
													</td>
													<td colspan="10">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.Memo"/>
													</td>
													<td colspan="11">
														<!-- <textarea rows="4" cols="60" style="size: 1000px;"></textarea> -->
														<html:textarea rows="4" cols="60" style="size: 1000px;" property="memo" />
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<input type="checkbox" id="applyDealerPrice" value="<spring:message code="BzComposer.Customer.applyDealerPrice"/>"/>
														<spring:message code="BzComposer.Customer.applyDealerPrice"/>
													</td>
													<td style="font-size: 1em;">
														<input type="checkbox" id="isAlsoClient" value="<spring:message code="BzComposer.Vendor.isAlsoClient"/>"/>
														<spring:message code="BzComposer.Vendor.isAlsoClient"/>
													</td>
													<td style="font-size: 1em;">
														<input type="checkbox" id="taxableVendor" value="<spring:message code="BzComposer.Customer.taxableVendor"/>"/>
														<spring:message code="BzComposer.Customer.taxableVendor"/>
													</td>
													<td style="font-size: 1em;">
														<input type="checkbox" id="vendor1099" value="<spring:message code="BzComposer.Customer.vendorEligibleFor1099"/>"/>
														<spring:message code="BzComposer.Customer.vendorEligibleFor1099"/>
													</td>
													<td colspan="8">
														&nbsp;
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- general tab ends -->
									
							<!-- account tab starts -->
							<div id="account-2">
	   							<div id="content1" class="tabPage">
	   								<!-- add here the content of first tab -->
									<div id="table-negotiations">
										<table class="tabla-listados" cellspacing="0" style="font-size: 1em;">
											<thead>
												<tr>
													<th colspan="12" style="font-size:1.3em;">
														<spring:message code="BzComposer.Customer.purchasePreferenceInformation"/>
													</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Vendor.term"/>
													</td>
													<td style="font-size: 1em;">
														<html:select property="term">
															<html:option value="">
																<spring:message code="BzComposer.ComboBox.Select" />
															</html:option>
															<html:options collection="TermList" property="value" labelProperty="label" />
														</html:select>
													</td>
													<td colspan="10">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Vendor.Rep"/>
													</td>
													<td style="font-size: 1em;">
														<html:select property="rep">
															<html:option value="">
																<spring:message code="BzComposer.ComboBox.Select" />
															</html:option>
															<html:options collection="RepList" property="value" labelProperty="label" />
														</html:select>
													</td>
													<td colspan="10">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Vendor.PayMethod"/>
													</td>
													<td style="font-size: 1em;">
														<html:select property="paymentType">
															<html:option value="">
																<spring:message code="BzComposer.ComboBox.Select" />
															</html:option>
															<html:options collection="PaymentList" property="value" labelProperty="label" />
														</html:select>
													</td>
													<td colspan="10">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Vendor.ShippingVia"/>
													</td>
													<td style="font-size: 1em;">
														<html:select property="shipping">
															<html:option value="">
																<spring:message code="BzComposer.ComboBox.Select" />
															</html:option>
															<html:options collection="ShipCarrierList" property="value" labelProperty="label" />
														</html:select>
													</td>
													<td colspan="10">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Vendor.lineOfCreditTerm"/>
													</td>
													<td style="font-size: 1em;">
														<html:select property="creditTerm">
															<html:option value="">
																<spring:message code="BzComposer.ComboBox.Select" />
															</html:option>
															<html:options collection="CreditTermList" property="value" labelProperty="label" />
														</html:select>
													</td>
													<td colspan="10">
														&nbsp;
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- account tab ends -->
									
							<!-- services tab starts -->
							<div id="services-3">
	   							<div id="content1" class="tabPage">
	   								<!-- add here the content of first tab -->
									<div id="table-negotiations" style="font-size: 1em;">
										<table class="tabla-listados" cellspacing="0">
											<tbody>
												<tr>
													<td style="font-size: 1em;">
														<spring:message code="BzComposer.Customer.Service"/>
													</td>
													<td style="font-size: 1em;">
														<html:select property="defaultService">
															<html:option value="">
																<spring:message code="BzComposer.ComboBox.Select" />
															</html:option>
															<html:options collection="serviceList" property="value" labelProperty="label" />
														</html:select>
													</td>
													<td style="font-size: 1em;">
														<input type="button" id="addService" name="addService" value="Add" class="formbutton"/>
													</td>
													<td colspan="9">
														&nbsp;
													</td> 
												</tr>
												<tr>
													<td colspan="12" style="font-size: 1em;">
														<spring:message code="BzComposer.Vendor.Service.Service"/>
													</td>
												</tr>
												<tr>
													<td colspan="10">
														<table id="serviceTable" border="1">
															<thead>
																<tr>
																	<th style="font-size:1.3em;">
																		<spring:message code="BzComposer.Item.ServiceTitle"/>
																	</th>
																	<th style="font-size:1.3em;">
																		<spring:message code="BzComposer.ServiceCode"/>
																	</th>
																	<th style="font-size:1.3em;">
																		<spring:message code="BzComposer.Item.ServiceDescription"/>
																	</th>
																	<th style="font-size:1.3em;">
																		<spring:message code="BzComposer.Vendor.billingAmount"/>
																	</th>
																	<th style="font-size:1.3em;">
																		<spring:message code="BzComposer.Vendor.billingCycle"/>
																	</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																</tr>
															</tbody>
														</table>
													</td>
													<td style="font-size: 1em;">
														<input type="button" id="editService" name="editService" value="Edit" class="formbutton"/>
														<br>
														<input type="button" id="clearService" name="clearService" value="Clear" class="formbutton"/>
													</td>
													<td>
														&nbsp;
													</td>
												</tr>	
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- services tab ends -->
									
							<!-- manage multiple address tab starts  -->
							<div id="manageAddress-4">
	   							<div id="content1" class="tabPage">
	   								<!-- add here the content of first tab -->
									<div id="table-negotiations">
										<table class="tabla-listados" cellspacing="0">
											<tbody>
												<tr>
												<td>
												<div id="tabsAddress" style="height:400px;">
									  				<ul id="tabs">
						  								<li style="font-size: 1.1em;"><a href="#general-1">Billing Addresses</a></li>
													</ul>
									
													<!-- general tab starts -->
													<div id="general-1">
							   							<div id="content1" class="tabPage">
							   								<!-- add here the content of first tab -->
															<div id="table-negotiations">
																<table id="billingAddress" class="tabla-listados" cellspacing="0" style="font-size: 1em;">
																	<thead>
																		<tr>
																			<th style="font-size:1.3em;">
																				Select
																			</th>
																			<th style="font-size:1.3em;">
																				Name
																			</th>
																			<th style="font-size:1.3em;">
																				First Name
																			</th>
																			<th style="font-size:1.3em;">
																				Last Name
																			</th>
																			<th style="font-size:1.3em;">
																				Address1
																			</th>
																			<th style="font-size:1.3em;">
																				Address2
																			</th>
																			<th style="font-size:1.3em;">
																				Status
																			</th>
																		</tr>
																	</thead>
																	<tbody>
																		
																	</tbody>
																</table>
															</div>
														</div>
													</div>
													<!-- Billing Address Ends -->
												</div>
												</td>
												<td style="font-size:1em;" align="center">
													<input type="button" id="addAddress" class="formbutton" value=" Add "/>
													<!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->
													<br>
													<input type="button" class="formbutton" id="editAddress" value=" Edit "/>
													<br>
													<input type="button" class="formbutton" id="deleteAddress" value=" Delete "/>
												</td>
												</tr>
												<tr>
													<td colspan="2">&nbsp;</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- manage multiple address tab ends -->
						
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="12" align="center">
					<input type="submit" id="addSupplier" class="formbutton" value="Add New"/>
					&nbsp;&nbsp;
					<!-- <input type="button" id="close" class="formbutton" value="Close"/> -->
					<button type="button" id="close" class="formbutton" value="Close" onclick="window.close();">Close</button>
				</td>
			</tr>
		</table>
	</div>
	</td>
	</tr>
	</table>
	</div>
	</div>
	</div>
	</div>
	</div>
	<div>
		<input type="hidden" name="bst" id="bsst" value="0" /> 
		<html:hidden property="state" value="0" /> 
		<html:hidden property="bsstate" value="0" />
		<html:hidden property="shstate" value="0" />
	</div>
	</form:form>
</body>
</html>