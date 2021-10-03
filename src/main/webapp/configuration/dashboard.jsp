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
<title><bean:message key="BzComposer.dashboardtitle" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script type="text/javascript">
$(document).ready(function()
{
	//var isChecked = "off";
	var isSOBChecked = "<%= request.getAttribute("isSOBChecked")%>";
	var isISBChecked = "<%= request.getAttribute("isISBChecked")%>";
	var isIRBChecked = "<%= request.getAttribute("isIRBChecked")%>";
	var isPOBChecked = "<%= request.getAttribute("isPOBChecked")%>";
	
	$('#salesOrderBoard').change(function()
	{
		var isChecked = isSOBChecked;
		debugger
		if($(this).prop("checked") == true)
		{
			//alert("salesOrderBoard is checked.");
	        $("#salesOrderBoard").attr('checked', true);
	        debugger
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {
			//alert("salesOrderBoard is unchecked.");
	        $("#salesOrderBoard").attr('checked', false);
	        debugger
	        isChecked = "off";
		}	
	    else
	    {
	    	//alert("salesOrderBoard is unchecked.");
	        $("#salesOrderBoard").attr('checked', isChecked);
	       /*  debugger
	    	document.configurationForm.salesOrderBoard.value = isChecked; */
	    	debugger
	    }	
		debugger
		document.configurationForm.salesOrderBoard.value = isChecked;
		$("#salesOrderBoard").val(isChecked);
	});
	$('#itemReceivedBoard').change(function()
	{
		
		var isChecked = isIRBChecked;
		debugger
		if($(this).prop("checked") == true)
		{
			//alert("itemReceivedBoard is checked.");
	        $("#itemReceivedBoard").attr('checked', true);
	        debugger
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {
			//alert("itemReceivedBoard is unchecked.");
	        $("#itemReceivedBoard").attr('checked', false);
	        debugger
	        isChecked = "off";
		}	
	    else
	    {
	    	//alert("itemReceivedBoard is unchecked.");
	        $("#itemReceivedBoard").attr('checked', isChecked);
	       /*  debugger
	    	document.configurationForm.itemReceivedBoard.value = isChecked; */
	    	debugger
	    }	
		debugger
    	document.configurationForm.itemReceivedBoard.value = isChecked;
		$("#itemReceivedBoard").val(isChecked);
	});
	$('#poboard').change(function()
	{
		var isChecked = isPOBChecked;
		
		debugger
		if($(this).prop("checked") == true)
		{
			//alert("poboard is checked.");
	        $("#poboard").attr('checked', true);
	        debugger
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {
			//alert("poboard is unchecked.");
	        $("#poboard").attr('checked', false);
	        debugger
	        isChecked = "off";
		}	
	    else
	    {
	    	//alert("poboard is unchecked.");
	        $("#poboard").attr('checked', isChecked);
	        /* debugger
	    	document.configurationForm.poboard.value = isChecked; */
	    	debugger
	    }	
		debugger
    	document.configurationForm.poboard.value = isChecked;
		$("#poboard").val(isChecked);
	});
	$('#itemShippedBoard').change(function()
	{
		var isChecked = isISBChecked;
		
		debugger
		if($(this).prop("checked") == true)
		{
			//alert("itemShippedBoard is checked.");
	        $("#itemShippedBoard").attr('checked', true);
	        debugger
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {
			//alert("itemShippedBoard is unchecked.");
	        $("#itemShippedBoard").attr('checked', false);
	        debugger
	        isChecked = "off";
		}	
	    else
	    {
	    	//alert("itemShippedBoard is unchecked.");
	        $("#itemShippedBoard").attr('checked', isChecked);
	       /*  debugger
	    	document.configurationForm.itemShippedBoard.value = isChecked; */
	    	debugger
	    }	
		debugger
    	document.configurationForm.itemShippedBoard.value = isChecked;
		$("#itemShippedBoard").val(isChecked);
	});
});
</script>
</head>
<!-- <body onload="init4();"> -->
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
						<input type="hidden" id='<bean:write name="index" />lid' name='<bean:write name="index" />lidname'
						value='<bean:write name="lbl" property="value" />' />
						<input type="hidden" id='<bean:write name="index" />lname' name='<bean:write name="index" />lnm'
						value='<bean:write name="lbl" property="label" />' />
					</logic:iterate>
		</logic:present>
	</div>
	<div id="table-negotiations">
		<table cellspacing="0"  style="width: 100%;overflow-y:scroll;" class="section-border">
			<tr>
				<td valign="top"  style="width: 20%;">
					<table>
						<tr>
							<td>
								<%-- <%@include file="testMenu4.jsp" %> --%>
								<%@include file="menuPage.jsp" %>
								<%-- <div id="table-negotiations"
								style="width: 185px;padding-left: 10px;overflow-y:auto;max-height: 497px;">
								<%@include file="testMenu4.jsp" %>
								</div> --%>
							</td>
						</tr>
					<%-- <tr align="center">
							<td>
								<input type="button" name="Revoke" class="formButton" onclick="RevokeValues();"
								value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
								<input type="button" name="Save" class="formButton" onclick="SaveValues();"
								value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr> --%>
					</table>
				</td>
				<td valign="top" style="padding-top: 2%;padding-right: 4%;">
					<!-- Dashboard Starts -->
		 			<div id="dashboard" style="display:none;">
						<table class="table-notifications">
							<tr>
								<th align="left" colspan="2" style="font-size: 1.2em;">
									<bean:message key="BzComposer.configuration.defaultdashboardsetting" />
								</th>
							</tr>
							<tr>
								<td align="left" style="font-size: 1em;">
									<bean:message key="BzComposer.configuration.defaultcustomdashboard" />
								</td>
							</tr>
							<tr>
								<td align="left" style="font-size: 1em;">
									<html:checkbox property="salesOrderBoard" styleId="salesOrderBoard">
										<bean:message key="Bzcomposer.configuration.purchase" />
									</html:checkbox>
									&nbsp;&nbsp;&nbsp;
									<html:checkbox property="itemReceivedBoard" styleId="itemReceivedBoard">
										<bean:message key="Bzcomposer.configuration.sales" />
									</html:checkbox>
								</td>
							</tr>
							<tr>
								<td align="left" style="font-size: 1em;">
									<html:checkbox property="poboard" styleId="poboard">
										<bean:message key="Bzcomposer.configuration.invoice" />
									</html:checkbox>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<html:checkbox property="itemShippedBoard" styleId="itemShippedBoard">
										<bean:message key="Bzcomposer.configuration.estimate" />
									</html:checkbox>
								</td>
							</tr>
						</table>
					</div>
					<!-- Dashboard Ends -->
				</td>
			</tr>
		</table>
		<div>
			<input type="hidden" name="tabid" id="tabid" value="" />
			<input type="hidden" name="salesOrderBoard" value=""/>
			<input type="hidden" name="itemReceivedBoard" value=""/>
			<input type="hidden" name="itemShippedBoard" value=""/>
			<input type="hidden" name="poboard" value=""/>
		</div>
	</div>
	<div align="center">
		<%-- <html:button property="save" style="font-size: 1em;">Save</html:button>
		<html:cancel style="font-size: 1em;">Cancel</html:cancel> --%>
		<input type="Submit" name="Submit" onclick="SaveValues()" style="font-size:1em;" value="<bean:message key="BzComposer.global.save"/>"/>
		<input type="reset" name="Cancel" onclick="RevokeValues()" style="font-size:1em;" value="<bean:message key="BzComposer.global.cancel"/>"/>
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
function SaveValues()
{
	/* if(confirm('<bean:message key="BzComposer.configuration.saveconfirm"/>'))
	{
		debugger;
		document.configurationForm.salesOrderBoard.value = document.configurationForm.salesOrderBoard.value;
		document.configurationForm.itemReceivedBoard.value = document.configurationForm.itemReceivedBoard.value;
		document.configurationForm.poboard.value = document.configurationForm.poboard.value;
		document.configurationForm.itemShippedBoard.value = document.configurationForm.itemShippedBoard.value;
		
		var salesOrderBoard = $("#salesOrderBoard").val();
		var itemReceivedBoard = $("#itemReceivedBoard").val();
		var poboard = $("#poboard").val();
		var itemShippedBoard = $("#itemShippedBoard").val();
		
		document.getElementById('salesOrderBoard').value = salesOrderBoard;
		document.getElementById('itemReceivedBoard').value = itemReceivedBoard;
		document.getElementById('itemShippedBoard').value = itemShippedBoard;
		document.getElementById('poboard').value = poboard;
		
		document.getElementById('tabid').value="SaveDashboardSetting";
		document.forms[0].action = "Configuration.do";
		document.forms[0].submit();
	} */
	
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
	            	document.configurationForm.salesOrderBoard.value = document.configurationForm.salesOrderBoard.value;
	        		document.configurationForm.itemReceivedBoard.value = document.configurationForm.itemReceivedBoard.value;
	        		document.configurationForm.poboard.value = document.configurationForm.poboard.value;
	        		document.configurationForm.itemShippedBoard.value = document.configurationForm.itemShippedBoard.value;
	        		
	        		var salesOrderBoard = $("#salesOrderBoard").val();
	        		var itemReceivedBoard = $("#itemReceivedBoard").val();
	        		var poboard = $("#poboard").val();
	        		var itemShippedBoard = $("#itemShippedBoard").val();
	        		
	        		document.getElementById('salesOrderBoard').value = salesOrderBoard;
	        		document.getElementById('itemReceivedBoard').value = itemReceivedBoard;
	        		document.getElementById('itemShippedBoard').value = itemShippedBoard;
	        		document.getElementById('poboard').value = poboard;
	        		
	        		document.getElementById('tabid').value="SaveDashboardSetting";
	        		document.forms[0].action = "Configuration.do";
	        		document.forms[0].submit();
					//$('form').submit();
	            },
	            "<bean:message key='BzComposer.global.cancel'/>": function () {
	                $(this).dialog("close");
	                return false;
	            }
	        }
	    });
	    return false;
}
</script>
</html>
<!-- Dialog box used in this page -->
<div id="showsaverecorddialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.saveconfirm"/></p>
</div>