<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title><bean:message key="BzComposer.unpaidinvoicelisttitle"/></title>
</head>
<body>
<html:form action="SalesBord.do?tabid=UnPaidInvoiceList&ilist=3" method="post">
<div id="">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<div>
	<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; 
	border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<bean:message key="BzComposer.report.unpaidinvoicelist.unpaidinvoices" />
	</span>
</div>
<div>
	<div id="table-negotiations">
		<table cellspacing="0" align="center" class="section-border" style="width: 100%;">
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr align="center">
				<td align="left">
					<logic:present name="IsUpdated">
						<strong>
							<span class="msgstyle"> 
								<bean:write name="IsUpdated" />
							</span>
						</strong>
					</logic:present>
				</td>
			</tr>
			<tr>
				<td align="left" width="46%" valign="top">
					<table class="table-notifications" width="100%">
						<tr>
							<th colspan="6" align="left">
								<bean:message key="BzComposer.report.unpaidinvoicelist.filteroption" />
							</th>
						</tr>			
						<tr>
							<td width="30%">
								<bean:message key="BzComposer.reportcenter.allinvoicelist.orderdate" />
							</td>
							<td>
								<logic:present name="BlankValue">
									<html:text property="orderDate1"  size="15" value="" />
								</logic:present> 
								<logic:notPresent name="BlankValue">
									<html:text property="orderDate1"  size="15" />
								</logic:notPresent>
							</td>
							<td align="left">
								<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
								onclick="displayCalendar(document.salesboardForm.orderDate1,'mm-dd-yyyy',this);" />
							</td>
							<td align="left">
								<bean:message key="BzComposer.reportcenter.allinvoicelist.to" /> 
								<logic:present name="BlankValue">
									<html:text property="orderDate2"  size="15" value="" />
								</logic:present> 
								<logic:notPresent name="BlankValue">
									<html:text property="orderDate2"  size="15" />
								</logic:notPresent>
							</td>
							<td align="left">
								<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
								onclick="displayCalendar(document.salesboardForm.orderDate2,'mm-dd-yyyy',this);">
							</td>
						</tr>
					</table>
				</td>
				<td width="27%" valign="top">
					<table class="table-notifications" width="100%">		
						<tr>
							<td colspan="2" align="center">
								<input type="submit" class="formbutton" name="findBtn" 
								value="<bean:message key="BzComposer.reportcenter.allinvoicelist.searchbtn"/>">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<div>
			<table align="center">
				<tr>
					<td align="center">
						<logic:notEmpty name="msg">
							<font color="red">
								<b><bean:write name="msg" /></b>
							</font>
						</logic:notEmpty>
					</td>
				</tr>
			</table>	
			<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; 
			border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
				<bean:message key="BzComposer.reportcenter.allinvoicelist.invoicelist" />
			</span>
			<div id="table-negotiations" style="overflow:auto;height:400;width:100%" class="section-border">
				<table class="tabla-listados" cellspacing="0">
					<thead>
						<tr>
							<th><bean:message key="BzComposer.reportcenter.allinvoicelist.invoicenumber" /></th>
							<th><bean:message key="BzComposer.reportcenter.allinvoicelist.orderdate" /></th>
							<th><bean:message key="BzComposer.reportcenter.allinvoicelist.sortby.clientorvendor" /></th>
							<th><bean:message key="BzComposer.reportcenter.allinvoicelist.representative" /></th>
							<th><bean:message key="BzComposer.reportcenter.allinvoicelist.salesamount" /></th>
							<th><bean:message key="BzComposer.reportcenter.allinvoicelist.balance" /></th>
						</tr>
					</thead>
					<tbody>
						<logic:present name="SalesBoardDetails" scope="request">
							<logic:notEmpty name="SalesBoardDetails" scope="request">
								<bean:size id="SalesListSize" name="SalesBoardDetails" />
									<input type="hidden" name="sListSize" id="lSize" 
									value='<bean:write name="SalesListSize" />'>
									<logic:iterate name="SalesBoardDetails" id="objList" indexId="ndx">
										<tr>
											<td align="left">
												<bean:write name="objList" property="orderNum" />
											</td>
							     			<td align="left">
							     				<bean:write name="objList" property="dateAdded" />
						     				</td>
											<td align="left">
												<bean:write name="objList" property="lastName" />,
												<bean:write name="objList" property="firstName" />
											</td>								
											<td align="left">
												<bean:write name="objList" property="rep" />
											</td>							
											<td align="left">
												<bean:write name="objList" property="total" />
											</td>						
											<td align="left">							
												<%--<bean:write name="objList" property="balance" /> --%>
											</td>
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