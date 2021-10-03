<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/styles/form.css" media="screen" rel="Stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/tableStyle/js/jquery.min.js"></script>
<title><spring:message code="BzComposer.importitemtitle"/></title>
<%@include file="/include/header.jsp"%>
<script>
function CloseMe(){
    window.close();
}
</script>
</head>
<body>
<div style="margin: 20px 10px 0px 40px;">
	<span style="font-size: 1.2em; font-weight: normal; color: #05A9C5 !important;">
		<spring:message code="BzComposer.importitem" />
	</span>
</div>
<div>
<form:form action="ItemFileUpload?tabid=UploadItemFile" method="post" enctype="MULTIPART/FORM-DATA" id="uploadForm" modelAttribute="itemDto">
	<div style="margin: 20px 10px 0px 40px;">
		<!-- <input type="button" class="formbutton" value="DownLoad Sample CSV for customer" onclick= "csvOption()" id="csv"/> -->
		<a href="${pageContext.request.contextPath}/samplefile/BCA item data template.csv" download class="formbutton">
 			<spring:message code="BzComposer.itemimport.csvfiledownload"/>
		</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/samplefile/BCA item data template.xls" download class="formbutton">
 			<spring:message code="BzComposer.itemimport.excelfiledownload"/>
		</a>
		<!-- <input type="button" class="formbutton" value="DownLoad Sample xls for customer" onclick= "xlsOption()" id="xls"/> -->
	</div>
	<div style="margin: 20px 10px 0px 40px;">
	 <table style="width:100%;">
	 	<tr>
	 		<td style="width:33%;">
	 			<spring:message code="BzComposer.itemimport.csvorexcelfile"/>	
 			</td>
	 		<td style="width:33%;"><input type="file" name="attachFile" /></td>
	 		<td style="width:33%;">
                <input type="submit" class="formbutton" value="<spring:message code='BzComposer.global.upload'/>" />
            </td>
	 	</tr>
	 	<tr><td colspan="3">&nbsp;</td></tr>
        <tr>
            <td colspan="3" align="right" style="padding-right:50px;">
                <input type="button" class="formbutton" onclick="CloseMe();" value="<spring:message code='BzComposer.global.close'/>" />
            </td>
        </tr>
	 </table>
	</div>
	<div>
		<c:if test="${not empty ItemUploaded}">
		  <span style="color: green"><spring:message code="BzComposer.FileUpload"/></span>
		</c:if>
	</div>
</form:form>
</div>
</body>
</html>