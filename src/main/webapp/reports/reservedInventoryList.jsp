<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><bean:message key="BzComposer.reservedinventorylisttitle"/></title>
<%@include file="/include/header.jsp"%>
</head>
<body>
<!-- begin shared/header -->
<html:form action="SalesOrderBoard.do?tabid=ReservedInventoryList" method="post">
<div class="report-form-headerpanel" id="headerPanel">
	<table>
		<tr>
		<%--<td>
				<input type="button" value='<bean:message key="BzComposer.Report.btn.ModifyReport"/>' 
				class="formbutton mar">
			</td> --%>
		<%--<td>
				<input type="button" value='<bean:message key="BzComposer.Report.btn.Print"/>' 
				class="formbutton mar" onclick="printPage()">
			</td> --%>
		   	<td>
		   		<input type="button" value='<bean:message key="BzComposer.reportcenter.allinvoicelist.emailbtn"/>' 
		   		class="formbutton mar" onclick="sendMail()" id="email">
	   		</td>
		   	<td>
		   		<input id="btnHeader1" type="button" 
		   		value='<bean:message key="BzComposer.reportcenter.allinvoicelist.hideheaderbtn"/>' 
		   		class="formbutton mar" onclick="hideShowHeader()">
	   		</td>
		   	<td>
		   		<input type="button" value='<bean:message key="BzComposer.reportcenter.allinvoicelist.refreshbtn"/>' 
		   		class="formbutton mar" onclick="search()">
	   		</td>
		</tr>
	</table>
</div>
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos"></div>
<%-- <div><span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
	<bean:message key="BzComposer.Report.ReservedInventoryList" /></span></div> --%>
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
	<div id="printContent">
		<div id="headerBar">
			<h5 style="text-align: center; color: blue; padding-top: 20px">${sessionScope.user}</h5>
			<h6 style="text-align: center; color: blue;" id="headerBarValue">
				<bean:message key="BzComposer.report.inventorylist.reservedinventorylist" />
			</h6>
		</div>
		<div id="table-negotiations" style="overflow: auto; height: 400; text-align: center;">
			<table class="tabla-customListOds" id="exportPd" border="1">
				<thead>
					<tr>
						<th>
							<bean:message key="BzComposer.report.reservedinventorylist.sonumber" />
						</th>
						<th width="60">
							<bean:message key="BzComposer.report.reservedinventorylist.date" />
						</th>
						<th>
							<bean:message key="BzComposer.report.reservedinventorylist.inventorycode" />
						</th>
						<th>
							<bean:message key="BzComposer.report.reservedinventorylist.productname" />
						</th>
						<th>
							<bean:message key="BzComposer.report.reservedinventorylist.reservedquantity" />
						</th>
					</tr>
				</thead>
				<tbody>
					<logic:present name="SalesOrderBoardDetails" scope="request">
						<logic:notEmpty name="SalesOrderBoardDetails" scope="request">
							<bean:size id="SalesListSize" name="SalesOrderBoardDetails" />
								<input type="hidden" name="sListSize" id="lSize" 
								value='<bean:write name="SalesListSize" />'>
								<logic:iterate name="SalesOrderBoardDetails" id="objList" indexId="ndx">
									<tr id='<bean:write name="ndx" />$$' ondblclick="sendToInvoice()"
									onclick="setRowId(<bean:write name="objList" property="so_no" />,
									'<bean:write name="objList" property="email" />','<bean:write name="ndx" />$$');">
										<td align="left">
											<bean:write name="objList" property="so_no" />
										</td>
										<td align="left" width="60">
											<bean:write name="objList" property="dateAdded" />
										</td>
										<td align="left">
											<bean:write name="objList" property="inventoryCode" />
										</td>
										<td align="left">
											<bean:write name="objList" property="itemName" />
										</td>
										<td align="center">
											<bean:write name="objList" property="inventoryQty" />
										</td>
									</tr>
								</logic:iterate>
						</logic:notEmpty>
					</logic:present>
				</tbody>
			</table>
		</div>
	</div>
</html:form>
<%@ include file="/include/emailModal.jsp"%>
<%@ include file="/include/footer.jsp"%>
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
	document.forms[0].action = "SalesOrderBoard.do?tabid=ReservedInventoryList";
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