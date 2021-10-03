<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title>${sessionScope.user} - <bean:message key="BzComposer.Report.Return.InventoryList"/></title>
</head>
<body>

<html:form action="Item.do?tabid=ReturnInventoryList" method="post">
	
	<div class="report-form-headerpanel" id="headerPanel">
		<table>
		   <tr>
		    <%-- 	<td><input type="button" value='<bean:message key="BzComposer.Report.btn.ModifyReport"/>' class="formbutton mar"></td>
		   <td><input type="button" value='<bean:message key="BzComposer.Report.btn.Print"/>' class="formbutton mar" onclick="printPage()"></td>
		   	<td><input type="button" value='<bean:message key="BzComposer.Report.btn.Refresh"/>' class="formbutton mar" onclick="search()"></td> --%>
		   	<td><input type="button" value='<bean:message key="BzComposer.Report.btn.Email"/>' class="formbutton mar" onclick="sendMail()" id="email"></td>
		   	<td><input id="btnHeader1" type="button" value='<bean:message key="BzComposer.Report.btn.HideHeader"/>' class="formbutton mar" onclick="hideShowHeader()"></td>
		   	<td><input type="button" value='<bean:message key="BzComposer.Report.btn.Refresh"/>' class="formbutton mar" onclick="search()"></td>
		   </tr>
		</table>
	</div>
	
	
	<div id="">
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding">
	<div>
	
	<div id="headerBar">
	      <h5 style="text-align: center;color: blue;padding-top: 20px">${sessionScope.user}</h5>
	      <h6 style="text-align: center;color: blue;" id="headerBarValue"><bean:message key="BzComposer.Report.Return.InventoryList"/></h6>
	</div>
	
	<!--search  -->
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
	    		<td><img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" onclick="displayCalendar(document.ItemForm.fromDate,'mm-dd-yyyy',this);" style="padding-left: 5px"></td>
	    		<td><label style="padding-left: 15px"><bean:message key="BzComposer.sales.to"/></label></td>
	    		<td><html:text property="toDate" size="15"/></td>
	    		<td><img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" onclick="displayCalendar(document.ItemForm.toDate,'mm-dd-yyyy',this);" style="padding-left: 5px"></td>
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
	<!-- search -->	
	
	<table align="center">
		<tr>
			<td align="center"><logic:notEmpty name="msg">
				<font color="red"><b><bean:write name="msg" /></b></font>
			</logic:notEmpty></td>
		</tr>
	</table>
	
		<%-- <span
		style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;"><bean:message
		key="BzComposer.sales.InvoiceBoard.InvoiceList" /></span> --%>
	<div id="table-negotiations"
		style="overflow:auto;height:400;width:100%" class="section-border">
	<table class="tabla-listados" cellspacing="0">

		<thead>
			<tr>
				<th><bean:message key="BzComposer.Report.Return.InventoryList.InventoryName" /></th>
				<th><bean:message key="BzComposer.Report.Return.InventoryList.InventoryId" /></th>
				<th><bean:message key="BzComposer.Report.Return.InventoryList.RmaItemQty" /></th>
				<th><bean:message key="BzComposer.Report.Return.InventoryList.Reason" /></th>
				<th><bean:message key="BzComposer.Report.Return.InventoryList.AdjustedQty" /></th>
				<th><bean:message key="BzComposer.Report.Return.InventoryList.Date" /></th>
				<th><bean:message key="BzComposer.Report.Return.InventoryList.RmaId" /></th>
				<th><bean:message key="BzComposer.Report.Return.InventoryList.RmaNo" /></th>
			</tr>
		</thead>
		<tbody>
			<logic:present name="missingInventoryList" scope="request">
				<logic:notEmpty name="missingInventoryList" scope="request">

				<%-- 	<bean:size id="SalesListSize" name="damagesItemList" />
					<input type="hidden" name="sListSize" id="lSize"
						value='<bean:write name="SalesListSize" />'> --%>

					<logic:iterate name="missingInventoryList" id="objList" indexId="ndx">
						<tr >
							<td align="left"><bean:write name="objList"
								property="inventoryName" /></td>
						     <td align="left"><bean:write name="objList"
								property="inventoryID" /></td>
							<td align="left"><bean:write name="objList"
								property="rmaitemqty" />
							</td>	
							<td align="left"><bean:write name="objList"
								property="Reason" /></td>
								
							<td align="left"><bean:write name="objList"
								property="TotalAdjustedqty" /></td>							
						    
							<td align="left"><bean:write name="objList"
								property="DateAdded" /></td>
								
								<td align="left"><bean:write name="objList"
								property="RmaID" /></td>
								
								<td align="left"><bean:write name="objList"
								property="RefCustomerRMAno" /></td>

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
<%@ include file="/include/emailModal.jsp"%>
</body>
</html>

<script>
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
function search()
{
	document.forms[0].action = "Item.do?tabid=ReturnInventoryList";
	document.forms[0].submit();
}
function callRefresh(){
	document.forms[0].action = "Item.do?tabid=ReturnInventoryList";
	document.forms[0].submit();
}

function sendMail() {
	modal.style.display = "block";
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
}
function closeModal()
{
	modal.style.display = "none";
}
var modal = document.getElementById('myModal');
</script>