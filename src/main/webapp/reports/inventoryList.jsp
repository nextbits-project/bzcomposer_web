<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title>${sessionScope.user} - <bean:message key="BzComposer.inventorylisttitle"/></title>
</head>
<body>
<html:form action="Item.do" method="post">
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
		   				value='<bean:message key="BzComposer.reportcenter.allinvoicelist.hideheaderbtn"/>' class="formbutton mar" 
		   				onclick="hideShowHeader()">
	   				</td>
		   			<td>
		   				<input type="button" value='<bean:message key="BzComposer.reportcenter.allinvoicelist.refreshbtn"/>' 
		   				class="formbutton mar" onclick="callRefresh()">
	   				</td>
		   		</tr>
			</table>
		</div>
		<div id="printContent">
			<div id="headerBar">
	      		<h5 style="text-align: center;color: blue;padding-top: 20px">${sessionScope.user}</h5>
	      		<h6 style="text-align: center;color: blue;" id="headerBarValue">
	      			<bean:message key="BzComposer.report.inventorylist.inventorylisttitle"/>
      			</h6>
			</div>
			<div id="table-negotiations" style="overflow: auto; height: 400; text-align: center;">
				<table class="tabla-customListOds" id="exportPd" border="1">		
					<thead>
						<tr>
							<th class="emblem"><bean:message key="BzComposer.report.inventorylist.itemname" /></th>
							<th class="emblem"><bean:message key="BzComposer.report.inventorylist.title" /></th>
							<th class="emblem">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</th>
							<th class="emblem"><bean:message key="BzComposer.report.inventorylist.quantity" /></th>
							<th class="emblem"><bean:message key="BzComposer.report.inventorylist.purchaseprice" /></th>
							<th class="emblem"><bean:message key="BzComposer.report.inventorylist.saleprice" /></th>
							<th class="emblem"><bean:message key="BzComposer.report.inventorylist.serialnumber" /></th>
							<th class="emblem"><bean:message key="BzComposer.report.inventorylist.weight" /></th>
							<th class="emblem"><bean:message key="BzComposer.report.inventorylist.location" /></th>
							<th class="emblem"><bean:message key="BzComposer.report.inventorylist.taxable" /></th>
						</tr>
					</thead>
					<tbody>
						<logic:present name="ItemDetails">
							<logic:notEmpty name="ItemDetails">
								<bean:size name="ItemDetails" id="ItemDetailsSize" />
								<input type="hidden" name="listSize" id="lSize" 
								value='<bean:write name="ItemDetailsSize" />'>
								<logic:iterate name="ItemDetails" id="objList1" indexId="ndx">
									<tr>
										<td>
											<logic:equal name="objList1" property="putcharacter" value="***">
											<font size="2">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;
												<bean:write name="objList1" property="itemCode" />
											</font>
											</logic:equal> 
											<logic:equal name="objList1" property="putcharacter" value="**">
											<font size="3">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*
												<bean:write name="objList1" property="itemCode" />
											</font>
											</logic:equal> 
											<logic:equal name="objList1" property="putcharacter" value="*">
											<font size="3">
												<bean:write name="objList1" property="putcharacter" />
												<bean:write name="objList1" property="itemCode" />
											</font>
											</logic:equal>
										</td>
										<td>
											<bean:write name="objList1" property="itemName" />
										</td>
										<td></td>
										<td>&nbsp;<bean:write name="objList1" property="qty" /></td>
										<td>&nbsp;<bean:write name="objList1" property="purchasePrice" /></td>
										<td>&nbsp;<bean:write name="objList1" property="salePrice" /></td>
										<td>&nbsp;<bean:write name="objList1" property="serialNum" /></td>
										<td>&nbsp;<bean:write name="objList1" property="weight" /></td>
										<td>&nbsp;<bean:write name="objList1" property="location" /></td>
										<td>&nbsp;<bean:write name="objList1" property="taxable" /></td>
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
	$("#btnHeader1").replaceWith("<input id='btnHeader2' type='button' value='<bean:message key='BzComposer.reportcenter.allinvoicelist.showheaderbtn'/>' class='formbutton mar' onclick='ShowHeader()'>");
}
function ShowHeader()
{
	document.getElementById("headerBar").style.display = "block";
	$("#btnHeader2").replaceWith("<input id='btnHeader1' type='button' value='<bean:message key='BzComposer.reportcenter.allinvoicelist.hideheaderbtn'/>' class='formbutton mar' onclick='hideShowHeader()'>");
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
	document.forms[0].action = "Item.do?tabid=ProfitLossByItem";
	document.forms[0].submit();
}
function callRefresh(){
	document.forms[0].action = "Item.do?tabid=InventoryList";
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