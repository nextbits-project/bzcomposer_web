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
<title><spring:message code="BzComposer.importcustomertitle"/></title>
<%@include file="/include/header.jsp"%>
<script>

function downloadTemplate(type){
	
	document.forms[0].action = "File?tabid=DownloadLeadTemplate&type="+type;
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
		<spring:message code="BzComposer.importlead" />
	</span>
</div>
<div style="margin: 20px 10px 0px 40px;">
<table>
  <tr>
    <th style="background-color: #dddddd; text-align: center">STEP 1<br>Download Excel/CSV File</th><th>&thinsp;&thinsp;</th>
    <th style="background-color: #dddddd; text-align: center">STEP 2<br>Fill Excel/CSV File data according to instruction</th><th>&thinsp;&thinsp;</th>
    <th style="background-color: #dddddd; text-align: center">STEP 3<br>Validate data and complete import</th>
  </tr>
</table>
</div>
<div style="margin: 20px 10px 0px 40px;">
<b>Instructions:</b>
<ol>
  <li>Download the format file (Download XLS Template/Download CSV Template and fill) it with proper data.</li>
  <li>You can see the first record to understand how the data must be filled.</li>
  <li>Then please removed/edit 1st record according to your input.</li>
  <li>Once you downloaded and filled the template file upload it in the form below and submit.</li>
  <li>After uploading Leads you need to edit them and change the various fields(if you want?).</li>
  <li>If any Leads data not imported then it means your Phone number and Email matched with existing data.</li>
</ol>
</div>
<div>
<form:form action="FileUpload?tabid=UploadLeadsFile" method="post" enctype="MULTIPART/FORM-DATA" id="uploadForm" modelAttribute="companyInfoDto">
	<!-- <div style="margin: 20px 10px 0px 40px;">
		<a href="${pageContext.request.contextPath}/samplefile/BCA customer data template.csv" download class="formbutton">
 			<spring:message code="BzComposer.customerimport.csvfiledownload"/>
		</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/samplefile/BCA customer data template.xls" download class="formbutton">
 			<spring:message code="BzComposer.customerimport.excelfiledownload"/>
		</a>
	</div> -->
	<div style="margin: 20px 10px 0px 40px;">
	 <table style="width:100%;">
	 	<tr>
	 		<td style="width:33%;"><spring:message code="BzComposer.itemimport.csvorexcelfile"/></td>
	 		<td style="width:33%;"><input type="file" name="attachFile" /></td>
	 		<td style="width:33%;">
                <input type="submit" class="formbutton" onclick="pleaseWait();" value="<spring:message code='BzComposer.global.upload'/>" />
            </td>
	 	</tr>
	 	<tr><td colspan="3">&nbsp;</td></tr>
	 	<tr>
	 		<td colspan="3" align="right" style="padding-right:50px;">
                <input type="button" class="formbutton" value="<spring:message code='BzComposer.global.downloadxlstemplate'/>" onclick="downloadTemplate('xls')"/>
                <input type="button" class="formbutton" value="<spring:message code='BzComposer.global.downloadcsvtemplate'/>" onclick="downloadTemplate('csv')"/>
                <input type="button" class="formbutton" onclick="CloseMe();" value="<spring:message code='BzComposer.global.close'/>" />
            </td>
	 	</tr>
	 </table>
	</div>
	<div>
	    <span style="color: green;display:none;" id="pleaseWait"><spring:message code="BzComposer.configuration.pleaseWait"/></span>
		<c:if test="${not empty successMessage}">
		  <span style="color: green"><%= session.getAttribute("successMessage") %></span>
		  <% session.removeAttribute("successMessage"); %>
		</c:if>
	</div>
</form:form>
</div>
</body>
</html>