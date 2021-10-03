<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
 <%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<title><bean:message key="BzComposer.mysqlconfigurationtitle" /></title>
<link href="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="<bean:write name="path" property="pathvalue"/>/tableStyle/tab/jquery-ui.js"></script>
	
<!-- jQuery Modal -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<style type="text/css">
.modal1 {
    overflow: visible;
    height: auto;
    vertical-align: top;
}
</style>
<script type="text/javascript">
</script>
</head>
<!-- <body onload="init3();"> -->
<body onload="init();">
<!-- begin shared/header -->
<html:form action="Configuration.do?" enctype="MULTIPART/FORM-DATA" method="post">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos"></div>
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
	<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.configuration.configurationtitle"/>
	</span>
</div>
<div>
	<div>
		<logic:present name="Labels">
			<bean:size name="Labels" id="size" />
				<input type="hidden" name="lsize" id="lblsize" value='<bean:write name="size" />' />
				<logic:iterate name="Labels" id="lbl" indexId="index">
					<input type="hidden" id='<bean:write name="index" />lid' name='<bean:write name="index" />lidname'
						value='<bean:write name="lbl" property="value" />' />
					<input type="hidden" id='<bean:write name="index" />lname' name='<bean:write name="index" />lnm'
						value='<bean:write name="lbl" property="label" />' />
				</logic:iterate>
		</logic:present>
	</div>
	<div id="table-negotiations">
		<table cellspacing="0" style="width: 100%; overflow-y: scroll;" class="section-border">
			<tr>
				<td valign="top" style="width: 20%;">
					<table>
						<tr>
							<td>
								<%-- <%@include file="testMenu3.jsp" %> --%>
								<%@include file="menuPage.jsp" %>
								<%-- <div id="table-negotiations" style="width: 185px; padding-left: 10px; overflow-y: auto; max-height: 597px;">
									<%@include file="testMenu3.jsp"%>
								</div> --%>
							</td>
						</tr>
						<%-- <tr align="center">
							<td>
								<input type="button" name="Revoke" class="formButton" onclick="RevokeValues();"
									value='<bean:message key="BizComposer.Configuration.RevokeButton"/>' />
								<input type="button" name="Save" class="formButton" onclick="SaveValues();"
									value='<bean:message key="BizComposer.Configuration.SaveButton"/>' />
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr> --%>
					</table>
				</td>
				<td valign="top" style="padding-top: 2%; padding-right: 4%;">
					<div id="MySQLConfiguration" style="display: none;">
												
											 
					<table class="table-notifications">
				<tr>
					<th align="left" colspan="2" style="font-size: 1.2em;"><bean:message
						key="BzComposer.configuration.mysqlsettings" /></th>
				</tr>
				<tr>
					<td align="left" style="font-size: 1em;">
						<b><bean:message key="BzComposer.configuration.mysqlsetting" /></b>
					</td>
				</tr>
				 <tr>
					<td style="font-size: 1em;">
						<bean:message key="BzComposer.configuration.hostaddress" /> :
					</td>
					<td>
						<input type="text" name="hostAddess" style="font-size: 1em;"/>
					</td>
				</tr>
				<tr>
					<td style="font-size: 1em;">
						<bean:message key="BzComposer.configuration.username" /> :
					</td>
					<td>
						<input type="text" name="userName" style="font-size: 1em;"/>
					</td>
				</tr>
				<tr>
					<td style="font-size: 1em;">
						<bean:message key="BzComposer.configuration.password"/> :
					</td>
					<td>
						<input type="text" name="password" style="font-size: 1em;"/>
					</td>
				</tr>
				<tr>
					<td style="font-size: 1em;">
						<bean:message key="BzComposer.configuration.port" /> :
					</td>
					<td>
						<input type="text" name="port" style="font-size: 1em;"/>
					</td>
				</tr>
			</table> 
			</div>
			</td>
		</tr>
	</table>
		
	<div>
		<input type="hidden" name="tabid" id="tabid" value="" />
	</div>
</div>
	<div align="center">
		<html:button property="save" style="font-size: 1em;">
			<bean:message key="BzComposer.global.save"/>
		</html:button>
		<html:cancel style="font-size: 1em;">
			<bean:message key="BzComposer.global.cancel"/>
		</html:cancel>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</html:form>
<%@ include file="/include/footer.jsp"%>
</body>
</html>