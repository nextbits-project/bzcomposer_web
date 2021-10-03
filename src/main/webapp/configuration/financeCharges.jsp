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
<title><bean:message key="BzComposer.financechargetitle" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script type="text/javascript">
$(document).ready(function()
{
	/* $("#annualInterestRate").val("0.0");
	$("#minCharge").val("0.0");
	$("#gracePeriod").val("0"); */
		
	//alert("Inside ready function");
	debugger
	$('#assessFinanceCharge').change(function()
	{
		var isChecked = "<%= request.getAttribute("isChecked")%>";
		debugger
		if($(this).prop("checked") == true)
		{
			//alert("assessFinanceCharge is checked.");
	        $("#assessFinanceCharge").attr('checked', true);
	        debugger
	        isChecked = "on"; 
		}
	    else if($(this).prop("checked") == false)
	    {
			//alert("assessFinanceCharge is unchecked.");
	        $("#assessFinanceCharge").attr('checked', false);
	        debugger
	        isChecked = "off";
		}	
	    else
	    {
	    	//alert("assessFinanceCharge is unchecked.");
	        $("#assessFinanceCharge").attr('checked', true);
	        debugger
	    	document.configurationForm.assessFinanceCharge.value = isChecked;
	    	debugger
	    }	
		$("#assessFinanceCharge").val(isChecked);
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
		<%-- <logic:present name="Labels">
			<bean:size name="Labels" id="size" />
			<input type="hidden" name="lsize" id="lblsize" value='<bean:write name="size" />' />
			<logic:iterate name="Labels" id="lbl" indexId="index">
				<input type="hidden" id='<bean:write name="index" />lid' name='<bean:write name="index" />lidname' value='<bean:write name="lbl" property="value" />' />
				<input type="hidden" id='<bean:write name="index" />lname' name='<bean:write name="index" />lnm' value='<bean:write name="lbl" property="label" />' />
			</logic:iterate>
		</logic:present> --%>
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
					<!--  Finance charges starts -->
					<div id="finance" style="display:none;">
						<table class="table-notifications" width="100%">
							<tr>
								<th align="left" style="font-size: 1.2em;">
									<bean:message key="BzComposer.configuration.chargerate" />
								</th>
							</tr>
							<tr>
								<td>
									<table>
										<tr>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.annualinterestrate" />
												&nbsp;&nbsp;&nbsp;
											</td>
											<td style="font-size: 1em;">
												<html:text property="annualInterestRate" styleId="annualInterestRate" onkeypress="return numbersonly(event,this.value);">
												</html:text>
											</td>
										</tr>
										<tr>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.minimumfinancerate" />
												&nbsp;&nbsp;&nbsp;
											</td>
											<td style="font-size: 1em;">
												<html:text property="minCharge" styleId="minCharge" 
												onkeypress="return numbersonly(event,this.value);">
												</html:text>
											</td>
										</tr>
										<tr>
											<td style="font-size: 1em;">
												<bean:message key="BzComposer.configuration.graceperiodindays" />
												&nbsp;&nbsp;&nbsp;
											</td>
											<td style="font-size: 1em;">
												<html:text property="gracePeriod" styleId="gracePeriod" 
												onkeypress="return numbersonly(event,this.value);">
												</html:text>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<th align="left" style="font-size: 1.2em;">
									<bean:message key="BzComposer.configuration.applyingcharges" />
								</th>
							</tr>
							<tr>
								<td>
									<table>
										<tr>
											<td style="font-size: 1em;">
												<%-- <html:checkbox property="assessFinanceCharge" styleId="assesFinanceCharge">&nbsp;
													<bean:message key="BizComposer.Configuration.FinnanceCharge.AssessFinanceCharge" />
												</html:checkbox> --%>
												<html:checkbox property="assessFinanceCharge" styleId="assessFinanceCharge">&nbsp;
													<bean:message key="BzComposer.configuration.applyingcharges.assessfinancecharge" />
												</html:checkbox>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<!-- Finance Charges Ends -->
				</td>
			</tr>
		</table>
		<%-- <div>
			<html:hidden property="empStateID" /> 
			<html:hidden property="labelName" /> 
			<html:hidden property="fileName" />
		</div> --%>
		<div>
			<input type="hidden" name="tabid" id="tabid" value="" />
			<input type="hidden" name="assetFinanceChargeStatus" id="assetFinanceChargeStatus" value=""/>
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
	
		document.configurationForm.annualInterestRate.value = document.configurationForm.annualInterestRate.value;
		document.configurationForm.minCharge.value = document.configurationForm.minCharge.value;
		document.configurationForm.gracePeriod.value = document.configurationForm.gracePeriod.value; 
		document.configurationForm.assessFinanceCharge.value = $("#assessFinanceCharge").val();
		
		
		var annualRate = $("#annualInterestRate").val();
		var minCharge = $("#minCharge").val();
		var graceDays = $("#gracePeriod").val();
		var financeCharge = $("#assessFinanceCharge").val();
		
		//alert("Annual Interesest Rate(%):"+annualRate+"\nMinimum Charge Rate(%):"+minCharge+"\nGrace Days:"+graceDays+"\nFinance Charge is clicked?:"+financeCharge);
		
		document.getElementById('tabid').value="SaveFinanceCharges";
		document.getElementById('assetFinanceChargeStatus').value = financeCharge;
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
	            	var annualRate = $("#annualInterestRate").val();
	        		var minCharge = $("#minCharge").val();
	        		var graceDays = $("#gracePeriod").val();
	        		var financeCharge = $("#assessFinanceCharge").val();
	        		
	            	document.configurationForm.annualInterestRate.value = document.configurationForm.annualInterestRate.value;
	        		document.configurationForm.minCharge.value = document.configurationForm.minCharge.value;
	        		document.configurationForm.gracePeriod.value = document.configurationForm.gracePeriod.value; 
	        		document.configurationForm.assessFinanceCharge.value = $("#assessFinanceCharge").val();
	        		
	        		document.getElementById('tabid').value="SaveFinanceCharges";
	        		document.getElementById('assetFinanceChargeStatus').value = financeCharge;
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