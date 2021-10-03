<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<script>
	self.moveTo(100,100);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" language="JavaScript1.2"
	src="tree-menu/apytmenu.js"></script>
<script type="text/javascript" language="JavaScript1.2"
	src="tree-menu/apytmenu_add.js"></script>

<%@include file="/include/header.jsp"%>
<title><bean:message key="BizComposer.PayHistory.Title"/></title>
</head>
<body>
<html:form action="Item.do" enctype="MULTIPART/FORM-DATA" method="post">

	<div id="cos">

	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding">
	<div>
	<table class="tabla-listados" cellspacing="0">
		<logic:present name="CustName">
			<tr>
				<td align="right"><strong><bean:message
					key="BzComposer.Invoice.Customer" /> :- </strong></td>
				<td><bean:write name="CustName" /></td>
			</tr>
			<tr>
				<td align="right"><strong><bean:message
					key="BzComposer.Invoice.Company" /> :- </strong></td>
				<td><bean:write name="Company" /></td>
			</tr>
		</logic:present>
		<logic:notPresent name="CustName">

		</logic:notPresent>
		<tr>
			<td colspan="2">
			<div id="table-negotiations"
				style="overflow:auto;height:400;width:100%">
			<table class="tabla-listados" cellspacing="0">
				<thead>
					<tr>
						<th><strong><bean:message
							key="BzComposer.Invoice.Num" /></strong></th>
						<th><strong><bean:message
							key="BzComposer.Invoice.Date" /></strong></th>
						<th><strong><bean:message
							key="BzComposer.Invoice.Amount" /></strong></th>
						<th><strong><bean:message
							key="BzComposer.Invoice.Balance" /></strong></th>
						<th><strong><bean:message
							key="BzComposer.Invoice.Paid" /></strong></th>
						<th><strong><bean:message
							key="BzComposer.Invoice.Type" /></strong></th>
					</tr>
				</thead>
				<logic:present name="PayHistory">

					<logic:iterate name="PayHistory" id="history">
						<tr>
							<td><bean:write name="history" property="orderNo" /></td>
							<td><bean:write name="history" property="orderDate" /></td>
							<td><bean:write name="history" property="total" /></td>
							<td><bean:write name="history" property="balance" /></td>
							<logic:equal name="history" property="paid" value="1">
								<td>Yes</td>
							</logic:equal>
							<logic:equal name="history" property="paid" value="0">
								<td>No</td>
							</logic:equal>
							<td><bean:write name="history" property="type" /></td>
						</tr>
					</logic:iterate>
				</logic:present>
				<tr></tr>
				<tr></tr>
				<logic:present name="Total">
					<table>
						<logic:iterate name="Total" id="list">
							<tr align="center">
								<td align="Center"><strong><bean:message
									key="BzComposer.Invoice.Total" /> <bean:message key="BizComposer.PayHistory.for"/> <bean:write name="list"
									property="type" /></strong></td>
							</tr>
							<tr align="center">
								<td align="Center"><strong><bean:message
									key="BzComposer.Invoice.Amount" /> :-</strong></td>
								<td></td>
								<td><bean:write name="list" property="total" /></td>
								<td align="Center"><strong><bean:message
									key="BzComposer.Invoice.Balance" /> :-</strong></td>
								<td></td>
								<td><bean:write name="list" property="balance" /></td>
							</tr>
						</logic:iterate>
					</table>
				</logic:present>
			</table>
			</div>
			</td>
		</tr>
		<tr align="center">
			<td align="center" colspan="2"><input type="button"
				class="formbutton"
				Value='<bean:message key="BzComposer.Invoice.Close"/>'
				onclick="window.close();" title="Close this window" /></td>
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

</html>

