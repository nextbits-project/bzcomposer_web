<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title><bean:message key="BzComposer.Report.AllInvoice"/></title>
<style type="text/css">
.height250 {
height: 400px;

}
.fht-tbody{
height: 100% !important; /*  change table height*/
/* border-bottom: 1px solid rgb(207, 207, 207); */
}
table.tabla-listados {
width: 100%;
border: 1px solid rgb(207, 207, 207);
margin: 0px 0px 0px 0px;
margin: 0px 0px 0px 0px;
}
table.tabla-listados tbody tr.odd td {
background: #e1e5e9;
}

</style>
</head>
<body>

<html:form action="Customer.do?tabid=TransctionListByCustomerReport" method="post">
	
	
	<div id="">
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding">
	<div>
	
	<span
		style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		
		<bean:message key="BzComposer.Report.CustomerList" />
				
		</span></div>

	<table cellspacing="0" align="center" class="section-border" style="width: 100%;">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr align="center">
			<td align="left"><logic:present name="IsUpdated">
				<strong><span class="msgstyle"> <bean:write
					name="IsUpdated" /></span></strong>
			</logic:present></td>
		</tr>
		<tr>
			<td align="left" width="46%" valign="top">

			<table class="table-notifications" width="100%">
				<tr>
					<th colspan="5" align="left"><bean:message
						key="BzComposer.sales.FilterOption" /></th>
				</tr>
			
				
					<tr>
					<td width="30%"><bean:message key="BzComposer.sales.OrderDate" /></td>
					<td><logic:present name="BlankValue">
						<html:text property="saleDate1" size="15"
							value="" />
					</logic:present> <logic:notPresent name="BlankValue">
						<html:text property="saleDate1"  size="15" />
					</logic:notPresent></td>
					<td align="left"><img
						src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
						onclick="displayCalendar(document.CustomerForm.saleDate1,'mm-dd-yyyy',this);" /></td>
					<td align="left"><bean:message key="BzComposer.sales.to" /> <logic:present
						name="BlankValue">
						<html:text property="saleDate2"  size="15"
							value="" />
					</logic:present> <logic:notPresent name="BlankValue">
						<html:text property="saleDate2"   size="15" />
					</logic:notPresent></td>
					<td align="left"><img
						src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
						onclick="displayCalendar(document.CustomerForm.saleDate2,'mm-dd-yyyy',this);">
					</td>
				</tr>
			</table>

			</td>
			<td width="27%" valign="top">

			<table class="table-notifications" width="100%">		
				<tr>
					<td colspan="2" align="center"><input type="submit"
						class="formbutton" name="findBtn" value="Search"></td>
				</tr>
			</table>

			</td>

			
		</tr>
	</table>

	<div >
	<table align="center">
		<tr>
			<td align="center"><logic:notEmpty name="msg">
				<font color="red"><b><bean:write name="msg" /></b></font>
			</logic:notEmpty></td>
		</tr>
	</table>
	
		<span
		style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		
		<bean:message key="BzComposer.Report.Transactionlist.ByCustomer" /></span>
	<div>
	<br>
	<div>
		<div class="grid_8 height250 tabla-listados" id="table-negotiations" >
    			<table  id="hireEmployeeList" class="tabla-listados" cellpadding="0" cellspacing="0">
		
		<thead style="font-weight: bold;">
			<tr>
			<th colspan="2" class="emblem"><bean:message
								key="BzComposer.Vendor.CompanyName" /></th>
								
						
						
			</tr>
		</thead>
		<tbody>
						<logic:present name="TransactionListByCustomer" scope="request">
				<logic:notEmpty name="TransactionListByCustomer" scope="request">

					<bean:size id="SalesListSize" name="TransactionListByCustomer" />
					<input type="hidden" name="sListSize" id="lSize"
						value='<bean:write name="SalesListSize" />'>

					<logic:iterate name="TransactionListByCustomer" id="objList" indexId="ndx">
						<tr >
							<td colspan="2"><bean:write name="objList" property="companyName" /></td>
						  	
						 
						</tr>
					</logic:iterate>
				</logic:notEmpty>

			</logic:present>
		</tbody>
	</table>
	</div>
	</div>

</div>
	</div>
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


	