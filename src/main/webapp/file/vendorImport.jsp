<%@ page contentType="text/html;charset=UTF-8" %>
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
	<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/js/jquery.min.js"></script>
<title><bean:message key="BzComposer.importvendortitle"/></title>
</head>
<body>
<html:form action="File.do?tabid=ImportVendor" method="post" enctype="MULTIPART/FORM-DATA" styleId="uploadForm">
	<div>
		<!-- <input type="button" class="formbutton" value="DownLoad Sample CSV for customer" onclick= "csvOption()" id="csv"/> -->
		<a href="${pageContext.request.contextPath}/samplefile/BCA vendor data template.csv" download class="formbutton">
 			<bean:message key="BzComposer.vendorimport.csvfiledownload"/>
		</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/samplefile/BCA vendor data template.xls" download class="formbutton">
 			<bean:message key="BzComposer.vendorimport.excelfiledownload"/>
		</a>
		<!-- <input type="button" class="formbutton" value="DownLoad Sample xls for customer" onclick= "xlsOption()" id="xls"/> -->
	</div>
	<div style="margin-top: 40px">
	 <table>
	 	<tr>
	 		<td><bean:message key="BzComposer.vendorimport.csvorexcelfile"/></td>
	 		<td><html:file property="uploadCustomer"></html:file></td>
	 	</tr>
	 	<tr>
	 		<td><input type="button" class="formbutton" value="<bean:message key='BzComposer.global.upload'/>" onclick="upload()"/></td>
	 	</tr>
	 </table>
	</div>
	<div>
		<logic:present name="successMessage1">
		  <span style="color: green">	
		  		<bean:message key="BzComposer.FileUpload"/>
		  </span>
		</logic:present>
	</div>
</html:form>
<script type="text/javascript">
var progress;
function upload()
{
	document.forms[0].action = "File.do?tabid=UploadVendorFile";
	document.forms[0].submit();
}
</script>
</body>
</html>