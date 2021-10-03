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
<title><bean:message key="BzComposer.emailsetuptitle" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
  <script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
<script type="text/javascript">
$(function() 
{ 
});

$(document).ready(function(){
});
 
/* commented on 24-11-2019 for preventing simple alert 
function saveTemplate()
{
	alert("Inside saveTemplate Method")
} 

function deleteTemplate()
{
	alert("Inside deleteTemplate Method")
}*/

function addNewTemplate()
{
	debugger	
	document.getElementById("templateName").style.display = "block";
	document.getElementById("templateSubject").style.display = "block";
	document.getElementById("emailText").style.display = "block";
	document.getElementById("txtTemplateText").style.display = "none";
	document.getElementById("txtTemplateName").style.display = "none";
	document.getElementById("txtTemplateSubject").style.display = "none";
	document.getElementById("emailText").value = "<<name>>"+'\n'+"<<company name>>"+'\n'+"<<address>>"+'\n'+"<<phonenumber>>";	
}
function setContent()
{
	debugger
	var id = $("#selectedTemplateId option:selected").val();
	alert("Selected Tempalte Id:"+id)
	document.getElementById("templateName").style.display = "none";
	document.getElementById("txtTemplateName").style.display = "block";
	document.getElementById("templateSubject").style.display = "none";
	document.getElementById("txtTemplateSubject").style.display = "block";
	document.getElementById("emailText").style.display = "none";
	document.getElementById("txtTemplateText").style.display = "block";
	
	//window.open("Configuration.do?tabid=con&templateId="+id,null,"scrollbars=yes,height=600,width=1300,status=yes,toolbar=no,menubar=no,location=no");
	$.ajax({
		type: "POST",
     	url:"Configuration.do?tabid=con&templateId="+id,
       	data: { emailText : id }
   		}).done(function(data){
   		debugger
       	//$("#state").html(data);
   		$(document).find('div#emailTextDiv table').replaceWith($(data).find('div#emailTextDiv').html());
   	});
}

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
					<!-- emailSetUp Starts -->
					<div id="emailSetUp" style="display:none;">
						<table class="table-notifications" width="100%">
							<tr>
								<th colspan="3" align="left" style="font-size:1.2em;">
									<b><bean:message key="BzComposer.configuration.emailtemplate" /></b>
								</th>
							</tr>
							<tr>
								<td colspan="3" style="font-size:1em;">
									<a href="#" onclick="addNewTemplate();" style="font-size:1em;">
										<bean:message key="BzComposer.configuration.newtemplate"/>
									</a>
									&nbsp;&nbsp;
									<a href="#" onclick="saveTemplate();" style="font-size:1em;">
									<bean:message key="BzComposer.configuration.savetemplate"/>
									</a>
									&nbsp;&nbsp;
									<a href="#" onclick="deleteTemplate();" style="font-size:1em;">
									<bean:message key="BzComposer.configuration.deletetemplate"/>
									</a>
								</td>
							</tr>
							<tr>
								<td style="font-size:1em;">
									<bean:message key="BzComposer.configuration.availabletemplate"/>:
								</td>
								<td colspan="3" align="center" style="font-size:1em;">
									<bean:message key="BzComposer.configuration.templatenote"/>
								</td>
							</tr>
							<tr>
								<td rowspan="4" style="font-size:1em;">
									<select id="selectedTemplateId"  multiple="multiple" style="height:300px;" onchange="setContent()">
										<logic:present name="configurationForm" property="listOfExistingTemplates"> 
											<logic:iterate name="configurationForm" id="objList1" property="listOfExistingTemplates" scope="session">
												<option value="<bean:write name='objList1' property='templateId' />">
													<bean:write name="objList1" property="templateName" />
												</option>
											</logic:iterate>
										</logic:present> 
									</select>
								</td>
								<td style="font-size:1em;">
									<bean:message key="BzComposer.configuration.templatename"/>* :
								</td>
								<td style="font-size:1em;">
									<input type="text" id="templateName" style="display: block;">
									<logic:present name="configurationForm" property="listOfExistingTemplates" scope="session"> 
										<input type="text" id="txtTemplateName" style="display: none;" value="<bean:write name="objList1" property="templateName" />" readonly="readonly">
									</logic:present>
								</td>
							</tr>
							<tr>
								<td style="font-size:1em;">
									<bean:message key="BzComposer.configuration.subject"/>* :
								</td>
								<td style="font-size:1em;">
									
									<input type="text" id="templateSubject">
									<logic:present name="configurationForm" property="listOfExistingTemplates" scope="session"> 
										<input type="text" id="txtTemplateSubject" style="display: none;" value="<bean:write name="objList1" property="templateSubject" />" readonly="readonly">
									</logic:present>
								</td>
							</tr>
							<tr>
								<td style="font-size:1em;">
									<bean:message key="BzComposer.configuration.emailtext"/> :
								</td>
							</tr>
							<tr>
								<td colspan="2" align="left" style="font-size:1em;">
									<div id="emailTextDiv">
									<!-- <input type="text" id="emailText" name="emailText" style="height: 150px; width: 520px;"> -->
									<textarea id="emailText" style="height: 150px;width: 520px;"></textarea>
									<logic:present name="configurationForm" property="listOfExistingTemplates" scope="session"> 
										 <%-- <input type="text" id="txtTemplateText" style="display: none;" value="<bean:write name="objList1" property="templateContent" />"> --%> 
										<textarea id="txtTemplateText" style="display: none;height: 150px;width: 520px;"><bean:write name="objList1" property="templateContent" /></textarea>
									</logic:present>
									</div>
								</td>
							</tr>
						</table> 
					</div>
					<!-- emailSetUp Ends -->	
			</td>
		</tr>
	</table>
	<div><html:hidden property="fileName" /></div>
	<div><input type="hidden" name="tabid" id="tabid" value="" />
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
		
		//document.getElementById('tabid').value="SaveConfigurationBilling";
		//document.forms[0].action = "Configuration.do";
		//document.forms[0].submit();
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
	            	//document.getElementById('tabid').value="SaveConfigurationBilling";
	        		//document.forms[0].action = "Configuration.do";
	        		//document.forms[0].submit();
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