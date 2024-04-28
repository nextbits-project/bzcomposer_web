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
<title><spring:message code="BzComposer.importcontacttitle"/></title>
<%@include file="/include/header.jsp"%>
<script>


function downloadContactTemplate(type){
	document.forms[0].action = "File?tabid=DownloadContactTemplate&type="+type;
	document.forms[0].submit();
}

function CloseMe(){
    window.close();
}
function pleaseWait(){
    document.getElementById("pleaseWait").style.display = "block";
}
</script>
</head>
<body>
<div style="margin: 20px 10px 0px 40px;">
	<span style="font-size: 1.2em; font-weight: normal; color: #05A9C5 !important;">
		<spring:message code="BzComposer.importcontact" />
	</span>
</div>
<div>
<form:form action="FileUpload?tabid=UploadContactFile" method="post" enctype="MULTIPART/FORM-DATA" id="uploadForm" modelAttribute="companyInfoDto">
	<!-- <div style="margin: 20px 10px 0px 40px;">
		<a href="${pageContext.request.contextPath}/samplefile/BCA customer data template.csv" download class="formbutton">
 			<spring:message code="BzComposer.contactimport.csvfiledownload"/>
		</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/samplefile/BCA customer data template.xls" download class="formbutton">
 			<spring:message code="BzComposer.contactimport.excelfiledownload"/>
		</a>
	</div> -->
	<div style="margin: 20px 10px 0px 40px;">
	 <table style="width:100%;">
	 	<tr>
	 		<td style="width:33%;"><spring:message code="BzComposer.contactimport.csvorexcelfile"/></td>
	 		<td style="width:33%;"><input type="file" name="attachFile" /></td>
	 		<td style="width:33%;">
                <input type="submit" class="formbutton" onclick="pleaseWait();" value="<spring:message code='BzComposer.global.upload'/>" />
            </td>
	 	</tr>
	 	<tr><td colspan="3">&nbsp;</td></tr>
	 	<tr>
	 		<td colspan="3" align="right" style="padding-right:50px;">
                <input type="button" class="formbutton" value="<spring:message code='BzComposer.global.downloadxlstemplate'/>" onclick="downloadContactTemplate('xls')"/>
                <input type="button" class="formbutton" value="<spring:message code='BzComposer.global.downloadcsvtemplate'/>" onclick="downloadContactTemplate('csv')"/>
                <input type="button" class="formbutton" onclick="CloseMe();" value="<spring:message code='BzComposer.global.close'/>" />
            </td>
	 	</tr>
	 </table>
	</div>
	<div>
	    <span style="color: green;display:none;" id="pleaseWait"><spring:message code="BzComposer.configuration.pleaseWait"/></span>
		<c:if test="${not empty successMessage}">
		  <span style="color: green"><spring:message code="BzComposer.FileUpload"/></span>
		  <% session.removeAttribute("successMessage"); %>
		</c:if>
	</div>
</form:form>
</div>
</body>
</html>