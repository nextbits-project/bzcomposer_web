<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link
	href="<bean:write name="path" property="pathvalue"/>/styles/form.css"
	media="screen" rel="Stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/admin.css" media="screen" rel="Stylesheet" type="text/css">	
	<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/js/jquery.min.js"></script>
	<link href="<bean:write name="path" property="pathvalue"/>/styles/calendar.css" rel="stylesheet" />
	<script src="<bean:write name="path" property="pathvalue"/>/scripts/calendar.js" type="text/javascript"></script>
	<style type="text/css">
	.customfieldset{
		margin-left: 20px;
	}
	.customlegend{
		
	}
	</style>
<title>QuickBook Import</title>
</head>
<body>
<html:form action="File.do?tabid=ImportQuickBook" method="post" enctype="MULTIPART/FORM-DATA" styleId="uploadForm">
	<div class="customfieldset">
		<%-- <table class="tabla-listados">
			<tr>
				<td><bean:message key="menu.quickbook.import"/></td>
			</tr>
			<tr>
				<td><bean:message key="menu.quickbook.lastImportdate"/></td>
			</tr>
		</table> --%>
		<fieldset>
			<legend class="customlegend"><bean:message key="menu.quickbook.import"/></legend>
			<table style="margin-top:40px;">
				<tr>
					<td><b><bean:message key="menu.quickbook.lastImportdate"/></b></td>
					<logic:present name="LastImportDate">
						<td style="padding-left: 15px"><b><bean:write name="LastImportDate"/></b></td>
					</logic:present>
				</tr>
			</table>
		<div style="margin-top: 25px">	
			<fieldset>
				<legend><bean:message key="menu.quickbook.datefilters"/></legend>
				<table>
                    <tbody>
                    <tr>
                        <td><bean:message key="menu.quickbook.from"/></td>
                        <td><html:text property="fromDate"></html:text></td>
                       <td><img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" onclick="displayCalendar(document.CompanyInfoForm.fromDate,'mm-dd-yyyy',this);" style="padding-left: 5px"></td>
                        <td style="padding-left:120px"><bean:message key="menu.quickbook.to"/></td>
                        <td><html:text property="toDate"></html:text></td>
                        <td><img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" onclick="displayCalendar(document.CompanyInfoForm.toDate,'mm-dd-yyyy',this);" style="padding-left: 5px"></td>
                    </tr>
                </tbody>
                </table>
			</fieldset>
		</div>	
			<table style="margin-top: 40px">
				<tr>
					<td><bean:message key="menu.quickbook.importfrom"/></td>
					<td>
						
						<select style="width: 100%">
					<logic:present name="cmbImportFrom">	
						<logic:iterate id="objList" name="cmbImportFrom">
							<option><bean:write name="objList" property="storeName"/></option>
						</logic:iterate>	
					</logic:present>
					<logic:notPresent name="cmbImportFrom">
					 <option></option>
					</logic:notPresent>	
						</select>
					</td>
					
				</tr>
				<tr>
					<td style="padding-top: 50px;"><input type="text"/></td>
					<td style="padding-top: 50px;"><html:file property="quickBookFile"></html:file></td>
				</tr>
				<tr>
					<td><input type="button" class="formbutton" value="Import" onclick="importquickbook()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="formbutton" value="Cancel"></td>
				</tr>
			</table>
			<div>
		<logic:present name="success">
		  <span style="color: green">	
		  		<bean:write name="success"/>
		  </span>
		</logic:present>
	</div>
		</fieldset>
		<!-- <fieldset>
			<legend>Date Filter</legend>
		    QuickBook Import QuickBook Import 
		    
		</fieldset> -->
	</div>
</html:form>
<script type="text/javascript">
var progress;
function importquickbook()
{
	debugger;
	document.forms[0].action = "File.do?tabid=QuickBookImport&type=ImportFile";
	document.forms[0].submit();
}
$(document).ready(function(){	
	
});
</script>
</body>
</html>