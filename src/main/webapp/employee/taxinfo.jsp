<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html xmlns="http://www.w3.org/1999/xhtml"
	version="-//W3C//DTD XHTML 1.1//EN" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.taxinfotitle" /></title>
<script>
window.onload = initShowHideDivs;
</script>
</head>
<body>
<!-- begin shared/header -->
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
	<!-- begin Contents --> 
	<span id="waitMessage">
		<img src="<bean:write name="path" property="pathvalue"/>/images/spinner.gif"></img>
		<bean:message key="BzComposer.taxinfo.loadingcontent"/>
	</span>
<div class="dhtmlgoodies_question">
	<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; 
	border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.taxinfo.taxinformationsummary" />
	</span>
</div>
<div class="dhtmlgoodies_answer">
<div id="table-negotiations">
<table class="tabla-listados" cellspacing="0">
	<thead>
		<tr>
			<th class="emblem">&nbsp;</th>
			<th class="emblem">&nbsp;</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="emblem">
				<img src="<bean:write name="path" property="pathvalue"/>/images/edit.png" alt="Editable"></img>
			</td>
			<td>
				<A HREF="fedTax.do?tabid=f0e0d0"><bean:message key="BzComposer.taxinfo.federaltaxinfo" /></A>
			</td>
		</tr>
		<tr>
			<td class="emblem">
				<img src="<bean:write name="path" property="pathvalue"/>/images/edit.png" alt="Editable"></img>
			</td>
			<td>
				<A HREF="StateTax.do?tabid=s0t0a0"><bean:message key="BzComposer.taxinfo.statetaxinfo" /></A>
			</td>
		</tr>
	</tbody>
</table>
</div>
</div>
<!-- end Contents --></div>
</div>
</div>
</div>
	<%@ include file="/include/footer.jsp"%></div>
</body>
</html>