<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<script>
	self.moveTo(100,100);
</script>
<script type="text/javascript">
function getContent()
{
	var content = document.getElementById("emailContent").value;
	alert("Content is:"+content);
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <script type="text/javascript" language="JavaScript1.2" src="tree-menu/apytmenu.js"></script>
<script type="text/javascript" language="JavaScript1.2" src="tree-menu/apytmenu_add.js"></script> -->
<%@include file="/include/header.jsp"%>
<title>BizComposer</title>
</head>
<body onload="getContent();">
<html:form action="Invoice.do?tabid=Invoice" enctype="MULTIPART/FORM-DATA" method="post">
	<div id="cos">
	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding">
	<div>
		<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"></span>
	</div>
	<div>
		<logic:present name="EmailInfo">
		<table class="tabla-listados" cellspacing="0">
			<thead>
				<tr>
					<th colspan="2"><strong><bean:message
						key="BzComposer.Invoice.emailMessage" /></strong>
					</th>
				</tr>
			</thead>
			<tbody>
				<logic:present name="Result">
					<tr>
						<td colspan="2"><font color="blue">**<bean:write
							name="Result" /></font></td>
					</tr>
				</logic:present>

				<tr>
					<td colspan="2"><strong><bean:message
						key="BzComposer.Invoice.emailUserInfo" /></strong></td>
				</tr>
				<tr>
					<td><bean:message key="BzComposer.Invoice.emailRecipntAddr" />
					<html:text property="emailAddr" size="30" name="EmailInfo" readonly="true">
					</html:text>
					</td>
					<td align="left" nowrap><html:checkbox property="isEmailSent"
						name="EmailInfo" disabled="true">
						<bean:message key="BzComposer.Invoice.emailIsEmailSent" />
					</html:checkbox></td>
				</tr>
				<tr>
					<td colspan="2"><strong><bean:message
						key="BzComposer.Invoice.emailContent" /></strong></td>
				</tr>
				<tr>
					<td colspan="2"><bean:message
						key="BzComposer.Invoice.emailSubject" /> : <html:text
						property="subject" size="60" name="EmailInfo"></html:text></td>
				</tr>
				<tr>
					<td colspan="2"><html:textarea property="content" rows="20"
						cols="100" name="EmailInfo" styleId="emailContent" readonly="true"></html:textarea>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="button" class="formbutton" title="Send Mail"
						value='<bean:message key="BzComposer.Invoice.emailSend"/>'
						onclick="Send('<bean:write name="EmailInfo" property="emailAddr"/>')" />  &nbsp;&nbsp;<input type="button"
						title="Cancel Mail" class="formbutton"
						value='<bean:message key="BzComposer.Invoice.Close"/>'
						onclick="CloseMe();" /></td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" id="ordId"
			value="<%=request.getAttribute("order_no") %>" />

	</logic:present></div>
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
function CloseMe(){
	window.close();
}
function Send(emailaddr){
	if(emailaddr==""){
		alert("Please check Email address for this recipient");
	}
	else{
		ordId=document.getElementById('ordId').value;
		document.forms[0].action="Invoice.do?tabid=SendMail&OrderNo="+ordId;
		document.forms[0].submit();
	}
}
</script>
</html>

