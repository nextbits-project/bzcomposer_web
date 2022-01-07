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
<title><bean:message key="BzComposer.billingtitle" /></title>
<script type="text/javascript" src="<bean:write name="path" property="pathvalue"/>/dist/js/custom.js"></script>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<!-- Remember to include jQuery :) -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>  -->

<!-- jQuery Modal -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->

 <style type="text/css">
 /* * {
  padding: 0;
  margin: 5px;
  text-align: center;
} */
.modal {
  display: none; /* Hidden by default */
}
</style>

<script type="text/javascript">
$(function() {
    $( "#tabs" ).tabs();
    $( "#tabs1" ).tabs();
    $( "#tabs2" ).tabs();
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
	var oEmail = null;
	var oT = null;
	var nm="";
	var r = null;

	function TestConnection(){
		d = new Date();
		var host = document.configurationForm.mailServer.value;
		oEmail = c(CheckEmailConnection);
		oGET(oEmail,'<bean:write name="path" property="pathvalue"/>/include/testMailServerConnection.jsp?HostName='+host+'&Date='+d);
	}
	
	/* Commented to prevent general alert on 24-11-2019 
	function getData()
	{
		alert("Inside getData")
	} */
	
	function checkRecords()
	{
		var size = $("#selectedUser option").length;
		if(size>=4)
		{

			alert("<bean:message key='BzComposer.configuration.networksecurity.maxnumberofuser'/>");
		}
		else
		{
			window.open("Configuration.do?tabid=addNewUser",null,"scrollbars=yes,height=300,width=700,status=yes,toolbar=no,menubar=no,location=no" );
		}
	}
	function showInActive()
	{
		var uId = $("#selectedGroupStatus option:selected").val();
		$('select[id="selectedGroupStatus"]').find('option[id="'+uId+'"]').attr("hidden",false);
	}
	
	function addNewGroup()
	{
		window.open("Configuration.do?tabid=addNewGroup",null,"scrollbars=yes,height=800,width=1200,status=yes,toolbar=no,menubar=no,location=no" );
		/*var left = (screen.width/2)-(w/2);
		var top = (screen.height/2)-(h/2);
		window.open("Configuration.do?tabid=addNewGroup",null, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);*/
	}
	
	function hideInActive()
	{
		var uId = $("#selectedGroupStatus option:selected").val();
		$('select[id="selectedGroupStatus"]').find('option[id="'+uId+'"]').attr("hidden",true);
	}
	
	function selectUserData()
	{
		$('select[id="selectedPassword"]').find('option').attr("selected",false);
		$('select[id="selectedGroup"]').find('option').attr("selected",false);
		$('select[id="selectedStatus"]').find('option').attr("selected",false);
		var user = $.trim($("#selectedUser option:selected").text());
		$('select[id="selectedPassword"]').find('option[id="'+user+'"]').attr("selected",true);
		$('select[id="selectedGroup"]').find('option[id="'+user+'"]').attr("selected",true);
		$('select[id="selectedStatus"]').find('option[id="'+user+'"]').attr("selected",true);

	}
	
</script>
<script type="text/javascript">
     $(document).ready(function()
    {
    	document.configurationForm.printBills.value = '<%= request.getAttribute("pbValue")%>';
		document.configurationForm.mailToCustomer.value = '<%= request.getAttribute("mcValue")%>';
    	document.configurationForm.showCombinedBilling.value = '<%= request.getAttribute("showCmbValue")%>';
    	 
    	var template = '<%= request.getAttribute("billingTemplateID")%>';
    	 
    	$('select[id="showBillingStatStyle"]').find('option[value="'+template+'"]').attr("selected",true);
    	 
    	 $("#showCombinedBilling").change(function(){
        	var isChecked = "on";
        	if($(this).prop("checked") == true){

                $("#showCombinedBilling").attr('checked', true);
                isChecked = "on"; 
            }
            else if($(this).prop("checked") == false){

                $("#showCombinedBilling").attr('checked', false);
                isChecked = "off";
            }	
            else
            {

                $("#showCombinedBilling").attr('checked', true);
                document.configurationForm.showCombinedBilling.value = isChecked;
            }	
        	$("#showCombinedBilling").val(isChecked);
        });
    	 
        $('#printBills').change(function(){
        	var isChecked = "on";
        	if($(this).prop("checked") == true){

                $("#printBills").attr('checked', true);
                isChecked = "on"; 
            }
            else if($(this).prop("checked") == false){

                $("#printBills").attr('checked', false);
                isChecked = "off";
            }	
            else
            {

                $("#printBills").attr('checked', true);
                document.configurationForm.printBills.value = isChecked;
            }
        	$("#printBills").val(isChecked);
        });
        
        $('#mailToCustomer').change(function(){
        	var isChecked = "on";
            if($(this).prop("checked") == true){

                $("#mailToCustomer").attr('checked', true);
                isChecked = "on";
            }
            else if($(this).prop("checked") == false){

                $("#mailToCustomer").attr('checked', false);
                isChecked = "off";
            }
            else
            {
            	alert("mailToCustomer is unchecked.");
                $("#mailToCustomer").attr('checked', true);
                document.configurationForm.mailToCustomer.value = isChecked;
            }
            $("#mailToCustomer").val(isChecked);
        });
    });
</script>
</head>
<body onload="init();">
<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post">

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
			<input type="hidden" id='<bean:write name="index" />lid'
				name='<bean:write name="index" />lidname'
				value='<bean:write name="lbl" property="value" />' />
			<input type="hidden" id='<bean:write name="index" />lname'
				name='<bean:write name="index" />lnm'
				value='<bean:write name="lbl" property="label" />' />
		</logic:iterate>
	</logic:present></div>
	<div id="table-negotiations">
	<table cellspacing="0"  style="width: 100%;overflow-y:scroll;" class="section-border">
		<tr>
			<td valign="top"  style="width: 20%;">
			<table>
				<tr>
					<td>
						<%-- <%@include file="testMenu.jsp" %> --%>
						<%@include file="menuPage.jsp" %>
					<%-- <div id="table-negotiations"
						style="width: 185px;padding-left: 10px;overflow-y:auto;max-height: 497px;">
					<%@include file="testMenu.jsp" %>
					</div> --%>
					</td>
				</tr>
				<%-- <tr align="center">
					<td><input type="button" name="Revoke" class="formButton"
						onclick="RevokeValues();"
						value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
					<input type="button" name="Save" class="formButton"
						onclick="SaveValues();"
						value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr> --%>
			</table>
			</td>

			<td valign="top" style="padding-top: 2%;padding-right: 4%;">
			<!-- Billing Starts  -->
			<div>
				<html:errors/>
			</div>
			<br>
			<div id="billing" style="display:none;">
				<table class="table-notifications" width="80%">
					<tr>
						<th colspan="2" align="left" style="font-size:1.2em;"><bean:message key="BzComposer.configuration.invoiceprefrence" /></th>
					</tr>
					<tr>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.configuration.startbillinginvoicenumber"/>:
						</td>
						<td colspan="2" align="center" style="font-size:1em;">
							<html:text property="startingBillNumber"></html:text>
						</td>
					</tr>
					<tr>
						<th colspan="2" align="left" style="font-size:1.2em;"><bean:message key="BzComposer.configuration.billingstatementpreference" /></th>
					</tr>
					<tr>
						<td colspan="2" style="font-size:1em;">
							<html:checkbox property="showCombinedBilling" styleId="showCombinedBilling">
								<bean:message key="BzComposer.configuration.showbillingstatement"/>
							</html:checkbox>
						</td>
					</tr>
					<tr>
						<td style="font-size:1em;">
							<bean:message key="BzComposer.configuration.defaultbillingtemplateforprint"/>
						</td>
						<td colspan="2" align="center" style="font-size:1em;">
							<%-- <html:select property="showBillingStatStyle" styleId="showBillingStatStyle">
								<logic:present name="configurationForm" property="listOfExistingBillingType"> 
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingBillingType" scope="session">
										<option value="<bean:write name='objList1' property='showBillingStatStyle' />">
											<bean:write name="objList1" property="billingTypeName" />
										</option>
									</logic:iterate>
								</logic:present> 
							</html:select> --%>
							<html:select property="showBillingStatStyle" styleId="showBillingStatStyle">
								<logic:present name="configurationForm" property="listOfExistingBillingType"> 
									<logic:iterate name="configurationForm" id="objList1" property="listOfExistingBillingType" scope="session">
										<option value="<bean:write name='objList1' property='showBillingStatStyle' />">
											<bean:write name="objList1" property="billingTypeName" />
										</option>
									</logic:iterate>
								</logic:present> 
							</html:select>
						</td>
					</tr>
					<tr>
						<td style="font-size:1em;">
							<%-- <input type="checkbox" id="mailToCustomer" name="mailToCustomer">
							<bean:message key="Bizcomposer.emailToCustomers"/>&nbsp;&nbsp; --%>
							<html:checkbox property="mailToCustomer" styleId="mailToCustomer">
								<bean:message key="BzComposer.configuration.emailtocustomers"/>
							</html:checkbox>
							&nbsp;&nbsp;
							<%-- <input type="checkbox" id="printBills" name="printBills">
							<bean:message key="Bizcomposer.printBills"/> --%>
							<html:checkbox property="printBills" styleId="printBills">
								<bean:message key="BzComposer.configuration.printbills"/>
							</html:checkbox>
						</td>
					</tr>
				</table>
			</div>
			<!-- Billing Ends -->
				</td>
			</tr>
	</table>
	<div>
		<html:hidden property="empStateID" />
		<html:hidden property="labelName" /> <html:hidden property="fileName" />
	 </div>
	<div>
		<input type="hidden" name="tabid" id="tabid" value="" />
		<input type="hidden" name="printBillsValue" id="printBillsValue" value="" />
		<input type="hidden" name="mailToCust" id="mailToCust" value="" />
		<input type="hidden" name="showCmbBilling" id="showCmbBilling" value="" />
	</div>
	</div>
	<div>
		<center>
		<%-- <html:button property="save" onclick="SaveValues()" style="font-size:1em;">Save</html:button>
		<html:cancel style="font-size:1em;">Cancel</html:cancel></center> --%>
		<input type="Submit" name="Submit" onclick="SaveValues()" style="font-size:1em;" value="<bean:message key="BzComposer.global.save"/>"/>
		<input type="reset" name="Cancel" onclick="RevokeValues()" style="font-size:1em;" value="<bean:message key="BzComposer.global.cancel"/>"/>
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
	
		document.configurationForm.startingBillNumber.value = document.configurationForm.startingBillNumber.value;

		
		document.configurationForm.showCombinedBilling.value = document.configurationForm.showCombinedBilling.value;
		
		document.configurationForm.showBillingStatStyle.value =  document.configurationForm.showBillingStatStyle.value;
		var selectedBillingType = $.trim($("#selectedBillingTypeId option:selected").text());

		
		document.configurationForm.mailToCustomer.value = document.configurationForm.mailToCustomer.value;
		
		document.configurationForm.printBills.value = document.configurationForm.printBills.value;
		

		//"\nIsPrinted Value:"+document.configurationForm.printBills.value+
		//"\nIsEmailed Value:"+document.configurationForm.mailToCustomer.value);
		
		
		var printBill = $("#printBills").val();
		var mailCustomer = $("#mailToCustomer").val();
		var combinedBilling = $("#showCombinedBilling").val();
		
		document.getElementById('printBillsValue').value= printBill;
		document.getElementById("mailToCust").value = mailCustomer;
		document.getElementById("showCmbBilling").value = combinedBilling;
		
		document.getElementById('tabid').value="SaveConfigurationBilling";
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
	            	debugger;
	            	
	            	var selectedBillingType = $.trim($("#selectedBillingTypeId option:selected").text());
	        		var printBill = $("#printBills").val();
	        		var mailCustomer = $("#mailToCustomer").val();
	        		var combinedBilling = $("#showCombinedBilling").val();
	            	
	            	document.configurationForm.startingBillNumber.value = document.configurationForm.startingBillNumber.value;
	        		document.configurationForm.showCombinedBilling.value = document.configurationForm.showCombinedBilling.value;
	        		document.configurationForm.showBillingStatStyle.value =  document.configurationForm.showBillingStatStyle.value;
	        		
	        		document.configurationForm.mailToCustomer.value = document.configurationForm.mailToCustomer.value;
	        		document.configurationForm.printBills.value = document.configurationForm.printBills.value;
	        		
	        		document.getElementById('printBillsValue').value= printBill;
	        		document.getElementById("mailToCust").value = mailCustomer;
	        		document.getElementById("showCmbBilling").value = combinedBilling;
	        		
	        		document.getElementById('tabid').value="SaveConfigurationBilling";
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

function RevokeValues(){
	document.getElementById('tid').value="config";
	document.forms[0].action = "Configuration.do";
	document.forms[0].submit();
}

function SetLabelName(lblid){
	size = document.getElementById('lblsize').value;
	for(cnt=0;cnt<size;cnt++){
		lid = document.getElementById(cnt+'lid').value;
		if(lblid == lid){
			document.configurationForm.labelName.value =  document.getElementById(cnt+'lname').value;
			break;
		}
	}
}

/* function printBill(form)
{
	var 
	if(form.printBills.checked==true)
	{
		debugger
		form.printBills.value="on";
		alert("printBills:on");
		debugger
	}
	else
	{
		debugger
		form.printBills.value="off";
		alert("printBills:off");
		debugger
	}
}

function mailToCust(form)
{
	if(form.mailToCustomer.checked==true)
	{
		debugger
		form.mailToCustomer.value="on";
		alert("mailToCustomer:on");
		debugger
	}
	else
	{
		debugger
		form.mailToCustomer.value="off";
		alert("mailToCustomer:off");
		debugger
	}
}
  */
/* Commented to prevent general alert on 24-11-2019 
function ChangePassword()
{
	alert("Inside password Method");
} */ 
</script>
</html>
<!-- Dialog box used in this page -->
<div id="showsaverecorddialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.saveconfirm"/></p>
</div>