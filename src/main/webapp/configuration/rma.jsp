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
<title><bean:message key="BzComposer.rmapagetitle" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
  <script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<script type="text/javascript">
$(function() 
{
    $("#tabs2").tabs();
});   
$(document).ready(function(){
	var accountID = '<%= request.getAttribute("accountId")%>';
	$('select[id="selectedBankAccountId"]').find('option[value="'+accountID+'"]').attr("selected",true);
	$("#reason").val("");
	$("#parentReasonId option").prop("selected",false);
	$("#availableReasons option").prop("selected",false);
}); 
/* alert("is UPS Active:"+isUPS+"\n is USPS Active:"+isUSPS+"\n is Fedex Active:"+isFedex); */
function selectReason()
{
	$('select[id="availableReasons"]').find('option').attr("selected",false);
	debugger
	var selectedReason = $.trim($("#parentReasonId option:selected").text());
	if(selectedReason =="")
	{
		//alert("<bean:message key='BzComposer.configuration.rma.enterreason'/>");
		return rmareasondialog();
	}
	else
	{
		alert("SelectedReason:"+selectedReason);
		debugger
		var reasonSelected = $('select[id="parentReasonId"]').find('option[id="'+selectedReason+'"]').val();
		debugger	
		$('select[id="availableReasons"]').find('option[value="'+reasonSelected+'"]').attr("selected",true);
		$("#reason").val(selectedReason);
	}
}

function addNewReason()
{
	debugger
	var newReason = $("#reason").val();
	debugger
	var camelized = newReason.toLowerCase().replace(/\b[a-z]/g, function(letter) {
	    return letter.toUpperCase();
	});
	debugger
    var selectedReason = $('select[id="parentReasonId"]').find('option[id="'+camelized+'"]').attr("selected",true);
	debugger
	var isAvailable = $.trim($("#parentReasonId option:selected").text());
	debugger
	if(newReason == "")
	{
		//alert("<bean:message key='BzComposer.configuration.rma.enterreason'/>");
		return rmareasondialog();
		$("#parentReasonId option").prop("selected",false);
	}
	else
	{
		if((newReason.match("^no") || newReason.match("^No"))&&(newReason.match("reason$") || newReason.match("Reason$"))) 
		{
			//alert("<bean:message key='BzComposer.configuration.rma.entervalidreason'/>");
			return entervalidreasondialog();
			$("#parentReasonId option").prop("selected",false);
		}
		else if(camelized == isAvailable || newReason == isAvailable)
		{
			debugger
			//alert("<bean:message key='BzComposer.configuration.customerinvoice.reasonalreadyexists'/>");
			return reasonnotexistdialog();
			$("#parentReasonId option").prop("selected",false);
		}
		/* if(newReason.match("reason$") || newReason.match("Reason$")) 
		{
			alert("Please enter valid reason")
		} */
		else
		{
			var parentReasonId = $("#availableReasons option:selected").val();
			var parentReason = $("#availableReasons option:selected").text();
			alert("New Reason:"+newReason+"\nParent Reason Id:"+parentReasonId+"\nParentReason:"+parentReason);
			document.getElementById('tabid').value="addNewRMAReason";
			document.getElementById('reason').value= newReason;
			debugger
			document.getElementById('parentReasonId').value= parentReasonId;
			debugger
			document.forms[0].action = "Configuration.do";
			document.forms[0].submit();
		}
	}
	/* $("#parentReasonId option").prop("selected",false); */
	/* document.configurationForm.reason.value = document.configurationForm.reason.value;
	document.configurationForm. */
}

