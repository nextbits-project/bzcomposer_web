<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@include file="/include/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${sessionScope.user}-<bean:message key="BzComposer.Report.Banking&Accounting.ARInvDetail"/></title>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<%-- <script src="<bean:write name="path" property="pathvalue"/>/tableStyle/js/jquery.min.js"></script> --%>
<style>
input, textarea, select {
	display: inline-block;
	/* 	padding: 4px; */
	margin-bottom: 3px;
	line-height: 13px;
	/* 	color: #555555; */
	border: 1px solid #cccccc;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	margin-top: 3px
}
</style>
<script type="text/javascript">
	$(function() {
		$("#tabs").tabs();
	});
	
</script>
</head>
<body>
	<html:form action="AccountReceivableAR.do?tabid=AccontReceivableReport" method="post">
	
	
		<div id="cos">
			<%-- <label style="margin-right: 5px">Date</label>
			<html:select property="sortingElement">
				<html:option value="">All</html:option>
			</html:select> --%>
			<%-- <div style="float: right;">
				<label>From</label>
				<html:text property="fromDate"></html:text>
				<img
					src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
					onclick="displayCalendar(document.InvoiceForm.fromDate,'mm-dd-yyyy',this);" />
				<label>To</label>
				<html:text property="toDate"></html:text>
				<img
					src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
					onclick="displayCalendar(document.InvoiceForm.toDate,'mm-dd-yyyy',this);" />
				<input type="button" class="formbutton" name="AddItemBtn" value="Refresh" onclick="callRefresh();" title="Refresh Item" id="refresh"></td>
			</div> --%>
			
			
			<div class="statusquo ok">
				<div id="hoja">
					<div id="blanquito">
						<div id="padding">

							<div id="tabs" style="float: left;width: 100%">
								<ul class="uiTabs">
									<li><a href="#AR-InvoiceDetail" data-toggle="tab"><bean:message
												key="BzComposer.Report.Banking&Accounting.ARInvDetail" /></a></li>
									<li><a href="#AR-CustomerDetail" data-toggle="tab"><bean:message
												key="BzComposer.Report.Banking&Accounting.ARCustDetail" /></a></li>
									<li><a href="#Graph" data-toggle="tab"><bean:message
												key="BzComposer.Report.Banking&Accounting.Graph" /></a></li>
								</ul>
								<div id="AR-InvoiceDetail">
									<div id="content1" class="tabPage" style="overflow:auto;height: 500px">
	<%-- <div class="report-form-underheader">
	 <table>
	    	<tr>
	    		<td>
	    		  <label style="padding-right: 10px"><bean:message key="BzComposer.Report.labelDates"/></label>
	    		</td>
	    		<td>
	    		  <html:select property="datesCombo">
	    		  	<html:option value="0" ><bean:message key="BizComposer.amazonBulkMailer.DateSelect.All"/></html:option>
	    		  	<html:option value="1"><bean:message key="BizComposer.amazonBulkMailer.DateSelect.Today"/></html:option>
	    		  	<html:option value="2"><bean:message key="BizComposer.amazonBulkMailer.DateSelect.ThisWeek"/></html:option>
	    		  	<html:option value="3"><bean:message key="BizComposer.amazonBulkMailer.DateSelect.ThisWeekToDate"/></html:option>
	    		  	<html:option value="4"><bean:message key="BizComposer.amazonBulkMailer.DateSelect.ThisMonth"/></html:option>
	    		  	<html:option value="5"><bean:message key="BizComposer.amazonBulkMailer.DateSelect.ThisMonthToDate"/></html:option>
	    		  	<html:option value="6"><bean:message key="BizComposer.amazonBulkMailer.DateSelect.FiscalQuarter"/></html:option>
	    		  	<html:option value="7"><bean:message key="BizComposer.amazonBulkMailer.DateSelect.FiscalQuarterToDate"/></html:option>
	    		  	<html:option value="8"><bean:message key="BizComposer.amazonBulkMailer.DateSelect.Custom"/></html:option>
	    		  	<html:option value="9"><bean:message key="BizComposer.amazonBulkMailer.DateSelect.10Days"/></html:option>
	    		  	<html:option value="10"><bean:message key="BizComposer.amazonBulkMailer.DateSelect.30Days"/></html:option>
	    		  	<html:option value="11"><bean:message key="BizComposer.amazonBulkMailer.DateSelect.60Days"/></html:option>
	    		  </html:select>
	    		</td>
	    		<td><label style="padding-left: 15px"><bean:message key="BzComposer.sales.FromDate"/></label></td>
	    		<td><html:text property="fromDate" size="15"/></td>
	    		<td><img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" onclick="displayCalendar(document.InvoiceForm.fromDate,'mm-dd-yyyy',this);" style="padding-left: 5px"></td>
	    		<td><label style="padding-left: 15px"><bean:message key="BzComposer.sales.to"/></label></td>
	    		<td><html:text property="toDate" size="15"/></td>
	    		<td><img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" onclick="displayCalendar(document.InvoiceForm.toDate,'mm-dd-yyyy',this);" style="padding-left: 5px"></td>
	    		<td><label style="padding-right: 10px;padding-left: 15px"><bean:message key="BzComposer.Report.labelSortBy"/></label></td>
	    		<td>
	    		 <html:select property="sortBy">
	    		  	<html:option value="0"><bean:message key="BzComposer.Report.labelSortBy.Default"/></html:option>
	    		  	<html:option value="1"><bean:message key="BzComposer.Report.labelSortBy.Type"/></html:option>
	    		  	<html:option value="2"><bean:message key="BzComposer.Report.labelSortBy.#ID"/></html:option>
	    		  	<html:option value="3"><bean:message key="BzComposer.Report.labelSortBy.client/vendor"/></html:option>
	    		  	<html:option value="4"><bean:message key="BzComposer.Report.labelSortBy.memo"/></html:option>
	    		  	<html:option value="4"><bean:message key="BzComposer.Report.labelSortBy.amount"/></html:option>
	    		</html:select>
	    		</td>
	    	    <td><input type="button" value='<bean:message key="BzComposer.sales.Search"/>' class="formbutton mar" style="margin-left: 195px" onclick="search()"></td>
	    	</tr>
	 </table>
	</div> --%>
										<div id="table-negotiations">
											<table class="tabla-listados" cellspacing="0" style="overflow:-y:auto">
												<thead>
													<tr>
														<th colspan="9"><bean:message
																key="BzComposer.Vendor.Type" /></th>
														<th colspan="9"><bean:message
																key="BzComposer.sales.SaleDate" /></th>
														<th colspan="9"><bean:message
																key="BzComposer.Invoice.Number" /></th>
														<th colspan="9"><bean:message
																key="BzComposer.Email.Name" /></th>
														<th colspan="9"><bean:message
																key="BzComposer.datamanager.terms" /></th>
														<th colspan="9"><bean:message
																key="BizComposer.Configuration.Reminders.DueDate" /></th>
														<th colspan="9"><bean:message
																key="BizComposer.Configuration.Reminders.OverdueDays" /></th>
														<th colspan="9"><bean:message
																key="BzComposer.datamanager.paymentmethod" /></th>
														<th colspan="9"><bean:message
																key="BzComposer.Report.Receivable" /></th>
													</tr>
												</thead>
												<tbody>
													<logic:present name="invoiceDetail" scope="request">
														<logic:notEmpty name="invoiceDetail" scope="request">

															<bean:size id="SalesListSize" name="invoiceDetail" />
															<input type="hidden" name="sListSize" id="lSize"
																value='<bean:write name="SalesListSize" />'>

															<logic:iterate name="invoiceDetail" id="objList"
																indexId="ndx">
																<tr>
																	<td colspan="9"><bean:write name="objList"
																			property="invoiceType" /></td>

																	<td colspan="9"><bean:write name="objList"
																			property="dateAdded" /></td>

																	<td colspan="9"><bean:write name="objList"
																			property="invoiceId" /></td>
																	<td colspan="9"><bean:write name="objList"
																			property="firstName" />,<bean:write name="objList"
																			property="lastName" /></td>
																	<td colspan="9"><bean:write name="objList"
																			property="term" /></td>
																	<td colspan="9"><bean:write name="objList"
																			property="dueDate" /></td>
																	<td colspan="9"><bean:write name="objList"
																			property="pastDays" /></td>
																	<td colspan="9"><bean:write name="objList"
																			property="paymentTypeName" /></td>
																	<td colspan="9"><bean:write name="objList"
																			property="balance" /></td>
																</tr>
															</logic:iterate>
														</logic:notEmpty>
													</logic:present>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div id="AR-CustomerDetail" style="float: left;width: 100%">
									<div id="content1" class="tabPage" style="overflow:auto;height: 500px">
										<div id="table-negotiations">
											<table class="tabla-listados" cellspacing="0">
												<thead>
													<tr>
														<th colspan="9"><bean:message
																key="BzComposer.Companyinformation.FirstName" /></th>
														<th colspan="9"><bean:message
																key="BzComposer.Companyinformation.LastName" /></th>
														<th colspan="9"><bean:message
																key="BzComposer.Vendor.CompanyName" /></th>
														<th colspan="9"><bean:message
																key="BzComposer.Invoice.TotalInv" /></th>
														<th colspan="9"><bean:message
																key="BzComposer.Invoice.TotalNoRec" /></th>
													</tr>
												</thead>
											    <tbody>
													<logic:present name="custDetail" scope="request">
														<logic:notEmpty name="custDetail" scope="request">

															<bean:size id="SalesListSize" name="custDetail" />
															<input type="hidden" name="sListSize" id="lSize"
																value='<bean:write name="SalesListSize" />'>

															<logic:iterate name="custDetail" id="objList"
																indexId="ndx">
																<tr>
																	<td colspan="9"><bean:write name="objList"
																			property="firstName" /></td>

																	<td colspan="9"><bean:write name="objList"
																			property="lastName" /></td>

																	<td colspan="9"><bean:write name="objList"
																			property="companyName" /></td>
																	<td colspan="9"><bean:write name="objList"
																			property="totalInvoices" /></td>
																	<td colspan="9"><bean:write name="objList"
																			property="balance" /></td>
																</tr>
															</logic:iterate>
														</logic:notEmpty>
													</logic:present>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div id="Graph">
									<div id="content1" class="tabPage">
										<!-- <div id="table-negotiations"> -->
										<table class="tabla-listados-noborder" cellspacing="0">
											<tr>
												<td style="width: 300px">
													<ul>
														<li style="cursor: pointer"><bean:message
																key="BzComposer.Report.AgingSum" /></li>
														<li style="cursor: pointer"><bean:message
																key="BzComposer.Report.ChartSum" /></li>
													</ul>
												</td>
												<td><label>As of</label> <html:text property="date"
														size="15" value="" /> <img
													src="<bean:write name="path" property="pathvalue"/>/images/cal.gif"
													onclick="displayCalendar(document.InvoiceForm.date,'mm-dd-yyyy',this);" />
													<table class="tabla-listados">
														<thead>
															<th colspan="9"><bean:message
																	key="BzComposer.sales.Customer" /></th>
															<th colspan="9"><bean:message
																	key="BzComposer.Report.Current" /></th>
															<th colspan="9"><bean:message
																	key="BzComposer.Report.1-30" /></th>
															<th colspan="9"><bean:message
																	key="BzComposer.Report.31-60" /></th>
															<th colspan="9"><bean:message
																	key="BzComposer.Report.61-90" /></th>
															<th colspan="9"><bean:message
																	key="BzComposer.Report.G90" /></th>
															<th colspan="9"><bean:message
																	key="BzComposer.Invoice.Total" /></th>
														</thead>
													</table></td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						<div class="btn-center">	
							<input type="button" class="formbutton" name="AddItemBtn" value="Look Up" onclick="callRefresh();" title="Refresh Item">
							<input type="button" class="formbutton" name="AddItemBtn" value="Print" onclick="callRefresh();" title="Refresh Item">
						<div style="float: right;">	
							<label>Sum of Receivable@</label>
						<input type="text" name="totalBalance" id="lSize" readonly="true" value='<bean:write name="totalBalance"/>'>
						</div>
						</div>	
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</html:form>
	<%@ include file="/include/footer.jsp"%>
<script type="text/javascript">
$("#tabs").tabs({
    change: function(event, ui) {
        alert("PRESSED TAB!");
    }
});
function callRefresh()
{
	debugger;
	document.forms[0].action = "AccountReceivableAR.do?tabid=AccontReceivableReport";
	document.forms[0].submit();
}
function search()
{
	document.forms[0].action = "AccountReceivableAR.do?tabid=AccontReceivableReport";
	document.forms[0].submit();
}
</script>	
</body>
</html>