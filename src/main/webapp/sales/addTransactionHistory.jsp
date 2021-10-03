<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="com.avibha.bizcomposer.sales.dao.InvoiceInfo"%>

<%String custID = request.getParameter("custId");
			String cond = request.getParameter("cond");
			String pfrom = request.getParameter("pfrom");
			String pto = request.getParameter("pto");
			System.out.println(" Cond " + cond);
			if (!(pfrom == null || pfrom.equals("") || pto == null || pto
					.equals(""))
					&& !(cond.equalsIgnoreCase("ShowAll"))) {

				java.util.ArrayList lookDetails = new java.util.ArrayList();
				InvoiceInfo invoice = new InvoiceInfo();
				lookDetails = invoice.searchHistory(request, cond, custID,
						pfrom, pto);
				request.setAttribute("LookupDetails", lookDetails);
			} else if (cond.equalsIgnoreCase("ShowAll")) {
				java.util.ArrayList lookDetails = new java.util.ArrayList();
				InvoiceInfo invoice = new InvoiceInfo();
				lookDetails = invoice.searchHistory(request, cond, custID,
						pfrom, pto);
				request.setAttribute("LookupDetails", lookDetails);
			}
%>
<ROOT>
<logic:present name="LookupDetails" scope="request">
	<table class="tabla-listados" cellspacing="0">
		<thead>
			<tr>
				<th><bean:message key="BzComposer.UpdateInvoice.NUM" /></th>
				<th><bean:message key="BzComposer.UpdateInvoice.DATE" /></th>
				<th align="right">
				<div align="right"><bean:message
					key="BzComposer.UpdateInvoice.AMOUNT($)" /></div>
				</th>
				<th align="right">
				<div align="right"><bean:message
					key="BzComposer.UpdateInvoice.BALANCE($)" /></div>
				</th>
				<th><bean:message key="BzComposer.UpdateInvoice.PAID" /></th>
				<th><bean:message key="BzComposer.UpdateInvoice.TYPE" /></th>
			</tr>
		</thead>
		<tbody>

			<logic:notEmpty name="LookupDetails" scope="request">
				<bean:size id="LookupListSize" name="LookupDetails" />
				<input type="hidden" name="sListSize" id="lSize"
					value='<bean:write name="LookupListSize" />'>

				<logic:iterate name="LookupDetails" id="objList" indexId="ndx">
					<tr id='<bean:write name="ndx" />$$'>
						<td>&nbsp;<bean:write name="objList" property="orderNum" /></td>
						<td>&nbsp;<bean:write name="objList" property="dateAdded" /></td>
						<td align="right">&nbsp;<bean:write name="objList"
							property="total" /></td>
						<td align="right">&nbsp;<bean:write name="objList"
							property="balance" /></td>
						<td>&nbsp;<bean:message key="BzComposer.UpdateInvoice.Zero" /></td>
						<td>&nbsp;<bean:write name="objList" property="name" /></td>
					</tr>
				</logic:iterate>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td align="right">Total:-</td>
					<td align="right"><bean:write name="FinalTotal" /></td>
					<td align="right">&nbsp;<bean:write name="FinalBalance" /></td>
				</tr>
			</logic:notEmpty>

		</tbody>
	</table>
</logic:present>
</ROOT>
