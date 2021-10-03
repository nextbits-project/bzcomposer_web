<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" language="JavaScript1.2" src="tree-menu/apytmenu.js"></script>
<script type="text/javascript" language="JavaScript1.2" src="tree-menu/apytmenu_add.js"></script>
<%@include file="/include/header.jsp"%>
<title>${sessionScope.user} -<bean:message key="BzComposer.discountinuedinventorylisttitle" /></title>
</head>
<body>
<!-- begin shared/header -->
<div id="ddcolortabsline">&nbsp;</div>
<div class="clear"></div>
<html:form action="Item.do?tabid=DiscontinuedList" method="post">
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
		   			<input id="btnHeader1" type="button" value='<bean:message key="BzComposer.reportcenter.allinvoicelist.hideheaderbtn"/>' 
		   			class="formbutton mar" onclick="hideShowHeader()">
	   			</td>
		   		<td>
		   			<input type="button" value='<bean:message key="BzComposer.reportcenter.allinvoicelist.refreshbtn"/>' 
		   			class="formbutton mar" onclick="search()">
	   			</td>
		   	</tr>
		</table>
	</div>
	<div id="headerBar">
		<h5 style="text-align: center;color: blue;padding-top: 20px">${sessionScope.user}</h5>
		<h6 style="text-align: center;color: blue;" id="headerBarValue">
			<bean:message key="BzComposer.report.discountinuedinventorylist.discountinuedinventorylist"/>
		</h6>
	</div>
	<!--search  -->
	<div class="report-form-underheader">
		<table>
	    	<tr>
	    		<td>
	    		  <label style="padding-right: 10px"><bean:message key="BzComposer.reportcenter.allinvoicelist.dates"/></label>
	    		</td>
	    		<td>
					<html:select property="datesCombo">
	    		  		<html:option value="0">
	    		  			<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.all"/>
    		  			</html:option>
		    		  	<html:option value="1">
		    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.today"/>
	    		  		</html:option>
		    		  	<html:option value="2">
		    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.thisweek"/>
	    		  		</html:option>
		    		  	<html:option value="3">
		    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.thisweektodate"/>
	    		  		</html:option>
		    		  	<html:option value="4">
		    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.thismonth"/>
	    		  		</html:option>
		    		  	<html:option value="5">
		    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.thismonthtodate"/>
	    		  		</html:option>
		    		  	<html:option value="6">
		    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.fiscalquarter"/>
	    		  		</html:option>
		    		  	<html:option value="7">
		    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.fiscalquartertodate"/>
	    		  		</html:option>
		    		  	<html:option value="8">
		    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.custom"/>
	    		  		</html:option>
		    		  	<html:option value="9">
		    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.last10days"/>
	    		  		</html:option>
		    		  	<html:option value="10">
		    		  		<bean:message key="BzComposer.reportcenter.allinvoicelist.dates.last30days"/>
	    		  		</html:option>
		    		  	<html:option value="11">
		    		  		<bean:message key="BizComposer.amazonBulkMailer.DateSelect.60Days"/>
	    		  		</html:option>
	    		  	</html:select>
	    		</td>
	    		<td>
	    			<label style="padding-left: 15px">
	    				<bean:message key="BzComposer.reportcenter.allinvoicelist.from"/>
    				</label>
   				</td>
	    		<td>
	    			<html:text property="fromDate" size="15"/>
    			</td>
	    		<td>
	    			<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" 
	    			onclick="displayCalendar(document.ItemForm.fromDate,'mm-dd-yyyy',this);" 
	    			style="padding-left: 5px">
    			</td>
	    		<td>
	    			<label style="padding-left: 15px">
	    				<bean:message key="BzComposer.sales.to"/>
    				</label>
   				</td>
	    		<td>
	    			<html:text property="toDate" size="15"/>
    			</td>
	    		<td>
	    			<img src="<bean:write name="path" property="pathvalue"/>/images/cal.gif" 
	    			onclick="displayCalendar(document.ItemForm.toDate,'mm-dd-yyyy',this);" 
	    			style="padding-left: 5px">
    			</td>
	    		<td>
	    			<label style="padding-right: 10px;padding-left: 15px">
	    				<bean:message key="BzComposer.Report.labelSortBy"/>
    				</label>
   				</td>
	    		<td>
					<html:select property="sortBy">
	    		  		<html:option value="0"><bean:message key="BzComposer.reportcenter.allinvoicelist.sortby.default"/></html:option>
		    		  	<html:option value="1"><bean:message key="BzComposer.reportcenter.allinvoicelist.sortby.type"/></html:option>
		    		  	<html:option value="2"><bean:message key="BzComposer.reportcenter.allinvoicelist.sortby.id"/></html:option>
		    		  	<html:option value="3"><bean:message key="BzComposer.reportcenter.allinvoicelist.sortby.clientorvendor"/></html:option>
		    		  	<html:option value="4"><bean:message key="BzComposer.reportcenter.allinvoicelist.sortby.memo"/></html:option>
		    		  	<html:option value="4"><bean:message key="BzComposer.reportcenter.allinvoicelist.sortby.amount"/></html:option>
	    			</html:select>
    			</td>
	    	    <td>
	    	    	<input type="button" value='<bean:message key="BzComposer.reportcenter.allinvoicelist.searchbtn"/>' 
	    	    	class="formbutton mar" style="margin-left: 195px" onclick="search()">
    	    	</td>
	    	</tr>
		</table>
	</div>
	<!-- search -->	
	<div id="table-negotiations" style="overflow: auto; height: 400; text-align: center;">
		<table class="tabla-customListOds" id="exportPd" border="1">
			<thead>
				<tr>
					<th class="emblem">
						<bean:message key="BzComposer.report.discountinuedinventorylist.category" />
					</th>
					<th class="emblem">
						<bean:message key="BzComposer.report.discountinuedinventorylist.inventoryname" />
					</th>
					<th class="emblem">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</th>
					<th class="emblem">
						<bean:message key="BzComposer.report.discountinuedinventorylist.sku" />
					</th>
					<th class="emblem">
						<bean:message key="BzComposer.report.discountinuedinventorylist.quantity" />
					</th>
					<th class="emblem">
						<bean:message key="BzComposer.report.discountinuedinventorylist.weight" />
					</th>
					<th class="emblem">
						<bean:message key="BzComposer.report.discountinuedinventorylist.purchaseprice" />
					</th>
					<th class="emblem">
						<bean:message key="BzComposer.report.discountinuedinventorylist.saleprice" />
					</th>			
				</tr>
			</thead>
			<tbody>
				<logic:present name="ItemDetails">
					<logic:notEmpty name="ItemDetails">
						<bean:size name="ItemDetails" id="ItemDetailsSize" />
						<input type="hidden" name="listSize" id="lSize" value='<bean:write name="ItemDetailsSize" />'>
						<logic:iterate name="ItemDetails" id="objList1" indexId="ndx">
							<tr>
								<td>
									<bean:write name="objList1" property="category" />
								</td>
								<td colspan="2">
									<bean:write name="objList1" property="itemName" />
								</td>
								<td>&nbsp;</td>
								<td>
									&nbsp;<bean:write name="objList1" property="qty" />
								</td>
								<td>
									&nbsp;<bean:write name="objList1" property="weight" />
								</td>
								<td>
									&nbsp;<bean:write name="objList1" property="purchasePrice" />
								</td>
								<td>
									&nbsp;<bean:write name="objList1" property="salePrice" />
								</td>						
							</tr>
						</logic:iterate>
					</logic:notEmpty>
				</logic:present>
			</tbody>
		</table>
	</div>
	<input type="hidden" name="ItemType"  value="1">
	<!-- end Contents -->
</html:form>
<%@ include file="/include/footer.jsp"%>
<%@ include file="/include/emailModal.jsp"%>
</body>
</html>
<script>
function callRefresh(){
	document.forms[0].action = "Item.do?tabid=DiscontinuedList";
	document.forms[0].submit();
}
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
function search()
{
	document.forms[0].action = "Item.do?tabid=DiscontinuedList";
	document.forms[0].submit();
}
function callRefresh(){
	document.forms[0].action = "Item.do?tabid=DiscontinuedList";
	document.forms[0].submit();
}
function sendMail() 
{
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