function updateRMAReason()
{
	//alert("inside updateRMAReason method");
	debugger
	var reason = $("#reason").val();
	debugger
	/* var camelized = reason.toLowerCase().replace(/\b[a-z]/g, function(letter) {
	    return letter.toUpperCase();
	}); */
	var isAvailable = $.trim($("#parentReasonId option:selected").text());
	debugger
	var parentReasonId = $("#availableReasons option:selected").val();
	debugger
	var reasonId = /* $("#parentReasonId option:selected").text(); */$("#parentReasonId").children(":selected").attr("value");
	debugger
	if(reason == "")
	{
		debugger
		//alert("<bean:message key='BzComposer.configuration.rma.enterreason'/>");
		return rmareasondialog();
		debugger
		$("#parentReasonId option").prop("selected",false);
	}
	/* else if(reason == camelized)
	{
		alert("Reason already exist")
	} */
	else if(isAvailable =="")
	{
		//alert("<bean:message key='BzComposer.configuration.rma.selectreasontoupdate'/>");
		return selectreasontoupdatedialog();
	}
	else 
	{
		alert("Reason:"+reason+"\nParentReasonID:"+parentReasonId);
		document.getElementById('tabid').value="updateRMAReason";
		document.getElementById('reason').value= reason;
		debugger
		document.getElementById('resonId').value = reasonId;
		debugger
		document.getElementById('parentReasonId').value= parentReasonId;
		debugger
		document.forms[0].action = "Configuration.do";
		document.forms[0].submit();
	}
}

function deleteReason()
{
	//alert("Inside deleteReason")
	var reason = $("#reason").val();
	var parentReasonId = $("#availableReasons option:selected").val();
	var parentReason = $("#availableReasons option:selected").text();
	//alert("Reason:"+reason+"\nParent Reason Id:"+parentReasonId+"\nParentReason:"+parentReason);
	/* if(confirm("<bean:message key='BzComposer.configuration.rma.deleteselectedrecord'/>"))
	{
		//alert("Redirectd to delete page code");
		document.getElementById('tabid').value="deleteRMAReason";
		document.getElementById('reason').value= reason;
		document.getElementById('parentReasonId').value= parentReasonId;
		debugger
		document.forms[0].action = "Configuration.do";
		document.forms[0].submit();
		
	}
	else
	{
		//alert("<bean:message key='BzComposer.configuration.rma.recordwillnotdeleted'/>");
		return recordnotdeleteddialog();
	} */
	debugger;
	event.preventDefault();
	$("#deleteselectedrecorddialg").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	        	"<bean:message key='BzComposer.global.ok'/>": function () {
	            	debugger;
	            	document.getElementById('tabid').value="deleteRMAReason";
	        		document.getElementById('reason').value= reason;
	        		document.getElementById('parentReasonId').value= parentReasonId;
	        		debugger
	        		document.forms[0].action = "Configuration.do";
	        		document.forms[0].submit();
					//$('form').submit();
	            },
	            "<bean:message key='BzComposer.global.cancel'/>": function () {
	                $(this).dialog("close");
	                return recordnotdeleteddialog();
	                return false;
	            }
	        }
	    });
	    return false;
} 
function clearValues()
{
	debugger
	$("#reason").val("");
	$("#parentReasonId option").prop("selected",false);
	$("#availableReasons option").prop("selected",false);
	//$('select[id="parentReasonId"]').find('option').prop("selected",false);
	debugger
}

/* function showSelectedAccount()
{
	var accountId = $("#selectedBankAccountId option:selected").val();
	var bank = $("#selectedBankAccountId option:selected").text();
	alert("SelectedBankAccountId:"+accountId+"\nSelected Bank:"+bank);	
} */
</script>
</head>
<!-- <body onload="init2();"> -->
<body onload="init();">
<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post">

