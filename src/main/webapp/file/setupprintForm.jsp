<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%-- <title><bean:message key="menu.file.ManagePrintForms"/></title> --%>
<title>
	<bean:message key="BzComposer.manageprintformstitle"/>
</title>
<link href="<bean:write name="path" property="pathvalue"/>/dist/css/custom.css" rel="stylesheet" type="text/css" />
<script>
function closeMe()
{
    window.opener = self;
    window.close();
}
</script>
</head>
<body>
<div class="bca_file_twocheckbox">
	<ul>
		<li><input type="checkbox" value="Print Bills" checked="checked"><bean:message key="BzComposer.setupprintforms.printbills"/></li>
		<li><input type="checkbox" value="Email to Customers"><bean:message key="BzComposer.setupprintforms.emailtocustomer"/></li>
	</ul>
</div>
<!-- <div class="bca_printlayouts"></div> -->
<div class="bca_file_twocheckbox_btn">
	<ul>
		<li><button><bean:message key="BzComposer.global.save"/></button></li>
		<li><button onclick="closeMe();"><bean:message key="BzComposer.global.close"/></button></li>
	</ul>
</div>
</body>
</html>