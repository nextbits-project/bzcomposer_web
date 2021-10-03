<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<script>
window.onload = initShowHideDivs;
</script>
<title><bean:message key="BzComposer.companytaxoptiontitle" /></title>
</head>
<body>
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
	<!-- begin Contents --> 
	<span id="waitMessage">
		<img src="<bean:write name="path" property="pathvalue"/>/images/spinner.gif">
		<bean:message key="BzComposer.companytax.loadingcontents"/>
	</span>
	<div class="dhtmlgoodies_question">
		<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; 
		border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<bean:message key="BzComposer.companytax.companytaxoptionsummary" />
		</span>
	</div>
	<div class="dhtmlgoodies_answer">
	<div id="table-negotiations">
		<table class="tabla-listados" cellspacing="0">
			<thead>
				<tr>
					<th colspan="4" class="emblem">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="emblem">
						<img src="<bean:write name="path" property="pathvalue"/>/images/edit.png" alt="Editable" 
						width="22" height="22">
					</td>
					<td>
						<a href="Deduction.do?tabid=c1o1m1" title="Deduction">
							<bean:message key="BzComposer.companytax.deduction" />
						</a>
					</td>
				</tr>
				<tr>
					<td class="emblem">
						<img src="<bean:write name="path" property="pathvalue"/>/images/edit.png" alt="Editable">
					</td>
					<td>
						<a href="CompanyTaxOption.do?tabid=t1x1o1" title="Option">
							<bean:message key="BzComposer.companytax.option" />
						</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<!-- end Contents -->
</div>
</div>
</div>
</div>
<%@ include file="/include/footer.jsp"%></div>
</body>
</html>