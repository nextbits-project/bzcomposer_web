<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title>${sessionScope.user} - <bean:message key="BzComposer.SalesPanel.SalesByItem"/></title>
</head>
<body>

<html:form action="SalesBord.do?tabid=SalesRID&ilist=3" method="post">
	
	<div class="report-form-headerpanel" id="headerPanel">
		<table>
		   <tr>
		   <%-- 	<td><input type="button" value='<bean:message key="BzComposer.Report.btn.ModifyReport"/>' class="formbutton mar"></td> --%>
		   <%-- 	<td><input type="button" value='<bean:message key="BzComposer.Report.btn.Print"/>' class="formbutton mar" onclick="printPage()"></td> --%>
		   	<td><input type="button" value='<bean:message key="BzComposer.Report.btn.Email"/>' class="formbutton mar" onclick="sendMail()" id="email"></td>
		   	<td><input id="btnHeader1" type="button" value='<bean:message key="BzComposer.Report.btn.HideHeader"/>' class="formbutton mar" onclick="hideShowHeader()"></td>
		   	<td><input type="button" value='<bean:message key="BzComposer.Report.btn.Refresh"/>' class="formbutton mar" onclick="search()"></td>
		   	
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
	    		<td><img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" onclick="displayCalendar(document.salesboardForm.fromDate,'mm-dd-yyyy',this);" style="padding-left: 5px"></td>
	    		<td><label style="padding-left: 15px"><bean:message key="BzComposer.sales.to"/></label></td>
	    		<td><html:text property="toDate" size="15"/></td>
	    		<td><img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" onclick="displayCalendar(document.salesboardForm.toDate,'mm-dd-yyyy',this);" style="padding-left: 5px"></td>
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
	      <h5 style="text-align: center;color: blue;padding-top: 20px">${sessionScope.user}</h5>
	      <h6 style="text-align: center;color: blue;" id="headerBarValue"><bean:message key="BzComposer.SalesPanel.SalesByItem"/></h6>
	</div>
	<div id="table-negotiations"
		style="overflow:auto;height:400; text-align: center;">
		
		<table class="tabla-customListOds" cellspacing="0" id="exportPd" border="1">

		<thead>
			<tr>
				<th><bean:message key="BzComposer.Employee.Name" /></th>
				<th><bean:message key="BzComposer.Vendor.Memo" /></th>
				<th><bean:message key="BzComposer.Item.Qty" /></th>
				<th><bean:message key="BzComposer.Invoice.Amt" /></th>
				<th><bean:message key="BzComposer.accounting.Balance" /></th>
			</tr>
		</thead>

		<tbody>
				<logic:present name="salesRBC" scope="request">
				<logic:notEmpty name="salesRBC" scope="request">
<%-- 					<input type="hidden" name="sListSize" id="lSize"
						value='<bean:write name="catList" />'>
 --%>				<logic:iterate name="salesRBC" id="objList" indexId="ndx">
						<tr>
						<td><bean:write name="objList"
								property="cvName" /></td>
						      <td></td>
							<td><bean:write name="objList"
								property="inventoryQty" />
							</td>	
								
							<td><bean:write name="objList"
								property="amount" /></td>							
						    <td><bean:write name="objList"
								property="balTotal" /></td>
						</tr>
					</logic:iterate>
				</logic:notEmpty>
			</logic:present>
		</tbody>
	</table>
	</div>
</div>	
</html:form>
<%@ include file="/include/footer.jsp"%>
<%@ include file="/include/emailModal.jsp"%>
<!-- Javascript begins here -->
<script type="text/javascript">
var modal = document.getElementById('myModal');
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
	/*   debugger;
	  var doc = new jsPDF("1", "pt","a2");  
	  var source = $("#printContent")[0]; 
	  doc.fromHTML(source); 
	  doc.save($("#headerBarValue").html()+".pdf");  */
	  
	  //for creating pdf 
	   var divToPrint=document.getElementById("exportPd");
	   var header = document.getElementById("headerBar");
	   newWin= window.open("");
	   newWin.document.write(header.outerHTML+divToPrint.outerHTML);
	   newWin.print();
	   newWin.close(); 
	 
	   //for creating excel
	   debugger;
	   str="";

  var myTableHead = document.getElementById('ProfitLossItem');
  var rowCount = myTableHead.rows.length;
  var colCount = myTableHead.getElementsByTagName("tr")[0].getElementsByTagName("th").length; 

var ExcelApp = new ActiveXObject("Excel.Application");
var ExcelSheet = new ActiveXObject("Excel.Sheet");
ExcelSheet.Application.Visible = true;

for(var i=0; i<rowCount; i++) 
{   
    for(var j=0; j<colCount; j++) 
    {           
        str= myTableHead.getElementsByTagName("tr")[i].getElementsByTagName("th")[j].innerHTML;
        ExcelSheet.ActiveSheet.Cells(i+1,j+1).Value = str;
    }
}
	/* window.open('data:application/vnd.ms-excel,' + $('#ProfitLossItem').html()); */
}
function search()
{
	document.forms[0].action = "SSalesBord.do?tabid=SalesRID&ilist=3";
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
</script>
<!-- Javascript end here -->
</body>
</html>