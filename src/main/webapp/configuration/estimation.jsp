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
<title><bean:message key="BzComposer.estimationtitle" /></title>
<%-- <link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> --%>
<%-- <script src="<bean:write name="path" property="pathvalue"/>/dist/js/jquery.min.js"></script>  --%>
<%-- <script src="<bean:write name="path" property="pathvalue"/>/dist/js/bootstrap.min.js"></script> --%>
</head>
<script type="text/javascript">

$(function() {
    $( "#tabs" ).tabs();
    $( "#tabs1" ).tabs();
  });
  
</script>
</head>
<!-- <body onload="init1();"> -->
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
						<input type="hidden" id='<bean:write name="index" />lid' name='<bean:write name="index" />lidname' value='<bean:write name="lbl" property="value" />' />
						<input type="hidden" id='<bean:write name="index" />lname' name='<bean:write name="index" />lnm' value='<bean:write name="lbl" property="label" />' />
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
									<%-- <%@include file="testMenu1.jsp" %> --%>
									<%@include file="menuPage.jsp" %>
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
					<td>
					</td>
					<td valign="top" style="padding-top: 2%;padding-right: 4%;">
						<div>
							<html:errors/>
						</div>
						<br>
						<!-- estimation Starts -->
						<div id="estimation" style="display:block;">
							<table class="table-notifications">
							<tr>
								<th align="left" colspan="2" style="font-size:1.2em;">
									<bean:message key="BzComposer.configuration.estimationpreference"/>
								</th>
							</tr>
							<tr>
								<td style="font-size:1em;">
									<bean:message key="BzComposer.configuration.startingestimationnumber"/>:
								</td>
								<td style="font-size:1em;">
									<html:text property="startingEstimationNumber"></html:text>
								</td>
							</tr>
							</table>
						</div>
						<!-- estimation Ends -->
					</td>
				</tr>
			</table>
	<div><input type="hidden" name="tabid" id="tabid" value="" />
	</div>
	</div>
	<div align="center">
		<%-- <html:button property="" onclick="SaveValues()" style="font-size: 1em;">Save</html:button>
		<html:cancel style="font-size: 1em;">Cancel</html:cancel> --%>
		<input type="submit" name="Save" id="Save" onclick="SaveValues()" style="font-size:1em;" value="<bean:message key="BzComposer.global.save"/>">
		<input type="reset" id="Cancel" name="Cancel" onclick="RevokeValues()" style="font-size:1em;" value="<bean:message key="BzComposer.global.cancel"/>">
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
		document.configurationForm.startingEstimationNumber.value = document.configurationForm.startingEstimationNumber.value;
		alert("Starting Estimation Number:"+document.configurationForm.startingEstimationNumber.value);
		
		document.getElementById('tabid').value="SaveConfigurationEstimation";
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
	            	document.configurationForm.startingEstimationNumber.value = document.configurationForm.startingEstimationNumber.value;
	        		alert("Starting Estimation Number:"+document.configurationForm.startingEstimationNumber.value);
	        		
	        		document.getElementById('tabid').value="SaveConfigurationEstimation";
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