<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title><bean:message
	key="BizComposer.Configuration.General.BackUpSetting" /></title>
</head>
<body>
<html:form action="Configuration.do?" method="post">
	<div id="cos">

	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding">
	<div><span
		style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"></span>
	</div>
	<div>
	<table>
		<tr>
			<td>
			<div align="center"><strong> <font size="4"> <bean:message
				key="BizComposer.Configuration.General.BackUpSetting.ConfigureDatabaseBackup" />
			</font> </strong></div>


			</td>
		</tr>
		<tr>
			<td><strong> <bean:message
				key="BizComposer.Configuration.General.BackUpSetting.BackupNaming" />
			</strong>
			<fieldset>
			<table>
				<tr>
					<td><bean:message
						key="BizComposer.Configuration.General.BackUpSetting.BackupLocation" />
					</td>
					<td><html:text property="backupLocation"></html:text></td>
				</tr>
			</table>
			</fieldset>
			</td>
		</tr>
	</table>
	</div>


	</div>
	</div>
	</div>
	</div>
	</div>


	<!-- end Contents -->
</html:form>
<%@ include file="/include/footer.jsp"%>

</body>
<script>
		
</script>
</html>

