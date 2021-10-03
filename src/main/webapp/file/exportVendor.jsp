<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<bean:write name="path" property="pathvalue"/>/styles/form.css" media="screen" rel="Stylesheet" type="text/css" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/js/jquery.min.js"></script>
<title><bean:message key="BzComposer.exportvendortitle"/></title>
</head>
<body>
<html:form action="File.do?tabid=ExportVendor" method="post" enctype="MULTIPART/FORM-DATA" styleId="uploadForm">
	<table>
		<tr>
			<td><input type="button" class="formbutton" value="<bean:message key='BzComposer.exportvendor.downloadcustomerincsv'/>" onclick="downloadCustomerList('csv')"/></td>
			<td><input type="button" class="formbutton" value="<bean:message key='BzComposer.exportvendor.downloadcustomerinxls'/>" onclick="downloadCustomerList('xls')"/></td>
		</tr>	 
	</table>
	<div>
		<logic:present name="success">
		  <span style="color: green">	
		  		<bean:write name="success"/>
		  </span>
		</logic:present>
	</div>
</html:form>
<script type="text/javascript">
var progress;
function downloadCustomerList(type)
{
	debugger;
	document.forms[0].action = "File.do?tabid=ExportVendor&type="+type;
	document.forms[0].submit();
}
</script>
</body>
</html>