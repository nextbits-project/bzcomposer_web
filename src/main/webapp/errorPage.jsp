<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><bean:message key="BzComposer.errorpagetitle"/></title>
</head>
<body>
<bean:message key="BzComposer.errorpage.error"/>
<br>
<bean:message key="BzComposer.errorpage.exception"/>
<html:errors />
<%-- <logic:present name="SaveStatus">
	<tr>
		<td colspan="12">
			<span class="msgstyle">*<bean:write name="SaveStatus" /></span>
		</td>
	</tr>
</logic:present> --%>
<a href="login"><bean:message key="BzComposer.login"/></a>
</body>
</html>