<div id="ddcolortabsline">&nbsp;</div>
<div id="cos"></div>
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
								<%-- <%@include file="testMenu2.jsp" %> --%>
								<%@include file="menuPage.jsp" %>
								<%-- <div id="table-negotiations" style="width: 185px;padding-left: 10px;overflow-y:auto;max-height: 497px;">
									<%@include file="testMenu2.jsp" %>
								</div> --%>
							</td>
						</tr>
						<%-- <tr align="center">
							<td>
								<input type="button" name="Revoke" class="formButton" onclick="RevokeValues();" value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
								<input type="button" name="Save" class="formButton" onclick="SaveValues();" value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr> --%>
					</table>
				</td>
				<td valign="top" style="padding-top: 2%;padding-right: 4%;">
					<!-- RMA Starts -->
			<div id="rma" style="display:none;">
				<div id="tabs2" style="height:450px;">
  					<ul>
    					<li style="font-size: 1.2em;"><a href="#addModifyReason">
    						<bean:message key="BzComposer.configuration.addmodifyreason" /></a>
   						</li>
    					<li style="font-size: 1.2em;"><a href="#chargeForRMAItem" style="display:none;">
    						<bean:message key="BzComposer.configuration.chargeforrma" /></a>
   						</li>
  					</ul>
  					<div id="addModifyReason">
						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="2" align="left" style="font-size: 1.2em;">
									<b><bean:message key="BzComposer.configuration.addmodifyreason" /></b>
								</th>
							</tr>
							<tr>
								<td style="font-size: 1em;">
									<bean:message key="BzComposer.configuration.addReason"/> :
								</td>
								<td style="font-size: 1em;">
									<html:text property="reason" styleId="reason"></html:text> 
								</td>
							</tr>
							<tr>
								<td style="font-size: 1em;">
									<bean:message key="BzComposer.configuration.type"/> :
								</td>
								<td style="font-size: 1em;">
									<html:select property="reasonTypeId" styleId="availableReasons">
										<logic:present name="configurationForm" property="listOfExistingReasonType"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingReasonType" scope="session">
												<option value="<bean:write name='objList1' property='reasonTypeId' />"><bean:write name="objList1" property="reasonType" /></option>
											</logic:iterate>
										</logic:present>
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									<html:select property="parentReasonId"  styleId="parentReasonId" multiple="multiple" style="height:100px;" onchange="selectReason()">
										<logic:present name="configurationForm" property="listOfExistingMasterReasonType"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingMasterReasonType" scope="session">
												<option name="<bean:write name='objList1' property='reason' />" id="<bean:write name="objList1" property="parentReasonId" />" value="<bean:write name='objList1' property='reasonId' />">
													<bean:write name="objList1" property="reason" />
												</option>
												<option id="<bean:write name="objList1" property="reason" />" value="<bean:write name='objList1' property='parentReasonId' />" style="display: none;">
													<bean:write name="objList1" property="reasonType" />
												</option>
											</logic:iterate>
										</logic:present>
									</html:select>
								</td>
								<td style="font-size: 1em;">
									<%-- <html:button property="Save" style="width:60px;class:formButton;">Add</html:button> --%>
									<input type="Submit" class="formButton" id="Save" name="Save" 
									value="<bean:message key='BzComposer.global.save'/>" style="width:70px;font-size:1em;" onclick="addNewReason()">
									<br>
									<%-- <html:button property="Save" style="width:60px;">Update</html:button> --%>
									<input type="Submit" class="formButton" id="Update" name="Update" 
									value="<bean:message key='BzComposer.global.update'/>" style="width:70px;font-size:1em;" onclick="updateRMAReason()">
									<br>
									<%-- <html:button property="Delete" style="width:60px;">Delete</html:button> --%>
									<input type="Submit" class="formButton" id="Delete" name="Delete" 
									value="<bean:message key='BzComposer.global.delete'/>" style="width:70px;font-size:1em;" onclick="deleteReason()">
									<br>
									<%-- <html:button property="reset" style="width:60px;">Clear</html:button> --%>
									<input type="button" class="formButton" id="Clear" name="Clear" 
									value="<bean:message key='BzComposer.global.clear'/>" style="width:70px;font-size:1em;" onclick="clearValues()"> 
								</td>
							</tr>
						</table>
						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="2" align="left" style="font-size: 1.2em;">
									<b><bean:message key="BzComposer.configuration.defaultbankforaction" /></b>
								</th>
							</tr>
							<tr>
								<td style="font-size: 1em;">
									<bean:message key="BzComposer.configuration.defaultbank"/>:
								</td>
								<td style="font-size: 1em;">
									<%-- <html:select property="selectedBankAccountId" styleId="selectedBankAccountId" onchange="showSelectedAccount()">> --%>
									<html:select property="selectedBankAccountId" styleId="selectedBankAccountId">
										<logic:present name="configurationForm" property="listOfExistingBankAccount"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingBankAccount" scope="session">
												<option value="<bean:write name='objList1' property='selectedBankAccountId' />"><bean:write name="objList1" property="selectedAccountName" /></option>
											</logic:iterate>
										</logic:present> 
									</html:select> 
								</td>
							</tr>
						</table>
					</div>
					<div id="chargeForRMAItem" style="display:none;">
						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="2" align="left" style="font-size: 1.2em;">
									<b><bean:message key="BzComposer.configuration.chargeforrma" /></b>
								</th>
							</tr>
							<tr>
								<td style="font-size: 1em;">
									<bean:message key="BzComposer.configuration.chargeforrmaitem"/> :
								</td>
								<td>
									<%-- <html:text property=""></html:text> --%>
								</td>
							</tr>
						</table>
					</div>
					</div>
				</div>
			<!-- RMA Ends -->
			</td>
		</tr>
	</table>
	<div><html:hidden property="fileName" /></div>
	<div>
		<input type="hidden" name="tabid" id="tabid" value="" />
		<input type="hidden" name="reason" id="reason" value=""/>
		<input type="hidden" name="resonId" id="resonId" value=""/>
		<input type="hidden" name="parentReasonId" id="parentReasonId" value=""/>
	</div>
	</div>
	<div align="center">
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
	
		document.configurationForm.selectedBankAccountId.value = document.configurationForm.selectedBankAccountId.value;
		var bank = $("#selectedBankAccountId option:selected").text();
		alert("Selected BankAccount Number:"+document.configurationForm.selectedBankAccountId.value+"\nBank:"+bank);
		
		document.getElementById('tabid').value="SaveDefaultBank";
		document.forms[0].action = "Configuration.do";
		document.forms[0].submit();
	} */
	
	debugger;
	event.preventDefault();
	$("#saverecorddialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	        	"<bean:message key='BzComposer.global.ok'/>": function () {
	            	debugger;
	            	document.configurationForm.selectedBankAccountId.value = document.configurationForm.selectedBankAccountId.value;
	        		var bank = $("#selectedBankAccountId option:selected").text();
	        		
	        		document.getElementById('tabid').value="SaveDefaultBank";
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
function rmareasondialog()
{
	event.preventDefault();
	$("#rmareasondialog").dialog({
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
function entervalidreasondialog()
{
	event.preventDefault();
	$("#entervalidreasondialog").dialog({
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
function reasonnotexistdialog()
{
	event.preventDefault();
	$("#reasonnotexistdialog").dialog({
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
function selectreasontoupdatedialog()
{
	event.preventDefault();
	$("#selectreasontoupdatedialog").dialog({
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
function recordnotdeleteddialog()
{
	event.preventDefault();
	$("#recordnotdeleteddialog").dialog({
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
</script>
</html>
<!-- Dialog box used in this page -->
<div id="rmareasondialog" style="display:none;">
	<p><bean:message key='BzComposer.configuration.rma.enterreason'/></p>
</div>
<div id="entervalidreasondialog" style="display:none;">
	<p><bean:message key='BzComposer.configuration.rma.entervalidreason'/></p>
</div>
<div id="reasonnotexistdialog" style="display:none;">
	<p><bean:message key='BzComposer.configuration.rma.entervalidreason'/></p>
</div>
<div id="selectreasontoupdatedialog" style="display:none;">
	<p><bean:message key='BzComposer.configuration.rma.selectreasontoupdate'/></p>
</div>
<div id="recordnotdeleteddialog" style="display:none;">
	<p><bean:message key='BzComposer.configuration.rma.recordwillnotdeleted'/></p>
</div>
<div id="saverecorddialog" style="display:none;">
	<p><bean:message key="BzComposer.configuration.saveconfirm"/></p>
</div>
<div id="deleteselectedrecorddialg" style="display:none;">
	<p><bean:message key="BzComposer.configuration.rma.deleteselectedrecord"/></p>
</div>