<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title><bean:message key="BzComposer.Report.AllInvoice"/></title>
</head>
<body>

<html:form action="Customer.do?tabid=ProfitLossDetail" method="post">
	
	<div class="report-form-headerpanel" id="headerPanel">
		<table>
		   <tr>
		   <%-- 	<td><input type="button" value='<bean:message key="BzComposer.Report.btn.ModifyReport"/>' class="formbutton mar"></td> --%>
		   	<td><input type="button" value='<bean:message key="BzComposer.Report.btn.Print"/>' class="formbutton mar" onclick="printPage()"></td>
		   	<td><input type="button" value='<bean:message key="BzComposer.Report.btn.Email"/>' class="formbutton mar"></td>
		   	<td><input id="btnHeader1" type="button" value='<bean:message key="BzComposer.Report.btn.HideHeader"/>' class="formbutton mar" onclick="hideShowHeader()"></td>
		   	<td><input type="button" value='<bean:message key="BzComposer.Report.btn.Refresh"/>' class="formbutton mar"></td>
		   	
		   </tr>
		</table>
	</div>
	<div class="report-form-underheader">
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
	    		<td><img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" onclick="displayCalendar(document.CustomerForm.fromDate,'mm-dd-yyyy',this);" style="padding-left: 5px"></td>
	    		<td><label style="padding-left: 15px"><bean:message key="BzComposer.sales.to"/></label></td>
	    		<td><html:text property="toDate" size="15"/></td>
	    		<td><img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" onclick="displayCalendar(document.CustomerForm.toDate,'mm-dd-yyyy',this);" style="padding-left: 5px"></td>
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
	</div>
<div id="printContent">	
	<div id="headerBar">
	      <h5 style="text-align: center;color: blue;padding-top: 20px" id="headerBarValue">${sessionScope.user}</h5>
	      <h6 style="text-align: center;color: blue;" id="headerBarValue"><bean:message key="BzComposer.Report.Profit&Budget.ProfitLossDetail"/></h6>
	</div>
	<div id="table-negotiations"
		style="overflow:auto;height:400;width:100%" class="section-border">
	<table class="tabla-customListOds" cellspacing="0" id="abc">

		<thead>
			<tr>
					<th style="padding-left: 50px"><bean:message key="BzComposer.Vendor.Type" /></th>
					<th style="padding-left: 50px"><bean:message key="BzComposer.Report.Invoice.Num" /></th>
					<th style="padding-left: 50px"><bean:message key="BzComposer.Valuation.InventoryValuation.Detail.Customer" /></th>
					<th style="padding-left: 50px"><bean:message key="BzComposer.Employee.Memo" /></th>
					<th style="padding-left: 50px"><bean:message key="BzComposer.Employee.Amount" /></th>
			</tr>
		</thead>
		<tbody>
				<logic:present name="AccountReceivable" scope="request">		
				<logic:notEmpty name="AccountReceivable" scope="request">

					<bean:size id="SalesListSize" name="AccountReceivable" />
					<input type="hidden" name="sListSize" id="lSize"
						value='<bean:write name="AccountReceivable" />'>
					<tr>
						<td style="padding-left: 1px;color: blue;"><b><bean:message key="BzComposer.Report.Customer.Income"/></b></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><b><bean:message key="BzComposer.Invoice.uncategorised"/></b></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<logic:iterate name="AccountReceivable" id="objList" indexId="ndx">
						<tr>
						    <td style="padding-left: 50px"><bean:write name="objList" property="type"/></td>
						<logic:empty name="objList" property="number"><td style="padding-left: 50px"><bean:write name="objList" property="clientVendorID" /></td></logic:empty>
						<logic:notEmpty name="objList" property="number"><td style="padding-left: 50px"><bean:write name="objList" property="number" /></td></logic:notEmpty>
							<td style="padding-left: 50px"><bean:write name="objList" 	property="firstName" /></td>
							<td style="padding-left: 50px"><bean:write name="objList" property="memo" /></td>
							<td style="padding-left: 50px"><bean:write name="objList" property="total" /></td>
						</tr>
						
					</logic:iterate>
					<tr>
					 <td><b><bean:message key="BzComposer.Invoice.Total"/></b></td>
					 <td></td>
					 <td></td>
					 <td></td>
					 <td><b><u><bean:write name="totalUncategorisedIncome"/></u></b></td>
					</tr>
					<tr>
					 <td style="color: blue;"><b><bean:message key="BzComposer.Invoice.TotalIncome"/></b></td>
					 <td></td>
					 <td></td>
					 <td></td>
					 <td style="color: blue;"><b><u><bean:write name="totalUncategorisedIncome"/></u></b></td>
					</tr>
					<tr>
					 <td><b><bean:message key="BzComposer.Report.CostOfGoods"/></b></td>
					 <td></td>
					 <td></td>
					 <td></td>
					 <td></td>
					</tr> 
					 <logic:iterate name="AccountPayable" id="objList" indexId="ndx">
						<tr>
							<td style="padding-left: 50px"><bean:write name="objList" 	property="type" /></td>
							<td style="padding-left: 50px"><bean:write name="objList" property="number" /></td>
							<td style="padding-left: 50px"><bean:write name="objList" 	property="firstName" /></td>
							<td style="padding-left: 50px"><bean:write name="objList" property="memo" /></td>
							<td style="padding-left: 50px"><bean:write name="objList" property="total" /></td>
						</tr>
					</logic:iterate>
					<tr>
						<td><b><bean:message key="BzComposer.Report.TotalCOGS"/></b></td>
						<td></td>
						<td></td>
						<td></td>
						<td><b><u><bean:write name="Total_COGS"/></u></b></td>
					</tr> 
					<tr>
						<td style="color: blue;"><b><bean:message key="BzComposer.Report.GrossProfit"/></b></td>
						<td></td>
						<td></td>
						<td></td>
						<td style="color: blue;"><b><u><bean:write name="GrossProfit"/></u></b></td>
					</tr> 
				</logic:notEmpty>
			</logic:present>
		</tbody>
	</table>
	</div>
</div>	
</html:form>
<%@ include file="/include/footer.jsp"%>

<!-- Javascript begins here -->
<script type="text/javascript">
function hideShowHeader()
{
	debugger;
	document.getElementById("headerBar").style.display = "none";
	/* $("#btnHeader1").hide(); */
	document.getElementById("headerBar").style.display = "none";
	$("#btnHeader1").replaceWith("<input id='btnHeader2' type='button' value='<bean:message key='BzComposer.Report.btn.ShowHeader'/>' class='formbutton mar' onclick='ShowHeader()'>");
}
function ShowHeader()
{
	document.getElementById("headerBar").style.display = "block";
	$("#btnHeader2").replaceWith("<input id='btnHeader1' type='button' value='<bean:message key='BzComposer.Report.btn.HideHeader'/>' class='formbutton mar' onclick='hideShowHeader()'>");
}
function printPage()
{
	debugger;
	        var doc = new jsPDF("1", "pt","a2");  
	        debugger;
			 var source = $("#printContent")[0]; 
		 	 doc.fromHTML(source); 
			 doc.save($("#headerBarValue").html()+".pdf"); 
}
function search()
{
	document.forms[0].action = "Customer.do?tabid=ProfitLossDetail";
	document.forms[0].submit();
}
</script>
<!-- Javascript end here -->
</body>
</html>


