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
<title><bean:message key="BzComposer.vendorpurchaseordertitle" /></title>
<%-- <link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> --%>
<%-- <script src="<bean:write name="path" property="pathvalue"/>/dist/js/jquery.min.js"></script>  --%>
<%-- <script src="<bean:write name="path" property="pathvalue"/>/dist/js/bootstrap.min.js"></script> --%>
</head>
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
$(function() {
    $( "#tabs" ).tabs();
    $( "#tabs1" ).tabs();
  });
$(document).ready(function()
{
	debugger
	 //request.setAttribute("sortId", sortId);
	var countryId = '<%= request.getAttribute("countryID")%>';
	var stateId = '<%=request.getAttribute("stateID")%>';
	var viaId = '<%= request.getAttribute("viaID")%>';
	var CategoryID = '<%= request.getAttribute("CategoryID")%>';
	
	var termId = '<%= request.getAttribute("termID")%>';
	var repId = '<%= request.getAttribute("repID")%>';
	var paymentMethodId = '<%= request.getAttribute("payMethodID")%>';
	var inchargeEmpId = '<%= request.getAttribute("inchargeEmpID")%>';
	
	debugger
	
	$('select[id="selectedCountryId1"]').find('option[value="'+countryId+'"]').attr("selected",true);
	$('select[id="selectedCategoryId"]').find('option[value="'+CategoryID+'"]').attr("selected",true);
	$('select[id="selectedStateId1"]').find('option[value="'+stateId+'"]').attr("selected",true);
	$('select[id="shipCarrierId"]').find('option[value="'+viaId+'"]').attr("selected",true);
	$('select[id="selectedTermId"]').find('option[value="'+termId+'"]').attr("selected",true);
	
	$('select[id="selectedSalesRepId"]').find('option[value="'+repId+'"]').attr("selected",true);
	$('select[id="selectedPaymentId"]').find('option[value="'+paymentMethodId+'"]').attr("selected",true);
	$('select[id="selectedActiveEmployeeId"]').find('option[value="'+inchargeEmpId+'"]').attr("selected",true);
	
	$('#poShowCountry').change(function()
	{
		var isChecked = "<%= request.getAttribute("showCountry")%>";
		//var isChecked = "on";
		debugger
		if($(this).prop("checked") == true)
		{

	        $("#poShowCountry").attr('checked', true);
	        debugger
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {

	        $("#poShowCountry").attr('checked', false);
	        debugger
	        isChecked = "off";
		}	
	    else
	    {

	        $("#poShowCountry").attr('checked', isChecked);
	        debugger
	    	document.configurationForm.poShowCountry.value = isChecked;
	    	debugger
	    }	
		$("#poShowCountry").val(isChecked);
	});
		
	$('#poShowTelephone').change(function()
	{
		var isChecked = "<%= request.getAttribute("showTelephone")%>";
		//var isChecked = "on";
		debugger
		if($(this).prop("checked") == true)
		{

	        $("#poShowTelephone").attr('checked', true);
	        debugger
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {

	        $("#poShowTelephone").attr('checked', false);
	        debugger
	        isChecked = "off";
		}	
	    else
	    {

	        $("#poShowTelephone").attr('checked', isChecked);
	        debugger
	    	document.configurationForm.poShowTelephone.value = isChecked;
	    	debugger
	    }	
		$("#poShowTelephone").val(isChecked);
	});
	
	$('#isPurchasePrefix').change(function()
	{
		var isChecked = "<%= request.getAttribute("purchasePrefix")%>";
		//var isChecked = "on";
		debugger
		if($(this).prop("checked") == true)
		{

	        $("#isPurchasePrefix").attr('checked', true);
	        debugger
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {

	        $("#isPurchasePrefix").attr('checked', false);
	        debugger
	        isChecked = "off";
		}	
	    else
	    {

	        $("#isPurchasePrefix").attr('checked', isChecked);
	        debugger
	    	document.configurationForm.isPurchasePrefix.value = isChecked;
	    	debugger
	    }	
		$("#isPurchasePrefix").val(isChecked);
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


function disable() 
{
	var value = document.configurationForm.selectedCountryId.value;
	/* alert("Selected Country:"+value); */
	if(value == "2")
	{
		document.configurationForm.selectedStateId.disabled=false;
	}
	else
	{
		document.configurationForm.selectedStateId.disabled=true;
	}
}

function disable1() 
{
	var value = document.configurationForm.selectedCountryId1.value;
	/* alert("Selected Country:"+value); */
	if(value == "2")
	{
		document.configurationForm.selectedStateId1.disabled=false;
	}
	else
	{
		document.configurationForm.selectedStateId1.disabled=true;
	}
}

function ShowEditFoootenote()
{
	/*if(window.showModalDialog){
		window.showModalDialog("Configuration.do?tabid=ShowEditFootnote","BizComposer - Select Footnote to be printed","dialogWidth:600px;dialogHeight:600px");
	}
	else*/
		window.open("Configuration.do?tabid=ShowEditFootnote",null,"scrollbars=yes,height=400,width=600,status=yes,toolbar=no,menubar=no,location=no,modal=yes");
}	

function clearDescription()
{
	document.getElementById("description").value = "";
}
</script>
</head>
<!-- <body onload="init1();"> -->
<body onload="init();">
<!-- begin shared/header -->
<html:form action="Configuration.do?" styleId="frmVendorPurchase"  enctype="MULTIPART/FORM-DATA" method="post">
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
		<span style="font-size:30px;cursor:pointer; margin-left: 20px;" onclick="toggleFunction()">&#9776;</span>
			<table cellspacing="0"  style="border: 0;width: 100%;overflow-y:scroll;" class="section-border">
				<tr>
					<td id="leftMenu" style="position: relative; width: 180px;">
						<table>
							<tr>
								<td>
									<%-- <%@include file="testMenu1.jsp" %> --%>
									<%@include file="menuPage.jsp" %>
									<%-- <jsp:include page="menuPage.jsp"></jsp:include> --%>
									<%-- <div id="table-negotiations" style="width: 185px;padding-left: 10px;overflow-y:auto;max-height: 497px;">
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
					<td valign="top" >

			<!-- Purchase & Vendor Starts -->
			<div id="purchase" style="display:none;padding: 0; position: relative; left: 0;">
			<table class="table-notifications" width="100%">
				<tr>
					<th colspan="4" align="left" style="font-size:12px; padding: 5px;"><bean:message
						key="BzComposer.configuration.vendor" />
					</th>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<bean:message key="BzComposer.configuration.vendorlistsortby"/> :
 					</td>
					<td style="font-size:12px;">
						<html:select property="sortBy" styleId="sortBy">
							<html:option value="1">
								<bean:message key="BzComposer.configuration.companyname"/>
							</html:option>
							<html:option value="2">
								<bean:message key="BzComposer.global.lastname"/>
							</html:option>
						</html:select>
					</td>
					<td style="font-size:12px;">
						<bean:message key="BzComposer.configuration.vendorstate"/> :
					</td>
						<td id="state" style="font-size:12px;">
							 <html:select property="selectedStateId1" styleId="selectedStateId1">
							 	<option value="0"></option>
								<logic:present name="configurationForm" property="listOfExistingState1"> 
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingState1" scope="session">
										<option value="<bean:write name='objList1' property='selectedStateId1' />"><bean:write name="objList1" property="stateName1" /></option>
									</logic:iterate>
								</logic:present> 
							</html:select>  
						</td>
				</tr>

				<tr>
					<td style="font-size:12px;"><bean:message
						key="BzComposer.configuration.vendordefaultcountry" /> :
					</td>
					<td style="font-size:12px;">
						<html:select property="selectedCountryId1" styleId="selectedCountryId1" onchange="disable1()">
							<option value="0"></option>
							<logic:present name="configurationForm" property="listOfExistingCountry1"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCountry1" scope="session">
									<option value="<bean:write name='objList1' property='selectedCountryId1' />"><bean:write name="objList1" property="countryName1" /></option>
								</logic:iterate>
							</logic:present> 
						</html:select> 
					</td>
					<td align="center" style="font-size:12px;">
						<bean:message key="BzComposer.configuration.province"/> :
					</td>
					<td style="font-size:12px;">
						<html:text property="vendorProvience" styleId="vendorProvience"></html:text>
					</td>
				</tr>
				<tr>
					<th colspan="4" align="left" style="font-size:12px; padding: 5px;"><bean:message
						key="BzComposer.configuration.purchaseorderpreference" />
					</th>
				</tr>
				<tr>
					<td style="font-size:12px;"><bean:message
						key="BzComposer.configuration.startponumber" /> :</td>
					<td style="font-size:12px;">
						<html:text property="startPONum" styleId="startPONum" size="20" maxlength="15" style="width:100;" 
						onkeypress="return numbersonly(event,this.value);" styleClass="startPONum">
					</html:text></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="font-size:12px;"><bean:message
						key="BzComposer.configuration.postyle" /> :</td>
					<td style="font-size:12px;">
					<%-- <logic:present name="InvStyle">
						
						<html:select property="poStyleID" style="width:100;">
							<html:option value="0">
								<bean:message key="BzComposer.ComboBox.Select" />
							</html:option>
							<html:options collection="InvStyle" property="value"
								labelProperty="label" />
						</html:select>
					</logic:present> --%>
					<%-- <html:select property="">
					</html:select> --%>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="font-size:12px;"><bean:message
						key="BzComposer.configuration.defaultfootnote" /> :</td>
					<td id="vdfoot" style="font-size:12px;">
					<logic:present name="Footnote">
					
						<html:select property="vendorDefaultFootnoteID" styleId="vendorDefaultFootnoteID" style="width:100;">
							<html:option value="0">
								<bean:message key="BzComposer.ComboBox.Select" />
							</html:option>
							<html:options collection="Footnote" property="value"
								labelProperty="label" />
						</html:select>
					</logic:present></td>
					<td valign="top">&nbsp; <a href="#"
						onclick="ShowEditFoootenote();"  style="font-size:12px;"> <strong> <bean:message
						key="BzComposer.configuration.editfootnotebtn" /> </strong> </a></td>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<html:checkbox property="poShowCountry" styleId="poShowCountry">
							<bean:message key="BzComposer.configuration.showcountorynameonpurchaseorder"/>
						</html:checkbox>
						 
					</td>
					<td style="font-size:12px;"> 
						<html:checkbox property="poShowTelephone" styleId="poShowTelephone">
							<bean:message key="BzComposer.configuration.showphonefaxnumberonpurchaseorder"/>
						</html:checkbox>
					</td>
					<td style="font-size:12px;">
						<html:checkbox property="isPurchasePrefix" styleId="isPurchasePrefix">
							<bean:message key="BzComposer.configuration.useprefixpo"/>
						</html:checkbox>
					</td>
				</tr>
				<tr>
					<th colspan="4" align="left" style="font-size:12px; padding: 5px;">
						<bean:message key="BzComposer.configuration.vendorpreference" />
					</th>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<bean:message key="BzComposer.configuration.shipping"/> :
					</td>
					<td style="font-size:12px;">
						<html:select property="shipCarrierId" styleId="shipCarrierId">
							<option value="0"></option>
							<logic:present name="configurationForm" property="listOfExistingShipCarrier"> 
								<logic:iterate name="configurationForm" id="objList1" property="listOfExistingShipCarrier" scope="session">
									<option value="<bean:write name='objList1' property='shipCarrierId' />">
										<bean:write name="objList1" property="shipCarrierName" />
									</option>
								</logic:iterate>
							</logic:present> 
						</html:select>
					</td>
					<td style="font-size:12px;">
						<bean:message key="BzComposer.configuration.term"/> :
					</td>
					<td style="font-size:12px;">
						<html:select property="selectedTermId" styleId="selectedTermId">
							<option value="0"></option>	
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
							<option value="0"></option>
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
					<td style="font-size:12px;">
						<bean:message key="BzComposer.configuration.defaultcategoryforaccpayable"/> :
					</td>
					<td style="font-size:12px;"> 
						<html:select property="selectedCategoryId" styleId="selectedCategoryId">
							<html:option value=""></html:option>
								<logic:present name="configurationForm" property="listOfExistingCategory"> 
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingCategory" scope="session">
										<option value="<bean:write name='objList1' property='selectedCategoryId' />"><bean:write name="objList1" property="categoryName" />&nbsp;<bean:write name="objList1" property="categoryNumber" /></option>
									</logic:iterate>
								</logic:present> 
						</html:select>
					</td>
				</tr>
				<tr>
					<th colspan="4" align="left" style="font-size:12px; padding: 5px;"><bean:message
						key="BzComposer.configuration.receiveditempreference" />
					</th>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<bean:message key="BzComposer.configuration.startrinumber"/> :
					</td>
					<td style="font-size:12px;">
						<input type="text" id="riNumber">
					</td>
				</tr>
				<tr>
					<th colspan="4" align="left" style="font-size:12px; padding: 5px;"><bean:message
						key="BzComposer.configuration.employeeinchargeofitemreceive" />
					</th>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<bean:message key="BzComposer.configuration.selectemployee"/> :
					</td>
					<td style="font-size:12px;">
						<html:select property="selectedActiveEmployeeId" styleId="selectedActiveEmployeeId">
							<html:option value=""></html:option>
								<logic:present name="configurationForm" property="listOfExistingActiveEmployee"> 
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingActiveEmployee" scope="session">
										<option value="<bean:write name='objList1' property='selectedActiveEmployeeId' />">
											<bean:write name="objList1" property="activeEmployeeName" />
										</option>
									</logic:iterate>
								</logic:present> 
						</html:select>
					</td>
				</tr>
			</table>
			</div>
			<!-- Purchase & Vendor Ends -->
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
		<input type="hidden" name="showCountry" id="showCountry" value="" />
		<input type="hidden" name="showTelephone" id="showTelephone" value="" />
		<input type="hidden" name="isPrefix" id="isPrefix" value="" />
	</div>
	</div>
	<div>
		<div align="center">
			<input type="submit" name="Submit" style="font-size:12px;" value="<bean:message key="BzComposer.global.save"/>"/>
			<input type="reset" name="Cancel" onclick="RevokeValues()" style="font-size:12px;" value="<bean:message key="BzComposer.global.cancel"/>"/>
		</div>	
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
/* function SaveValues()
{
	if(confirm('<bean:message key="BizComposer.Configuration.SaveConfirm"/>'))
	{
		debugger
		document.configurationForm.sortBy.value = document.configurationForm.sortBy.value;
		document.configurationForm.selectedCountryId1.value = document.configurationForm.selectedCountryId1.value;
		document.configurationForm.selectedStateId1.value = document.configurationForm.selectedStateId1.value;
		document.configurationForm.vendorProvience.value = document.configurationForm.vendorProvience.value;
		document.configurationForm.startPONum.value = document.configurationForm.startPONum.value; 
		document.configurationForm.vendorDefaultFootnoteID.value = document.configurationForm.vendorDefaultFootnoteID.value;
		
		document.configurationForm.shipCarrierId.value = document.configurationForm.shipCarrierId.value;
		document.configurationForm.selectedTermId.value = document.configurationForm.selectedTermId.value;
		document.configurationForm.selectedSalesRepId.value = document.configurationForm.selectedSalesRepId.value;
		/* document.configurationForm.selectedPaymentId.value = document.configurationForm.selectedPaymentId.value; */
		/*document.configurationForm.selectedCategoryId.value = document.configurationForm.selectedCategoryId.value;
		document.configurationForm.selectedActiveEmployeeId.value = document.configurationForm.selectedActiveEmployeeId.value;
		
		document.configurationForm.poShowCountry.value = $("#poShowCountry").val();
		document.configurationForm.poShowTelephone.value = $("#poShowTelephone").val();
		document.configurationForm.isPurchasePrefix.value = $("#isPurchasePrefix").val();
		
		debugger
		
		document.getElementById('showCountry').value = $("#poShowCountry").val();
		document.getElementById('showTelephone').value = $("#poShowTelephone").val();
		document.getElementById('isPrefix').value = $("#isPurchasePrefix").val();
		
		debugger
		document.getElementById('tabid').value="saveVendorPurchaseValues";
		document.forms[0].action = "Configuration.do";
		document.forms[0].submit();
	}
} */

$("#frmVendorPurchase").submit(function(event) {
    //get the action attribute from the <form action=""> element
   /*  debugger
    if(confirm('<bean:message key="BzComposer.configuration.saveconfirm"/>'))
	{
    	var $form = $( this ),
        url = "Configuration.do?tabid=saveVendorPurchaseValues";

    	//Send the data using post with element id name and name2
    	var posting = $.post( url, { showCountry: $('#poShowCountry').val(), showTelephone: $('#poShowTelephone').val(), isPrefix: $('#isPurchasePrefix').val() } );

    	//Alerts the results
    	posting.done(function( data ) {
      		alert('success');
    	});
	}
    else
    {
    	 //stop form from submitting normally
        event.preventDefault();
    } */
    debugger;
    //Vendor Section
    var sortBy =document.getElementById('sortBy').value;
    var selectedStateId1 = document.getElementById('selectedStateId1').value;
    var selectedCountryId1 =document.getElementById('selectedCountryId1').value;
    var vendorProvience = document.getElementById('vendorProvience').value;
    //Purchase Order Preference Section
    var startPONum =document.getElementById('startPONum').value;
    var vendorDefaultFootnoteID = document.getElementById('vendorDefaultFootnoteID').value;
   	//Check Box values
    var showTelephone =document.getElementById('poShowTelephone').value;
    var isPrefix =document.getElementById('isPurchasePrefix').value;
	var showCountry = document.getElementById('poShowCountry').value ;
    //Vendor Preference Section
    var shipCarrierId =document.getElementById('shipCarrierId').value;
    var selectedTermId =document.getElementById('selectedTermId').value;
    var selectedSalesRepId =document.getElementById('selectedSalesRepId').value;
    var selectedPaymentId =document.getElementById('selectedPaymentId').value;
    var selectedCategoryId =document.getElementById('selectedCategoryId').value;
    //Employee In Charge Of Item Received Itemse Section
     var selectedActiveEmployeeId =document.getElementById('selectedActiveEmployeeId').value;
    debugger;
	event.preventDefault();
	$("#showsaverecorddialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	        	"<bean:message key='BzComposer.global.ok'/>": function () {
	            	debugger;
	            	
					//$('form').submit();
					var formData = $('frmVendorPurchase').serialize();
	        		
	        		$.ajax({
	        			type : "POST",
	        			url : "Configuration.do?tabid=saveVendorPurchaseValues&sortBy="+sortBy+"&selectedStateId1="+selectedStateId1+
	        					"&selectedCountryId1="+selectedCountryId1+"&vendorProvience="+vendorProvience+"&startPONum="+startPONum+
	        					"&vendorDefaultFootnoteID="+vendorDefaultFootnoteID+"&showTelephone="+showTelephone+"&isPrefix="+isPrefix+
	        					"&showCountry="+showCountry+"&shipCarrierId="+shipCarrierId+"&selectedTermId="+selectedTermId+
	        					"&selectedSalesRepId="+selectedSalesRepId+"&selectedPaymentId="+selectedPaymentId+"&selectedActiveEmployeeId="+selectedActiveEmployeeId+"&selectedCategoryId="+selectedCategoryId,
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
	            },
	            "<bean:message key='BzComposer.global.cancel'/>": function () {
	                $(this).dialog("close");
	                /* stop form from submitting normally */
	                event.preventDefault();
	                return false;
	            }
	        }
	    });
	    return false;
    
  });
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