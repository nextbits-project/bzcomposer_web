<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="ISO-8859-1"> -->
<%@include file="/include/header.jsp"%>
<title><bean:message key="BzComposer.addnewcompanystep2title" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/dist/css/custom.css" rel="stylesheet" type="text/css" />
<link href="<bean:write name="path" property="pathvalue"/>/styles/form.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<bean:write name="path" property="pathvalue"/>/dist/js/custom.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<!-- For dialog -->
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />

</head>
<body>
<html:form action="CompanyNew.do?tabid=createNewCompany3" method="post">
	<html:hidden property="companyName"/>
	<div class="bca_createnewcompanyimgleft">
		<img alt="" src="images/newCompany1.png" height="548px">
	</div>
	
	<!-- dialog box that used in this page -->
	<div id="quitMessage" style="display:none;font-size:1em;">
		<p><bean:message key="bca.quitmessage"/></p>	
	</div>
	
	<div class="bca_createnewcompanyright">
		<div class="bca_createnewcompanyright_title">
			<h3><bean:message key="bca.selectthefeature" /></h3>
		</div>
		<div class="bca_createnewcompanyright_body" style="height: 487px;">
			<h4 style="width: 100%; margin-top: 20px;"><b><bean:message key="bca.Selectthemodulesfromthelist" /></b></h4>
			<div class="bca_twolistboxes">
				<table>
					<thead>
						<tr>
							<th><bean:message key="bca.Availablemodules" /></th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
							<th><bean:message key="bca.Selectedmodules" /></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
							<%-- <select multiple="multiple" style="width: 200px; height: 200px;" class="featureName1" name="moduleID">
									<logic:iterate name="listOfExistingModules" id="objList" indexId="ndx">
										<option value="<bean:write name="objList" property="moduleID" />"><bean:write name="objList" property="featureName" /></option>
									</logic:iterate>
								</select> --%>
								<html:select property="selectedModuleId" style="width: 200px; height: 200px;" styleClass="featureName1" multiple="true">
									<logic:present name="CompanyInfoForm" property="listOfExistingModules"> 
										<logic:iterate name="CompanyInfoForm" id="objList1" property="listOfExistingModules" scope="session">
											<option value="<bean:write name='objList1' property='moduleIdOfCNCPage2' />"><bean:write name="objList1" property="featureName" /></option>
										</logic:iterate>
							 		</logic:present> 
								</html:select>
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>
								<a class="addfeature" style="cursor: pointer; border: 1px solid #000; padding: 5px; background-color: #fff ">>></a><br/><br/>
								<a class="removefeature" style="cursor: pointer;border: 1px solid #000; padding: 5px; background-color: #fff "><<</a>
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>
								<!-- <select multiple="multiple" style="width: 200px; height: 200px;"  class="featureName2" id="mycmbbox" >
								</select> -->
								<html:select property="selectedModuleId" multiple="true" style="width: 200px; height: 200px;" styleClass="featureName2">
								</html:select>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="bca_createnewcompanyright_bottom">
		<ul>
			<%-- <li><a href="<bean:write name="path" property="pathvalue"/>/CompanyNew.do?tabid=createNewCompany">Back</a></li> --%>
			<li>
				<a href="#" onclick="history.back(-1)" class="formbutton">
					<bean:message key="BzComposer.global.goback"/>
				</a>
			</li>
			<li>
				<a class="formbutton" onclick="submitform();">
					<bean:message key="BzComposer.global.next"/>
				</a>
			</li>
			<li>
				<a class="formbutton" onclick="finish();">
					<bean:message key="BzComposer.global.finish"/>
				</a>
			</li>
			<li>
				<a class="formbutton" onclick="quit();">
					<bean:message key="BzComposer.global.close"/>
				</a>
			</li>
		</ul>
	</div>
</html:form>
<script type="text/javascript">
function submitform()
{
	document.forms[0].action = "CompanyNew.do?tabid=createNewCompany3";
	document.forms[0].submit();
}
function finish() {
	document.forms[0].action = "CompanyNew.do?tabid=finish3";
	document.forms[0].submit(); 
}
function quit(){
	$("#quitMessage").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
        	"<bean:message key='bca.quitmessage.yes'/>": function () {
                $("#quitMessage").dialog("close");
                window.history.go(-2);
            },
            "<bean:message key='bca.quitmessage.no'/>": function () {
                $("#quitMessage").dialog("close");
                return false;
            }
        }
    });
}
</script>	
</body>
</html>